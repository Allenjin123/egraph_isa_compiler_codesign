#include <stdio.h>

#ifndef PI
#define PI 3.141592653589793115997963468544

#endif

struct int_sqrt {
  unsigned sqrt;
  unsigned frac;
};

static double my_fabs(double x) {
  return (x < 0.0) ? -x : x;
}

static double my_sqrt(double x) {
  if (x <= 0.0) {
    return 0.0;
  }
  double guess = x;
  if (guess < 1.0) {
    guess = 1.0;
  }
  for (int i = 0; i < 12; ++i) {
    guess = 0.5 * (guess + x / guess);
  }
  return guess;
}

static double my_cbrt(double x) {
  if (x == 0.0) {
    return 0.0;
  }
  double guess = x;
  double magnitude = my_fabs(guess);
  if (magnitude < 1.0) {
    magnitude = 1.0;
  }
  guess = (guess < 0.0) ? -magnitude : magnitude;
  for (int i = 0; i < 18; ++i) {
    double guess_sq = guess * guess;
    if (guess_sq == 0.0) {
      break;
    }
    guess = (2.0 * guess + x / guess_sq) / 3.0;
  }
  return guess;
}

/* --------------- helpers --------------- */
static long my_round_to_long(double t) {        /* 最近整数，避免 <math.h> */
  return (long)(t >= 0.0 ? t + 0.5 : t - 0.5);
}

/* --------------- cos(x) --------------- */
static double my_cos(double x) {
  /* 四象限约简：k = round(x / (pi/2)), y = x - k*(PI/2) */
  const double INV_PI_2 = 0.63661977236758134308;      /* 2/pi */
  const double PI_2_HI  = 1.57079632679489655800;      /* (pi/2) high */
  const double PI_2_LO  = 6.12323399573676603587e-17;  /* (pi/2) low  */

  long   k = my_round_to_long(x * INV_PI_2);
  double y = x - k * PI_2_HI;
         y = y - k * PI_2_LO;                          /* 抑制约简误差 */
  double z = y * y;

  /* cos(y) minimax 多项式：1 + z*(C1 + z*(C2 + ...))，y ∈ [-pi/4, pi/4] */
  const double C1 = -0.5;
  const double C2 =  4.16666666666666019037e-02;
  const double C3 = -1.38888888888741095749e-03;
  const double C4 =  2.48015872894767294178e-05;
  const double C5 = -2.75573143513906633035e-07;
  const double C6 =  2.08757232129817482790e-09;
  const double C7 = -1.13596475577881948265e-11;

  double cosy = 1.0 + z*(C1 + z*(C2 + z*(C3 + z*(C4 + z*(C5 + z*(C6 + z*C7))))));

  /* sin(y) 多项式（给象限还原用）：y + y*z*(S1 + z*(S2 + ...)) */
  const double S1 = -1.66666666666666324348e-01;
  const double S2 =  8.33333333332248946124e-03;
  const double S3 = -1.98412698298579493134e-04;
  const double S4 =  2.75573137070700676789e-06;
  const double S5 = -2.50507602534068634195e-08;
  const double S6 =  1.58969099521155010221e-10;

  double siny = y + y*z*(S1 + z*(S2 + z*(S3 + z*(S4 + z*(S5 + z*S6)))));

  /* 根据 k mod 4 还原 cos(x) */
  switch ((int)(k & 3L)) {
      case 0:  return cosy;
      case 1:  return -siny;
      case 2:  return -cosy;
      default: return  siny;
  }
}

static double my_acos(double x) {
  if (x >= 1.0) {
    return 0.0;
  }
  if (x <= -1.0) {
    return PI;
  }
  double low = 0.0;
  double high = PI;
  for (int i = 0; i < 60; ++i) {
    double mid = 0.5 * (low + high);
    double cos_mid = my_cos(mid);
    if (cos_mid > x) {
      low = mid;
    } else {
      high = mid;
    }
  }
  return 0.5 * (low + high);
}

static void SolveCubic(double a,
                       double b,
                       double c,
                       double d,
                       int *solutions,
                       double *x) {
  long double a1 = b / a;
  long double a2 = c / a;
  long double a3 = d / a;
  long double Q = (a1 * a1 - 3.0 * a2) / 9.0;
  long double R = (2.0 * a1 * a1 * a1 - 9.0 * a1 * a2 + 27.0 * a3) / 54.0;
  double R_val = (double)R;
  double Q_val = (double)Q;
  double R2_Q3 = (double)(R * R - Q * Q * Q);

  double Q3 = (double)(Q * Q * Q);
  double sqrtQ3 = (Q3 > 0.0) ? my_sqrt(Q3) : 0.0;
  if (R2_Q3 <= 0.0) {
    double ratio;
    if (sqrtQ3 > 0.0) {
      ratio = R_val / sqrtQ3;
    } else {
      ratio = (R_val >= 0.0) ? 1.0 : -1.0;
    }
    if (ratio > 1.0) {
      ratio = 1.0;
    } else if (ratio < -1.0) {
      ratio = -1.0;
    }
    double theta = my_acos(ratio);
    *solutions = 3;
    double sqrtQ = my_sqrt((Q_val >= 0.0) ? Q_val : 0.0);
    double factor = -2.0 * sqrtQ;
    double offset = (double)a1 / 3.0;
    x[0] = factor * my_cos(theta / 3.0) - offset;
    x[1] = factor * my_cos((theta + 2.0 * PI) / 3.0) - offset;
    x[2] = factor * my_cos((theta + 4.0 * PI) / 3.0) - offset;
  } else {
    *solutions = 1;
    double term = my_sqrt(my_fabs(R2_Q3)) + my_fabs(R_val);
    double root = my_cbrt(term);
    if (root != 0.0) {
      root += Q_val / root;
    }
    root *= (R < 0.0) ? 1.0 : -1.0;
    root -= (double)a1 / 3.0;
    x[0] = root;
  }
}

