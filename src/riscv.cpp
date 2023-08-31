#include "../lib/console.h"
#include "../h/riscv.hpp"

bool RiscV::user_mode = false;
SleepingThreadsList RiscV::list_of_sleeping_threads;

void RiscV::popSppSpie() {
    if(TCB::running->get_user_mode()){
        mc_sstatus(RiscV::SSTATUS_MASK::SSTATUS_SPP);
    }else{
        ms_sstatus(RiscV::SSTATUS_MASK::SSTATUS_SPP);
    }

    __asm__ volatile ("csrw sepc, ra");
    __asm__ volatile ("sret");
}

void RiscV::handleEcallInterrupt() {
    uint64 volatile scause = r_scause();

    uint64 volatile sepc = RiscV::r_sepc() + 4;
    uint64 volatile sstatus = RiscV::r_sstatus();

    if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){

        uint64 volatile a0 = RiscV::r_a0();

        if(a0 == MEM_ALLOC){
            uint64 num_of_blocks;
            uint64* ret;

            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(num_of_blocks));
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(ret));

            *ret = (uint64) __mem_alloc(num_of_blocks * MEM_BLOCK_SIZE);

        }else if(a0 == MEM_FREE){
            void* ptr;
            uint64* ret;

            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(ptr));
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(ret));

            *ret = __mem_free(ptr);

        }else if(a0 == THREAD_CREATE){
            thread_t* handle;
            TCB::Body start_routine;
            void* args = nullptr;
            uint64* stack;
            int *ret;

            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(handle));
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(start_routine));
            __asm__ volatile ("ld %0, 13*8(fp)" : "=r"(args));
            __asm__ volatile ("ld %0, 14*8(fp)" : "=r"(stack));
            __asm__ volatile ("ld %0, 15*8(fp)" : "=r"(ret));

            *ret = TCB::create_thread(handle, start_routine, args, stack) != nullptr ? 0 : -1;

        }else if(a0 == THREAD_EXIT){
            TCB::running->set_finished(true);
            TCB* temp = TCB::running;

            TCB::dispatch();

            __mem_free(temp);

        }else if(a0 == THREAD_DISPATCH){
            TCB::time_slice_counter = 0;
            TCB::dispatch();

        }else if(a0 == THREAD_JOIN){
            thread_t handle;
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(handle));

            TCB::join(handle);

        }else if(a0 == SEM_OPEN){
            sem_t* handle;
            int val;
            int* ret;

            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(handle));
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(val));
            __asm__ volatile ("ld %0, 13*8(fp)" : "=r"(ret));

            if(sem::create_semaphore(handle, val)){
                *ret = 0;
            }else{
                *ret = -1;
            }

        }else if(a0 == SEM_CLOSE){
            sem_t handle;
            int* ret;

            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(handle));
            __asm__ volatile("ld %0, 12*8(fp)" : "=r"(ret));

            *ret = handle->close();

        }else if(a0 == SEM_WAIT){
            sem_t handle;
            int* ret;

            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(handle));
            __asm__ volatile("ld %0, 12*8(fp)" : "=r"(ret));

            *ret = handle->wait();

        }else if(a0 == SEM_SIGNAL){
            sem_t handle;
            int* ret;

            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(handle));
            __asm__ volatile("ld %0, 12*8(fp)" : "=r"(ret));

            *ret = handle->signal();

        }else if(a0 == TIME_SLEEP){
            time_t slice;

            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(slice));

            if(slice > 0){
                TCB::running->set_sleeping(true);
                RiscV::list_of_sleeping_threads.put(TCB::running, slice);
            }

            TCB::dispatch();

        }else if(a0 == GETC){
            char* ret;
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(ret));

            *ret = __getc();

        }else if(a0 == PUTC){
            char c;
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(c));

            __putc(c);
        }

        w_sepc(sepc);
        w_sstatus(sstatus);
    }else{
        __putc(scause + '0');
        __putc('\n');
        while(true);
    }
}

void RiscV::handleTimerInterrupt() {
    time_t volatile curr = RiscV::list_of_sleeping_threads.peek_time_first();

    if(curr != -1UL){
        RiscV::list_of_sleeping_threads.dec_time_first();
        if(RiscV::list_of_sleeping_threads.peek_time_first() <= 0){
            RiscV::list_of_sleeping_threads.remove_finished();
        }
    }

    mc_sip(SIP_MASK::SIP_SSIP);

    TCB::time_slice_counter++;
    if(TCB::time_slice_counter >= TCB::running->get_time_slice()){
        uint64 volatile sepc = RiscV::r_sepc();
        uint64 volatile sstatus = RiscV::r_sstatus();

        TCB::time_slice_counter = 0;
        TCB::dispatch();

        w_sepc(sepc);
        w_sstatus(sstatus);
    }
}

void RiscV::handleExternalInterrupt() {
    console_handler();
}
