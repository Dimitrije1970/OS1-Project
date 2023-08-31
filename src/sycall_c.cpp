#include "../h/syscall_c.h"
#include "../lib/console.h"

void* mem_alloc(size_t size) {
    uint64 num_of_blocks = (size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;

    uint64 res = 0;
    uint64* ret = &res;

    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    __asm__ volatile ("mv a1, %0" : : "r"(num_of_blocks));
    __asm__ volatile ("mv a0, %0" : : "r"(MEM_ALLOC));
    __asm__ volatile ("ecall");

    return (void*) *ret;
}

int mem_free(void* ptr) {
    uint64 res = 0;
    uint64* ret = &res;

    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    __asm__ volatile ("mv a1, %0" : : "r"(ptr));
    __asm__ volatile ("mv a0, %0" : : "r"(MEM_FREE));
    __asm__ volatile ("ecall");

    return (int) *ret;
}

int thread_create(thread_t* handle, void (*start_routine)(void *), void* args) {
    int id = 0;
    int* res = &id;

    auto* stack = new uint64[DEFAULT_STACK_SIZE];
    __asm__ volatile ("mv a4, %0" : : "r"(stack));
    __asm__ volatile ("mv a3, %0" : : "r"(args));
    __asm__ volatile ("mv a2, %0" : : "r"(start_routine));
    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_CREATE));
    __asm__ volatile ("mv a5, %0" : : "r"(res));
    __asm__ volatile ("ecall");

    return *res;
}

int thread_exit() {
    int id = 0;
    int* res = &id;

    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_EXIT));
    __asm__ volatile ("ecall");

    return *res;
}

void thread_dispatch() {
    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_DISPATCH));
    __asm__ volatile ("ecall");
}

void thread_join(thread_t handle) {
    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_JOIN));
    __asm__ volatile ("ecall");
}

int sem_open(sem_t* handle, unsigned int val) {
    int x = 0;
    int* ret = &x;

    __asm__ volatile ("mv a2, %0" : : "r"(val));
    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    __asm__ volatile ("mv a0, %0" : : "r"(SEM_OPEN));
    __asm__ volatile ("mv a3, %0" : : "r"(ret));
    __asm__ volatile ("ecall");

    return *ret;
}

int sem_close(sem_t handle) {
    int x = 0;
    int* ret = &x;

    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    __asm__ volatile ("mv a0, %0" : : "r"(SEM_CLOSE));
    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    __asm__ volatile ("ecall");

    return *ret;
}

int sem_wait(sem_t handle) {
    int x = 0;
    int* ret = &x;

    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    __asm__ volatile ("mv a0, %0" : : "r"(SEM_WAIT));
    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    __asm__ volatile ("ecall");

    return *ret;
}

int sem_signal(sem_t handle) {
    int x = 0;
    int* ret = &x;

    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    __asm__ volatile ("mv a0, %0" : : "r"(SEM_SIGNAL));
    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    __asm__ volatile ("ecall");

    return *ret;
}

int time_sleep(time_t slice) {
    __asm__ volatile ("mv a1, %0" : : "r"(slice));
    __asm__ volatile ("mv a0, %0" : : "r"(TIME_SLEEP));
    __asm__ volatile ("ecall");

    return 0;
}

char getc() {
    char c = '\0';
    char* ret = &c;

    __asm__ volatile ("mv a1, %0" : : "r"(ret));
    __asm__ volatile ("mv a0, %0" : : "r"(GETC));
    __asm__ volatile ("ecall");

    if(ret != nullptr){
        return *ret;
    }else{
        return ' ';
    }
}

void putc(char c) {
    __asm__ volatile ("mv a1, %0" : : "r"(c));
    __asm__ volatile ("mv a0, %0" : : "r"(PUTC));
    __asm__ volatile ("ecall");
}

