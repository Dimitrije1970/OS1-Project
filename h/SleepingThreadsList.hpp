#ifndef PROJECT_BASE_V1_1_SLEEPINGTHREADSLIST_HPP
#define PROJECT_BASE_V1_1_SLEEPINGTHREADSLIST_HPP

#include "../h/scheduler.hpp"
#include "../h/tcb.hpp"

class SleepingThreadsList{
private:
    struct Elem{
        TCB* thread;
        time_t slice;
        Elem* next;
    };

    Elem *head, *tail;
public:
    SleepingThreadsList();

    void dec_time_first();
    time_t peek_time_first();
    void remove_finished();
    void put(TCB*, time_t);
};

#endif //PROJECT_BASE_V1_1_SLEEPINGTHREADSLIST_HPP