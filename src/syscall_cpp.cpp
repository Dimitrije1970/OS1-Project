#include "../h/syscall_cpp.hpp"
#include "../h/syscall_c.h"
#include "../h/scheduler.hpp"
#include "../lib/console.h"

void* operator new(size_t size){
    return mem_alloc(size);
}

void* operator new[](size_t size){
    return mem_alloc(size);
}

void operator delete(void* ptr){
    mem_free(ptr);
}

void operator delete[](void* ptr){
    mem_free(ptr);
}

Thread::Thread(void (*body)(void *), void *arg) {
    myHandle = nullptr;
    thread_create(&myHandle, body, arg);
}

Thread::~Thread() {
    myHandle->set_finished(true);
    delete myHandle;
}

int Thread::start() {
    return 0;
}

void Thread::join() {
    if(myHandle) thread_join(myHandle);
}

void Thread::dispatch() {
    thread_dispatch();
}

int Thread::sleep(time_t time) {
    time_sleep(time);
    return 0;
}

Thread::Thread() {
    myHandle = nullptr;
    thread_create(&myHandle, Thread::threadWrapper, (void*)this);
}

void Thread::threadWrapper(void *thread) {
    ((Thread*)thread)->run();
}

Semaphore::Semaphore(unsigned int init) {
    myHandle = nullptr;
    sem_open(&myHandle, init);
}

int Semaphore::wait() {
    return sem_wait(myHandle);
}

int Semaphore::signal() {
    return sem_signal(myHandle);
}

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

void PeriodicThread::wrapper(void* arg) {
    periodic_s* ps = (periodic_s*) arg;

    while(true){
        time_sleep(ps->period);
        ps->periodic_thread->periodicActivation();
    }

    MemoryAllocator::getInstance().free(ps);
}

void PeriodicThread::terminate() {
    thread_exit();
}

PeriodicThread::PeriodicThread(time_t period) {
    this->period = period;

    periodic_s* ps = (periodic_s*) MemoryAllocator::getInstance().mallocBytes(sizeof(periodic_s));
    ps->periodic_thread = this;
    ps->period = period;

    Thread(PeriodicThread::wrapper, ps);
}

char Console::getc() {
    return __getc();
}

void Console::putc(char c) {
    __putc(c);
}

