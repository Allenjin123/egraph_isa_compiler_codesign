// cargo build --release
// cargo run -- --release --bound 1.25 --solver gurobi --timeout 1800 --extractor faster-greedy-dag-mt1 --pre 4 benchmark/BoolE/mul32_map.json



mod extractor;
mod ilp_gen;
use egg::egraph;
use rustc_hash::{FxHashMap, FxHashSet};
use extraction_gym::ExtractionResult;
use indexmap::{IndexMap,IndexSet};
use egraph_serialize::EGraph as SerializedEGraph;
use egraph_serialize::ClassId;
use egraph_serialize::NodeId;
use egraph_serialize::Node;
use egraph_serialize::Data;
use egraph_serialize::Cost;
use anyhow::Context;
use core::panic;
use std::default;
use std::fmt::format;
use std::result;
use std::time::Instant;
use std::path::PathBuf;
use std::fs;
use std::env;
use serde::{Serialize, Deserialize};
use serde_json::{to_string_pretty, from_str,Value};
use std::collections::{HashMap, BTreeMap,HashSet};
use linked_hash_map::{LinkedHashMap};
use std::collections::VecDeque;
use ordered_float::NotNan;
use std::process::Command;
use std::fs::File;
use std::io::Read;
use std::error::Error;
use wait_timeout::ChildExt;


fn collect_results(cost: HashMap<NodeId,Cost>, bound:f32, zero_node: &mut Vec<NodeId>) {
    // assert!(bound >= 1.0);
    let mut collects: HashMap<u32, Vec<(NodeId, NotNan<f64>)>> = HashMap::new();
    
    // Collect nodes by category
    for (node_id, cost) in cost.iter() {
        let classid = node_id.0[0];
        match collects.get_mut(&classid) {
            Some(v) => {
                v.push((node_id.clone(), cost.clone()));
            }
            None => {
                collects.insert(classid, vec![(node_id.clone(), cost.clone())]);
            }
        }
    }

    // Process each category
    for (_, costs) in collects.iter() {
        let mut sorted_costs = costs.clone();
        // Sort by cost from smallest to largest
        sorted_costs.sort_by(|a, b| a.1.cmp(&b.1));
        
        // Get minimum value and calculate threshold
        if let Some((_, min_cost)) = sorted_costs.first() {
            // Calculate threshold: minimum value * bound
            let threshold = *min_cost * NotNan::new(bound as f64).expect("bound is not NaN");
            
            // Add nodes greater than threshold to zero_node
            for &(ref node_id, cost) in &sorted_costs {
                if cost > threshold {
                    zero_node.push(node_id.clone());
                }
            }
        }
    }
}

fn write_json_result<T: serde::Serialize>(filename: &str, data: &T) {
    let json_result = to_string_pretty(data).unwrap();
    //let _ = fs::create_dir_all("out_json");
    let __ = fs::write(filename, json_result);
}

pub fn parse_cplex_solution(file_path: &str) -> Result<HashMap<String, f64>, Box<dyn Error>> {
    // 读取文件内容
    let mut file = File::open(file_path)?;
    let mut contents = String::new();
    file.read_to_string(&mut contents)?;
    
    // 查找变量部分
    let variables_start = contents.find("<variables>")
        .ok_or("Could not find <variables> tag")?;
    let variables_end = contents.find("</variables>")
        .ok_or("Could not find </variables> tag")?;
    
    // 提取变量部分
    let variables_section = &contents[variables_start..variables_end + 12]; // +12 for "</variables>"
    
    // 使用正则表达式提取N_开头的变量
    let mut variables = HashMap::new();
    let lines: Vec<&str> = variables_section.lines().collect();
    
    for line in lines {
        if line.contains("<variable") && line.contains("name=\"N_") {
            // 提取名称
            let name_start = line.find("name=\"")
                .map(|pos| pos + 6)
                .ok_or("Could not find name attribute")?;
            let name_end = line[name_start..].find("\"")
                .map(|pos| name_start + pos)
                .ok_or("Could not find end of name attribute")?;
            let name = &line[name_start..name_end];
            
            // 提取值
            let value_start = line.find("value=\"")
                .map(|pos| pos + 7)
                .ok_or("Could not find value attribute")?;
            let value_end = line[value_start..].find("\"")
                .map(|pos| value_start + pos)
                .ok_or("Could not find end of value attribute")?;
            let value_str = &line[value_start..value_end];
            let value = value_str.parse::<f64>()?;
            
            // 只保存N_开头的变量
            if name.starts_with("N_") {
                variables.insert(name.to_string(), value);
            }
        }
    }
    
    Ok(variables)
}



#[derive(Default, Clone,Serialize)]
pub struct ExtractionResultttt {
    pub choices: IndexMap<ClassId, NodeId>,
}

impl ExtractionResultttt {

    pub fn new_empty() -> Self {
        Self {
            choices: IndexMap::<ClassId, NodeId>::default(),
        }
    }
}

fn gen_gurobi_mst(activated: &FxHashSet<NodeId>, results: &ExtractionResult, filename: &str) {
    let mut str = String::new();
    for (cid,nid) in results.choices.iter() {
        if activated.contains(nid) {
            str.push_str(&format!("N_{}_{} 1\n", cid.0, nid.0[1]));
        }
        else{
            str.push_str(&format!("A_{} 0\n", cid.0));
        }
    }
    fs::write(filename, str).expect("Unable to write file");
}


fn main() {

    // Get command-line arguments
    let args: Vec<String> = env::args().collect();

    // Initialize variables
    let mut filename = String::new();
    let mut extractor = String::from("faster-greedy-dag-mt1");
    let mut bound: f32 = 1.25;
    let mut solver = String::from("gurobi"); // Default solver
    let mut timeout_secs: u64 = 1800; // Default timeout (30 minutes)
    let mut pre_flag: i32 = 2; // Flag for preprocessing only
    let mut result= ExtractionResult::new_empty();
    
    // Parse command line arguments
    let mut i = 1;
    while i < args.len() {
        match args[i].as_str() {
            "--bound" => {
                if i + 1 < args.len() {
                    match args[i + 1].parse::<f32>() {
                        Ok(value) => {
                            bound = value;
                        },
                        Err(_) => {
                            panic!("Error: Invalid bound value");
                        }
                    }
                    i += 2;
                } else {
                    panic!("Error: Missing value for --bound parameter");
                }
            },
            "--solver" => {
                if i + 1 < args.len() {
                    let solver_name = args[i + 1].to_lowercase();
                    if solver_name == "gurobi" || solver_name == "cplex" || solver_name == "cpsat" {
                        solver = solver_name;
                    } else {
                        panic!("Error: Unknown solver '{}'. Use 'gurobi', 'cplex' or 'cpsat'", args[i + 1]);
                    }
                    i += 2;
                } else {
                    panic!("Error: Missing value for --solver parameter");
                }
            },
            "--timeout" => {
                if i + 1 < args.len() {
                    match args[i + 1].parse::<u64>() {
                        Ok(value) => {
                            if value > 0 {
                                timeout_secs = value;
                            } else {
                                panic!("Error: Timeout must be greater than 0 seconds");
                            }
                        },
                        Err(_) => {
                            panic!("Error: Invalid timeout value");
                        }
                    }
                    i += 2;
                } else {
                    panic!("Error: Missing value for --timeout parameter");
                }
            },
            "--extractor" => {
                if i + 1 < args.len() {
                    let extractor_name = args[i + 1].to_lowercase();
                    if extractor::extractors().keys().any(|key| key.to_lowercase() == extractor_name) {
                        extractor = extractor_name;
                    } else {
                        panic!("Error: Unknown solver '{}'. Select from {:?}", args[i + 1], extractor::extractors().keys());
                    }
                    i += 2;
                } else {
                    panic!("Error: Missing value for --extractor parameter");
                }
            }
            "--pre" => {
                if i + 1 < args.len() {
                    match args[i + 1].parse::<i32>() {
                        Ok(value) => {
                            if value == 0 || value == 1 || value == 2 || value == 3 || value == 4 || value == 5 {
                                pre_flag = value;
                            } else {
                                panic!("Error: Pre flag must be 0, 1, or 2");
                            }
                        },
                        Err(_) => {
                            panic!("Error: Invalid pre flag value");
                        }
                    }
                    i += 2;
                } else {
                    panic!("Error: Missing value for --pre parameter");
                }
            },
            arg => {
                // Assume this is the filename
                filename = arg.to_string();
                i += 1;
            }
        }
    }

    if pre_flag == 1 || pre_flag == 3 {
        bound = -1.0;
    }

    // Check if filename is provided
    if filename.is_empty() {
        eprintln!("Error: No input file specified");
        eprintln!("Usage: {} [OPTIONS] <input.json>", args[0]);
        eprintln!("Options:");
        eprintln!("  --bound <value>      Bound value (default: 1.25)");
        eprintln!("  --solver <name>      Solver: gurobi, cplex, or cpsat (default: gurobi)");
        eprintln!("  --timeout <seconds>  Timeout in seconds (default: 1800)");
        eprintln!("  --extractor <name>   Extractor name (default: faster-greedy-dag-mt1)");
        eprintln!("  --pre <flag>         Pre-processing flag: 0-5 (default: 2)");
        eprintln!("");
        eprintln!("Example: {} --bound 1.1 --solver gurobi input.json", args[0]);
        std::process::exit(1);
    }

    let path = std::path::Path::new(&filename);

    let ext = path.extension()
        .expect("Error: 文件没有扩展名");
    if ext.to_string_lossy().to_lowercase() != "json" {
        panic!("Error: 文件类型不是 json");
    }

    let base_name = path.file_stem()
        .expect("Error: 无法提取文件名主体")
        .to_string_lossy()
        .to_string();

    let lp_file_path = format!("file/lp/{}_{}.lp", base_name, bound);
    let mst_file_path = format!("file/start/{}_{}.mst", base_name, bound);
    let zero_file_path = format!("file/ZeroNode/{}_{}_{}.mst", base_name, bound, solver);
    let redundancy_file_path = format!("file/redundancy/{}_{}.json", base_name, bound);
    let result_file = format!("file/result/{}_{}_{}.sol", base_name, bound, solver);
    let pool = format!("file/pool/{}_{}_{}", base_name, bound, solver);
    let log_file = format!("file/log/{}_{}_{}.log", base_name, bound, solver);

    if extractor != "faster-greedy-dag" && extractor != "faster-greedy-dag-mt1" && extractor != "faster-greedy-dag-mt2" {
        pre_flag = 5;
    }

    println!("Using solver: {}", solver);
    println!("Using extractor: {}", extractor);
    println!("Using bound value: {}", bound);
    println!("Using timeout: {} seconds", timeout_secs);
    println!("Pre-processing mode: {}", match pre_flag {
        0 => "Solver only (skip LP generation)",
        1 => "Generate LP file only (no solving) -- wo warm start",
        2 => "Generate LP file only (no solving) -- w warm start",
        3 => "Full run (generate LP and solve) -- wo warm start",
        4 => "Full run (generate LP and solve) -- w warm start",
        5 => "Heuristic run only",
        _ => {
            panic!("unknown pre-flag");
        }
    });
    println!("LP file path: {}", lp_file_path);
    println!("MST file path: {}", mst_file_path);
    println!("Zero Node file path: {}", zero_file_path);


    let mut zero_node = Vec::<NodeId>::new();
    let mut runtime: f64 = 0.0;
    let mut total_egraph;
    
    // Create all necessary directories
    let directories = vec![
        "file",
        "file/lp",
        "file/start", 
        "file/ZeroNode",
        "file/result",
        "file/log",
        "file/redundancy",
        &pool,
    ];
    
    for dir in directories {
        fs::create_dir_all(dir).unwrap_or_else(|err| {
            eprintln!("Warning: Could not create directory '{}': {}", dir, err);
        });
    }

    if pre_flag == 0 {
        println!("Skipping extraction phase (--pre=0 mode)");
        let empty_data = Data {
            nodes: IndexMap::new(),
            root_eclasses: Vec::new(),
        };
        total_egraph = SerializedEGraph::from_Data(&empty_data)
            .with_context(|| format!("Failed to create empty egraph"))
            .unwrap();
    }
    else {
        let file_path: PathBuf = env::current_dir().unwrap().join(&filename);
        println!("Loading file: {}", file_path.display());
 
        let mut data: Data = Data::from_json_file(&file_path)
            .with_context(|| format!("Failed to parse {filename}"))
            .unwrap();
        // remove_redundant_nodes(&mut data, "dag");
        data.to_json_file(redundancy_file_path.clone());
        let mut paritioned_data = Vec::<Data>::new();
 
        total_egraph = SerializedEGraph::from_Data(&data).with_context(|| format!("Failed to get egraph")).unwrap();


        // remove lp and mst file if exist
        if std::path::Path::new(&lp_file_path).exists() {
            fs::remove_file(&lp_file_path)
                .unwrap_or_else(|err| eprintln!("Failed to delete {}: {}", lp_file_path, err));
        }
        if std::path::Path::new(&mst_file_path).exists() {
            fs::remove_file(&mst_file_path)
                .unwrap_or_else(|err| eprintln!("Failed to delete {}: {}", mst_file_path, err));
        }
    }

    if pre_flag == 2 || pre_flag == 4 || pre_flag == 5 {
        let mut extractors: indexmap::IndexMap<&str, extractor::ExtractorDetail, _> = extractor::extractors();
        extractors.retain(|_, ed| ed.get_use_for_bench());
        let extractor_name: String = extractor.into();
        let ed = extractors
            .get(extractor_name.as_str())
            .with_context(|| format!("Unknown extractor: {extractor_name}"))
            .unwrap();
        let start = Instant::now();
        result = ed.get_extractor().extract(&total_egraph, &total_egraph.root_eclasses);
        let grownth_duration = start.elapsed();
        runtime += grownth_duration.as_secs_f64();
        result.check(&total_egraph);
        let tree = result.tree_cost(&total_egraph, &total_egraph.root_eclasses);
        let dag = result.dag_cost(&total_egraph, &total_egraph.root_eclasses);
        let depth = result.depth_cost(&total_egraph, &total_egraph.root_eclasses);
        println!("{:<18}: runtime-{} tree:{} dag:{} depth: {}", extractor_name, runtime, tree, dag, depth);
    }

    if pre_flag == 1 || pre_flag == 2 || pre_flag == 3 || pre_flag == 4 {
        // Generate MST files based on solver type - only when pre_flag == 1
        if (pre_flag == 2 || pre_flag == 4) {
            collect_results(result.cost.clone(), bound, &mut zero_node);
            println!("zero_node: {:?}", zero_node.len());
            let activated: FxHashSet<NodeId> = result.activate_nodes(&total_egraph, &total_egraph.root_eclasses);
            if solver == "gurobi" || solver == "cplex" {
                gen_gurobi_mst(&activated,&result, &mst_file_path);
                println!("MST file successfully generated at: {}", mst_file_path);
            }
            //  else if solver == "cplex" {
            //     gen_cplex_mst(&activated,&result, &mst_file_path);
            //     println!("MST file successfully generated at: {}", mst_file_path);
            // }
            else if solver == "cpsat" {
                let mut str = String::new();
                for nid in zero_node.iter() {
                    str.push_str(&format!("N_{}_{}\n", nid.0[0], nid.0[1]));
                }
                fs::write(zero_file_path.clone(), str).expect("Unable to write file");
                println!("Zero Node file successfully generated at: {}", zero_file_path);
                gen_gurobi_mst(&activated,&result, &mst_file_path);
                println!("MST file successfully generated at: {}", mst_file_path);
            }
            else {
                panic!("Error: Unknown solver: {}", solver);
            }

            println!("Generating LP file: {}", lp_file_path);
            ilp_gen::generate_ilp_file(&total_egraph, &total_egraph.root_eclasses, &lp_file_path, Some(zero_node));
        }
        else{
            ilp_gen::generate_ilp_file(&total_egraph, &total_egraph.root_eclasses, &lp_file_path, None);
        }
        println!("LP file successfully generated at: {}", lp_file_path);
    }

    if pre_flag == 0 || pre_flag == 3 || pre_flag == 4 {
        println!("Running solver: {}", solver);
        
        // Make sure the LP file exists
        if !std::path::Path::new(&lp_file_path).exists() {
            panic!("Error: LP file not found: {}", lp_file_path);
        }


        // Check if MST file exists when in solver-only mode
        if !std::path::Path::new(&mst_file_path).exists() {
            eprintln!("Warning: MST file not found: {}", mst_file_path);
            eprintln!("Continuing without warm start solution");
        }

        if solver == "cpsat" && !std::path::Path::new(&zero_file_path).exists() {
            eprintln!("Warning: Zero Node file not found: {}", zero_file_path);
            eprintln!("Continuing without warm start solution");
        }

        // Run the selected solver as a child process
        let mut runtime_solve: f64 = 0.0;
        let start_solve = Instant::now();
        let mut child = match solver.as_str() {
            "gurobi" => {
                // Using Gurobi
                let mut cmd = Command::new("gurobi/gurobi_solver");
                let mut args = vec![
                    "--lp_file".to_string(),
                    lp_file_path.clone(),
                    "--output_file".to_string(), 
                    result_file.clone(),
                    "--time_limit".to_string(),
                    timeout_secs.to_string(),
                    // "--solution_pool_dir".to_string(),
                    // pool,
                    "--log_file".to_string(),
                    log_file,
                ];
                
                // Add MST file if it exists
                if std::path::Path::new(&mst_file_path).exists() {
                    args.insert(0, "--mst_file".to_string());
                    args.insert(1, mst_file_path.clone());
                }

                
                println!("command: {}", args.join(" "));
                
                cmd.args(args)
                    .spawn()
                    .expect("Failed to start Gurobi solver")

                
            },
            "cplex" => {
                // Using CPLEX
                let mut cmd = Command::new("cplex/cplex_solver");
                let mut args = vec![
                    "--lp_file".to_string(),
                    lp_file_path.clone(),
                    "--output_file".to_string(), 
                    result_file.clone(),
                    "--time_limit".to_string(),
                    timeout_secs.to_string(),
                    // "--solution_pool_dir".to_string(),
                    // pool,
                    "--log_file".to_string(),
                    log_file,
                ];
                
                // Add MST file if it exists
                if std::path::Path::new(&mst_file_path).exists() {
                    args.insert(0, "--mst_file".to_string());
                    args.insert(1, mst_file_path.clone());
                }

                // clear;cplex/cplex_solver --lp_file file/lp/serialized_egraph_32_1.25.lp --output_file file/result/serialized_egraph_32_1.25_cplex.sol --log_file file/log/serialized_egraph_32_1.25_cplex.log --time_limit 50 --solution_pool_dir pool --mst_file file/start/serialized_egraph_32_1.25_cplex.mst

                println!("command: {}", args.join(" "));
                
                cmd.args(args)
                    .spawn()
                    .expect("Failed to start CPLEX solver")
            },
            "cpsat" => {
                let mut cmd = Command::new("cpsat/cpsat");
                let mut args = vec![
                    "--egraph_json_file".to_string(),
                    redundancy_file_path.to_string(),
                    "--output_sol_file".to_string(), 
                    result_file.clone(),
                    "--time_limit".to_string(),
                    timeout_secs.to_string(),
                    // "--solution_pool_dir".to_string(),
                    // pool,
                    "--log_file".to_string(),
                    log_file,
                ];

                if std::path::Path::new(&mst_file_path).exists() {
                    args.insert(0, "--total_gurobi_mst".to_string());
                    args.insert(1, mst_file_path.clone());
                }

                if std::path::Path::new(&zero_file_path).exists() {
                    args.insert(2, "--zero_node_mst".to_string());
                    args.insert(3, zero_file_path.clone());
                }

                
                println!("command: {}", args.join(" "));

                cmd.args(args)
                    .spawn()
                    .expect("Failed to start CPSAT solver")
            },
            _ => {
                panic!("Error: Unknown solver: {}", solver);
            }
        };


        println!("-----------------------------------------------------");
        let status = child.wait().expect("Failed to wait for solver process");
        println!("-----------------------------------------------------");

        let grownth_duration_solve = start_solve.elapsed();
        runtime_solve += grownth_duration_solve.as_secs_f64();

        if !status.success() {
            
            panic!("{} did not exit successfully.", solver);
        }

        if !std::path::Path::new(result_file.as_str()).exists() {
            panic!("Solver did not produce a solution file");
        }

        let sol_contents = fs::read_to_string(result_file).expect("Failed to read solution file");
        if sol_contents.trim().is_empty() {
            panic!("Solver produced an empty solution file");
        }
        let mut ilp_solution = ExtractionResult::new(IndexMap::new());
        
        // Parse the solution file
        for line in sol_contents.lines() {
            let line = line.trim();
            if line.is_empty() || line.starts_with('#') {
                continue;
            }

            let parts: Vec<_> = line.split_whitespace().collect();
            if parts.len() == 2 {
                let var_name = parts[0];
                if var_name.starts_with("N_") {
                    let cid = var_name[2..].split('_').next().unwrap().parse::<u32>().unwrap();
                    let nid = var_name[2..].split('_').nth(1).unwrap().parse::<u32>().unwrap();
                    let var_value_str = parts[1];
                    let val = var_value_str.parse::<f64>().expect(format!("Failed to parse solution value: {:?}", var_value_str).as_str()).round() as i32;
                    if val == 1 {
                        if !ilp_solution.choices.contains_key(&ClassId::from(cid)) {
                            ilp_solution.choose(ClassId::from(cid), NodeId::from((cid, nid)));
                        } else {
                            panic!("classid already exists");
                        }
                    }
                }
            }
        }



        // Skip solution checking if we used an empty e-graph
        println!("Solution found with solver: {}", solver);
    }
}