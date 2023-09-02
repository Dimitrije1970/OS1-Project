#ifndef PROJECT_BASE_V1_1_RISCV_HPP
#define PROJECT_BASE_V1_1_RISCV_HPP

#include "../lib/hw.h"
#include "../h/MemoryAllocator.hpp"
#include "../h/syscall_c.h"
#include "../h/sem.hpp"
#include "../h/SleepingThreadsList.hpp"

class SleepingThreadsList;
class RiscV{
private:
    static bool user_mode;
    static SleepingThreadsList list_of_sleeping_threads;

    static void handleEcallInterrupt();
    static void handleTimerInterrupt();
    static void handleExternalInterrupt();
public:
    enum SSTATUS_MASK{
        SSTATUS_SIE = (1 << 1),
        SSTATUS_SPIE = (1 << 5),
        SSTATUS_SPP = (1 << 8)
    };

    enum SIP_MASK{
        SIP_SSIP = (1 << 1),
        SIP_STIP = (1 << 5),
        SIP_SEIP = (1 << 9)
    };

    static void popSppSpie();

    static void w_stvec(uint64);

    static uint64 r_sepc();
    static void w_sepc(uint64);

    static uint64 r_sstatus();
    static void w_sstatus(uint64);
    static void ms_sstatus(uint64 mask);
    static void mc_sstatus(uint64 mask);

    static uint64 r_a0();

    static uint64 r_scause();

    static void mc_sip(uint64 mask);

    static bool get_user_mode() { return user_mode; }
    static void set_user_mode(bool value) { user_mode = value; }

    static void interruptRoutine();
};

inline void RiscV::w_stvec(uint64 val) {
    __asm__ volatile ("csrw stvec, %0" : : "r"(val));
}

inline uint64 RiscV::r_sepc() {
    uint64 volatile sepc;
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));

    return sepc;
}

inline void RiscV::w_sepc(uint64 sepc){
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
}

inline uint64 RiscV::r_sstatus() {
    uint64 volatile sstatus;
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));

    return sstatus;
}

inline void RiscV::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}

inline void RiscV::ms_sstatus(uint64 mask){
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask] "r"(mask));
}

inline void RiscV::mc_sstatus(uint64 mask){
    __asm__ volatile("csrc sstatus, %[mask]" : : [mask] "r"(mask));
}

inline uint64 RiscV::r_a0() {
    uint64 volatile a0;
    __asm__ volatile ("ld %0, 10*8(fp)" : "=r"(a0));

    return a0;
}

inline uint64 RiscV::r_scause() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));

    return scause;
}

inline void RiscV::mc_sip(uint64 mask) {
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
}


#endif //PROJECT_BASE_V1_1_RISCV_HPP