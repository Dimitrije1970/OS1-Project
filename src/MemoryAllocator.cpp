#include "../h/MemoryAllocator.hpp"

MemoryAllocator::MemoryAllocator() {
    const size_t heap_start = (size_t) HEAP_START_ADDR - ((size_t) HEAP_START_ADDR % MEM_BLOCK_SIZE) + MEM_BLOCK_SIZE;
    const auto heap_end = (size_t) HEAP_END_ADDR;

    head = (Segment*) (heap_start - sizeof(Segment::size));
    head->size = (heap_end - heap_start) / MEM_BLOCK_SIZE;
    head->next = nullptr;
}

bool MemoryAllocator::tryToJoin(const MemoryAllocator::Segment *left, const MemoryAllocator::Segment *right) {
    return (size_t) left + (left->size + 1) * MEM_BLOCK_SIZE == (size_t) right;
}

MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;

    return instance;
}

void* MemoryAllocator::mallocBytes(size_t size) {
    return malloc(convert(size));
}

void* MemoryAllocator::malloc(size_t size) {
    if(!head) return nullptr;
    if(size <= 0) return nullptr;

    Segment* cur = head;
    void* allocated = allocateBlocks(cur, size);

    if(!allocated){
        for(Segment* prev = head; cur; cur = cur->next){
            if((allocated = allocateBlocks(cur, size))){
                prev->next = cur;

                return allocated;
            }
        }

        return nullptr;
    }

    head = cur;
    return allocated;

}

void* MemoryAllocator::allocateBlocks(MemoryAllocator::Segment *&header, size_t requested_blocks) {
    if(!header) return nullptr;
    if(!requested_blocks) return nullptr;

    if(header->size < requested_blocks) return nullptr;
    void* memory_start = (void*) ((size_t) header + sizeof(Segment::size));

    if(header->size > requested_blocks + 1){
        auto* leftover = (Segment*) ((size_t) header + MEM_BLOCK_SIZE * (requested_blocks + 1));
        leftover->next = header->next;
        leftover->size = header->size - (requested_blocks + 1);
        header->size = requested_blocks;
        header = leftover;

        return memory_start;
    }

    header = header->next;
    return memory_start;
}

int MemoryAllocator::free(void* data) {
    if(!data) return -1;

    auto* data_header = (Segment*) ((size_t) data - sizeof(Segment::size));

    Segment* prev = nullptr, *succ = head;
    while(succ && (size_t) succ < (size_t) data_header){
        prev = succ;
        succ = succ->next;
    }

    if(!prev){
        head = data_header;
        if(!succ) return 1;

        if(tryToJoin(data_header, succ)){
            data_header->next = succ->next;
            data_header->size += succ->size + 1;

            return 1;
        }

        data_header->next = succ;

        return 1;
    }

    if(tryToJoin(prev, data_header)){
        prev->size += data_header->size + 1;

        if(succ && this->tryToJoin(prev, succ)){
            prev->size += succ->size + 1;
            prev->next = succ->next;

            return 1;
        }

        return 1;
    }

    if(succ && tryToJoin(data_header, succ)){
        data_header->size += succ->size + 1;
        data_header->next = succ->next;
        prev->next = data_header;

        return 1;
    }

    prev->next = data_header;
    data_header->next = succ;

    return 1;
}



