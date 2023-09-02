#include "../h/SleepingThreadsList.hpp"

void SleepingThreadsList::dec_time_first() {
    if(head != nullptr){
        head->slice-=1;
    }
}

time_t SleepingThreadsList::peek_time_first() {
    if(!head) {
        return -1;
    }
    return head->slice;
}

void SleepingThreadsList::remove_finished() {
    while(head != nullptr && head->slice <= 0){
        Node* elem = head;
        head = head->next;
        if(!head) {tail = nullptr;}
        elem->thread->set_sleeping(false);
        Scheduler::put(elem->thread);
        MemoryAllocator::getInstance().free(elem);
    }
}

void SleepingThreadsList::put(TCB *thread, time_t slice) {
    if(head == nullptr){
        head = (Node*) MemoryAllocator::getInstance().mallocBytes(sizeof(Node));
        head->thread = thread;
        head->next = nullptr;
        head->slice = slice;
        tail = head;
    } else {
        Node* temp = head;
        Node* prev = nullptr;
        while(temp != tail && slice >= temp->slice){
            slice -= temp->slice;
            prev = temp;
            temp = temp->next;
        }
        if(temp == tail) {
            if(slice >= tail->slice){
                Node* novi = (Node*) MemoryAllocator::getInstance().mallocBytes(sizeof(Node));
                novi->thread = thread;
                novi->next = nullptr;
                novi->slice = slice - tail->slice;
                tail->next = novi;
                tail = novi;
            }
            else {
                Node* novi = (Node*) MemoryAllocator::getInstance().mallocBytes(sizeof(Node));
                novi->thread = thread;
                novi->next = tail;
                novi->slice= slice;
                if(prev != nullptr){
                    prev->next = novi;
                } else {
                    head = novi;
                }
                tail->slice -= slice;
            }
        }
        else {
            Node* novi = (Node*) MemoryAllocator::getInstance().mallocBytes(sizeof(Node));
            novi->thread = thread;
            novi->next  = temp;
            novi->slice = slice;
            if(prev) {
                prev->next = novi;
            } else {
                head = novi;
            }
            temp->slice -= slice;
        }
    }
}