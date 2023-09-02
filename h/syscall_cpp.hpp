#ifndef PROJECT_BASE_V1_1_SYSCALL_CPP_HPP
#define PROJECT_BASE_V1_1_SYSCALL_CPP_HPP

#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"
#include "../h/tcb.hpp"

void* operator new(size_t);
void* operator new[](size_t);

void operator delete(void*);
void operator delete[](void*);

class Thread {
public:
    Thread (void (*body)(void*), void* arg);
    virtual ~Thread ();
    int start ();
    void join();
    static void dispatch ();
    static int sleep (time_t);
    static void threadWrapper(void *);
protected:
    Thread ();
    virtual void run () {}
private:
    thread_t myHandle;
};

class Semaphore{
public:

    Semaphore (unsigned init = 1);
    virtual ~Semaphore ();

    int wait();
    int signal();

private:
    sem_t myHandle;
};

class PeriodicThread : public Thread {
public:
    static void wrapper(void*);
    void terminate ();

protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation() {}

private:
    time_t period;

    struct periodic_s{
        PeriodicThread* periodic_thread;
        time_t period;
    };
};

class Console {
public:
    static char getc();
    static void putc(char);
};

#endif //PROJECT_BASE_V1_1_SYSCALL_CPP_HPP