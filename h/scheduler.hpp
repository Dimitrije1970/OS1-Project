#ifndef PROJECT_BASE_V1_1_SCHEDULER_HPP
#define PROJECT_BASE_V1_1_SCHEDULER_HPP

class TCB;
class Scheduler{
private:
    struct Node{
        TCB* tcb;
        Node* next;
    };

    Scheduler()=delete;
    ~Scheduler()=delete;

    static Node* head, *tail;
public:
    Scheduler(const Scheduler&)=delete;
    Scheduler& operator=(const Scheduler&)=delete;

    static TCB* get();
    static void put(TCB* tcb);
};

#endif //PROJECT_BASE_V1_1_SCHEDULER_HPP
