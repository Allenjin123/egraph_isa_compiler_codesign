/* +++Date last modified: 05-Jul-1997 */

/*
**  BITCNTS.C - Test program for bit counting functions
**
**  public domain by Bob Stout & Auke Reitsma
*/

#include <stdio.h>
// #include <stdlib.h>
#include <time.h>
#include <limits.h>

#define FUNCS  7
#ifndef CDECL
#define CDECL
#endif

static unsigned long long bitcnts_rand_state = 1ULL;
static volatile long long bitcnts_checksum = 0;

void srand(unsigned int seed)
{
      bitcnts_rand_state = seed;
}

int rand(void)
{
      bitcnts_rand_state = bitcnts_rand_state * 6364136223846793005ULL + 1ULL;
      return (int)((bitcnts_rand_state >> 32) & 0x7fffffff);
}

static int CDECL bit_shifter(long int x);
int CDECL bit_count(long x);
int CDECL bitcount(long i);
int CDECL ntbl_bitcnt(long x);
int CDECL ntbl_bitcount(long int x);
int CDECL BW_btbl_bitcount(long int x);
int CDECL AR_btbl_bitcount(long int x);

static const unsigned char bit_count_table[256] =
{
      0, 1, 1, 2, 1, 2, 2, 3, 1, 2, 2, 3, 2, 3, 3, 4,
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
      1, 2, 2, 3, 2, 3, 3, 4, 2, 3, 3, 4, 3, 4, 4, 5,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
      2, 3, 3, 4, 3, 4, 4, 5, 3, 4, 4, 5, 4, 5, 5, 6,
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
      3, 4, 4, 5, 4, 5, 5, 6, 4, 5, 5, 6, 5, 6, 6, 7,
      4, 5, 5, 6, 5, 6, 6, 7, 5, 6, 6, 7, 6, 7, 7, 8
};

int atoi(const char *s)
{
    int sign = 1, n = 0;
    if (*s == '-') { sign = -1; s++; }
    else if (*s == '+') s++;
    while (*s >= '0' && *s <= '9') {
        n = n * 10 + (*s - '0');
        s++;
    }
    return sign * n;
}

int main(int argc, char *argv[])
{
      clock_t start, stop;
      long cmin_ms = LONG_MAX, cmax_ms = 0;
      int i, cminix = 0, cmaxix = 0;
      long j, n, seed;
      int iterations;
      long long checksum = 0;
      static int (* CDECL pBitCntFunc[FUNCS])(long) = {
            bit_count,
            bitcount,
            ntbl_bitcnt,
            ntbl_bitcount,
            /*            btbl_bitcnt, DOESNT WORK*/
            BW_btbl_bitcount,
            AR_btbl_bitcount,
            bit_shifter
      };
      static const char *text[FUNCS] = {
            "Optimized 1 bit/loop counter",
            "Ratko's mystery algorithm",
            "Recursive bit count by nybbles",
            "Non-recursive bit count by nybbles",
            /*            "Recursive bit count by bytes",*/
            "Non-recursive bit count by bytes (BW)",
            "Non-recursive bit count by bytes (AR)",
            "Shift and count bits"
      };

      // if (argc < 2) {
      //       fprintf(stderr, "Usage: bitcnts <iterations>\n");
      //       exit(-1);
      // }
      iterations = atoi(argv[1]);

      //puts("Bit counter algorithm benchmark\n");

      for (i = 0; i < FUNCS; i++) {
            start = clock();

            for (j = n = 0, seed = rand(); j < iterations; j++, seed += 13)
                  n += pBitCntFunc[i](seed);

            stop = clock();
            int elapsed = (int)(stop - start);
            int ct_ms = (int)(((unsigned int)elapsed * 1000u) / (unsigned int)CLOCKS_PER_SEC);
            if (ct_ms < cmin_ms) {
                  cmin_ms = ct_ms;
                  cminix = i;
            }
            if (ct_ms > cmax_ms) {
                  cmax_ms = ct_ms;
                  cmaxix = i;
            }

            checksum += ct_ms;
            checksum += (long long)n;
            long secs = ct_ms / 1000;
            long millis = ct_ms % 1000;
            if (millis < 0) millis += 1000, secs -= 1;
            printf("%-38s> Time: %4ld.%03ld sec.; Bits: %ld\n",
                   text[i], secs, millis, n);
      }
      checksum += cmin_ms;
      checksum += cmax_ms;
      checksum += (long long)cminix;
      checksum += (long long)cmaxix;
      checksum += (long long)iterations;
      bitcnts_checksum = checksum;
      printf("\nBest  > %s\n", text[cminix]);
      printf("Worst > %s\n", text[cmaxix]);
      return (checksum > 0) ? 0 : 1;
}

int CDECL bit_count(long x)
{
      int n = 0;

      if (x) do
                  n++;
      while (0 != (x = x & (x - 1)));
      return n;
}

int CDECL bitcount(long i)
{
      i = ((i & 0xAAAAAAAAL) >>  1) + (i & 0x55555555L);
      i = ((i & 0xCCCCCCCCL) >>  2) + (i & 0x33333333L);
      i = ((i & 0xF0F0F0F0L) >>  4) + (i & 0x0F0F0F0FL);
      i = ((i & 0xFF00FF00L) >>  8) + (i & 0x00FF00FFL);
      i = ((i & 0xFFFF0000L) >> 16) + (i & 0x0000FFFFL);
      return (int)i;
}

int CDECL ntbl_bitcount(long int x)
{
      return
            bit_count_table[(int) (x & 0x0000000FUL)] +
            bit_count_table[(int)((x & 0x000000F0UL) >> 4)] +
            bit_count_table[(int)((x & 0x00000F00UL) >> 8)] +
            bit_count_table[(int)((x & 0x0000F000UL) >> 12)] +
            bit_count_table[(int)((x & 0x000F0000UL) >> 16)] +
            bit_count_table[(int)((x & 0x00F00000UL) >> 20)] +
            bit_count_table[(int)((x & 0x0F000000UL) >> 24)] +
            bit_count_table[(int)((x & 0xF0000000UL) >> 28)];
}



int CDECL BW_btbl_bitcount(long int x)
{
      union
      {
            unsigned char ch[4];
            long y;
      } U;

      U.y = x;

      return bit_count_table[U.ch[0]] + bit_count_table[U.ch[1]] +
             bit_count_table[U.ch[3]] + bit_count_table[U.ch[2]];
}

int CDECL AR_btbl_bitcount(long int x)
{
      unsigned char *Ptr = (unsigned char *)&x;
      int Accu;

      Accu  = bit_count_table[*Ptr++];
      Accu += bit_count_table[*Ptr++];
      Accu += bit_count_table[*Ptr++];
      Accu += bit_count_table[*Ptr];
      return Accu;
}


int CDECL ntbl_bitcnt(long x)
{
      int cnt = bit_count_table[(int)(x & 0x0000000FL)];

      if (0L != (x >>= 4))
            cnt += ntbl_bitcnt(x);

      return cnt;
}

static int CDECL bit_shifter(long int x)
{
      int i, n;

      for (i = n = 0; x && (i < (sizeof(long) * CHAR_BIT)); ++i, x >>= 1)
            n += (int)(x & 1L);
      return n;
}
