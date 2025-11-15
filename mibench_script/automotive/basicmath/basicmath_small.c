#include <stdio.h>

#ifndef PI
#define PI 3142  /* PI * 1000 定点数表示 */
#endif

#define SCALE 1000  /* 定点数缩放因子 */

struct int_sqrt {
  unsigned sqrt;
  unsigned frac;
};

static long my_fabs(long x) {
  return (x < 0) ? -x : x;
}

static long my_sqrt(long x) {
  if (x <= 0) {
    return 0;
  }
  long guess = x;
  if (guess < SCALE) {
    guess = SCALE;
  }
  for (int i = 0; i < 12; ++i) {
    guess = (guess + (x * SCALE) / guess) / 2;
  }
  return guess;
}

static long my_cbrt(long x) {
  if (x == 0) {
    return 0;
  }
  long guess = x;
  long magnitude = my_fabs(guess);
  if (magnitude < SCALE) {
    magnitude = SCALE;
  }
  guess = (guess < 0) ? -magnitude : magnitude;
  for (int i = 0; i < 18; ++i) {
    long guess_sq = (guess * guess) / SCALE;
    if (guess_sq == 0) {
      break;
    }
    guess = (2 * guess + (x * SCALE) / guess_sq) / 3;
  }
  return guess;
}

/* --------------- helpers --------------- */
static long my_round_to_long(long t) {        /* 最近整数，定点数转整数 */
  return (t >= 0 ? (t + SCALE/2) / SCALE : (t - SCALE/2) / SCALE);
}

/* --------------- cos(x) --------------- */
static long my_cos(long x) {
  /* 四象限约简：k = round(x / (pi/2)), y = x - k*(PI/2) */
  const long INV_PI_2 = 637;      /* (2/pi) * 1000 */
  const long PI_2 = 1571;         /* (pi/2) * 1000 */

  long k = my_round_to_long((x * INV_PI_2) / SCALE);
  long y = x - k * PI_2;
  long z = (y * y) / SCALE;

  /* cos(y) minimax 多项式简化版：1 + z*C1 */
  const long C1 = -500;  /* -0.5 * 1000 */
  const long C2 = 42;    /* 0.04167 * 1000 */

  long cosy = SCALE + (z * C1) / SCALE + (z * z * C2) / (SCALE * SCALE);

  /* sin(y) 多项式简化版：y - y*z*S1 */
  const long S1 = -167;  /* -0.16667 * 1000 */

  long siny = y + (y * z * S1) / (SCALE * SCALE);

  /* 根据 k mod 4 还原 cos(x) */
  switch ((int)(k & 3L)) {
      case 0:  return cosy;
      case 1:  return -siny;
      case 2:  return -cosy;
      default: return  siny;
  }
}

static long my_acos(long x) {
  if (x >= SCALE) {
    return 0;
  }
  if (x <= -SCALE) {
    return PI;
  }
  long low = 0;
  long high = PI;
  for (int i = 0; i < 60; ++i) {
    long mid = (low + high) / 2;
    long cos_mid = my_cos(mid);
    if (cos_mid > x) {
      low = mid;
    } else {
      high = mid;
    }
  }
  return (low + high) / 2;
}

