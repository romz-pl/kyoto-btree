#ifndef ROMZ_SPLIT_ARGS_H
#define ROMZ_SPLIT_ARGS_H

#define SPLI_ARGS enum { kMaxArgs = 64 }; \
int argc = 0;                             \
char *argv[kMaxArgs];                     \
char *p2 = strtok(command_line, " ");     \
while (p2 && argc < kMaxArgs-1)           \
  {                                       \
    argv[argc++] = p2;                    \
    p2 = strtok(0, " ");                  \
  }                                       \
argv[argc] = 0;      


#endif


