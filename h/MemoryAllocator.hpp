#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator{
public:
    static MemoryAllocator& getInstance();

    MemoryAllocator(const MemoryAllocator&)=delete;
    MemoryAllocator& operator=(const MemoryAllocator&)=delete;

    void* malloc(size_t);
    void * mallocBytes(size_t);

    int free(void*);

    static size_t bytesToBlocks(size_t bytes) { return (bytes + MEM_BLOCK_SIZE -1) / MEM_BLOCK_SIZE; }

private:
    struct Header{
        size_t size;
        Header* next;
    };

    Header* head = nullptr;

    MemoryAllocator();
    ~MemoryAllocator()=default;

    void reset();

    static void* allocateBlocks(Header* &header, const size_t size);
    static inline bool areHeadersMergable(const Header* left, const Header* right);
};

bool MemoryAllocator::areHeadersMergable(const MemoryAllocator::Header *left, const MemoryAllocator::Header *right) {
    return (size_t) left + (left->size + 1) * MEM_BLOCK_SIZE == (size_t) right;
}

#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
