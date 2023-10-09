#include "config.h"

#include "block.h"
#include "util.h"

Block blocks[] = {
    {"sb-disk",    1800,  3 },
    {"sb-cpu",     20,    4 },
    {"sb-ram",    20, 5 },
    {"sb-bluetooth",  0,   6 },
    {"sb-internet", 1,    7 },
    {"sb-sound",     0,    8 },
    {"sb-brightness",  0,    9 },
    {"sb-battery",  120,    10 },
    {"sb-time", 15,    11 },
};

const unsigned short blockCount = LEN(blocks);
