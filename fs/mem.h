#ifndef _MEM_H_
#define _MEM_H_

#include "global.h"

/* Prototypes */
s32   Mem_CreateHeap(void);
void *Mem_Alloc(u32 size);
void  Mem_Free(void *ptr);

#endif
