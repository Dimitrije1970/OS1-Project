#include "../h/scheduler.hpp"
#include "../lib/mem.h"

Scheduler::Node* Scheduler::head = nullptr;
Scheduler::Node* Scheduler::tail = nullptr;

TCB* Scheduler::get() {
    if(!head) return nullptr;

    Node* res = head;
    head = head->next;
    if(!head) tail = nullptr;
    TCB* tcb = res->tcb;
    __mem_free(res);

    return tcb;
}

void Scheduler::put(TCB *tcb) {
    Node* new_node = (Node*) __mem_alloc(sizeof(Node));
    new_node->tcb = tcb;
    new_node->next = nullptr;

    if(!head) head =  new_node;
    if(tail) tail->next = new_node;
    tail = new_node;
}