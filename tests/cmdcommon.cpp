#include "cmdcommon.h"

// global variables
uint64_t g_rnd_x = 123456789;
uint64_t g_rnd_y = 362436069;
uint64_t g_rnd_z = 521288629;
uint64_t g_rnd_w = 88675123;


// get the random seed
void mysrand(int64_t seed) {
  g_rnd_x = seed;
  for (int32_t i = 0; i < 16; i++) {
    myrand(1);
  }
}


// get a random number
int64_t myrand(int64_t range) {
  uint64_t t = g_rnd_x ^ (g_rnd_x << 11);
  g_rnd_x = g_rnd_y;
  g_rnd_y = g_rnd_z;
  g_rnd_z = g_rnd_w;
  g_rnd_w = (g_rnd_w ^ (g_rnd_w >> 19)) ^ (t ^ (t >> 8));
  return (g_rnd_w & kc::INT64MAX) % range;
}



