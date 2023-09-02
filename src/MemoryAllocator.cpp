#include "../h/MemoryAllocator.hpp"

MemoryAllocator::MemoryAllocator() {
    reset();
}

MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;

    return instance;
}

void MemoryAllocator::reset() {
    const size_t heap_start = (size_t) HEAP_START_ADDR - ((size_t) HEAP_START_ADDR % MEM_BLOCK_SIZE) + MEM_BLOCK_SIZE;
    const size_t heap_end = (size_t) HEAP_END_ADDR;

    if(heap_start > heap_end){
        head = nullptr;
        return;
    }

    head = (Header*) (heap_start - sizeof(Header::size));
    head->size = (heap_end - heap_start) / MEM_BLOCK_SIZE;
    head->next = nullptr;
}

void* MemoryAllocator::mallocBytes(size_t size) {
    return malloc(bytesToBlocks(size));
}

void* MemoryAllocator::malloc(size_t size) {
    if(!head) return nullptr;
    if(!size) return nullptr;

    Header* cur = head;
    void* allocated = allocateBlocks(cur, size);

    if(allocated){
        head = cur;
        return allocated;
    }

    for(Header* prev = head; cur; cur = cur->next){
        if((allocated = allocateBlocks(cur, size))){
            prev->next = cur;

            return allocated;
        }
    }

    return nullptr;
}

void * MemoryAllocator::allocateBlocks(MemoryAllocator::Header *&header, const size_t requested_blocks) {
    if(!header) return nullptr;
    if(!requested_blocks) return nullptr;

    if(header->size < requested_blocks) return nullptr;
    void* memory_start = (void*) ((size_t) header + sizeof(Header::size));

    if(header->size <= requested_blocks + 1){
        header = header->next;
        return memory_start;
    }

    Header* leftover = (Header*) ((size_t) header + MEM_BLOCK_SIZE * (requested_blocks + 1));
    leftover->next = header->next;
    leftover->size = header->size - (requested_blocks + 1);
    header->size = requested_blocks;
    header = leftover;

    return memory_start;
}

int MemoryAllocator::free(void* data) {
    if(!data) return -1;

    Header* data_header = (Header*) ((size_t) data - sizeof(Header::size));

    Header* prec = nullptr, *succ = head;
    while(succ && (size_t) succ < (size_t) data_header){
        prec = succ;
        succ = succ->next;
    }

    if(!prec){
        head = data_header;
        if(!succ) return 1;

        if(areHeadersMergable(data_header, succ)){
            data_header->next = succ->next;
            data_header->size += succ->size + 1;

            return 2;
        }

        data_header->next = succ;

        return 3;
    }

    if(areHeadersMergable(prec, data_header)){
        prec->size += data_header->size + 1;

        if(succ && this->areHeadersMergable(prec, succ)){
            prec->size += succ->size + 1;
            prec->next = succ->next;

            return 4;
        }

        return 5;
    }

    if(succ && areHeadersMergable(data_header, succ)){
        data_header->size += succ->size + 1;
        data_header->next = succ->next;
        prec->next = data_header;

        return 6;
    }

    prec->next = data_header;
    data_header->next = succ;

    return 7;
}



