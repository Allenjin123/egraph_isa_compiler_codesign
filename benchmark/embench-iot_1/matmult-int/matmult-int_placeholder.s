	.file	"matmult-int.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	benchmark_body.isra.0, @function
benchmark_body.isra.0:
.L2:
.L4:
.L5:
.L6:
.L8:
.L7:
.L19:
	.size	benchmark_body.isra.0, .-benchmark_body.isra.0
	.align	2
	.type	benchmark_body.constprop.0.isra.0, @function
benchmark_body.constprop.0.isra.0:
.L21:
.L22:
.L23:
.L24:
.L26:
.L25:
	.size	benchmark_body.constprop.0.isra.0, .-benchmark_body.constprop.0.isra.0
	.align	2
	.globl	initialise_board
	.type	initialise_board, @function
initialise_board:
	.size	initialise_board, .-initialise_board
	.align	2
	.globl	start_trigger
	.type	start_trigger, @function
start_trigger:
	.size	start_trigger, .-start_trigger
	.align	2
	.globl	stop_trigger
	.type	stop_trigger, @function
stop_trigger:
	.size	stop_trigger, .-stop_trigger
	.align	2
	.globl	values_match
	.type	values_match, @function
values_match:
	.size	values_match, .-values_match
	.align	2
	.globl	warm_caches
	.type	warm_caches, @function
warm_caches:
	.size	warm_caches, .-warm_caches
	.align	2
	.globl	benchmark
	.type	benchmark, @function
benchmark:
	.size	benchmark, .-benchmark
	.align	2
	.globl	InitSeed
	.type	InitSeed, @function
InitSeed:
	.size	InitSeed, .-InitSeed
	.align	2
	.globl	Test
	.type	Test, @function
Test:
.L44:
.L46:
.L45:
	.size	Test, .-Test
	.align	2
	.globl	RandomInteger
	.type	RandomInteger, @function
RandomInteger:
	.size	RandomInteger, .-RandomInteger
	.align	2
	.globl	Multiply
	.type	Multiply, @function
Multiply:
.L52:
.L54:
.L53:
	.size	Multiply, .-Multiply
	.align	2
	.globl	initialise_benchmark
	.type	initialise_benchmark, @function
initialise_benchmark:
.L59:
.L60:
.L61:
.L62:
	.size	initialise_benchmark, .-initialise_benchmark
	.align	2
	.globl	verify_benchmark
	.type	verify_benchmark, @function
verify_benchmark:
.L68:
.L70:
.L71:
	.size	verify_benchmark, .-verify_benchmark
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
	.size	main, .-main
	.globl	ResultArray
	.globl	ArrayB
	.globl	ArrayB_ref
	.globl	ArrayA
	.globl	ArrayA_ref
	.globl	Seed
	.section	.rodata
	.align	2
	.set	.LANCHOR3,. + 0
