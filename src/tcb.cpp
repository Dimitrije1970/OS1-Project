#include "../h/tcb.hpp"
#include "../lib/console.h"

int TCB::ID = 0;
TCB* TCB::running = nullptr;
time_t TCB::time_slice_counter = 0;

TCB *TCB::create_thread(TCB **handle, TCB::Body body, void *args, uint64 *stack) {
    TCB* tcb = new TCB(body, args, DEFAULT_TIME_SLICE, stack);
    tcb->set_user_mode(RiscV::get_user_mode());
    *handle = tcb;
    ID++;

    return tcb;
}

void TCB::thread_wrapper() {
    RiscV::popSppSpie();
    running->body(running->args);
    running->set_finished(true);
    thread_dispatch();
}

void TCB::yield(){
    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_DISPATCH));
    __asm__ volatile ("ecall");
}

void TCB::dispatch() {
    TCB* old = running;
    if(!old->is_finished() && !old->is_sleeping() && !old->is_blocked()) Scheduler::put(old);
    running = Scheduler::get();

    if(old != running && running != nullptr){
        contextSwitch(&(old->context), &(running->context));
    }
}

void TCB::join(TCB* handle) {
    while(!handle->is_finished()){
        TCB::dispatch();
    }
}

void TCB::outputThreadBody(void *) {

}



