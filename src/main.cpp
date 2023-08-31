#include "../h/syscall_c.h"
#include "../h/riscv.hpp"
#include "../test/printing.hpp"

bool finished_main = false;
extern void userMain();

void userMain_wrapper(void*){
    printString("userMain() started.\n");
    userMain();
    printString("userMain() ended.\n");
    finished_main = true;
}

void idle(void*){
    while(RiscV::get_user_mode()) thread_dispatch();
}

int main(){
    RiscV::w_stvec(((uint64) &RiscV::interruptRoutine) | 1);

    TCB *main_t = nullptr, *idle_t = nullptr, *t1 = nullptr;

    thread_create(&main_t, nullptr, nullptr);
    TCB::running = main_t;

    RiscV::ms_sstatus(RiscV::SSTATUS_MASK::SSTATUS_SIE);
    printString("USER MODE STARTED.\n");
    RiscV::set_user_mode(true);

    thread_create(&idle_t, &idle, nullptr);
    thread_create(&t1, &userMain_wrapper, nullptr);

    while(!finished_main){
        thread_dispatch();
    }

    RiscV::set_user_mode(false);
    printString("USER MODE ENDED.\n");
    RiscV::mc_sstatus(RiscV::SSTATUS_MASK::SSTATUS_SIE);

    thread_join(idle_t);

    delete main_t;
    delete idle_t;
    delete t1;

    return 0;
}