#define BITSPERLONG 32
#define TOP2BITS(x) (((x) & (3UL << (BITSPERLONG - 2))) >> (BITSPERLONG - 2))

static void usqrt(unsigned long x, struct int_sqrt *q) {
  unsigned long a = 0UL;
  unsigned long r = 0UL;
  unsigned long e = 0UL;

  for (int i = 0; i < BITSPERLONG; i++) {
    r = (r << 2) + TOP2BITS(x);
    x <<= 2;
    a <<= 1;
    e = (a << 1) + 1;
    if (r >= e) {
      r -= e;
      a++;
    }
  }
  // 旧版本行为：直接将整个 a 值（放大后的定点数）存入 sqrt 字段
  q->sqrt = (unsigned)a;
  q->frac = (unsigned)(a & 0xFFFF);
}

static double rad2deg(double rad) {
  return 180.0 * rad / PI;
}

static double deg2rad(double deg) {
  return PI * deg / 180.0;
}

/* The printf's may be removed to isolate just the math calculations */

int main(void) {
  double a1 = 1.0, b1 = -10.5, c1 = 32.0, d1 = -30.0;
  double a2 = 1.0, b2 = -4.5, c2 = 17.0, d2 = -30.0;
  double a3 = 1.0, b3 = -3.5, c3 = 22.0, d3 = -31.0;
  double a4 = 1.0, b4 = -13.7, c4 = 1.0, d4 = -35.0;
  double x[3];
  double X;
  int solutions;
  int i;
  unsigned long l = 0x3fed0169UL;
  struct int_sqrt q;

  double checksum = 0.0;

  /* solve some cubic functions */
  printf("********* CUBIC FUNCTIONS ***********\n");
  /* should get 3 solutions: 2, 6 & 2.5   */
  SolveCubic(a1, b1, c1, d1, &solutions, x);
  printf("Solutions:");
  for (i = 0; i < solutions; i++) {
    checksum += x[i];
    printf(" %f", x[i]);
  }
  printf("\n");
  /* should get 1 solution: 2.5           */
  SolveCubic(a2, b2, c2, d2, &solutions, x);
  printf("Solutions:");
  for (i = 0; i < solutions; i++) {
    checksum += x[i];
    printf(" %f", x[i]);
  }
  printf("\n");
  SolveCubic(a3, b3, c3, d3, &solutions, x);
  printf("Solutions:");
  for (i = 0; i < solutions; i++) {
    checksum += x[i];
    printf(" %f", x[i]);
  }
  printf("\n");
  SolveCubic(a4, b4, c4, d4, &solutions, x);
  printf("Solutions:");
  for (i = 0; i < solutions; i++) {
    checksum += x[i];
    printf(" %f", x[i]);
  }
  printf("\n");

  /* Now solve some random equations */
  for (a1 = 1; a1 < 10; a1++) {
    for (b1 = 10; b1 > 0; b1--) {
      for (c1 = 5; c1 < 15; c1 += 0.5) {
        for (d1 = -1; d1 > -11; d1--) {
          SolveCubic(a1, b1, c1, d1, &solutions, x);
          printf("Solutions:");
          for (i = 0; i < solutions; i++) {
            checksum += x[i];
            printf(" %f", x[i]);
          }
          printf("\n");
        }
      }
    }
  }

  printf("********* INTEGER SQR ROOTS ***********\n");
  /* perform some integer square roots */
  for (i = 0; i < 1001; ++i) {
    usqrt(i, &q);
    /* remainder differs on some machines */
    checksum += q.sqrt;
    printf("sqrt(%3d) = %2d\n", i, q.sqrt);
  }
  usqrt(l, &q);
  checksum += q.sqrt;
  printf("\nsqrt(%lX) = %X\n", l, q.sqrt);

  printf("********* ANGLE CONVERSION ***********\n");
  /* convert some rads to degrees */
  for (X = 0.0; X <= 360.0; X += 1.0) {
    checksum += deg2rad(X);
    printf("%3.0f degrees = %.12f radians\n", X, deg2rad(X));
  }
  printf("\n");
  for (X = 0.0; X <= (2 * PI + 1e-6); X += (PI / 180)) {
    checksum += rad2deg(X);
    printf("%.12f radians = %3.0f degrees\n", X, rad2deg(X));
  }

  return (checksum != 0.0) ? 0 : 1;
}
