#include "../h/SleepingThreadsList.hpp"

SleepingThreadsList::SleepingThreadsList() : head(nullptr), tail(nullptr) {}

void SleepingThreadsList::dec_time_first() {
    if(!head) return;
    head->slice--;
}

time_t SleepingThreadsList::peek_time_first() {
    if(head) {
        return head->slice;
    }

    return -1;
}

void SleepingThreadsList::remove_finished() {
    while(head != nullptr && head->slice <= 0){
        Elem* elem = head;
        head = head->next;
        if(!head) {tail = nullptr;}
        elem->thread->set_sleeping(false);
        Scheduler::put(elem->thread);
        MemoryAllocator::getInstance().free(elem);
    }
}

void SleepingThreadsList::put(TCB *thread, time_t slice) {
    if(head == nullptr){
        head = (Elem*) MemoryAllocator::getInstance().mallocBytes(sizeof(Elem));
        head->thread = thread;
        head->next = nullptr;
        head->slice = slice;
        tail = head;

    } else {
        Elem* temp = head;
        Elem* prev = nullptr;

        while(temp != tail && slice >= temp->slice){
            slice -= temp->slice;
            prev = temp;
            temp = temp->next;

        }

        if(temp == tail) {
            if(slice >= tail->slice){
                Elem* novi = (Elem*) MemoryAllocator::getInstance().mallocBytes(sizeof(Elem));
                novi->thread = thread;
                novi->next = nullptr;
                novi->slice = slice - tail->slice;
                tail->next = novi;
                tail = novi;
            }
            else {
                Elem* novi = (Elem*) MemoryAllocator::getInstance().mallocBytes(sizeof(Elem));
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
            Elem* novi = (Elem*) MemoryAllocator::getInstance().mallocBytes(sizeof(Elem));
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