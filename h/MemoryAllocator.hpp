#ifndef PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
#define PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP

#include "../lib/hw.h"

class MemoryAllocator{
private:
    struct Segment{
        size_t size;
        Segment* next;
    };

    Segment* head = nullptr;

    MemoryAllocator();

    static void* allocateBlocks(Segment* &header, size_t size);
    static bool tryToJoin(const MemoryAllocator::Segment *left, const MemoryAllocator::Segment *right);

public:
    MemoryAllocator(const MemoryAllocator&)=delete;
    MemoryAllocator& operator=(const MemoryAllocator&)=delete;

    void* malloc(size_t);
    void* mallocBytes(size_t);

    int free(void*);

    static MemoryAllocator& getInstance();
    static size_t convert(size_t bytes) { return (bytes + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE; }
};

#endif //PROJECT_BASE_V1_1_MEMORYALLOCATOR_HPP
