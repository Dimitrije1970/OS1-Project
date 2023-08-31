#ifndef PROJECT_BASE_V1_1_TCB_HPP
#define PROJECT_BASE_V1_1_TCB_HPP

#include "../lib/hw.h"
#include "../h/scheduler.hpp"
#include "../h/riscv.hpp"

class TCB{
private:
    struct Context{
        uint64 sp, ra;
    };

    using Body = void(*)(void*);
    Body body;
    void* args;

    uint64* stack;
    Context context;

    time_t time_slice;
    int id;
    bool finished, blocked, sleeping, main, user_mode;

    TCB(Body body, void* args, uint64 time_slice, uint64* stack) :
        body(body),
        args(args),
        stack(body != nullptr ? stack : nullptr),
        context({(uint64) &thread_wrapper, stack != nullptr ? reinterpret_cast<uint64>(&stack[DEFAULT_STACK_SIZE]) : 0UL}),
        time_slice(time_slice),
        id(ID),
        finished(false),
        blocked(false),
        sleeping(false),
        main(body == nullptr){

        if(body != nullptr){
            Scheduler::put(this);
        }

    }

    static time_t time_slice_counter;

    static void contextSwitch(Context* old_context, Context* new_context);
    static void thread_wrapper();
    static void dispatch();
public:
    friend class RiscV;
    friend class sem;

    static int ID;
    static TCB* running;
    static TCB* create_thread(TCB** handle, Body body, void* args, uint64* stack);
    static void yield();
    static void join(TCB*);
    static void outputThreadBody(void*);

//    void start(){
//        Scheduler::put(this);
//    }

    bool is_finished() const { return finished; }
    void set_finished(bool f) { this->finished = f; }

    bool is_sleeping() const { return sleeping; }
    void set_sleeping(bool s) { this->sleeping = s; }

    bool is_blocked() const { return blocked; }
    void set_blocked(bool b) { this->blocked = b; }

    bool is_main() const { return main; }
    int get_id() const { return id; }
    uint64 get_time_slice() const { return time_slice; }

    bool get_user_mode () const { return user_mode; }
    void set_user_mode (bool value) { user_mode = value; }

    ~TCB(){
        delete[] stack;
    }

};

#endif //PROJECT_BASE_V1_1_TCB_HPP
