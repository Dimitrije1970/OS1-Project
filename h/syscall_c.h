#ifndef PROJECT_BASE_V1_1_SYSCALL_C_H
#define PROJECT_BASE_V1_1_SYSCALL_C_H

#include "../lib/hw.h"

constexpr uint64 MEM_ALLOC = 0x1;
constexpr uint64 MEM_FREE = 0x2;

constexpr uint64 THREAD_CREATE = 0x11;
constexpr uint64 THREAD_EXIT = 0x12;
constexpr uint64 THREAD_DISPATCH = 0x13;
constexpr uint64 THREAD_JOIN = 0x14;

constexpr uint64 SEM_OPEN = 0x21;
constexpr uint64 SEM_CLOSE = 0x22;
constexpr uint64 SEM_WAIT = 0x23;
constexpr uint64 SEM_SIGNAL = 0x24;

constexpr uint64 TIME_SLEEP = 0x31;

constexpr uint64 GETC = 0x41;
constexpr uint64 PUTC = 0x42;

void* mem_alloc(size_t);
int mem_free(void*);

class TCB;
typedef TCB* thread_t;
int thread_create(thread_t*, void(*)(void*), void*);
int thread_exit();
void thread_dispatch();
void thread_join(thread_t);

class sem;
typedef sem* sem_t;
int sem_open(sem_t*, unsigned);
int sem_close(sem_t);
int sem_wait(sem_t);
int sem_signal(sem_t);

typedef unsigned long time_t;
int time_sleep(time_t);

const int EOF = -1;
char getc();
void putc(char);

#endif //PROJECT_BASE_V1_1_SYSCALL_C_H
