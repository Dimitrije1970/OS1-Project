#include "../h/sem.hpp"

sem* sem::create_semaphore(sem** handle, int val) {
    sem* temp = new sem(val+1);
    *handle = temp;

    return temp;
}

int sem::wait() {
    val--;

    if(val < 0){
        num_of_blocked_threads++;
        TCB::running->set_blocked(true);
        add_last(TCB::running);
        thread_dispatch();
    }

    if(!closed){
        return 0;
    }else{
        if(num_of_blocked_threads == 0){
            return 0;
        }else{
            num_of_blocked_threads--;
            return -1;
        }
    }
}

int sem::signal() {
    if(closed) return -1;

    val++;

    if(val <= 0){
        num_of_blocked_threads--;
        TCB* tcb = remove_first();
        tcb->set_blocked(false);
        Scheduler::put(tcb);
    }

    return 0;
}

int sem::close(){
    closed = true;

    while(peek_first()){
        TCB* tcb = remove_first();
        tcb->set_blocked(false);
        Scheduler::put(tcb);
    }

    return 0;
}

TCB* sem::peek_first() {
    return head ? head->tcb : nullptr;
}

void sem::add_last(TCB* tcb) {
    Node* new_node = new Node;
    new_node->tcb = tcb;
    new_node->next = nullptr;

    if(!head){
        head = new_node;
        return;
    }

    Node* current = head;
    while(current->next != nullptr) current = current->next;

    current->next = new_node;
}

TCB* sem::remove_first() {
    if(!head) return nullptr;

    Node* temp = head;
    TCB* tcb = temp->tcb;
    head = head->next;
    delete temp;

    return tcb;
}

