#ifndef PROJECT_BASE_V1_1_SLEEPINGTHREADSLIST_HPP
#define PROJECT_BASE_V1_1_SLEEPINGTHREADSLIST_HPP

#include "../h/scheduler.hpp"
#include "../h/tcb.hpp"

class SleepingThreadsList{
private:

    struct Node{
        TCB* thread;
        time_t slice;
        Node* next;
    };

    Node *head, *tail;
public:
    SleepingThreadsList() : head(nullptr), tail(nullptr) {}
    SleepingThreadsList(const SleepingThreadsList&)=delete;
    SleepingThreadsList& operator=(const SleepingThreadsList&)=delete;

    void dec_time_first();
    time_t peek_time_first();
    void remove_finished();
    void put(TCB*, time_t);
};

#endif //PROJECT_BASE_V1_1_SLEEPINGTHREADSLIST_HPP