.LC0:
	.word	291018000
	.word	315000075
	.word	279049970
	.word	205074215
	.word	382719905
	.word	302595865
	.word	348060915
	.word	308986330
	.word	343160760
	.word	307099935
	.word	292564810
	.word	240954510
	.word	232755815
	.word	246511665
	.word	328466830
	.word	263664375
	.word	324016395
	.word	334656070
	.word	285978755
	.word	345370360
	.word	252241835
	.word	333432715
	.word	299220275
	.word	247745815
	.word	422508990
	.word	316728505
	.word	359662270
	.word	277775280
	.word	323336795
	.word	320656600
	.word	249903690
	.word	251499360
	.word	242195700
	.word	263484280
	.word	348207635
	.word	289485100
	.word	328607555
	.word	300799835
	.word	269351410
	.word	305703460
	.word	304901010
	.word	316252815
	.word	263230275
	.word	208939015
	.word	421993740
	.word	335002930
	.word	348571170
	.word	280992155
	.word	289749970
	.word	259701175
	.word	295249990
	.word	310900035
	.word	250896625
	.word	250154105
	.word	315096035
	.word	236364800
	.word	312879355
	.word	312580685
	.word	275998435
	.word	344137885
	.word	286700525
	.word	325985600
	.word	253054970
	.word	224361490
	.word	353502130
	.word	306544290
	.word	323492140
	.word	259123905
	.word	307731610
	.word	282414410
	.word	281127810
	.word	246936935
	.word	207890815
	.word	233789540
	.word	339836730
	.word	277296350
	.word	319925620
	.word	307470895
	.word	290537580
	.word	292297535
	.word	272571255
	.word	377663320
	.word	304545985
	.word	263001340
	.word	375034885
	.word	325423710
	.word	410620380
	.word	313191730
	.word	356989815
	.word	308508355
	.word	218003850
	.word	272487135
	.word	266000220
	.word	264734710
	.word	367539620
	.word	304146675
	.word	355295500
	.word	276019740
	.word	251415695
	.word	301225235
	.word	272547900
	.word	321522300
	.word	288294345
	.word	247748015
	.word	389912855
	.word	331874890
	.word	370798315
	.word	315467255
	.word	367554485
	.word	311947660
	.word	258809685
	.word	270536510
	.word	256730515
	.word	287143040
	.word	363087030
	.word	285672775
	.word	353670120
	.word	304219695
	.word	274897255
	.word	324684660
	.word	233123995
	.word	227142480
	.word	212655155
	.word	198592290
	.word	345335250
	.word	302661845
	.word	253374925
	.word	233243305
	.word	233750030
	.word	224590040
	.word	200404820
	.word	250791135
	.word	234405760
	.word	211723645
	.word	280630165
	.word	185245875
	.word	296423665
	.word	276278575
	.word	252368265
	.word	278726535
	.word	277690535
	.word	339615440
	.word	320921550
	.word	307114315
	.word	400187215
	.word	334374655
	.word	376286920
	.word	295993530
	.word	362988020
	.word	356272700
	.word	293965465
	.word	261574710
	.word	259690975
	.word	263037705
	.word	416748985
	.word	274683275
	.word	385571030
	.word	402782385
	.word	323927010
	.word	362778710
	.word	267168970
	.word	323401680
	.word	279474330
	.word	201934365
	.word	362624300
	.word	330736145
	.word	371793675
	.word	299650280
	.word	333646005
	.word	264791490
	.word	215918320
	.word	277512760
	.word	264068435
	.word	234555295
	.word	321772515
	.word	217507025
	.word	310372440
	.word	317544750
	.word	245525965
	.word	343183435
	.word	281293570
	.word	326519505
	.word	233494705
	.word	238516065
	.word	297038200
	.word	266273420
	.word	349521550
	.word	259343530
	.word	306032255
	.word	266397915
	.word	210274920
	.word	263743085
	.word	231689610
	.word	251949545
	.word	293562740
	.word	226822900
	.word	309225440
	.word	286212000
	.word	206108715
	.word	236678985
	.word	288404350
	.word	310319375
	.word	282695670
	.word	244150740
	.word	426489380
	.word	387525790
	.word	342018190
	.word	326086505
	.word	352250260
	.word	319997735
	.word	300645835
	.word	284822660
	.word	271837440
	.word	274000415
	.word	361826730
	.word	252399600
	.word	348582320
	.word	375813820
	.word	316588255
	.word	322499110
	.word	273368780
	.word	329706295
	.word	288668335
	.word	234501665
	.word	381962610
	.word	343186285
	.word	337520205
	.word	259637405
	.word	295755465
	.word	284778105
	.word	205310525
	.word	249598310
	.word	256662470
	.word	251533535
	.word	336159770
	.word	249342150
	.word	333559450
	.word	329296590
	.word	278254845
	.word	300673860
	.word	318589575
	.word	315522800
	.word	260632295
	.word	250009765
	.word	337127730
	.word	312810490
	.word	346698590
	.word	260810030
	.word	388289910
	.word	337081285
	.word	283635410
	.word	208148610
	.word	234123865
	.word	259653165
	.word	370115255
	.word	243311450
	.word	377808245
	.word	358786770
	.word	286839730
	.word	321912835
	.word	229541925
	.word	253967450
	.word	223002545
	.word	202302515
	.word	303446955
	.word	268472740
	.word	285580065
	.word	211013405
	.word	287677960
	.word	279773910
	.word	227377310
	.word	197461135
	.word	222469715
	.word	179536615
	.word	306957380
	.word	178407075
	.word	281051570
	.word	279718120
	.word	234868230
	.word	288991535
	.word	290692955
	.word	317729070
	.word	297868235
	.word	213450065
	.word	469270935
	.word	375344910
	.word	326987580
	.word	334565680
	.word	325300040
	.word	290325655
	.word	254703825
	.word	284914960
	.word	245773820
	.word	276641510
	.word	323510795
	.word	271034400
	.word	337424250
	.word	360011440
	.word	281515520
	.word	331261535
	.word	287075125
	.word	313194850
	.word	269889345
	.word	208109115
	.word	420653930
	.word	331900290
	.word	355440665
	.word	318065155
	.word	343785360
	.word	302163035
	.word	308959360
	.word	312666110
	.word	268997740
	.word	288557415
	.word	370158305
	.word	205012650
	.word	318198795
	.word	384484520
	.word	316450105
	.word	378714460
	.word	278680580
	.word	356815220
	.word	307597060
	.word	216073365
	.word	390879235
	.word	358775185
	.word	358895230
	.word	306434180
	.word	315569040
	.word	272688130
	.word	249424325
	.word	274584610
	.word	273530970
	.word	265450585
	.word	325127920
	.word	312802050
	.word	317134900
	.word	298518590
	.word	269975470
	.word	332586535
	.word	245629780
	.word	267021570
	.word	234689035
	.word	208808065
	.word	366356035
	.word	267059560
	.word	349348005
	.word	270158755
	.word	348048340
	.word	291550930
	.word	272717800
	.word	259714410
	.word	236033845
	.word	280627610
	.word	335089770
	.word	176610475
	.word	259339950
	.word	322752840
	.word	236218295
	.word	329687310
	.word	226517370
	.word	272306005
	.word	271484080
	.word	216145515
	.word	400972075
	.word	288475645
	.word	332969550
	.word	338410905
	.word	329052205
	.word	330392265
	.word	306488095
	.word	271979085
	.word	232795960
	.word	257593945
	.word	339558165
	.word	202700275
	.word	320622065
	.word	386350450
	.word	315344865
	.word	329233410
	.word	224852610
	.word	231292540
	.word	236945875
	.word	243273740
	.word	336327040
	.word	305144680
	.word	248261920
	.word	191671605
	.word	241699245
	.word	263085200
	.word	198883715
	.word	175742885
	.word	202517850
	.word	172427630
	.word	296304160
	.word	209188850
	.word	326546955
	.word	252990460
	.word	238844535
	.word	289753485
	.bss
	.align	2
	.set	.LANCHOR0,. + 0
	.set	.LANCHOR1,. + 4096
	.set	.LANCHOR2,. + 8192
	.type	ArrayB, @object
	.size	ArrayB, 1600
ArrayB:
	.zero	1600
	.type	ArrayB_ref, @object
	.size	ArrayB_ref, 1600
ArrayB_ref:
	.zero	1600
	.type	ResultArray, @object
	.size	ResultArray, 1600
ResultArray:
	.zero	1600
	.type	ArrayA, @object
	.size	ArrayA, 1600
ArrayA:
	.zero	1600
	.type	ArrayA_ref, @object
	.size	ArrayA_ref, 1600
ArrayA_ref:
	.zero	1600
	.section	.sbss,"aw",@nobits
	.align	2
	.type	Seed, @object
	.size	Seed, 4
Seed:
	.zero	4
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits
