#ifndef PROJECT_BASE_V1_1_SEM_HPP
#define PROJECT_BASE_V1_1_SEM_HPP

#include "../h/tcb.hpp"

class TCB;
class sem{
private:
    struct Node{
        TCB* tcb;
        Node* next;
    };

    bool closed;
    int val, num_of_blocked_threads;
    Node *head;

//    void block();
//    void unblock();

    TCB* peek_first();
    void add_last(TCB* tcb);
    TCB* remove_first();
public:
    explicit sem(int val) : closed(false), val(val), num_of_blocked_threads(0), head(nullptr) {}

    int wait();
    int signal();

    bool is_closed() const { return closed; }
    void set_closed(bool c) { this->closed = c; }

    int get_val() const { return val; }

    static sem* create_semaphore(sem** handle, int val);

    int close();
};

#endif //PROJECT_BASE_V1_1_SEM_HPP