static void SolveCubic(long a,
                       long b,
                       long c,
                       long d,
                       int *solutions,
                       long *x) {
  long a1 = (b * SCALE) / a;
  long a2 = (c * SCALE) / a;
  long a3 = (d * SCALE) / a;
  long Q = ((a1 * a1) / SCALE - 3 * a2) / 9;
  long R = (2 * (a1 * a1 / SCALE) * a1 / SCALE - 9 * (a1 * a2) / SCALE + 27 * a3) / 54;
  long R_val = R;
  long Q_val = Q;
  long R2_Q3 = (R * R) / SCALE - (Q * Q / SCALE) * Q / SCALE;

  long Q3 = (Q * Q / SCALE) * Q / SCALE;
  long sqrtQ3 = (Q3 > 0) ? my_sqrt(Q3) : 0;
  if (R2_Q3 <= 0) {
    long ratio;
    if (sqrtQ3 > 0) {
      ratio = (R_val * SCALE) / sqrtQ3;
    } else {
      ratio = (R_val >= 0) ? SCALE : -SCALE;
    }
    if (ratio > SCALE) {
      ratio = SCALE;
    } else if (ratio < -SCALE) {
      ratio = -SCALE;
    }
    long theta = my_acos(ratio);
    *solutions = 3;
    long sqrtQ = my_sqrt((Q_val >= 0) ? Q_val : 0);
    long factor = -2 * sqrtQ;
    long offset = a1 / 3;
    x[0] = (factor * my_cos(theta / 3)) / SCALE - offset;
    x[1] = (factor * my_cos((theta + 2 * PI) / 3)) / SCALE - offset;
    x[2] = (factor * my_cos((theta + 4 * PI) / 3)) / SCALE - offset;
  } else {
    *solutions = 1;
    long term = my_sqrt(my_fabs(R2_Q3)) + my_fabs(R_val);
    long root = my_cbrt(term);
    if (root != 0) {
      root += (Q_val * SCALE) / root;
    }
    root = (root * ((R < 0) ? SCALE : -SCALE)) / SCALE;
    root -= a1 / 3;
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

static long rad2deg(long rad) {
  return (180 * rad * SCALE) / PI;
}

static long deg2rad(long deg) {
  return (PI * deg) / 180;
}

/* The printf's may be removed to isolate just the math calculations */

int main(void) {
  long a1 = 1*SCALE, b1 = -10*SCALE-SCALE/2, c1 = 32*SCALE, d1 = -30*SCALE;
  long a2 = 1*SCALE, b2 = -4*SCALE-SCALE/2, c2 = 17*SCALE, d2 = -30*SCALE;
  long a3 = 1*SCALE, b3 = -3*SCALE-SCALE/2, c3 = 22*SCALE, d3 = -31*SCALE;
  long a4 = 1*SCALE, b4 = -13*SCALE-7*SCALE/10, c4 = 1*SCALE, d4 = -35*SCALE;
  long x[3];
  long X;
  int solutions;
  int i;
  unsigned long l = 0x3fed0169UL;
  struct int_sqrt q;

  long checksum = 0;

  /* solve some cubic functions */
  printf("********* CUBIC FUNCTIONS ***********\n");
  /* should get 3 solutions: 2, 6 & 2.5   */
  SolveCubic(a1, b1, c1, d1, &solutions, x);
  printf("Solutions:");
  for (i = 0; i < solutions; i++) {
    checksum += x[i];
    printf(" %ld.%03ld", x[i]/SCALE, my_fabs(x[i]%SCALE));
  }
  printf("\n");
  /* should get 1 solution: 2.5           */
  SolveCubic(a2, b2, c2, d2, &solutions, x);
  printf("Solutions:");
  for (i = 0; i < solutions; i++) {
    checksum += x[i];
    printf(" %ld.%03ld", x[i]/SCALE, my_fabs(x[i]%SCALE));
  }
  printf("\n");
  SolveCubic(a3, b3, c3, d3, &solutions, x);
  printf("Solutions:");
  for (i = 0; i < solutions; i++) {
    checksum += x[i];
    printf(" %ld.%03ld", x[i]/SCALE, my_fabs(x[i]%SCALE));
  }
  printf("\n");
  SolveCubic(a4, b4, c4, d4, &solutions, x);
  printf("Solutions:");
  for (i = 0; i < solutions; i++) {
    checksum += x[i];
    printf(" %ld.%03ld", x[i]/SCALE, my_fabs(x[i]%SCALE));
  }
  printf("\n");

  /* Now solve some random equations */
  for (a1 = 1*SCALE; a1 < 10*SCALE; a1+=SCALE) {
    for (b1 = 10*SCALE; b1 > 0; b1-=SCALE) {
      for (c1 = 5*SCALE; c1 < 15*SCALE; c1 += SCALE/2) {
        for (d1 = -1*SCALE; d1 > -11*SCALE; d1-=SCALE) {
          SolveCubic(a1, b1, c1, d1, &solutions, x);
          printf("Solutions:");
          for (i = 0; i < solutions; i++) {
            checksum += x[i];
            printf(" %ld.%03ld", x[i]/SCALE, my_fabs(x[i]%SCALE));
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
  for (X = 0; X <= 360*SCALE; X += SCALE) {
    checksum += deg2rad(X);
    printf("%3ld degrees = %ld.%03ld radians\n", X/SCALE, deg2rad(X)/SCALE, my_fabs(deg2rad(X)%SCALE));
  }
  printf("\n");
  for (X = 0; X <= (2 * PI); X += (PI / 180)) {
    checksum += rad2deg(X);
    printf("%ld.%03ld radians = %3ld degrees\n", X/SCALE, my_fabs(X%SCALE), rad2deg(X)/SCALE);
  }

  return (checksum != 0) ? 0 : 1;
}
