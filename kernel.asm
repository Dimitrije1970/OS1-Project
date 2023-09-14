
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000b117          	auipc	sp,0xb
    80000004:	78813103          	ld	sp,1928(sp) # 8000b788 <_GLOBAL_OFFSET_TABLE_+0x10>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	634060ef          	jal	ra,80006650 <start>

0000000080000020 <spin>:
    80000020:	0000006f          	j	80000020 <spin>
	...

0000000080001000 <_ZN5RiscV16interruptRoutineEv>:
.align 4
.global _ZN5RiscV16interruptRoutineEv
.type _ZN5RiscV16interruptRoutineEv, @function

_ZN5RiscV16interruptRoutineEv:
    j EcallInterrupt
    80001000:	0280006f          	j	80001028 <EcallInterrupt>
    j TimerInterrupt
    80001004:	1340006f          	j	80001138 <TimerInterrupt>
	...
    .skip 28 #osatvlja prazno 7 ulaza u IVT
    j ExternalInterrupt
    80001024:	2240006f          	j	80001248 <ExternalInterrupt>

0000000080001028 <EcallInterrupt>:
EcallInterrupt:
    addi sp, sp, -256
    80001028:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr
    8000102c:	00013023          	sd	zero,0(sp)
    80001030:	00113423          	sd	ra,8(sp)
    80001034:	00213823          	sd	sp,16(sp)
    80001038:	00313c23          	sd	gp,24(sp)
    8000103c:	02413023          	sd	tp,32(sp)
    80001040:	02513423          	sd	t0,40(sp)
    80001044:	02613823          	sd	t1,48(sp)
    80001048:	02713c23          	sd	t2,56(sp)
    8000104c:	04813023          	sd	s0,64(sp)
    80001050:	04913423          	sd	s1,72(sp)
    80001054:	04a13823          	sd	a0,80(sp)
    80001058:	04b13c23          	sd	a1,88(sp)
    8000105c:	06c13023          	sd	a2,96(sp)
    80001060:	06d13423          	sd	a3,104(sp)
    80001064:	06e13823          	sd	a4,112(sp)
    80001068:	06f13c23          	sd	a5,120(sp)
    8000106c:	09013023          	sd	a6,128(sp)
    80001070:	09113423          	sd	a7,136(sp)
    80001074:	09213823          	sd	s2,144(sp)
    80001078:	09313c23          	sd	s3,152(sp)
    8000107c:	0b413023          	sd	s4,160(sp)
    80001080:	0b513423          	sd	s5,168(sp)
    80001084:	0b613823          	sd	s6,176(sp)
    80001088:	0b713c23          	sd	s7,184(sp)
    8000108c:	0d813023          	sd	s8,192(sp)
    80001090:	0d913423          	sd	s9,200(sp)
    80001094:	0da13823          	sd	s10,208(sp)
    80001098:	0db13c23          	sd	s11,216(sp)
    8000109c:	0fc13023          	sd	t3,224(sp)
    800010a0:	0fd13423          	sd	t4,232(sp)
    800010a4:	0fe13823          	sd	t5,240(sp)
    800010a8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5RiscV20handleEcallInterruptEv
    800010ac:	310010ef          	jal	ra,800023bc <_ZN5RiscV20handleEcallInterruptEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    800010b0:	00013003          	ld	zero,0(sp)
    800010b4:	00813083          	ld	ra,8(sp)
    800010b8:	01013103          	ld	sp,16(sp)
    800010bc:	01813183          	ld	gp,24(sp)
    800010c0:	02013203          	ld	tp,32(sp)
    800010c4:	02813283          	ld	t0,40(sp)
    800010c8:	03013303          	ld	t1,48(sp)
    800010cc:	03813383          	ld	t2,56(sp)
    800010d0:	04013403          	ld	s0,64(sp)
    800010d4:	04813483          	ld	s1,72(sp)
    800010d8:	05013503          	ld	a0,80(sp)
    800010dc:	05813583          	ld	a1,88(sp)
    800010e0:	06013603          	ld	a2,96(sp)
    800010e4:	06813683          	ld	a3,104(sp)
    800010e8:	07013703          	ld	a4,112(sp)
    800010ec:	07813783          	ld	a5,120(sp)
    800010f0:	08013803          	ld	a6,128(sp)
    800010f4:	08813883          	ld	a7,136(sp)
    800010f8:	09013903          	ld	s2,144(sp)
    800010fc:	09813983          	ld	s3,152(sp)
    80001100:	0a013a03          	ld	s4,160(sp)
    80001104:	0a813a83          	ld	s5,168(sp)
    80001108:	0b013b03          	ld	s6,176(sp)
    8000110c:	0b813b83          	ld	s7,184(sp)
    80001110:	0c013c03          	ld	s8,192(sp)
    80001114:	0c813c83          	ld	s9,200(sp)
    80001118:	0d013d03          	ld	s10,208(sp)
    8000111c:	0d813d83          	ld	s11,216(sp)
    80001120:	0e013e03          	ld	t3,224(sp)
    80001124:	0e813e83          	ld	t4,232(sp)
    80001128:	0f013f03          	ld	t5,240(sp)
    8000112c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001130:	10010113          	addi	sp,sp,256

    sret
    80001134:	10200073          	sret

0000000080001138 <TimerInterrupt>:
#Prekid od tajmera
TimerInterrupt:
    addi sp, sp, -256
    80001138:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr
    8000113c:	00013023          	sd	zero,0(sp)
    80001140:	00113423          	sd	ra,8(sp)
    80001144:	00213823          	sd	sp,16(sp)
    80001148:	00313c23          	sd	gp,24(sp)
    8000114c:	02413023          	sd	tp,32(sp)
    80001150:	02513423          	sd	t0,40(sp)
    80001154:	02613823          	sd	t1,48(sp)
    80001158:	02713c23          	sd	t2,56(sp)
    8000115c:	04813023          	sd	s0,64(sp)
    80001160:	04913423          	sd	s1,72(sp)
    80001164:	04a13823          	sd	a0,80(sp)
    80001168:	04b13c23          	sd	a1,88(sp)
    8000116c:	06c13023          	sd	a2,96(sp)
    80001170:	06d13423          	sd	a3,104(sp)
    80001174:	06e13823          	sd	a4,112(sp)
    80001178:	06f13c23          	sd	a5,120(sp)
    8000117c:	09013023          	sd	a6,128(sp)
    80001180:	09113423          	sd	a7,136(sp)
    80001184:	09213823          	sd	s2,144(sp)
    80001188:	09313c23          	sd	s3,152(sp)
    8000118c:	0b413023          	sd	s4,160(sp)
    80001190:	0b513423          	sd	s5,168(sp)
    80001194:	0b613823          	sd	s6,176(sp)
    80001198:	0b713c23          	sd	s7,184(sp)
    8000119c:	0d813023          	sd	s8,192(sp)
    800011a0:	0d913423          	sd	s9,200(sp)
    800011a4:	0da13823          	sd	s10,208(sp)
    800011a8:	0db13c23          	sd	s11,216(sp)
    800011ac:	0fc13023          	sd	t3,224(sp)
    800011b0:	0fd13423          	sd	t4,232(sp)
    800011b4:	0fe13823          	sd	t5,240(sp)
    800011b8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5RiscV20handleTimerInterruptEv
    800011bc:	50c010ef          	jal	ra,800026c8 <_ZN5RiscV20handleTimerInterruptEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    800011c0:	00013003          	ld	zero,0(sp)
    800011c4:	00813083          	ld	ra,8(sp)
    800011c8:	01013103          	ld	sp,16(sp)
    800011cc:	01813183          	ld	gp,24(sp)
    800011d0:	02013203          	ld	tp,32(sp)
    800011d4:	02813283          	ld	t0,40(sp)
    800011d8:	03013303          	ld	t1,48(sp)
    800011dc:	03813383          	ld	t2,56(sp)
    800011e0:	04013403          	ld	s0,64(sp)
    800011e4:	04813483          	ld	s1,72(sp)
    800011e8:	05013503          	ld	a0,80(sp)
    800011ec:	05813583          	ld	a1,88(sp)
    800011f0:	06013603          	ld	a2,96(sp)
    800011f4:	06813683          	ld	a3,104(sp)
    800011f8:	07013703          	ld	a4,112(sp)
    800011fc:	07813783          	ld	a5,120(sp)
    80001200:	08013803          	ld	a6,128(sp)
    80001204:	08813883          	ld	a7,136(sp)
    80001208:	09013903          	ld	s2,144(sp)
    8000120c:	09813983          	ld	s3,152(sp)
    80001210:	0a013a03          	ld	s4,160(sp)
    80001214:	0a813a83          	ld	s5,168(sp)
    80001218:	0b013b03          	ld	s6,176(sp)
    8000121c:	0b813b83          	ld	s7,184(sp)
    80001220:	0c013c03          	ld	s8,192(sp)
    80001224:	0c813c83          	ld	s9,200(sp)
    80001228:	0d013d03          	ld	s10,208(sp)
    8000122c:	0d813d83          	ld	s11,216(sp)
    80001230:	0e013e03          	ld	t3,224(sp)
    80001234:	0e813e83          	ld	t4,232(sp)
    80001238:	0f013f03          	ld	t5,240(sp)
    8000123c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001240:	10010113          	addi	sp,sp,256

    sret
    80001244:	10200073          	sret

0000000080001248 <ExternalInterrupt>:
#Spoljasnji prekid
ExternalInterrupt:
    addi sp, sp, -256
    80001248:	f0010113          	addi	sp,sp,-256
    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    sd x\index, \index*8(sp)
    .endr
    8000124c:	00013023          	sd	zero,0(sp)
    80001250:	00113423          	sd	ra,8(sp)
    80001254:	00213823          	sd	sp,16(sp)
    80001258:	00313c23          	sd	gp,24(sp)
    8000125c:	02413023          	sd	tp,32(sp)
    80001260:	02513423          	sd	t0,40(sp)
    80001264:	02613823          	sd	t1,48(sp)
    80001268:	02713c23          	sd	t2,56(sp)
    8000126c:	04813023          	sd	s0,64(sp)
    80001270:	04913423          	sd	s1,72(sp)
    80001274:	04a13823          	sd	a0,80(sp)
    80001278:	04b13c23          	sd	a1,88(sp)
    8000127c:	06c13023          	sd	a2,96(sp)
    80001280:	06d13423          	sd	a3,104(sp)
    80001284:	06e13823          	sd	a4,112(sp)
    80001288:	06f13c23          	sd	a5,120(sp)
    8000128c:	09013023          	sd	a6,128(sp)
    80001290:	09113423          	sd	a7,136(sp)
    80001294:	09213823          	sd	s2,144(sp)
    80001298:	09313c23          	sd	s3,152(sp)
    8000129c:	0b413023          	sd	s4,160(sp)
    800012a0:	0b513423          	sd	s5,168(sp)
    800012a4:	0b613823          	sd	s6,176(sp)
    800012a8:	0b713c23          	sd	s7,184(sp)
    800012ac:	0d813023          	sd	s8,192(sp)
    800012b0:	0d913423          	sd	s9,200(sp)
    800012b4:	0da13823          	sd	s10,208(sp)
    800012b8:	0db13c23          	sd	s11,216(sp)
    800012bc:	0fc13023          	sd	t3,224(sp)
    800012c0:	0fd13423          	sd	t4,232(sp)
    800012c4:	0fe13823          	sd	t5,240(sp)
    800012c8:	0ff13c23          	sd	t6,248(sp)

    call _ZN5RiscV23handleExternalInterruptEv
    800012cc:	4f0010ef          	jal	ra,800027bc <_ZN5RiscV23handleExternalInterruptEv>

    .irp index, 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31
    ld x\index, \index*8(sp)
    .endr
    800012d0:	00013003          	ld	zero,0(sp)
    800012d4:	00813083          	ld	ra,8(sp)
    800012d8:	01013103          	ld	sp,16(sp)
    800012dc:	01813183          	ld	gp,24(sp)
    800012e0:	02013203          	ld	tp,32(sp)
    800012e4:	02813283          	ld	t0,40(sp)
    800012e8:	03013303          	ld	t1,48(sp)
    800012ec:	03813383          	ld	t2,56(sp)
    800012f0:	04013403          	ld	s0,64(sp)
    800012f4:	04813483          	ld	s1,72(sp)
    800012f8:	05013503          	ld	a0,80(sp)
    800012fc:	05813583          	ld	a1,88(sp)
    80001300:	06013603          	ld	a2,96(sp)
    80001304:	06813683          	ld	a3,104(sp)
    80001308:	07013703          	ld	a4,112(sp)
    8000130c:	07813783          	ld	a5,120(sp)
    80001310:	08013803          	ld	a6,128(sp)
    80001314:	08813883          	ld	a7,136(sp)
    80001318:	09013903          	ld	s2,144(sp)
    8000131c:	09813983          	ld	s3,152(sp)
    80001320:	0a013a03          	ld	s4,160(sp)
    80001324:	0a813a83          	ld	s5,168(sp)
    80001328:	0b013b03          	ld	s6,176(sp)
    8000132c:	0b813b83          	ld	s7,184(sp)
    80001330:	0c013c03          	ld	s8,192(sp)
    80001334:	0c813c83          	ld	s9,200(sp)
    80001338:	0d013d03          	ld	s10,208(sp)
    8000133c:	0d813d83          	ld	s11,216(sp)
    80001340:	0e013e03          	ld	t3,224(sp)
    80001344:	0e813e83          	ld	t4,232(sp)
    80001348:	0f013f03          	ld	t5,240(sp)
    8000134c:	0f813f83          	ld	t6,248(sp)
    addi sp, sp, 256
    80001350:	10010113          	addi	sp,sp,256

    sret
    80001354:	10200073          	sret

0000000080001358 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>:
.global _ZN3TCB13contextSwitchEPNS_7ContextES1_
.type _ZN3TCB13contextSwitchEPNS_7ContextES1_, @function
_ZN3TCB13contextSwitchEPNS_7ContextES1_:
        sd ra, 0 * 8(a0)
    80001358:	00153023          	sd	ra,0(a0) # 1000 <_entry-0x7ffff000>
        sd sp, 1 * 8(a0)
    8000135c:	00253423          	sd	sp,8(a0)

        ld ra, 0 * 8(a1)
    80001360:	0005b083          	ld	ra,0(a1)
        ld sp, 1 * 8(a1)
    80001364:	0085b103          	ld	sp,8(a1)

        ret
    80001368:	00008067          	ret

000000008000136c <copy_and_swap>:
# a1 holds expected value
# a2 holds desired value
# a0 holds return value, 0 if successful, !0 otherwise
.global copy_and_swap
copy_and_swap:
    lr.w t0, (a0)          # Load original value.
    8000136c:	100522af          	lr.w	t0,(a0)
    bne t0, a1, fail       # Doesn’t match, so fail.
    80001370:	00b29a63          	bne	t0,a1,80001384 <fail>
    sc.w t0, a2, (a0)      # Try to update.
    80001374:	18c522af          	sc.w	t0,a2,(a0)
    bnez t0, copy_and_swap # Retry if store-conditional failed.
    80001378:	fe029ae3          	bnez	t0,8000136c <copy_and_swap>
    li a0, 0               # Set return to success.
    8000137c:	00000513          	li	a0,0
    jr ra                  # Return.
    80001380:	00008067          	ret

0000000080001384 <fail>:
    fail:
    li a0, 1               # Set return to failure.
    80001384:	00100513          	li	a0,1
    80001388:	00008067          	ret

000000008000138c <_Z9mem_allocm>:
#include "../h/syscall_c.h"
#include "../lib/console.h"

void* mem_alloc(size_t size) {
    8000138c:	fe010113          	addi	sp,sp,-32
    80001390:	00813c23          	sd	s0,24(sp)
    80001394:	02010413          	addi	s0,sp,32
    uint64 num_of_blocks = (size + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE;
    80001398:	03f50513          	addi	a0,a0,63
    8000139c:	00655513          	srli	a0,a0,0x6

    uint64 res = 0;
    800013a0:	fe043423          	sd	zero,-24(s0)
    uint64* ret = &res;

    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    800013a4:	fe840793          	addi	a5,s0,-24
    800013a8:	00078613          	mv	a2,a5
    __asm__ volatile ("mv a1, %0" : : "r"(num_of_blocks));
    800013ac:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(MEM_ALLOC));
    800013b0:	00100793          	li	a5,1
    800013b4:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800013b8:	00000073          	ecall

    return (void*) *ret;
}
    800013bc:	fe843503          	ld	a0,-24(s0)
    800013c0:	01813403          	ld	s0,24(sp)
    800013c4:	02010113          	addi	sp,sp,32
    800013c8:	00008067          	ret

00000000800013cc <_Z8mem_freePv>:

int mem_free(void* ptr) {
    800013cc:	fe010113          	addi	sp,sp,-32
    800013d0:	00813c23          	sd	s0,24(sp)
    800013d4:	02010413          	addi	s0,sp,32
    uint64 res = 0;
    800013d8:	fe043423          	sd	zero,-24(s0)
    uint64* ret = &res;

    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    800013dc:	fe840793          	addi	a5,s0,-24
    800013e0:	00078613          	mv	a2,a5
    __asm__ volatile ("mv a1, %0" : : "r"(ptr));
    800013e4:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(MEM_FREE));
    800013e8:	00200793          	li	a5,2
    800013ec:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800013f0:	00000073          	ecall

    return (int) *ret;
}
    800013f4:	fe842503          	lw	a0,-24(s0)
    800013f8:	01813403          	ld	s0,24(sp)
    800013fc:	02010113          	addi	sp,sp,32
    80001400:	00008067          	ret

0000000080001404 <_Z13thread_createPP3TCBPFvPvES2_>:

int thread_create(thread_t* handle, void (*start_routine)(void *), void* args) {
    80001404:	fc010113          	addi	sp,sp,-64
    80001408:	02113c23          	sd	ra,56(sp)
    8000140c:	02813823          	sd	s0,48(sp)
    80001410:	02913423          	sd	s1,40(sp)
    80001414:	03213023          	sd	s2,32(sp)
    80001418:	01313c23          	sd	s3,24(sp)
    8000141c:	04010413          	addi	s0,sp,64
    80001420:	00050493          	mv	s1,a0
    80001424:	00058913          	mv	s2,a1
    80001428:	00060993          	mv	s3,a2
    int id = 0;
    8000142c:	fc042623          	sw	zero,-52(s0)
    int* res = &id;

    auto* stack = new uint64[DEFAULT_STACK_SIZE];
    80001430:	00008537          	lui	a0,0x8
    80001434:	00001097          	auipc	ra,0x1
    80001438:	a0c080e7          	jalr	-1524(ra) # 80001e40 <_Znam>
    __asm__ volatile ("mv a4, %0" : : "r"(stack));
    8000143c:	00050713          	mv	a4,a0
    __asm__ volatile ("mv a3, %0" : : "r"(args));
    80001440:	00098693          	mv	a3,s3
    __asm__ volatile ("mv a2, %0" : : "r"(start_routine));
    80001444:	00090613          	mv	a2,s2
    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    80001448:	00048593          	mv	a1,s1
    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_CREATE));
    8000144c:	01100793          	li	a5,17
    80001450:	00078513          	mv	a0,a5
    __asm__ volatile ("mv a5, %0" : : "r"(res));
    80001454:	fcc40793          	addi	a5,s0,-52
    80001458:	00078793          	mv	a5,a5
    __asm__ volatile ("ecall");
    8000145c:	00000073          	ecall

    return *res;
}
    80001460:	fcc42503          	lw	a0,-52(s0)
    80001464:	03813083          	ld	ra,56(sp)
    80001468:	03013403          	ld	s0,48(sp)
    8000146c:	02813483          	ld	s1,40(sp)
    80001470:	02013903          	ld	s2,32(sp)
    80001474:	01813983          	ld	s3,24(sp)
    80001478:	04010113          	addi	sp,sp,64
    8000147c:	00008067          	ret

0000000080001480 <_Z11thread_exitv>:

int thread_exit() {
    80001480:	ff010113          	addi	sp,sp,-16
    80001484:	00813423          	sd	s0,8(sp)
    80001488:	01010413          	addi	s0,sp,16
    int id = 0;
    int* res = &id;

    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_EXIT));
    8000148c:	01200793          	li	a5,18
    80001490:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001494:	00000073          	ecall

    return *res;
}
    80001498:	00000513          	li	a0,0
    8000149c:	00813403          	ld	s0,8(sp)
    800014a0:	01010113          	addi	sp,sp,16
    800014a4:	00008067          	ret

00000000800014a8 <_Z15thread_dispatchv>:

void thread_dispatch() {
    800014a8:	ff010113          	addi	sp,sp,-16
    800014ac:	00813423          	sd	s0,8(sp)
    800014b0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_DISPATCH));
    800014b4:	01300793          	li	a5,19
    800014b8:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800014bc:	00000073          	ecall
}
    800014c0:	00813403          	ld	s0,8(sp)
    800014c4:	01010113          	addi	sp,sp,16
    800014c8:	00008067          	ret

00000000800014cc <_Z11thread_joinP3TCB>:

void thread_join(thread_t handle) {
    800014cc:	ff010113          	addi	sp,sp,-16
    800014d0:	00813423          	sd	s0,8(sp)
    800014d4:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    800014d8:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_JOIN));
    800014dc:	01400793          	li	a5,20
    800014e0:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800014e4:	00000073          	ecall
}
    800014e8:	00813403          	ld	s0,8(sp)
    800014ec:	01010113          	addi	sp,sp,16
    800014f0:	00008067          	ret

00000000800014f4 <_Z8sem_openPP3semj>:

int sem_open(sem_t* handle, unsigned int val) {
    800014f4:	fe010113          	addi	sp,sp,-32
    800014f8:	00813c23          	sd	s0,24(sp)
    800014fc:	02010413          	addi	s0,sp,32
    int x = 0;
    80001500:	fe042623          	sw	zero,-20(s0)
    int* ret = &x;

    __asm__ volatile ("mv a2, %0" : : "r"(val));
    80001504:	00058613          	mv	a2,a1
    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    80001508:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(SEM_OPEN));
    8000150c:	02100793          	li	a5,33
    80001510:	00078513          	mv	a0,a5
    __asm__ volatile ("mv a3, %0" : : "r"(ret));
    80001514:	fec40793          	addi	a5,s0,-20
    80001518:	00078693          	mv	a3,a5
    __asm__ volatile ("ecall");
    8000151c:	00000073          	ecall

    return *ret;
}
    80001520:	fec42503          	lw	a0,-20(s0)
    80001524:	01813403          	ld	s0,24(sp)
    80001528:	02010113          	addi	sp,sp,32
    8000152c:	00008067          	ret

0000000080001530 <_Z9sem_closeP3sem>:

int sem_close(sem_t handle) {
    80001530:	fe010113          	addi	sp,sp,-32
    80001534:	00813c23          	sd	s0,24(sp)
    80001538:	02010413          	addi	s0,sp,32
    int x = 0;
    8000153c:	fe042623          	sw	zero,-20(s0)
    int* ret = &x;

    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    80001540:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(SEM_CLOSE));
    80001544:	02200793          	li	a5,34
    80001548:	00078513          	mv	a0,a5
    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    8000154c:	fec40793          	addi	a5,s0,-20
    80001550:	00078613          	mv	a2,a5
    __asm__ volatile ("ecall");
    80001554:	00000073          	ecall

    return *ret;
}
    80001558:	fec42503          	lw	a0,-20(s0)
    8000155c:	01813403          	ld	s0,24(sp)
    80001560:	02010113          	addi	sp,sp,32
    80001564:	00008067          	ret

0000000080001568 <_Z8sem_waitP3sem>:

int sem_wait(sem_t handle) {
    80001568:	fe010113          	addi	sp,sp,-32
    8000156c:	00813c23          	sd	s0,24(sp)
    80001570:	02010413          	addi	s0,sp,32
    int x = 0;
    80001574:	fe042623          	sw	zero,-20(s0)
    int* ret = &x;

    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    80001578:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(SEM_WAIT));
    8000157c:	02300793          	li	a5,35
    80001580:	00078513          	mv	a0,a5
    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    80001584:	fec40793          	addi	a5,s0,-20
    80001588:	00078613          	mv	a2,a5
    __asm__ volatile ("ecall");
    8000158c:	00000073          	ecall

    return *ret;
}
    80001590:	fec42503          	lw	a0,-20(s0)
    80001594:	01813403          	ld	s0,24(sp)
    80001598:	02010113          	addi	sp,sp,32
    8000159c:	00008067          	ret

00000000800015a0 <_Z10sem_signalP3sem>:

int sem_signal(sem_t handle) {
    800015a0:	fe010113          	addi	sp,sp,-32
    800015a4:	00813c23          	sd	s0,24(sp)
    800015a8:	02010413          	addi	s0,sp,32
    int x = 0;
    800015ac:	fe042623          	sw	zero,-20(s0)
    int* ret = &x;

    __asm__ volatile ("mv a1, %0" : : "r"(handle));
    800015b0:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(SEM_SIGNAL));
    800015b4:	02400793          	li	a5,36
    800015b8:	00078513          	mv	a0,a5
    __asm__ volatile ("mv a2, %0" : : "r"(ret));
    800015bc:	fec40793          	addi	a5,s0,-20
    800015c0:	00078613          	mv	a2,a5
    __asm__ volatile ("ecall");
    800015c4:	00000073          	ecall

    return *ret;
}
    800015c8:	fec42503          	lw	a0,-20(s0)
    800015cc:	01813403          	ld	s0,24(sp)
    800015d0:	02010113          	addi	sp,sp,32
    800015d4:	00008067          	ret

00000000800015d8 <_Z10time_sleepm>:

int time_sleep(time_t slice) {
    800015d8:	ff010113          	addi	sp,sp,-16
    800015dc:	00813423          	sd	s0,8(sp)
    800015e0:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" : : "r"(slice));
    800015e4:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(TIME_SLEEP));
    800015e8:	03100793          	li	a5,49
    800015ec:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    800015f0:	00000073          	ecall

    return 0;
}
    800015f4:	00000513          	li	a0,0
    800015f8:	00813403          	ld	s0,8(sp)
    800015fc:	01010113          	addi	sp,sp,16
    80001600:	00008067          	ret

0000000080001604 <_Z4getcv>:

char getc() {
    80001604:	fe010113          	addi	sp,sp,-32
    80001608:	00813c23          	sd	s0,24(sp)
    8000160c:	02010413          	addi	s0,sp,32
    char c = '\0';
    80001610:	fe0407a3          	sb	zero,-17(s0)
    char* ret = &c;

    __asm__ volatile ("mv a1, %0" : : "r"(ret));
    80001614:	fef40793          	addi	a5,s0,-17
    80001618:	00078593          	mv	a1,a5
    __asm__ volatile ("mv a0, %0" : : "r"(GETC));
    8000161c:	04100793          	li	a5,65
    80001620:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001624:	00000073          	ecall
    if(ret != nullptr){
        return *ret;
    }else{
        return ' ';
    }
}
    80001628:	fef44503          	lbu	a0,-17(s0)
    8000162c:	01813403          	ld	s0,24(sp)
    80001630:	02010113          	addi	sp,sp,32
    80001634:	00008067          	ret

0000000080001638 <_Z4putcc>:

void putc(char c) {
    80001638:	ff010113          	addi	sp,sp,-16
    8000163c:	00813423          	sd	s0,8(sp)
    80001640:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a1, %0" : : "r"(c));
    80001644:	00050593          	mv	a1,a0
    __asm__ volatile ("mv a0, %0" : : "r"(PUTC));
    80001648:	04200793          	li	a5,66
    8000164c:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001650:	00000073          	ecall
}
    80001654:	00813403          	ld	s0,8(sp)
    80001658:	01010113          	addi	sp,sp,16
    8000165c:	00008067          	ret

0000000080001660 <_Z16userMain_wrapperPv>:
#include "../test/printing.hpp"

bool finished_main = false;
extern void userMain();

void userMain_wrapper(void*){
    80001660:	ff010113          	addi	sp,sp,-16
    80001664:	00113423          	sd	ra,8(sp)
    80001668:	00813023          	sd	s0,0(sp)
    8000166c:	01010413          	addi	s0,sp,16
    printString("userMain() started.\n");
    80001670:	00008517          	auipc	a0,0x8
    80001674:	9b050513          	addi	a0,a0,-1616 # 80009020 <CONSOLE_STATUS+0x10>
    80001678:	00004097          	auipc	ra,0x4
    8000167c:	d88080e7          	jalr	-632(ra) # 80005400 <_Z11printStringPKc>
    userMain();
    80001680:	00004097          	auipc	ra,0x4
    80001684:	448080e7          	jalr	1096(ra) # 80005ac8 <_Z8userMainv>
    printString("userMain() ended.\n");
    80001688:	00008517          	auipc	a0,0x8
    8000168c:	9b050513          	addi	a0,a0,-1616 # 80009038 <CONSOLE_STATUS+0x28>
    80001690:	00004097          	auipc	ra,0x4
    80001694:	d70080e7          	jalr	-656(ra) # 80005400 <_Z11printStringPKc>
    finished_main = true;
    80001698:	00100793          	li	a5,1
    8000169c:	0000a717          	auipc	a4,0xa
    800016a0:	16f70223          	sb	a5,356(a4) # 8000b800 <finished_main>
}
    800016a4:	00813083          	ld	ra,8(sp)
    800016a8:	00013403          	ld	s0,0(sp)
    800016ac:	01010113          	addi	sp,sp,16
    800016b0:	00008067          	ret

00000000800016b4 <_Z4idlePv>:

    static uint64 r_scause();

    static void mc_sip(uint64 mask);

    static bool get_user_mode() { return user_mode; }
    800016b4:	0000a797          	auipc	a5,0xa
    800016b8:	0fc7b783          	ld	a5,252(a5) # 8000b7b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800016bc:	0007c783          	lbu	a5,0(a5)

void idle(void*){
    while(RiscV::get_user_mode()) thread_dispatch();
    800016c0:	02078e63          	beqz	a5,800016fc <_Z4idlePv+0x48>
void idle(void*){
    800016c4:	ff010113          	addi	sp,sp,-16
    800016c8:	00113423          	sd	ra,8(sp)
    800016cc:	00813023          	sd	s0,0(sp)
    800016d0:	01010413          	addi	s0,sp,16
    while(RiscV::get_user_mode()) thread_dispatch();
    800016d4:	00000097          	auipc	ra,0x0
    800016d8:	dd4080e7          	jalr	-556(ra) # 800014a8 <_Z15thread_dispatchv>
    800016dc:	0000a797          	auipc	a5,0xa
    800016e0:	0d47b783          	ld	a5,212(a5) # 8000b7b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800016e4:	0007c783          	lbu	a5,0(a5)
    800016e8:	fe0796e3          	bnez	a5,800016d4 <_Z4idlePv+0x20>
}
    800016ec:	00813083          	ld	ra,8(sp)
    800016f0:	00013403          	ld	s0,0(sp)
    800016f4:	01010113          	addi	sp,sp,16
    800016f8:	00008067          	ret
    800016fc:	00008067          	ret

0000000080001700 <main>:

int main(){
    80001700:	fc010113          	addi	sp,sp,-64
    80001704:	02113c23          	sd	ra,56(sp)
    80001708:	02813823          	sd	s0,48(sp)
    8000170c:	02913423          	sd	s1,40(sp)
    80001710:	04010413          	addi	s0,sp,64
    RiscV::w_stvec(((uint64) &RiscV::interruptRoutine) | 1);
    80001714:	0000a797          	auipc	a5,0xa
    80001718:	0847b783          	ld	a5,132(a5) # 8000b798 <_GLOBAL_OFFSET_TABLE_+0x20>
    8000171c:	0017e793          	ori	a5,a5,1

    static void interruptRoutine();
};

inline void RiscV::w_stvec(uint64 val) {
    __asm__ volatile ("csrw stvec, %0" : : "r"(val));
    80001720:	10579073          	csrw	stvec,a5

    TCB *main_t = nullptr, *idle_t = nullptr, *t1 = nullptr;
    80001724:	fc043c23          	sd	zero,-40(s0)
    80001728:	fc043823          	sd	zero,-48(s0)
    8000172c:	fc043423          	sd	zero,-56(s0)

    thread_create(&main_t, nullptr, nullptr);
    80001730:	00000613          	li	a2,0
    80001734:	00000593          	li	a1,0
    80001738:	fd840513          	addi	a0,s0,-40
    8000173c:	00000097          	auipc	ra,0x0
    80001740:	cc8080e7          	jalr	-824(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    TCB::running = main_t;
    80001744:	0000a797          	auipc	a5,0xa
    80001748:	05c7b783          	ld	a5,92(a5) # 8000b7a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    8000174c:	fd843703          	ld	a4,-40(s0)
    80001750:	00e7b023          	sd	a4,0(a5)
inline void RiscV::w_sstatus(uint64 sstatus) {
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
}

inline void RiscV::ms_sstatus(uint64 mask){
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80001754:	00200793          	li	a5,2
    80001758:	1007a073          	csrs	sstatus,a5

    RiscV::ms_sstatus(RiscV::SSTATUS_MASK::SSTATUS_SIE);
    printString("USER MODE STARTED.\n");
    8000175c:	00008517          	auipc	a0,0x8
    80001760:	8f450513          	addi	a0,a0,-1804 # 80009050 <CONSOLE_STATUS+0x40>
    80001764:	00004097          	auipc	ra,0x4
    80001768:	c9c080e7          	jalr	-868(ra) # 80005400 <_Z11printStringPKc>
    static void set_user_mode(bool value) { user_mode = value; }
    8000176c:	0000a797          	auipc	a5,0xa
    80001770:	0447b783          	ld	a5,68(a5) # 8000b7b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001774:	00100713          	li	a4,1
    80001778:	00e78023          	sb	a4,0(a5)
    RiscV::set_user_mode(true);

    thread_create(&idle_t, &idle, nullptr);
    8000177c:	00000613          	li	a2,0
    80001780:	00000597          	auipc	a1,0x0
    80001784:	f3458593          	addi	a1,a1,-204 # 800016b4 <_Z4idlePv>
    80001788:	fd040513          	addi	a0,s0,-48
    8000178c:	00000097          	auipc	ra,0x0
    80001790:	c78080e7          	jalr	-904(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    thread_create(&t1, &userMain_wrapper, nullptr);
    80001794:	00000613          	li	a2,0
    80001798:	00000597          	auipc	a1,0x0
    8000179c:	ec858593          	addi	a1,a1,-312 # 80001660 <_Z16userMain_wrapperPv>
    800017a0:	fc840513          	addi	a0,s0,-56
    800017a4:	00000097          	auipc	ra,0x0
    800017a8:	c60080e7          	jalr	-928(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>

    while(!finished_main){
    800017ac:	0000a797          	auipc	a5,0xa
    800017b0:	0547c783          	lbu	a5,84(a5) # 8000b800 <finished_main>
    800017b4:	00079863          	bnez	a5,800017c4 <main+0xc4>
        thread_dispatch();
    800017b8:	00000097          	auipc	ra,0x0
    800017bc:	cf0080e7          	jalr	-784(ra) # 800014a8 <_Z15thread_dispatchv>
    800017c0:	fedff06f          	j	800017ac <main+0xac>
    800017c4:	0000a797          	auipc	a5,0xa
    800017c8:	fec7b783          	ld	a5,-20(a5) # 8000b7b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    800017cc:	00078023          	sb	zero,0(a5)
    }

    RiscV::set_user_mode(false);
    printString("USER MODE ENDED.\n");
    800017d0:	00008517          	auipc	a0,0x8
    800017d4:	89850513          	addi	a0,a0,-1896 # 80009068 <CONSOLE_STATUS+0x58>
    800017d8:	00004097          	auipc	ra,0x4
    800017dc:	c28080e7          	jalr	-984(ra) # 80005400 <_Z11printStringPKc>
}

inline void RiscV::mc_sstatus(uint64 mask){
    __asm__ volatile("csrc sstatus, %[mask]" : : [mask] "r"(mask));
    800017e0:	00200793          	li	a5,2
    800017e4:	1007b073          	csrc	sstatus,a5
    RiscV::mc_sstatus(RiscV::SSTATUS_MASK::SSTATUS_SIE);

    thread_join(idle_t);
    800017e8:	fd043503          	ld	a0,-48(s0)
    800017ec:	00000097          	auipc	ra,0x0
    800017f0:	ce0080e7          	jalr	-800(ra) # 800014cc <_Z11thread_joinP3TCB>

    delete main_t;
    800017f4:	fd843483          	ld	s1,-40(s0)
    800017f8:	02048063          	beqz	s1,80001818 <main+0x118>

    bool get_user_mode () const { return user_mode; }
    void set_user_mode (bool value) { user_mode = value; }

    ~TCB(){
        delete[] stack;
    800017fc:	0104b503          	ld	a0,16(s1)
    80001800:	00050663          	beqz	a0,8000180c <main+0x10c>
    80001804:	00000097          	auipc	ra,0x0
    80001808:	6cc080e7          	jalr	1740(ra) # 80001ed0 <_ZdaPv>
    8000180c:	00048513          	mv	a0,s1
    80001810:	00000097          	auipc	ra,0x0
    80001814:	658080e7          	jalr	1624(ra) # 80001e68 <_ZdlPv>
    delete idle_t;
    80001818:	fd043483          	ld	s1,-48(s0)
    8000181c:	02048063          	beqz	s1,8000183c <main+0x13c>
    80001820:	0104b503          	ld	a0,16(s1)
    80001824:	00050663          	beqz	a0,80001830 <main+0x130>
    80001828:	00000097          	auipc	ra,0x0
    8000182c:	6a8080e7          	jalr	1704(ra) # 80001ed0 <_ZdaPv>
    80001830:	00048513          	mv	a0,s1
    80001834:	00000097          	auipc	ra,0x0
    80001838:	634080e7          	jalr	1588(ra) # 80001e68 <_ZdlPv>
    delete t1;
    8000183c:	fc843483          	ld	s1,-56(s0)
    80001840:	02048063          	beqz	s1,80001860 <main+0x160>
    80001844:	0104b503          	ld	a0,16(s1)
    80001848:	00050663          	beqz	a0,80001854 <main+0x154>
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	684080e7          	jalr	1668(ra) # 80001ed0 <_ZdaPv>
    80001854:	00048513          	mv	a0,s1
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	610080e7          	jalr	1552(ra) # 80001e68 <_ZdlPv>

    return 0;
    80001860:	00000513          	li	a0,0
    80001864:	03813083          	ld	ra,56(sp)
    80001868:	03013403          	ld	s0,48(sp)
    8000186c:	02813483          	ld	s1,40(sp)
    80001870:	04010113          	addi	sp,sp,64
    80001874:	00008067          	ret

0000000080001878 <_ZN19SleepingThreadsListC1Ev>:
#include "../h/SleepingThreadsList.hpp"

SleepingThreadsList::SleepingThreadsList() : head(nullptr), tail(nullptr) {}
    80001878:	ff010113          	addi	sp,sp,-16
    8000187c:	00813423          	sd	s0,8(sp)
    80001880:	01010413          	addi	s0,sp,16
    80001884:	00053023          	sd	zero,0(a0)
    80001888:	00053423          	sd	zero,8(a0)
    8000188c:	00813403          	ld	s0,8(sp)
    80001890:	01010113          	addi	sp,sp,16
    80001894:	00008067          	ret

0000000080001898 <_ZN19SleepingThreadsList14dec_time_firstEv>:

void SleepingThreadsList::dec_time_first() {
    80001898:	ff010113          	addi	sp,sp,-16
    8000189c:	00813423          	sd	s0,8(sp)
    800018a0:	01010413          	addi	s0,sp,16
    if(!head) return;
    800018a4:	00053783          	ld	a5,0(a0)
    800018a8:	00078863          	beqz	a5,800018b8 <_ZN19SleepingThreadsList14dec_time_firstEv+0x20>
    head->slice--;
    800018ac:	0087b703          	ld	a4,8(a5)
    800018b0:	fff70713          	addi	a4,a4,-1
    800018b4:	00e7b423          	sd	a4,8(a5)
}
    800018b8:	00813403          	ld	s0,8(sp)
    800018bc:	01010113          	addi	sp,sp,16
    800018c0:	00008067          	ret

00000000800018c4 <_ZN19SleepingThreadsList15peek_time_firstEv>:

time_t SleepingThreadsList::peek_time_first() {
    800018c4:	ff010113          	addi	sp,sp,-16
    800018c8:	00813423          	sd	s0,8(sp)
    800018cc:	01010413          	addi	s0,sp,16
    if(head) {
    800018d0:	00053783          	ld	a5,0(a0)
    800018d4:	00078a63          	beqz	a5,800018e8 <_ZN19SleepingThreadsList15peek_time_firstEv+0x24>
        return head->slice;
    800018d8:	0087b503          	ld	a0,8(a5)
    }

    return -1;
}
    800018dc:	00813403          	ld	s0,8(sp)
    800018e0:	01010113          	addi	sp,sp,16
    800018e4:	00008067          	ret
    return -1;
    800018e8:	fff00513          	li	a0,-1
    800018ec:	ff1ff06f          	j	800018dc <_ZN19SleepingThreadsList15peek_time_firstEv+0x18>

00000000800018f0 <_ZN19SleepingThreadsList15remove_finishedEv>:

void SleepingThreadsList::remove_finished() {
    800018f0:	fe010113          	addi	sp,sp,-32
    800018f4:	00113c23          	sd	ra,24(sp)
    800018f8:	00813823          	sd	s0,16(sp)
    800018fc:	00913423          	sd	s1,8(sp)
    80001900:	01213023          	sd	s2,0(sp)
    80001904:	02010413          	addi	s0,sp,32
    80001908:	00050913          	mv	s2,a0
    8000190c:	0300006f          	j	8000193c <_ZN19SleepingThreadsList15remove_finishedEv+0x4c>
    while(head != nullptr && head->slice <= 0){
        Elem* elem = head;
        head = head->next;
        if(!head) {tail = nullptr;}
    80001910:	00093423          	sd	zero,8(s2)
        elem->thread->set_sleeping(false);
    80001914:	0004b783          	ld	a5,0(s1)

    bool is_finished() const { return finished; }
    void set_finished(bool f) { this->finished = f; }

    bool is_sleeping() const { return sleeping; }
    void set_sleeping(bool s) { this->sleeping = s; }
    80001918:	02078b23          	sb	zero,54(a5)
        Scheduler::put(elem->thread);
    8000191c:	0004b503          	ld	a0,0(s1)
    80001920:	00001097          	auipc	ra,0x1
    80001924:	224080e7          	jalr	548(ra) # 80002b44 <_ZN9Scheduler3putEP3TCB>
        MemoryAllocator::getInstance().free(elem);
    80001928:	00001097          	auipc	ra,0x1
    8000192c:	31c080e7          	jalr	796(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    80001930:	00048593          	mv	a1,s1
    80001934:	00001097          	auipc	ra,0x1
    80001938:	4d0080e7          	jalr	1232(ra) # 80002e04 <_ZN15MemoryAllocator4freeEPv>
    while(head != nullptr && head->slice <= 0){
    8000193c:	00093483          	ld	s1,0(s2)
    80001940:	00048e63          	beqz	s1,8000195c <_ZN19SleepingThreadsList15remove_finishedEv+0x6c>
    80001944:	0084b783          	ld	a5,8(s1)
    80001948:	00079a63          	bnez	a5,8000195c <_ZN19SleepingThreadsList15remove_finishedEv+0x6c>
        head = head->next;
    8000194c:	0104b783          	ld	a5,16(s1)
    80001950:	00f93023          	sd	a5,0(s2)
        if(!head) {tail = nullptr;}
    80001954:	fc0790e3          	bnez	a5,80001914 <_ZN19SleepingThreadsList15remove_finishedEv+0x24>
    80001958:	fb9ff06f          	j	80001910 <_ZN19SleepingThreadsList15remove_finishedEv+0x20>
    }
}
    8000195c:	01813083          	ld	ra,24(sp)
    80001960:	01013403          	ld	s0,16(sp)
    80001964:	00813483          	ld	s1,8(sp)
    80001968:	00013903          	ld	s2,0(sp)
    8000196c:	02010113          	addi	sp,sp,32
    80001970:	00008067          	ret

0000000080001974 <_ZN19SleepingThreadsList3putEP3TCBm>:

void SleepingThreadsList::put(TCB *thread, time_t slice) {
    80001974:	fc010113          	addi	sp,sp,-64
    80001978:	02113c23          	sd	ra,56(sp)
    8000197c:	02813823          	sd	s0,48(sp)
    80001980:	02913423          	sd	s1,40(sp)
    80001984:	03213023          	sd	s2,32(sp)
    80001988:	01313c23          	sd	s3,24(sp)
    8000198c:	01413823          	sd	s4,16(sp)
    80001990:	01513423          	sd	s5,8(sp)
    80001994:	04010413          	addi	s0,sp,64
    80001998:	00050a13          	mv	s4,a0
    8000199c:	00058a93          	mv	s5,a1
    800019a0:	00060913          	mv	s2,a2
    if(head == nullptr){
    800019a4:	00053483          	ld	s1,0(a0)
    800019a8:	02048463          	beqz	s1,800019d0 <_ZN19SleepingThreadsList3putEP3TCBm+0x5c>
        head->slice = slice;
        tail = head;

    } else {
        Elem* temp = head;
        Elem* prev = nullptr;
    800019ac:	00000993          	li	s3,0

        while(temp != tail && slice >= temp->slice){
    800019b0:	008a3703          	ld	a4,8(s4)
    800019b4:	04970a63          	beq	a4,s1,80001a08 <_ZN19SleepingThreadsList3putEP3TCBm+0x94>
    800019b8:	0084b783          	ld	a5,8(s1)
    800019bc:	04f96663          	bltu	s2,a5,80001a08 <_ZN19SleepingThreadsList3putEP3TCBm+0x94>
            slice -= temp->slice;
    800019c0:	40f90933          	sub	s2,s2,a5
            prev = temp;
    800019c4:	00048993          	mv	s3,s1
            temp = temp->next;
    800019c8:	0104b483          	ld	s1,16(s1)
        while(temp != tail && slice >= temp->slice){
    800019cc:	fe5ff06f          	j	800019b0 <_ZN19SleepingThreadsList3putEP3TCBm+0x3c>
        head = (Elem*) MemoryAllocator::getInstance().mallocBytes(sizeof(Elem));
    800019d0:	00001097          	auipc	ra,0x1
    800019d4:	274080e7          	jalr	628(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    800019d8:	01800593          	li	a1,24
    800019dc:	00001097          	auipc	ra,0x1
    800019e0:	3f8080e7          	jalr	1016(ra) # 80002dd4 <_ZN15MemoryAllocator11mallocBytesEm>
    800019e4:	00aa3023          	sd	a0,0(s4)
        head->thread = thread;
    800019e8:	01553023          	sd	s5,0(a0)
        head->next = nullptr;
    800019ec:	000a3783          	ld	a5,0(s4)
    800019f0:	0007b823          	sd	zero,16(a5)
        head->slice = slice;
    800019f4:	000a3783          	ld	a5,0(s4)
    800019f8:	0127b423          	sd	s2,8(a5)
        tail = head;
    800019fc:	000a3783          	ld	a5,0(s4)
    80001a00:	00fa3423          	sd	a5,8(s4)
    80001a04:	03c0006f          	j	80001a40 <_ZN19SleepingThreadsList3putEP3TCBm+0xcc>

        }

        if(temp == tail) {
    80001a08:	04970e63          	beq	a4,s1,80001a64 <_ZN19SleepingThreadsList3putEP3TCBm+0xf0>
                tail->slice -= slice;
            }

        }
        else {
            Elem* novi = (Elem*) MemoryAllocator::getInstance().mallocBytes(sizeof(Elem));
    80001a0c:	00001097          	auipc	ra,0x1
    80001a10:	238080e7          	jalr	568(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    80001a14:	01800593          	li	a1,24
    80001a18:	00001097          	auipc	ra,0x1
    80001a1c:	3bc080e7          	jalr	956(ra) # 80002dd4 <_ZN15MemoryAllocator11mallocBytesEm>
            novi->thread = thread;
    80001a20:	01553023          	sd	s5,0(a0)
            novi->next  = temp;
    80001a24:	00953823          	sd	s1,16(a0)
            novi->slice = slice;
    80001a28:	01253423          	sd	s2,8(a0)

            if(prev) {
    80001a2c:	0c098263          	beqz	s3,80001af0 <_ZN19SleepingThreadsList3putEP3TCBm+0x17c>
                prev->next = novi;
    80001a30:	00a9b823          	sd	a0,16(s3)
            } else {
                head = novi;
            }

            temp->slice -= slice;
    80001a34:	0084b783          	ld	a5,8(s1)
    80001a38:	41278933          	sub	s2,a5,s2
    80001a3c:	0124b423          	sd	s2,8(s1)
        }
    }
    80001a40:	03813083          	ld	ra,56(sp)
    80001a44:	03013403          	ld	s0,48(sp)
    80001a48:	02813483          	ld	s1,40(sp)
    80001a4c:	02013903          	ld	s2,32(sp)
    80001a50:	01813983          	ld	s3,24(sp)
    80001a54:	01013a03          	ld	s4,16(sp)
    80001a58:	00813a83          	ld	s5,8(sp)
    80001a5c:	04010113          	addi	sp,sp,64
    80001a60:	00008067          	ret
            if(slice >= tail->slice){
    80001a64:	00873783          	ld	a5,8(a4)
    80001a68:	04f96063          	bltu	s2,a5,80001aa8 <_ZN19SleepingThreadsList3putEP3TCBm+0x134>
                Elem* novi = (Elem*) MemoryAllocator::getInstance().mallocBytes(sizeof(Elem));
    80001a6c:	00001097          	auipc	ra,0x1
    80001a70:	1d8080e7          	jalr	472(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    80001a74:	01800593          	li	a1,24
    80001a78:	00001097          	auipc	ra,0x1
    80001a7c:	35c080e7          	jalr	860(ra) # 80002dd4 <_ZN15MemoryAllocator11mallocBytesEm>
                novi->thread = thread;
    80001a80:	01553023          	sd	s5,0(a0)
                novi->next = nullptr;
    80001a84:	00053823          	sd	zero,16(a0)
                novi->slice = slice - tail->slice;
    80001a88:	008a3783          	ld	a5,8(s4)
    80001a8c:	0087b783          	ld	a5,8(a5)
    80001a90:	40f90933          	sub	s2,s2,a5
    80001a94:	01253423          	sd	s2,8(a0)
                tail->next = novi;
    80001a98:	008a3783          	ld	a5,8(s4)
    80001a9c:	00a7b823          	sd	a0,16(a5)
                tail = novi;
    80001aa0:	00aa3423          	sd	a0,8(s4)
    80001aa4:	f9dff06f          	j	80001a40 <_ZN19SleepingThreadsList3putEP3TCBm+0xcc>
                Elem* novi = (Elem*) MemoryAllocator::getInstance().mallocBytes(sizeof(Elem));
    80001aa8:	00001097          	auipc	ra,0x1
    80001aac:	19c080e7          	jalr	412(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    80001ab0:	01800593          	li	a1,24
    80001ab4:	00001097          	auipc	ra,0x1
    80001ab8:	320080e7          	jalr	800(ra) # 80002dd4 <_ZN15MemoryAllocator11mallocBytesEm>
                novi->thread = thread;
    80001abc:	01553023          	sd	s5,0(a0)
                novi->next = tail;
    80001ac0:	008a3783          	ld	a5,8(s4)
    80001ac4:	00f53823          	sd	a5,16(a0)
                novi->slice= slice;
    80001ac8:	01253423          	sd	s2,8(a0)
                if(prev != nullptr){
    80001acc:	00098e63          	beqz	s3,80001ae8 <_ZN19SleepingThreadsList3putEP3TCBm+0x174>
                    prev->next = novi;
    80001ad0:	00a9b823          	sd	a0,16(s3)
                tail->slice -= slice;
    80001ad4:	008a3703          	ld	a4,8(s4)
    80001ad8:	00873783          	ld	a5,8(a4)
    80001adc:	41278933          	sub	s2,a5,s2
    80001ae0:	01273423          	sd	s2,8(a4)
    80001ae4:	f5dff06f          	j	80001a40 <_ZN19SleepingThreadsList3putEP3TCBm+0xcc>
                    head = novi;
    80001ae8:	00aa3023          	sd	a0,0(s4)
    80001aec:	fe9ff06f          	j	80001ad4 <_ZN19SleepingThreadsList3putEP3TCBm+0x160>
                head = novi;
    80001af0:	00aa3023          	sd	a0,0(s4)
    80001af4:	f41ff06f          	j	80001a34 <_ZN19SleepingThreadsList3putEP3TCBm+0xc0>

0000000080001af8 <_ZN3TCB14thread_wrapperEv>:
    ID++;

    return tcb;
}

void TCB::thread_wrapper() {
    80001af8:	fe010113          	addi	sp,sp,-32
    80001afc:	00113c23          	sd	ra,24(sp)
    80001b00:	00813823          	sd	s0,16(sp)
    80001b04:	00913423          	sd	s1,8(sp)
    80001b08:	02010413          	addi	s0,sp,32
    RiscV::popSppSpie();
    80001b0c:	00001097          	auipc	ra,0x1
    80001b10:	868080e7          	jalr	-1944(ra) # 80002374 <_ZN5RiscV10popSppSpieEv>
    running->body(running->args);
    80001b14:	0000a497          	auipc	s1,0xa
    80001b18:	cf448493          	addi	s1,s1,-780 # 8000b808 <_ZN3TCB7runningE>
    80001b1c:	0004b783          	ld	a5,0(s1)
    80001b20:	0007b703          	ld	a4,0(a5)
    80001b24:	0087b503          	ld	a0,8(a5)
    80001b28:	000700e7          	jalr	a4
    running->set_finished(true);
    80001b2c:	0004b783          	ld	a5,0(s1)
//    void start(){
//        Scheduler::put(this);
//    }

    bool is_finished() const { return finished; }
    void set_finished(bool f) { this->finished = f; }
    80001b30:	00100713          	li	a4,1
    80001b34:	02e78a23          	sb	a4,52(a5)
    thread_dispatch();
    80001b38:	00000097          	auipc	ra,0x0
    80001b3c:	970080e7          	jalr	-1680(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80001b40:	01813083          	ld	ra,24(sp)
    80001b44:	01013403          	ld	s0,16(sp)
    80001b48:	00813483          	ld	s1,8(sp)
    80001b4c:	02010113          	addi	sp,sp,32
    80001b50:	00008067          	ret

0000000080001b54 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm>:
TCB *TCB::create_thread(TCB **handle, TCB::Body body, void *args, uint64 *stack) {
    80001b54:	fc010113          	addi	sp,sp,-64
    80001b58:	02113c23          	sd	ra,56(sp)
    80001b5c:	02813823          	sd	s0,48(sp)
    80001b60:	02913423          	sd	s1,40(sp)
    80001b64:	03213023          	sd	s2,32(sp)
    80001b68:	01313c23          	sd	s3,24(sp)
    80001b6c:	01413823          	sd	s4,16(sp)
    80001b70:	01513423          	sd	s5,8(sp)
    80001b74:	04010413          	addi	s0,sp,64
    80001b78:	00050a13          	mv	s4,a0
    80001b7c:	00058993          	mv	s3,a1
    80001b80:	00060a93          	mv	s5,a2
    80001b84:	00068913          	mv	s2,a3
    TCB* tcb = new TCB(body, args, DEFAULT_TIME_SLICE, stack);
    80001b88:	04000513          	li	a0,64
    80001b8c:	00000097          	auipc	ra,0x0
    80001b90:	28c080e7          	jalr	652(ra) # 80001e18 <_Znwm>
    80001b94:	00050493          	mv	s1,a0
        main(body == nullptr){
    80001b98:	01353023          	sd	s3,0(a0)
    80001b9c:	01553423          	sd	s5,8(a0)
        stack(body != nullptr ? stack : nullptr),
    80001ba0:	06098263          	beqz	s3,80001c04 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0xb0>
    80001ba4:	00090793          	mv	a5,s2
        main(body == nullptr){
    80001ba8:	00f4b823          	sd	a5,16(s1)
    80001bac:	00000797          	auipc	a5,0x0
    80001bb0:	f4c78793          	addi	a5,a5,-180 # 80001af8 <_ZN3TCB14thread_wrapperEv>
    80001bb4:	00f4bc23          	sd	a5,24(s1)
        context({(uint64) &thread_wrapper, stack != nullptr ? reinterpret_cast<uint64>(&stack[DEFAULT_STACK_SIZE]) : 0UL}),
    80001bb8:	04090a63          	beqz	s2,80001c0c <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0xb8>
    80001bbc:	000086b7          	lui	a3,0x8
    80001bc0:	00d90933          	add	s2,s2,a3
        main(body == nullptr){
    80001bc4:	0324b023          	sd	s2,32(s1)
    80001bc8:	00200793          	li	a5,2
    80001bcc:	02f4b423          	sd	a5,40(s1)
    80001bd0:	0000a797          	auipc	a5,0xa
    80001bd4:	c407a783          	lw	a5,-960(a5) # 8000b810 <_ZN3TCB2IDE>
    80001bd8:	02f4a823          	sw	a5,48(s1)
    80001bdc:	02048a23          	sb	zero,52(s1)
    80001be0:	02048aa3          	sb	zero,53(s1)
    80001be4:	02048b23          	sb	zero,54(s1)
    80001be8:	0019b793          	seqz	a5,s3
    80001bec:	02f48ba3          	sb	a5,55(s1)
        if(body != nullptr){
    80001bf0:	04098063          	beqz	s3,80001c30 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0xdc>
            Scheduler::put(this);
    80001bf4:	00048513          	mv	a0,s1
    80001bf8:	00001097          	auipc	ra,0x1
    80001bfc:	f4c080e7          	jalr	-180(ra) # 80002b44 <_ZN9Scheduler3putEP3TCB>
    80001c00:	0300006f          	j	80001c30 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0xdc>
        stack(body != nullptr ? stack : nullptr),
    80001c04:	00000793          	li	a5,0
    80001c08:	fa1ff06f          	j	80001ba8 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0x54>
        context({(uint64) &thread_wrapper, stack != nullptr ? reinterpret_cast<uint64>(&stack[DEFAULT_STACK_SIZE]) : 0UL}),
    80001c0c:	00000913          	li	s2,0
    80001c10:	fb5ff06f          	j	80001bc4 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0x70>
    80001c14:	00050913          	mv	s2,a0
    80001c18:	00048513          	mv	a0,s1
    80001c1c:	00000097          	auipc	ra,0x0
    80001c20:	24c080e7          	jalr	588(ra) # 80001e68 <_ZdlPv>
    80001c24:	00090513          	mv	a0,s2
    80001c28:	0000b097          	auipc	ra,0xb
    80001c2c:	d50080e7          	jalr	-688(ra) # 8000c978 <_Unwind_Resume>

    static uint64 r_scause();

    static void mc_sip(uint64 mask);

    static bool get_user_mode() { return user_mode; }
    80001c30:	0000a797          	auipc	a5,0xa
    80001c34:	b807b783          	ld	a5,-1152(a5) # 8000b7b0 <_GLOBAL_OFFSET_TABLE_+0x38>
    80001c38:	0007c783          	lbu	a5,0(a5)
    bool is_main() const { return main; }
    int get_id() const { return id; }
    uint64 get_time_slice() const { return time_slice; }

    bool get_user_mode () const { return user_mode; }
    void set_user_mode (bool value) { user_mode = value; }
    80001c3c:	02f48c23          	sb	a5,56(s1)
    *handle = tcb;
    80001c40:	009a3023          	sd	s1,0(s4)
    ID++;
    80001c44:	0000a717          	auipc	a4,0xa
    80001c48:	bc470713          	addi	a4,a4,-1084 # 8000b808 <_ZN3TCB7runningE>
    80001c4c:	00872783          	lw	a5,8(a4)
    80001c50:	0017879b          	addiw	a5,a5,1
    80001c54:	00f72423          	sw	a5,8(a4)
}
    80001c58:	00048513          	mv	a0,s1
    80001c5c:	03813083          	ld	ra,56(sp)
    80001c60:	03013403          	ld	s0,48(sp)
    80001c64:	02813483          	ld	s1,40(sp)
    80001c68:	02013903          	ld	s2,32(sp)
    80001c6c:	01813983          	ld	s3,24(sp)
    80001c70:	01013a03          	ld	s4,16(sp)
    80001c74:	00813a83          	ld	s5,8(sp)
    80001c78:	04010113          	addi	sp,sp,64
    80001c7c:	00008067          	ret

0000000080001c80 <_ZN3TCB5yieldEv>:

void TCB::yield(){
    80001c80:	ff010113          	addi	sp,sp,-16
    80001c84:	00813423          	sd	s0,8(sp)
    80001c88:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_DISPATCH));
    80001c8c:	01300793          	li	a5,19
    80001c90:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001c94:	00000073          	ecall
}
    80001c98:	00813403          	ld	s0,8(sp)
    80001c9c:	01010113          	addi	sp,sp,16
    80001ca0:	00008067          	ret

0000000080001ca4 <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001ca4:	fe010113          	addi	sp,sp,-32
    80001ca8:	00113c23          	sd	ra,24(sp)
    80001cac:	00813823          	sd	s0,16(sp)
    80001cb0:	00913423          	sd	s1,8(sp)
    80001cb4:	02010413          	addi	s0,sp,32
    TCB* old = running;
    80001cb8:	0000a497          	auipc	s1,0xa
    80001cbc:	b504b483          	ld	s1,-1200(s1) # 8000b808 <_ZN3TCB7runningE>
    bool is_finished() const { return finished; }
    80001cc0:	0344c783          	lbu	a5,52(s1)
    if(!old->is_finished() && !old->is_sleeping() && !old->is_blocked()) Scheduler::put(old);
    80001cc4:	00079a63          	bnez	a5,80001cd8 <_ZN3TCB8dispatchEv+0x34>
    bool is_sleeping() const { return sleeping; }
    80001cc8:	0364c783          	lbu	a5,54(s1)
    80001ccc:	00079663          	bnez	a5,80001cd8 <_ZN3TCB8dispatchEv+0x34>
    bool is_blocked() const { return blocked; }
    80001cd0:	0354c783          	lbu	a5,53(s1)
    80001cd4:	04078063          	beqz	a5,80001d14 <_ZN3TCB8dispatchEv+0x70>
    running = Scheduler::get();
    80001cd8:	00001097          	auipc	ra,0x1
    80001cdc:	df0080e7          	jalr	-528(ra) # 80002ac8 <_ZN9Scheduler3getEv>
    80001ce0:	0000a797          	auipc	a5,0xa
    80001ce4:	b2a7b423          	sd	a0,-1240(a5) # 8000b808 <_ZN3TCB7runningE>

    if(old != running && running != nullptr){
    80001ce8:	00a48c63          	beq	s1,a0,80001d00 <_ZN3TCB8dispatchEv+0x5c>
    80001cec:	00050a63          	beqz	a0,80001d00 <_ZN3TCB8dispatchEv+0x5c>
        contextSwitch(&(old->context), &(running->context));
    80001cf0:	01850593          	addi	a1,a0,24
    80001cf4:	01848513          	addi	a0,s1,24
    80001cf8:	fffff097          	auipc	ra,0xfffff
    80001cfc:	660080e7          	jalr	1632(ra) # 80001358 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    }
}
    80001d00:	01813083          	ld	ra,24(sp)
    80001d04:	01013403          	ld	s0,16(sp)
    80001d08:	00813483          	ld	s1,8(sp)
    80001d0c:	02010113          	addi	sp,sp,32
    80001d10:	00008067          	ret
    if(!old->is_finished() && !old->is_sleeping() && !old->is_blocked()) Scheduler::put(old);
    80001d14:	00048513          	mv	a0,s1
    80001d18:	00001097          	auipc	ra,0x1
    80001d1c:	e2c080e7          	jalr	-468(ra) # 80002b44 <_ZN9Scheduler3putEP3TCB>
    80001d20:	fb9ff06f          	j	80001cd8 <_ZN3TCB8dispatchEv+0x34>

0000000080001d24 <_ZN3TCB4joinEPS_>:

void TCB::join(TCB* handle) {
    80001d24:	fe010113          	addi	sp,sp,-32
    80001d28:	00113c23          	sd	ra,24(sp)
    80001d2c:	00813823          	sd	s0,16(sp)
    80001d30:	00913423          	sd	s1,8(sp)
    80001d34:	02010413          	addi	s0,sp,32
    80001d38:	00050493          	mv	s1,a0
    bool is_finished() const { return finished; }
    80001d3c:	0344c783          	lbu	a5,52(s1)
    while(!handle->is_finished()){
    80001d40:	00079863          	bnez	a5,80001d50 <_ZN3TCB4joinEPS_+0x2c>
        TCB::dispatch();
    80001d44:	00000097          	auipc	ra,0x0
    80001d48:	f60080e7          	jalr	-160(ra) # 80001ca4 <_ZN3TCB8dispatchEv>
    while(!handle->is_finished()){
    80001d4c:	ff1ff06f          	j	80001d3c <_ZN3TCB4joinEPS_+0x18>
    }
}
    80001d50:	01813083          	ld	ra,24(sp)
    80001d54:	01013403          	ld	s0,16(sp)
    80001d58:	00813483          	ld	s1,8(sp)
    80001d5c:	02010113          	addi	sp,sp,32
    80001d60:	00008067          	ret

0000000080001d64 <_ZN3TCB16outputThreadBodyEPv>:

void TCB::outputThreadBody(void *) {
    80001d64:	ff010113          	addi	sp,sp,-16
    80001d68:	00813423          	sd	s0,8(sp)
    80001d6c:	01010413          	addi	s0,sp,16

}
    80001d70:	00813403          	ld	s0,8(sp)
    80001d74:	01010113          	addi	sp,sp,16
    80001d78:	00008067          	ret

0000000080001d7c <_ZN6Thread13threadWrapperEPv>:
Thread::Thread() {
    myHandle = nullptr;
    thread_create(&myHandle, Thread::threadWrapper, (void*)this);
}

void Thread::threadWrapper(void *thread) {
    80001d7c:	ff010113          	addi	sp,sp,-16
    80001d80:	00113423          	sd	ra,8(sp)
    80001d84:	00813023          	sd	s0,0(sp)
    80001d88:	01010413          	addi	s0,sp,16
    ((Thread*)thread)->run();
    80001d8c:	00053783          	ld	a5,0(a0)
    80001d90:	0107b783          	ld	a5,16(a5)
    80001d94:	000780e7          	jalr	a5
}
    80001d98:	00813083          	ld	ra,8(sp)
    80001d9c:	00013403          	ld	s0,0(sp)
    80001da0:	01010113          	addi	sp,sp,16
    80001da4:	00008067          	ret

0000000080001da8 <_ZN14PeriodicThread7wrapperEPv>:

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

void PeriodicThread::wrapper(void* arg) {
    80001da8:	fe010113          	addi	sp,sp,-32
    80001dac:	00113c23          	sd	ra,24(sp)
    80001db0:	00813823          	sd	s0,16(sp)
    80001db4:	00913423          	sd	s1,8(sp)
    80001db8:	02010413          	addi	s0,sp,32
    80001dbc:	00050493          	mv	s1,a0
    periodic_s* ps = (periodic_s*) arg;

    while(true){
        time_sleep(ps->period);
    80001dc0:	0084b503          	ld	a0,8(s1)
    80001dc4:	00000097          	auipc	ra,0x0
    80001dc8:	814080e7          	jalr	-2028(ra) # 800015d8 <_Z10time_sleepm>
        ps->periodic_thread->periodicActivation();
    80001dcc:	0004b503          	ld	a0,0(s1)
    80001dd0:	00053783          	ld	a5,0(a0)
    80001dd4:	0187b783          	ld	a5,24(a5)
    80001dd8:	000780e7          	jalr	a5
    while(true){
    80001ddc:	fe5ff06f          	j	80001dc0 <_ZN14PeriodicThread7wrapperEPv+0x18>

0000000080001de0 <_ZN9SemaphoreD1Ev>:
Semaphore::~Semaphore() {
    80001de0:	ff010113          	addi	sp,sp,-16
    80001de4:	00113423          	sd	ra,8(sp)
    80001de8:	00813023          	sd	s0,0(sp)
    80001dec:	01010413          	addi	s0,sp,16
    80001df0:	00009797          	auipc	a5,0x9
    80001df4:	7d078793          	addi	a5,a5,2000 # 8000b5c0 <_ZTV9Semaphore+0x10>
    80001df8:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001dfc:	00853503          	ld	a0,8(a0)
    80001e00:	fffff097          	auipc	ra,0xfffff
    80001e04:	730080e7          	jalr	1840(ra) # 80001530 <_Z9sem_closeP3sem>
}
    80001e08:	00813083          	ld	ra,8(sp)
    80001e0c:	00013403          	ld	s0,0(sp)
    80001e10:	01010113          	addi	sp,sp,16
    80001e14:	00008067          	ret

0000000080001e18 <_Znwm>:
void* operator new(size_t size){
    80001e18:	ff010113          	addi	sp,sp,-16
    80001e1c:	00113423          	sd	ra,8(sp)
    80001e20:	00813023          	sd	s0,0(sp)
    80001e24:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001e28:	fffff097          	auipc	ra,0xfffff
    80001e2c:	564080e7          	jalr	1380(ra) # 8000138c <_Z9mem_allocm>
}
    80001e30:	00813083          	ld	ra,8(sp)
    80001e34:	00013403          	ld	s0,0(sp)
    80001e38:	01010113          	addi	sp,sp,16
    80001e3c:	00008067          	ret

0000000080001e40 <_Znam>:
void* operator new[](size_t size){
    80001e40:	ff010113          	addi	sp,sp,-16
    80001e44:	00113423          	sd	ra,8(sp)
    80001e48:	00813023          	sd	s0,0(sp)
    80001e4c:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001e50:	fffff097          	auipc	ra,0xfffff
    80001e54:	53c080e7          	jalr	1340(ra) # 8000138c <_Z9mem_allocm>
}
    80001e58:	00813083          	ld	ra,8(sp)
    80001e5c:	00013403          	ld	s0,0(sp)
    80001e60:	01010113          	addi	sp,sp,16
    80001e64:	00008067          	ret

0000000080001e68 <_ZdlPv>:
void operator delete(void* ptr){
    80001e68:	ff010113          	addi	sp,sp,-16
    80001e6c:	00113423          	sd	ra,8(sp)
    80001e70:	00813023          	sd	s0,0(sp)
    80001e74:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80001e78:	fffff097          	auipc	ra,0xfffff
    80001e7c:	554080e7          	jalr	1364(ra) # 800013cc <_Z8mem_freePv>
}
    80001e80:	00813083          	ld	ra,8(sp)
    80001e84:	00013403          	ld	s0,0(sp)
    80001e88:	01010113          	addi	sp,sp,16
    80001e8c:	00008067          	ret

0000000080001e90 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001e90:	fe010113          	addi	sp,sp,-32
    80001e94:	00113c23          	sd	ra,24(sp)
    80001e98:	00813823          	sd	s0,16(sp)
    80001e9c:	00913423          	sd	s1,8(sp)
    80001ea0:	02010413          	addi	s0,sp,32
    80001ea4:	00050493          	mv	s1,a0
}
    80001ea8:	00000097          	auipc	ra,0x0
    80001eac:	f38080e7          	jalr	-200(ra) # 80001de0 <_ZN9SemaphoreD1Ev>
    80001eb0:	00048513          	mv	a0,s1
    80001eb4:	00000097          	auipc	ra,0x0
    80001eb8:	fb4080e7          	jalr	-76(ra) # 80001e68 <_ZdlPv>
    80001ebc:	01813083          	ld	ra,24(sp)
    80001ec0:	01013403          	ld	s0,16(sp)
    80001ec4:	00813483          	ld	s1,8(sp)
    80001ec8:	02010113          	addi	sp,sp,32
    80001ecc:	00008067          	ret

0000000080001ed0 <_ZdaPv>:
void operator delete[](void* ptr){
    80001ed0:	ff010113          	addi	sp,sp,-16
    80001ed4:	00113423          	sd	ra,8(sp)
    80001ed8:	00813023          	sd	s0,0(sp)
    80001edc:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80001ee0:	fffff097          	auipc	ra,0xfffff
    80001ee4:	4ec080e7          	jalr	1260(ra) # 800013cc <_Z8mem_freePv>
}
    80001ee8:	00813083          	ld	ra,8(sp)
    80001eec:	00013403          	ld	s0,0(sp)
    80001ef0:	01010113          	addi	sp,sp,16
    80001ef4:	00008067          	ret

0000000080001ef8 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80001ef8:	fe010113          	addi	sp,sp,-32
    80001efc:	00113c23          	sd	ra,24(sp)
    80001f00:	00813823          	sd	s0,16(sp)
    80001f04:	00913423          	sd	s1,8(sp)
    80001f08:	02010413          	addi	s0,sp,32
    80001f0c:	00009797          	auipc	a5,0x9
    80001f10:	68c78793          	addi	a5,a5,1676 # 8000b598 <_ZTV6Thread+0x10>
    80001f14:	00f53023          	sd	a5,0(a0)
    myHandle->set_finished(true);
    80001f18:	00853783          	ld	a5,8(a0)
    void set_finished(bool f) { this->finished = f; }
    80001f1c:	00100713          	li	a4,1
    80001f20:	02e78a23          	sb	a4,52(a5)
    delete myHandle;
    80001f24:	00853483          	ld	s1,8(a0)
    80001f28:	02048063          	beqz	s1,80001f48 <_ZN6ThreadD1Ev+0x50>

    bool get_user_mode () const { return user_mode; }
    void set_user_mode (bool value) { user_mode = value; }

    ~TCB(){
        delete[] stack;
    80001f2c:	0104b503          	ld	a0,16(s1)
    80001f30:	00050663          	beqz	a0,80001f3c <_ZN6ThreadD1Ev+0x44>
    80001f34:	00000097          	auipc	ra,0x0
    80001f38:	f9c080e7          	jalr	-100(ra) # 80001ed0 <_ZdaPv>
    80001f3c:	00048513          	mv	a0,s1
    80001f40:	00000097          	auipc	ra,0x0
    80001f44:	f28080e7          	jalr	-216(ra) # 80001e68 <_ZdlPv>
}
    80001f48:	01813083          	ld	ra,24(sp)
    80001f4c:	01013403          	ld	s0,16(sp)
    80001f50:	00813483          	ld	s1,8(sp)
    80001f54:	02010113          	addi	sp,sp,32
    80001f58:	00008067          	ret

0000000080001f5c <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001f5c:	fe010113          	addi	sp,sp,-32
    80001f60:	00113c23          	sd	ra,24(sp)
    80001f64:	00813823          	sd	s0,16(sp)
    80001f68:	00913423          	sd	s1,8(sp)
    80001f6c:	02010413          	addi	s0,sp,32
    80001f70:	00050493          	mv	s1,a0
}
    80001f74:	00000097          	auipc	ra,0x0
    80001f78:	f84080e7          	jalr	-124(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80001f7c:	00048513          	mv	a0,s1
    80001f80:	00000097          	auipc	ra,0x0
    80001f84:	ee8080e7          	jalr	-280(ra) # 80001e68 <_ZdlPv>
    80001f88:	01813083          	ld	ra,24(sp)
    80001f8c:	01013403          	ld	s0,16(sp)
    80001f90:	00813483          	ld	s1,8(sp)
    80001f94:	02010113          	addi	sp,sp,32
    80001f98:	00008067          	ret

0000000080001f9c <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001f9c:	ff010113          	addi	sp,sp,-16
    80001fa0:	00113423          	sd	ra,8(sp)
    80001fa4:	00813023          	sd	s0,0(sp)
    80001fa8:	01010413          	addi	s0,sp,16
    80001fac:	00009797          	auipc	a5,0x9
    80001fb0:	5ec78793          	addi	a5,a5,1516 # 8000b598 <_ZTV6Thread+0x10>
    80001fb4:	00f53023          	sd	a5,0(a0)
    myHandle = nullptr;
    80001fb8:	00053423          	sd	zero,8(a0)
    thread_create(&myHandle, body, arg);
    80001fbc:	00850513          	addi	a0,a0,8
    80001fc0:	fffff097          	auipc	ra,0xfffff
    80001fc4:	444080e7          	jalr	1092(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001fc8:	00813083          	ld	ra,8(sp)
    80001fcc:	00013403          	ld	s0,0(sp)
    80001fd0:	01010113          	addi	sp,sp,16
    80001fd4:	00008067          	ret

0000000080001fd8 <_ZN6Thread5startEv>:
int Thread::start() {
    80001fd8:	ff010113          	addi	sp,sp,-16
    80001fdc:	00813423          	sd	s0,8(sp)
    80001fe0:	01010413          	addi	s0,sp,16
}
    80001fe4:	00000513          	li	a0,0
    80001fe8:	00813403          	ld	s0,8(sp)
    80001fec:	01010113          	addi	sp,sp,16
    80001ff0:	00008067          	ret

0000000080001ff4 <_ZN6Thread4joinEv>:
    if(myHandle) thread_join(myHandle);
    80001ff4:	00853503          	ld	a0,8(a0)
    80001ff8:	02050663          	beqz	a0,80002024 <_ZN6Thread4joinEv+0x30>
void Thread::join() {
    80001ffc:	ff010113          	addi	sp,sp,-16
    80002000:	00113423          	sd	ra,8(sp)
    80002004:	00813023          	sd	s0,0(sp)
    80002008:	01010413          	addi	s0,sp,16
    if(myHandle) thread_join(myHandle);
    8000200c:	fffff097          	auipc	ra,0xfffff
    80002010:	4c0080e7          	jalr	1216(ra) # 800014cc <_Z11thread_joinP3TCB>
}
    80002014:	00813083          	ld	ra,8(sp)
    80002018:	00013403          	ld	s0,0(sp)
    8000201c:	01010113          	addi	sp,sp,16
    80002020:	00008067          	ret
    80002024:	00008067          	ret

0000000080002028 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80002028:	ff010113          	addi	sp,sp,-16
    8000202c:	00113423          	sd	ra,8(sp)
    80002030:	00813023          	sd	s0,0(sp)
    80002034:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80002038:	fffff097          	auipc	ra,0xfffff
    8000203c:	470080e7          	jalr	1136(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80002040:	00813083          	ld	ra,8(sp)
    80002044:	00013403          	ld	s0,0(sp)
    80002048:	01010113          	addi	sp,sp,16
    8000204c:	00008067          	ret

0000000080002050 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    80002050:	ff010113          	addi	sp,sp,-16
    80002054:	00113423          	sd	ra,8(sp)
    80002058:	00813023          	sd	s0,0(sp)
    8000205c:	01010413          	addi	s0,sp,16
    time_sleep(time);
    80002060:	fffff097          	auipc	ra,0xfffff
    80002064:	578080e7          	jalr	1400(ra) # 800015d8 <_Z10time_sleepm>
}
    80002068:	00000513          	li	a0,0
    8000206c:	00813083          	ld	ra,8(sp)
    80002070:	00013403          	ld	s0,0(sp)
    80002074:	01010113          	addi	sp,sp,16
    80002078:	00008067          	ret

000000008000207c <_ZN6ThreadC1Ev>:
Thread::Thread() {
    8000207c:	ff010113          	addi	sp,sp,-16
    80002080:	00113423          	sd	ra,8(sp)
    80002084:	00813023          	sd	s0,0(sp)
    80002088:	01010413          	addi	s0,sp,16
    8000208c:	00009797          	auipc	a5,0x9
    80002090:	50c78793          	addi	a5,a5,1292 # 8000b598 <_ZTV6Thread+0x10>
    80002094:	00f53023          	sd	a5,0(a0)
    myHandle = nullptr;
    80002098:	00053423          	sd	zero,8(a0)
    thread_create(&myHandle, Thread::threadWrapper, (void*)this);
    8000209c:	00050613          	mv	a2,a0
    800020a0:	00000597          	auipc	a1,0x0
    800020a4:	cdc58593          	addi	a1,a1,-804 # 80001d7c <_ZN6Thread13threadWrapperEPv>
    800020a8:	00850513          	addi	a0,a0,8
    800020ac:	fffff097          	auipc	ra,0xfffff
    800020b0:	358080e7          	jalr	856(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
}
    800020b4:	00813083          	ld	ra,8(sp)
    800020b8:	00013403          	ld	s0,0(sp)
    800020bc:	01010113          	addi	sp,sp,16
    800020c0:	00008067          	ret

00000000800020c4 <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    800020c4:	ff010113          	addi	sp,sp,-16
    800020c8:	00113423          	sd	ra,8(sp)
    800020cc:	00813023          	sd	s0,0(sp)
    800020d0:	01010413          	addi	s0,sp,16
    800020d4:	00009797          	auipc	a5,0x9
    800020d8:	4ec78793          	addi	a5,a5,1260 # 8000b5c0 <_ZTV9Semaphore+0x10>
    800020dc:	00f53023          	sd	a5,0(a0)
    myHandle = nullptr;
    800020e0:	00053423          	sd	zero,8(a0)
    sem_open(&myHandle, init);
    800020e4:	00850513          	addi	a0,a0,8
    800020e8:	fffff097          	auipc	ra,0xfffff
    800020ec:	40c080e7          	jalr	1036(ra) # 800014f4 <_Z8sem_openPP3semj>
}
    800020f0:	00813083          	ld	ra,8(sp)
    800020f4:	00013403          	ld	s0,0(sp)
    800020f8:	01010113          	addi	sp,sp,16
    800020fc:	00008067          	ret

0000000080002100 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    80002100:	ff010113          	addi	sp,sp,-16
    80002104:	00113423          	sd	ra,8(sp)
    80002108:	00813023          	sd	s0,0(sp)
    8000210c:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    80002110:	00853503          	ld	a0,8(a0)
    80002114:	fffff097          	auipc	ra,0xfffff
    80002118:	454080e7          	jalr	1108(ra) # 80001568 <_Z8sem_waitP3sem>
}
    8000211c:	00813083          	ld	ra,8(sp)
    80002120:	00013403          	ld	s0,0(sp)
    80002124:	01010113          	addi	sp,sp,16
    80002128:	00008067          	ret

000000008000212c <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    8000212c:	ff010113          	addi	sp,sp,-16
    80002130:	00113423          	sd	ra,8(sp)
    80002134:	00813023          	sd	s0,0(sp)
    80002138:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    8000213c:	00853503          	ld	a0,8(a0)
    80002140:	fffff097          	auipc	ra,0xfffff
    80002144:	460080e7          	jalr	1120(ra) # 800015a0 <_Z10sem_signalP3sem>
}
    80002148:	00813083          	ld	ra,8(sp)
    8000214c:	00013403          	ld	s0,0(sp)
    80002150:	01010113          	addi	sp,sp,16
    80002154:	00008067          	ret

0000000080002158 <_ZN14PeriodicThread9terminateEv>:
    }

    MemoryAllocator::getInstance().free(ps);
}

void PeriodicThread::terminate() {
    80002158:	ff010113          	addi	sp,sp,-16
    8000215c:	00113423          	sd	ra,8(sp)
    80002160:	00813023          	sd	s0,0(sp)
    80002164:	01010413          	addi	s0,sp,16
    thread_exit();
    80002168:	fffff097          	auipc	ra,0xfffff
    8000216c:	318080e7          	jalr	792(ra) # 80001480 <_Z11thread_exitv>
}
    80002170:	00813083          	ld	ra,8(sp)
    80002174:	00013403          	ld	s0,0(sp)
    80002178:	01010113          	addi	sp,sp,16
    8000217c:	00008067          	ret

0000000080002180 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80002180:	fd010113          	addi	sp,sp,-48
    80002184:	02113423          	sd	ra,40(sp)
    80002188:	02813023          	sd	s0,32(sp)
    8000218c:	00913c23          	sd	s1,24(sp)
    80002190:	01213823          	sd	s2,16(sp)
    80002194:	03010413          	addi	s0,sp,48
    80002198:	00050493          	mv	s1,a0
    8000219c:	00058913          	mv	s2,a1
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	edc080e7          	jalr	-292(ra) # 8000207c <_ZN6ThreadC1Ev>
    800021a8:	00009797          	auipc	a5,0x9
    800021ac:	3c078793          	addi	a5,a5,960 # 8000b568 <_ZTV14PeriodicThread+0x10>
    800021b0:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    800021b4:	0124b823          	sd	s2,16(s1)

    periodic_s* ps = (periodic_s*) MemoryAllocator::getInstance().mallocBytes(sizeof(periodic_s));
    800021b8:	00001097          	auipc	ra,0x1
    800021bc:	a8c080e7          	jalr	-1396(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    800021c0:	01000593          	li	a1,16
    800021c4:	00001097          	auipc	ra,0x1
    800021c8:	c10080e7          	jalr	-1008(ra) # 80002dd4 <_ZN15MemoryAllocator11mallocBytesEm>
    800021cc:	00050613          	mv	a2,a0
    ps->periodic_thread = this;
    800021d0:	00953023          	sd	s1,0(a0)
    ps->period = period;
    800021d4:	01253423          	sd	s2,8(a0)

    Thread(PeriodicThread::wrapper, ps);
    800021d8:	00000597          	auipc	a1,0x0
    800021dc:	bd058593          	addi	a1,a1,-1072 # 80001da8 <_ZN14PeriodicThread7wrapperEPv>
    800021e0:	fd040513          	addi	a0,s0,-48
    800021e4:	00000097          	auipc	ra,0x0
    800021e8:	db8080e7          	jalr	-584(ra) # 80001f9c <_ZN6ThreadC1EPFvPvES0_>
    800021ec:	fd040513          	addi	a0,s0,-48
    800021f0:	00000097          	auipc	ra,0x0
    800021f4:	d08080e7          	jalr	-760(ra) # 80001ef8 <_ZN6ThreadD1Ev>
}
    800021f8:	02813083          	ld	ra,40(sp)
    800021fc:	02013403          	ld	s0,32(sp)
    80002200:	01813483          	ld	s1,24(sp)
    80002204:	01013903          	ld	s2,16(sp)
    80002208:	03010113          	addi	sp,sp,48
    8000220c:	00008067          	ret
    80002210:	00050913          	mv	s2,a0
PeriodicThread::PeriodicThread(time_t period) {
    80002214:	00048513          	mv	a0,s1
    80002218:	00000097          	auipc	ra,0x0
    8000221c:	ce0080e7          	jalr	-800(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80002220:	00090513          	mv	a0,s2
    80002224:	0000a097          	auipc	ra,0xa
    80002228:	754080e7          	jalr	1876(ra) # 8000c978 <_Unwind_Resume>

000000008000222c <_ZN7Console4getcEv>:

char Console::getc() {
    8000222c:	ff010113          	addi	sp,sp,-16
    80002230:	00113423          	sd	ra,8(sp)
    80002234:	00813023          	sd	s0,0(sp)
    80002238:	01010413          	addi	s0,sp,16
    return __getc();
    8000223c:	00006097          	auipc	ra,0x6
    80002240:	50c080e7          	jalr	1292(ra) # 80008748 <__getc>
}
    80002244:	00813083          	ld	ra,8(sp)
    80002248:	00013403          	ld	s0,0(sp)
    8000224c:	01010113          	addi	sp,sp,16
    80002250:	00008067          	ret

0000000080002254 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002254:	ff010113          	addi	sp,sp,-16
    80002258:	00113423          	sd	ra,8(sp)
    8000225c:	00813023          	sd	s0,0(sp)
    80002260:	01010413          	addi	s0,sp,16
    __putc(c);
    80002264:	00006097          	auipc	ra,0x6
    80002268:	4a8080e7          	jalr	1192(ra) # 8000870c <__putc>
}
    8000226c:	00813083          	ld	ra,8(sp)
    80002270:	00013403          	ld	s0,0(sp)
    80002274:	01010113          	addi	sp,sp,16
    80002278:	00008067          	ret

000000008000227c <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);
    static void threadWrapper(void *);
protected:
    Thread ();
    virtual void run () {}
    8000227c:	ff010113          	addi	sp,sp,-16
    80002280:	00813423          	sd	s0,8(sp)
    80002284:	01010413          	addi	s0,sp,16
    80002288:	00813403          	ld	s0,8(sp)
    8000228c:	01010113          	addi	sp,sp,16
    80002290:	00008067          	ret

0000000080002294 <_ZN14PeriodicThread18periodicActivationEv>:
    static void wrapper(void*);
    void terminate ();

protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation() {}
    80002294:	ff010113          	addi	sp,sp,-16
    80002298:	00813423          	sd	s0,8(sp)
    8000229c:	01010413          	addi	s0,sp,16
    800022a0:	00813403          	ld	s0,8(sp)
    800022a4:	01010113          	addi	sp,sp,16
    800022a8:	00008067          	ret

00000000800022ac <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    800022ac:	ff010113          	addi	sp,sp,-16
    800022b0:	00113423          	sd	ra,8(sp)
    800022b4:	00813023          	sd	s0,0(sp)
    800022b8:	01010413          	addi	s0,sp,16
    800022bc:	00009797          	auipc	a5,0x9
    800022c0:	2ac78793          	addi	a5,a5,684 # 8000b568 <_ZTV14PeriodicThread+0x10>
    800022c4:	00f53023          	sd	a5,0(a0)
    800022c8:	00000097          	auipc	ra,0x0
    800022cc:	c30080e7          	jalr	-976(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    800022d0:	00813083          	ld	ra,8(sp)
    800022d4:	00013403          	ld	s0,0(sp)
    800022d8:	01010113          	addi	sp,sp,16
    800022dc:	00008067          	ret

00000000800022e0 <_ZN14PeriodicThreadD0Ev>:
    800022e0:	fe010113          	addi	sp,sp,-32
    800022e4:	00113c23          	sd	ra,24(sp)
    800022e8:	00813823          	sd	s0,16(sp)
    800022ec:	00913423          	sd	s1,8(sp)
    800022f0:	02010413          	addi	s0,sp,32
    800022f4:	00050493          	mv	s1,a0
    800022f8:	00009797          	auipc	a5,0x9
    800022fc:	27078793          	addi	a5,a5,624 # 8000b568 <_ZTV14PeriodicThread+0x10>
    80002300:	00f53023          	sd	a5,0(a0)
    80002304:	00000097          	auipc	ra,0x0
    80002308:	bf4080e7          	jalr	-1036(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    8000230c:	00048513          	mv	a0,s1
    80002310:	00000097          	auipc	ra,0x0
    80002314:	b58080e7          	jalr	-1192(ra) # 80001e68 <_ZdlPv>
    80002318:	01813083          	ld	ra,24(sp)
    8000231c:	01013403          	ld	s0,16(sp)
    80002320:	00813483          	ld	s1,8(sp)
    80002324:	02010113          	addi	sp,sp,32
    80002328:	00008067          	ret

000000008000232c <_Z41__static_initialization_and_destruction_0ii>:
    }
}

void RiscV::handleExternalInterrupt() {
    console_handler();
    8000232c:	00100793          	li	a5,1
    80002330:	00f50463          	beq	a0,a5,80002338 <_Z41__static_initialization_and_destruction_0ii+0xc>
    80002334:	00008067          	ret
    80002338:	000107b7          	lui	a5,0x10
    8000233c:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002340:	fef59ae3          	bne	a1,a5,80002334 <_Z41__static_initialization_and_destruction_0ii+0x8>
    80002344:	ff010113          	addi	sp,sp,-16
    80002348:	00113423          	sd	ra,8(sp)
    8000234c:	00813023          	sd	s0,0(sp)
    80002350:	01010413          	addi	s0,sp,16
SleepingThreadsList RiscV::list_of_sleeping_threads;
    80002354:	00009517          	auipc	a0,0x9
    80002358:	4cc50513          	addi	a0,a0,1228 # 8000b820 <_ZN5RiscV24list_of_sleeping_threadsE>
    8000235c:	fffff097          	auipc	ra,0xfffff
    80002360:	51c080e7          	jalr	1308(ra) # 80001878 <_ZN19SleepingThreadsListC1Ev>
    80002364:	00813083          	ld	ra,8(sp)
    80002368:	00013403          	ld	s0,0(sp)
    8000236c:	01010113          	addi	sp,sp,16
    80002370:	00008067          	ret

0000000080002374 <_ZN5RiscV10popSppSpieEv>:
void RiscV::popSppSpie() {
    80002374:	ff010113          	addi	sp,sp,-16
    80002378:	00813423          	sd	s0,8(sp)
    8000237c:	01010413          	addi	s0,sp,16
    if(TCB::running->get_user_mode()){
    80002380:	00009797          	auipc	a5,0x9
    80002384:	4207b783          	ld	a5,1056(a5) # 8000b7a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002388:	0007b783          	ld	a5,0(a5)
    bool get_user_mode () const { return user_mode; }
    8000238c:	0387c783          	lbu	a5,56(a5)
    80002390:	02078063          	beqz	a5,800023b0 <_ZN5RiscV10popSppSpieEv+0x3c>
    80002394:	10000793          	li	a5,256
    80002398:	1007b073          	csrc	sstatus,a5
    __asm__ volatile ("csrw sepc, ra");
    8000239c:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    800023a0:	10200073          	sret
}
    800023a4:	00813403          	ld	s0,8(sp)
    800023a8:	01010113          	addi	sp,sp,16
    800023ac:	00008067          	ret
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    800023b0:	10000793          	li	a5,256
    800023b4:	1007a073          	csrs	sstatus,a5
}
    800023b8:	fe5ff06f          	j	8000239c <_ZN5RiscV10popSppSpieEv+0x28>

00000000800023bc <_ZN5RiscV20handleEcallInterruptEv>:
void RiscV::handleEcallInterrupt() {
    800023bc:	fa010113          	addi	sp,sp,-96
    800023c0:	04113c23          	sd	ra,88(sp)
    800023c4:	04813823          	sd	s0,80(sp)
    800023c8:	04913423          	sd	s1,72(sp)
    800023cc:	05213023          	sd	s2,64(sp)
    800023d0:	06010413          	addi	s0,sp,96
    return a0;
}

inline uint64 RiscV::r_scause() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    800023d4:	142027f3          	csrr	a5,scause
    800023d8:	faf43c23          	sd	a5,-72(s0)

    return scause;
    800023dc:	fb843783          	ld	a5,-72(s0)
    uint64 volatile scause = r_scause();
    800023e0:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800023e4:	141027f3          	csrr	a5,sepc
    800023e8:	faf43823          	sd	a5,-80(s0)
    return sepc;
    800023ec:	fb043783          	ld	a5,-80(s0)
    uint64 volatile sepc = RiscV::r_sepc() + 4;
    800023f0:	00478793          	addi	a5,a5,4
    800023f4:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    800023f8:	100027f3          	csrr	a5,sstatus
    800023fc:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    80002400:	fa843783          	ld	a5,-88(s0)
    uint64 volatile sstatus = RiscV::r_sstatus();
    80002404:	fcf43423          	sd	a5,-56(s0)
    if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){
    80002408:	fd843703          	ld	a4,-40(s0)
    8000240c:	00800793          	li	a5,8
    80002410:	00f70863          	beq	a4,a5,80002420 <_ZN5RiscV20handleEcallInterruptEv+0x64>
    80002414:	fd843703          	ld	a4,-40(s0)
    80002418:	00900793          	li	a5,9
    8000241c:	0cf71263          	bne	a4,a5,800024e0 <_ZN5RiscV20handleEcallInterruptEv+0x124>
    __asm__ volatile ("ld %0, 10*8(fp)" : "=r"(a0));
    80002420:	05043783          	ld	a5,80(s0)
    80002424:	fcf43023          	sd	a5,-64(s0)
    return a0;
    80002428:	fc043783          	ld	a5,-64(s0)
        uint64 volatile a0 = RiscV::r_a0();
    8000242c:	faf43023          	sd	a5,-96(s0)
        if(a0 == MEM_ALLOC){
    80002430:	fa043703          	ld	a4,-96(s0)
    80002434:	00100793          	li	a5,1
    80002438:	0cf70663          	beq	a4,a5,80002504 <_ZN5RiscV20handleEcallInterruptEv+0x148>
        }else if(a0 == MEM_FREE){
    8000243c:	fa043703          	ld	a4,-96(s0)
    80002440:	00200793          	li	a5,2
    80002444:	10f70463          	beq	a4,a5,8000254c <_ZN5RiscV20handleEcallInterruptEv+0x190>
        }else if(a0 == THREAD_CREATE){
    80002448:	fa043703          	ld	a4,-96(s0)
    8000244c:	01100793          	li	a5,17
    80002450:	12f70063          	beq	a4,a5,80002570 <_ZN5RiscV20handleEcallInterruptEv+0x1b4>
        }else if(a0 == THREAD_EXIT){
    80002454:	fa043703          	ld	a4,-96(s0)
    80002458:	01200793          	li	a5,18
    8000245c:	14f70463          	beq	a4,a5,800025a4 <_ZN5RiscV20handleEcallInterruptEv+0x1e8>
        }else if(a0 == THREAD_DISPATCH){
    80002460:	fa043703          	ld	a4,-96(s0)
    80002464:	01300793          	li	a5,19
    80002468:	16f70863          	beq	a4,a5,800025d8 <_ZN5RiscV20handleEcallInterruptEv+0x21c>
        }else if(a0 == THREAD_JOIN){
    8000246c:	fa043703          	ld	a4,-96(s0)
    80002470:	01400793          	li	a5,20
    80002474:	16f70e63          	beq	a4,a5,800025f0 <_ZN5RiscV20handleEcallInterruptEv+0x234>
        }else if(a0 == SEM_OPEN){
    80002478:	fa043703          	ld	a4,-96(s0)
    8000247c:	02100793          	li	a5,33
    80002480:	18f70063          	beq	a4,a5,80002600 <_ZN5RiscV20handleEcallInterruptEv+0x244>
        }else if(a0 == SEM_CLOSE){
    80002484:	fa043703          	ld	a4,-96(s0)
    80002488:	02200793          	li	a5,34
    8000248c:	1af70263          	beq	a4,a5,80002630 <_ZN5RiscV20handleEcallInterruptEv+0x274>
        }else if(a0 == SEM_WAIT){
    80002490:	fa043703          	ld	a4,-96(s0)
    80002494:	02300793          	li	a5,35
    80002498:	1af70863          	beq	a4,a5,80002648 <_ZN5RiscV20handleEcallInterruptEv+0x28c>
        }else if(a0 == SEM_SIGNAL){
    8000249c:	fa043703          	ld	a4,-96(s0)
    800024a0:	02400793          	li	a5,36
    800024a4:	1af70e63          	beq	a4,a5,80002660 <_ZN5RiscV20handleEcallInterruptEv+0x2a4>
        }else if(a0 == TIME_SLEEP){
    800024a8:	fa043703          	ld	a4,-96(s0)
    800024ac:	03100793          	li	a5,49
    800024b0:	1cf70463          	beq	a4,a5,80002678 <_ZN5RiscV20handleEcallInterruptEv+0x2bc>
        }else if(a0 == GETC){
    800024b4:	fa043703          	ld	a4,-96(s0)
    800024b8:	04100793          	li	a5,65
    800024bc:	1ef70c63          	beq	a4,a5,800026b4 <_ZN5RiscV20handleEcallInterruptEv+0x2f8>
        }else if(a0 == PUTC){
    800024c0:	fa043703          	ld	a4,-96(s0)
    800024c4:	04200793          	li	a5,66
    800024c8:	04f71e63          	bne	a4,a5,80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(c));
    800024cc:	05843503          	ld	a0,88(s0)
            __putc(c);
    800024d0:	0ff57513          	andi	a0,a0,255
    800024d4:	00006097          	auipc	ra,0x6
    800024d8:	238080e7          	jalr	568(ra) # 8000870c <__putc>
    800024dc:	0480006f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
        __putc(scause + '0');
    800024e0:	fd843503          	ld	a0,-40(s0)
    800024e4:	0305051b          	addiw	a0,a0,48
    800024e8:	0ff57513          	andi	a0,a0,255
    800024ec:	00006097          	auipc	ra,0x6
    800024f0:	220080e7          	jalr	544(ra) # 8000870c <__putc>
        __putc('\n');
    800024f4:	00a00513          	li	a0,10
    800024f8:	00006097          	auipc	ra,0x6
    800024fc:	214080e7          	jalr	532(ra) # 8000870c <__putc>
        while(true);
    80002500:	0000006f          	j	80002500 <_ZN5RiscV20handleEcallInterruptEv+0x144>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(num_of_blocks));
    80002504:	05843903          	ld	s2,88(s0)
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(ret));
    80002508:	06043483          	ld	s1,96(s0)
            *ret = (uint64) MemoryAllocator::getInstance().mallocBytes(num_of_blocks * MEM_BLOCK_SIZE);
    8000250c:	00000097          	auipc	ra,0x0
    80002510:	738080e7          	jalr	1848(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    80002514:	00691593          	slli	a1,s2,0x6
    80002518:	00001097          	auipc	ra,0x1
    8000251c:	8bc080e7          	jalr	-1860(ra) # 80002dd4 <_ZN15MemoryAllocator11mallocBytesEm>
    80002520:	00a4b023          	sd	a0,0(s1)
        w_sepc(sepc);
    80002524:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002528:	14179073          	csrw	sepc,a5
        w_sstatus(sstatus);
    8000252c:	fc843783          	ld	a5,-56(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002530:	10079073          	csrw	sstatus,a5
}
    80002534:	05813083          	ld	ra,88(sp)
    80002538:	05013403          	ld	s0,80(sp)
    8000253c:	04813483          	ld	s1,72(sp)
    80002540:	04013903          	ld	s2,64(sp)
    80002544:	06010113          	addi	sp,sp,96
    80002548:	00008067          	ret
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(ptr));
    8000254c:	05843903          	ld	s2,88(s0)
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(ret));
    80002550:	06043483          	ld	s1,96(s0)
            *ret = MemoryAllocator::getInstance().free(ptr);
    80002554:	00000097          	auipc	ra,0x0
    80002558:	6f0080e7          	jalr	1776(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    8000255c:	00090593          	mv	a1,s2
    80002560:	00001097          	auipc	ra,0x1
    80002564:	8a4080e7          	jalr	-1884(ra) # 80002e04 <_ZN15MemoryAllocator4freeEPv>
    80002568:	00a4b023          	sd	a0,0(s1)
    8000256c:	fb9ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(handle));
    80002570:	05843503          	ld	a0,88(s0)
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(start_routine));
    80002574:	06043583          	ld	a1,96(s0)
            __asm__ volatile ("ld %0, 13*8(fp)" : "=r"(args));
    80002578:	06843603          	ld	a2,104(s0)
            __asm__ volatile ("ld %0, 14*8(fp)" : "=r"(stack));
    8000257c:	07043683          	ld	a3,112(s0)
            __asm__ volatile ("ld %0, 15*8(fp)" : "=r"(ret));
    80002580:	07843483          	ld	s1,120(s0)
            *ret = TCB::create_thread(handle, start_routine, args, stack) != nullptr ? 0 : -1;
    80002584:	fffff097          	auipc	ra,0xfffff
    80002588:	5d0080e7          	jalr	1488(ra) # 80001b54 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm>
    8000258c:	00050863          	beqz	a0,8000259c <_ZN5RiscV20handleEcallInterruptEv+0x1e0>
    80002590:	00000793          	li	a5,0
    80002594:	00f4a023          	sw	a5,0(s1)
    80002598:	f8dff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
    8000259c:	fff00793          	li	a5,-1
    800025a0:	ff5ff06f          	j	80002594 <_ZN5RiscV20handleEcallInterruptEv+0x1d8>
            TCB::running->set_finished(true);
    800025a4:	00009797          	auipc	a5,0x9
    800025a8:	1fc7b783          	ld	a5,508(a5) # 8000b7a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800025ac:	0007b483          	ld	s1,0(a5)
    void set_finished(bool f) { this->finished = f; }
    800025b0:	00100793          	li	a5,1
    800025b4:	02f48a23          	sb	a5,52(s1)
            TCB::dispatch();
    800025b8:	fffff097          	auipc	ra,0xfffff
    800025bc:	6ec080e7          	jalr	1772(ra) # 80001ca4 <_ZN3TCB8dispatchEv>
            MemoryAllocator::getInstance().free(temp);
    800025c0:	00000097          	auipc	ra,0x0
    800025c4:	684080e7          	jalr	1668(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    800025c8:	00048593          	mv	a1,s1
    800025cc:	00001097          	auipc	ra,0x1
    800025d0:	838080e7          	jalr	-1992(ra) # 80002e04 <_ZN15MemoryAllocator4freeEPv>
    800025d4:	f51ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
            TCB::time_slice_counter = 0;
    800025d8:	00009797          	auipc	a5,0x9
    800025dc:	1b87b783          	ld	a5,440(a5) # 8000b790 <_GLOBAL_OFFSET_TABLE_+0x18>
    800025e0:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    800025e4:	fffff097          	auipc	ra,0xfffff
    800025e8:	6c0080e7          	jalr	1728(ra) # 80001ca4 <_ZN3TCB8dispatchEv>
    800025ec:	f39ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(handle));
    800025f0:	05843503          	ld	a0,88(s0)
            TCB::join(handle);
    800025f4:	fffff097          	auipc	ra,0xfffff
    800025f8:	730080e7          	jalr	1840(ra) # 80001d24 <_ZN3TCB4joinEPS_>
    800025fc:	f29ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(handle));
    80002600:	05843503          	ld	a0,88(s0)
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(val));
    80002604:	06043583          	ld	a1,96(s0)
    80002608:	0005859b          	sext.w	a1,a1
            __asm__ volatile ("ld %0, 13*8(fp)" : "=r"(ret));
    8000260c:	06843483          	ld	s1,104(s0)
            if(sem::create_semaphore(handle, val)){
    80002610:	00000097          	auipc	ra,0x0
    80002614:	208080e7          	jalr	520(ra) # 80002818 <_ZN3sem16create_semaphoreEPPS_i>
    80002618:	00050663          	beqz	a0,80002624 <_ZN5RiscV20handleEcallInterruptEv+0x268>
                *ret = 0;
    8000261c:	0004a023          	sw	zero,0(s1)
    80002620:	f05ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
                *ret = -1;
    80002624:	fff00793          	li	a5,-1
    80002628:	00f4a023          	sw	a5,0(s1)
    8000262c:	ef9ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(handle));
    80002630:	05843503          	ld	a0,88(s0)
            __asm__ volatile("ld %0, 12*8(fp)" : "=r"(ret));
    80002634:	06043483          	ld	s1,96(s0)
            *ret = handle->close();
    80002638:	00000097          	auipc	ra,0x0
    8000263c:	42c080e7          	jalr	1068(ra) # 80002a64 <_ZN3sem5closeEv>
    80002640:	00a4a023          	sw	a0,0(s1)
    80002644:	ee1ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(handle));
    80002648:	05843503          	ld	a0,88(s0)
            __asm__ volatile("ld %0, 12*8(fp)" : "=r"(ret));
    8000264c:	06043483          	ld	s1,96(s0)
            *ret = handle->wait();
    80002650:	00000097          	auipc	ra,0x0
    80002654:	2b4080e7          	jalr	692(ra) # 80002904 <_ZN3sem4waitEv>
    80002658:	00a4a023          	sw	a0,0(s1)
    8000265c:	ec9ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(handle));
    80002660:	05843503          	ld	a0,88(s0)
            __asm__ volatile("ld %0, 12*8(fp)" : "=r"(ret));
    80002664:	06043483          	ld	s1,96(s0)
            *ret = handle->signal();
    80002668:	00000097          	auipc	ra,0x0
    8000266c:	38c080e7          	jalr	908(ra) # 800029f4 <_ZN3sem6signalEv>
    80002670:	00a4a023          	sw	a0,0(s1)
    80002674:	eb1ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(slice));
    80002678:	05843603          	ld	a2,88(s0)
            if(slice > 0){
    8000267c:	00061863          	bnez	a2,8000268c <_ZN5RiscV20handleEcallInterruptEv+0x2d0>
            TCB::dispatch();
    80002680:	fffff097          	auipc	ra,0xfffff
    80002684:	624080e7          	jalr	1572(ra) # 80001ca4 <_ZN3TCB8dispatchEv>
    80002688:	e9dff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>
                TCB::running->set_sleeping(true);
    8000268c:	00009797          	auipc	a5,0x9
    80002690:	1147b783          	ld	a5,276(a5) # 8000b7a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002694:	0007b583          	ld	a1,0(a5)
    void set_sleeping(bool s) { this->sleeping = s; }
    80002698:	00100793          	li	a5,1
    8000269c:	02f58b23          	sb	a5,54(a1)
                RiscV::list_of_sleeping_threads.put(TCB::running, slice);
    800026a0:	00009517          	auipc	a0,0x9
    800026a4:	18050513          	addi	a0,a0,384 # 8000b820 <_ZN5RiscV24list_of_sleeping_threadsE>
    800026a8:	fffff097          	auipc	ra,0xfffff
    800026ac:	2cc080e7          	jalr	716(ra) # 80001974 <_ZN19SleepingThreadsList3putEP3TCBm>
    800026b0:	fd1ff06f          	j	80002680 <_ZN5RiscV20handleEcallInterruptEv+0x2c4>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(ret));
    800026b4:	05843483          	ld	s1,88(s0)
            *ret = __getc();
    800026b8:	00006097          	auipc	ra,0x6
    800026bc:	090080e7          	jalr	144(ra) # 80008748 <__getc>
    800026c0:	00a48023          	sb	a0,0(s1)
    800026c4:	e61ff06f          	j	80002524 <_ZN5RiscV20handleEcallInterruptEv+0x168>

00000000800026c8 <_ZN5RiscV20handleTimerInterruptEv>:
void RiscV::handleTimerInterrupt() {
    800026c8:	fb010113          	addi	sp,sp,-80
    800026cc:	04113423          	sd	ra,72(sp)
    800026d0:	04813023          	sd	s0,64(sp)
    800026d4:	02913c23          	sd	s1,56(sp)
    800026d8:	05010413          	addi	s0,sp,80
    time_t volatile curr = RiscV::list_of_sleeping_threads.peek_time_first();
    800026dc:	00009517          	auipc	a0,0x9
    800026e0:	14450513          	addi	a0,a0,324 # 8000b820 <_ZN5RiscV24list_of_sleeping_threadsE>
    800026e4:	fffff097          	auipc	ra,0xfffff
    800026e8:	1e0080e7          	jalr	480(ra) # 800018c4 <_ZN19SleepingThreadsList15peek_time_firstEv>
    800026ec:	fca43c23          	sd	a0,-40(s0)
    if(curr != -1UL){
    800026f0:	fd843703          	ld	a4,-40(s0)
    800026f4:	fff00793          	li	a5,-1
    800026f8:	04f71463          	bne	a4,a5,80002740 <_ZN5RiscV20handleTimerInterruptEv+0x78>
}

inline void RiscV::mc_sip(uint64 mask) {
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    800026fc:	00200793          	li	a5,2
    80002700:	1447b073          	csrc	sip,a5
    TCB::time_slice_counter++;
    80002704:	00009717          	auipc	a4,0x9
    80002708:	08c73703          	ld	a4,140(a4) # 8000b790 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000270c:	00073783          	ld	a5,0(a4)
    80002710:	00178793          	addi	a5,a5,1
    80002714:	00f73023          	sd	a5,0(a4)
    if(TCB::time_slice_counter >= TCB::running->get_time_slice()){
    80002718:	00009717          	auipc	a4,0x9
    8000271c:	08873703          	ld	a4,136(a4) # 8000b7a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002720:	00073703          	ld	a4,0(a4)
    uint64 get_time_slice() const { return time_slice; }
    80002724:	02873703          	ld	a4,40(a4)
    80002728:	04e7f663          	bgeu	a5,a4,80002774 <_ZN5RiscV20handleTimerInterruptEv+0xac>
}
    8000272c:	04813083          	ld	ra,72(sp)
    80002730:	04013403          	ld	s0,64(sp)
    80002734:	03813483          	ld	s1,56(sp)
    80002738:	05010113          	addi	sp,sp,80
    8000273c:	00008067          	ret
        RiscV::list_of_sleeping_threads.dec_time_first();
    80002740:	00009497          	auipc	s1,0x9
    80002744:	0e048493          	addi	s1,s1,224 # 8000b820 <_ZN5RiscV24list_of_sleeping_threadsE>
    80002748:	00048513          	mv	a0,s1
    8000274c:	fffff097          	auipc	ra,0xfffff
    80002750:	14c080e7          	jalr	332(ra) # 80001898 <_ZN19SleepingThreadsList14dec_time_firstEv>
        if(RiscV::list_of_sleeping_threads.peek_time_first() <= 0){
    80002754:	00048513          	mv	a0,s1
    80002758:	fffff097          	auipc	ra,0xfffff
    8000275c:	16c080e7          	jalr	364(ra) # 800018c4 <_ZN19SleepingThreadsList15peek_time_firstEv>
    80002760:	f8051ee3          	bnez	a0,800026fc <_ZN5RiscV20handleTimerInterruptEv+0x34>
            RiscV::list_of_sleeping_threads.remove_finished();
    80002764:	00048513          	mv	a0,s1
    80002768:	fffff097          	auipc	ra,0xfffff
    8000276c:	188080e7          	jalr	392(ra) # 800018f0 <_ZN19SleepingThreadsList15remove_finishedEv>
    80002770:	f8dff06f          	j	800026fc <_ZN5RiscV20handleTimerInterruptEv+0x34>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002774:	141027f3          	csrr	a5,sepc
    80002778:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    8000277c:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sepc = RiscV::r_sepc();
    80002780:	faf43c23          	sd	a5,-72(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002784:	100027f3          	csrr	a5,sstatus
    80002788:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    8000278c:	fc843783          	ld	a5,-56(s0)
        uint64 volatile sstatus = RiscV::r_sstatus();
    80002790:	fcf43023          	sd	a5,-64(s0)
        TCB::time_slice_counter = 0;
    80002794:	00009797          	auipc	a5,0x9
    80002798:	ffc7b783          	ld	a5,-4(a5) # 8000b790 <_GLOBAL_OFFSET_TABLE_+0x18>
    8000279c:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    800027a0:	fffff097          	auipc	ra,0xfffff
    800027a4:	504080e7          	jalr	1284(ra) # 80001ca4 <_ZN3TCB8dispatchEv>
        w_sepc(sepc);
    800027a8:	fb843783          	ld	a5,-72(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800027ac:	14179073          	csrw	sepc,a5
        w_sstatus(sstatus);
    800027b0:	fc043783          	ld	a5,-64(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800027b4:	10079073          	csrw	sstatus,a5
}
    800027b8:	f75ff06f          	j	8000272c <_ZN5RiscV20handleTimerInterruptEv+0x64>

00000000800027bc <_ZN5RiscV23handleExternalInterruptEv>:
void RiscV::handleExternalInterrupt() {
    800027bc:	ff010113          	addi	sp,sp,-16
    800027c0:	00113423          	sd	ra,8(sp)
    800027c4:	00813023          	sd	s0,0(sp)
    800027c8:	01010413          	addi	s0,sp,16
    console_handler();
    800027cc:	00006097          	auipc	ra,0x6
    800027d0:	fb4080e7          	jalr	-76(ra) # 80008780 <console_handler>
    800027d4:	00813083          	ld	ra,8(sp)
    800027d8:	00013403          	ld	s0,0(sp)
    800027dc:	01010113          	addi	sp,sp,16
    800027e0:	00008067          	ret

00000000800027e4 <_GLOBAL__sub_I__ZN5RiscV9user_modeE>:
    800027e4:	ff010113          	addi	sp,sp,-16
    800027e8:	00113423          	sd	ra,8(sp)
    800027ec:	00813023          	sd	s0,0(sp)
    800027f0:	01010413          	addi	s0,sp,16
    800027f4:	000105b7          	lui	a1,0x10
    800027f8:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    800027fc:	00100513          	li	a0,1
    80002800:	00000097          	auipc	ra,0x0
    80002804:	b2c080e7          	jalr	-1236(ra) # 8000232c <_Z41__static_initialization_and_destruction_0ii>
    80002808:	00813083          	ld	ra,8(sp)
    8000280c:	00013403          	ld	s0,0(sp)
    80002810:	01010113          	addi	sp,sp,16
    80002814:	00008067          	ret

0000000080002818 <_ZN3sem16create_semaphoreEPPS_i>:
#include "../h/sem.hpp"

sem* sem::create_semaphore(sem** handle, int val) {
    80002818:	fe010113          	addi	sp,sp,-32
    8000281c:	00113c23          	sd	ra,24(sp)
    80002820:	00813823          	sd	s0,16(sp)
    80002824:	00913423          	sd	s1,8(sp)
    80002828:	01213023          	sd	s2,0(sp)
    8000282c:	02010413          	addi	s0,sp,32
    80002830:	00050913          	mv	s2,a0
    80002834:	00058493          	mv	s1,a1
    sem* temp = new sem(val+1);
    80002838:	01800513          	li	a0,24
    8000283c:	fffff097          	auipc	ra,0xfffff
    80002840:	5dc080e7          	jalr	1500(ra) # 80001e18 <_Znwm>
    80002844:	0014849b          	addiw	s1,s1,1

    TCB* peek_first();
    void add_last(TCB* tcb);
    TCB* remove_first();
public:
    explicit sem(int val) : closed(false), val(val), num_of_blocked_threads(0), head(nullptr) {}
    80002848:	00050023          	sb	zero,0(a0)
    8000284c:	00952223          	sw	s1,4(a0)
    80002850:	00052423          	sw	zero,8(a0)
    80002854:	00053823          	sd	zero,16(a0)
    *handle = temp;
    80002858:	00a93023          	sd	a0,0(s2)

    return temp;
}
    8000285c:	01813083          	ld	ra,24(sp)
    80002860:	01013403          	ld	s0,16(sp)
    80002864:	00813483          	ld	s1,8(sp)
    80002868:	00013903          	ld	s2,0(sp)
    8000286c:	02010113          	addi	sp,sp,32
    80002870:	00008067          	ret

0000000080002874 <_ZN3sem10peek_firstEv>:
    }

    return 0;
}

TCB* sem::peek_first() {
    80002874:	ff010113          	addi	sp,sp,-16
    80002878:	00813423          	sd	s0,8(sp)
    8000287c:	01010413          	addi	s0,sp,16
    return head ? head->tcb : nullptr;
    80002880:	01053503          	ld	a0,16(a0)
    80002884:	00050463          	beqz	a0,8000288c <_ZN3sem10peek_firstEv+0x18>
    80002888:	00053503          	ld	a0,0(a0)
}
    8000288c:	00813403          	ld	s0,8(sp)
    80002890:	01010113          	addi	sp,sp,16
    80002894:	00008067          	ret

0000000080002898 <_ZN3sem8add_lastEP3TCB>:

void sem::add_last(TCB* tcb) {
    80002898:	fe010113          	addi	sp,sp,-32
    8000289c:	00113c23          	sd	ra,24(sp)
    800028a0:	00813823          	sd	s0,16(sp)
    800028a4:	00913423          	sd	s1,8(sp)
    800028a8:	01213023          	sd	s2,0(sp)
    800028ac:	02010413          	addi	s0,sp,32
    800028b0:	00050493          	mv	s1,a0
    800028b4:	00058913          	mv	s2,a1
    Node* new_node = new Node;
    800028b8:	01000513          	li	a0,16
    800028bc:	fffff097          	auipc	ra,0xfffff
    800028c0:	55c080e7          	jalr	1372(ra) # 80001e18 <_Znwm>
    new_node->tcb = tcb;
    800028c4:	01253023          	sd	s2,0(a0)
    new_node->next = nullptr;
    800028c8:	00053423          	sd	zero,8(a0)

    if(!head){
    800028cc:	0104b783          	ld	a5,16(s1)
    800028d0:	02078663          	beqz	a5,800028fc <_ZN3sem8add_lastEP3TCB+0x64>
        head = new_node;
        return;
    }

    Node* current = head;
    while(current->next != nullptr) current = current->next;
    800028d4:	00078713          	mv	a4,a5
    800028d8:	0087b783          	ld	a5,8(a5)
    800028dc:	fe079ce3          	bnez	a5,800028d4 <_ZN3sem8add_lastEP3TCB+0x3c>

    current->next = new_node;
    800028e0:	00a73423          	sd	a0,8(a4)
}
    800028e4:	01813083          	ld	ra,24(sp)
    800028e8:	01013403          	ld	s0,16(sp)
    800028ec:	00813483          	ld	s1,8(sp)
    800028f0:	00013903          	ld	s2,0(sp)
    800028f4:	02010113          	addi	sp,sp,32
    800028f8:	00008067          	ret
        head = new_node;
    800028fc:	00a4b823          	sd	a0,16(s1)
        return;
    80002900:	fe5ff06f          	j	800028e4 <_ZN3sem8add_lastEP3TCB+0x4c>

0000000080002904 <_ZN3sem4waitEv>:
int sem::wait() {
    80002904:	fe010113          	addi	sp,sp,-32
    80002908:	00113c23          	sd	ra,24(sp)
    8000290c:	00813823          	sd	s0,16(sp)
    80002910:	00913423          	sd	s1,8(sp)
    80002914:	02010413          	addi	s0,sp,32
    80002918:	00050493          	mv	s1,a0
    val--;
    8000291c:	00452783          	lw	a5,4(a0)
    80002920:	fff7879b          	addiw	a5,a5,-1
    80002924:	00f52223          	sw	a5,4(a0)
    if(val < 0){
    80002928:	02079713          	slli	a4,a5,0x20
    8000292c:	02074463          	bltz	a4,80002954 <_ZN3sem4waitEv+0x50>
    if(!closed){
    80002930:	0004c783          	lbu	a5,0(s1)
    80002934:	06078263          	beqz	a5,80002998 <_ZN3sem4waitEv+0x94>
        if(num_of_blocked_threads == 0){
    80002938:	0084a503          	lw	a0,8(s1)
    8000293c:	04051663          	bnez	a0,80002988 <_ZN3sem4waitEv+0x84>
}
    80002940:	01813083          	ld	ra,24(sp)
    80002944:	01013403          	ld	s0,16(sp)
    80002948:	00813483          	ld	s1,8(sp)
    8000294c:	02010113          	addi	sp,sp,32
    80002950:	00008067          	ret
        num_of_blocked_threads++;
    80002954:	00852783          	lw	a5,8(a0)
    80002958:	0017879b          	addiw	a5,a5,1
    8000295c:	00f52423          	sw	a5,8(a0)
        TCB::running->set_blocked(true);
    80002960:	00009797          	auipc	a5,0x9
    80002964:	e407b783          	ld	a5,-448(a5) # 8000b7a0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80002968:	0007b583          	ld	a1,0(a5)
    void set_blocked(bool b) { this->blocked = b; }
    8000296c:	00100793          	li	a5,1
    80002970:	02f58aa3          	sb	a5,53(a1)
        add_last(TCB::running);
    80002974:	00000097          	auipc	ra,0x0
    80002978:	f24080e7          	jalr	-220(ra) # 80002898 <_ZN3sem8add_lastEP3TCB>
        thread_dispatch();
    8000297c:	fffff097          	auipc	ra,0xfffff
    80002980:	b2c080e7          	jalr	-1236(ra) # 800014a8 <_Z15thread_dispatchv>
    80002984:	fadff06f          	j	80002930 <_ZN3sem4waitEv+0x2c>
            num_of_blocked_threads--;
    80002988:	fff5051b          	addiw	a0,a0,-1
    8000298c:	00a4a423          	sw	a0,8(s1)
            return -1;
    80002990:	fff00513          	li	a0,-1
    80002994:	fadff06f          	j	80002940 <_ZN3sem4waitEv+0x3c>
        return 0;
    80002998:	00000513          	li	a0,0
    8000299c:	fa5ff06f          	j	80002940 <_ZN3sem4waitEv+0x3c>

00000000800029a0 <_ZN3sem12remove_firstEv>:

TCB* sem::remove_first() {
    800029a0:	fe010113          	addi	sp,sp,-32
    800029a4:	00113c23          	sd	ra,24(sp)
    800029a8:	00813823          	sd	s0,16(sp)
    800029ac:	00913423          	sd	s1,8(sp)
    800029b0:	02010413          	addi	s0,sp,32
    800029b4:	00050793          	mv	a5,a0
    if(!head) return nullptr;
    800029b8:	01053503          	ld	a0,16(a0)
    800029bc:	02050863          	beqz	a0,800029ec <_ZN3sem12remove_firstEv+0x4c>

    Node* temp = head;
    TCB* tcb = temp->tcb;
    800029c0:	00053483          	ld	s1,0(a0)
    head = head->next;
    800029c4:	00853703          	ld	a4,8(a0)
    800029c8:	00e7b823          	sd	a4,16(a5)
    delete temp;
    800029cc:	fffff097          	auipc	ra,0xfffff
    800029d0:	49c080e7          	jalr	1180(ra) # 80001e68 <_ZdlPv>

    return tcb;
}
    800029d4:	00048513          	mv	a0,s1
    800029d8:	01813083          	ld	ra,24(sp)
    800029dc:	01013403          	ld	s0,16(sp)
    800029e0:	00813483          	ld	s1,8(sp)
    800029e4:	02010113          	addi	sp,sp,32
    800029e8:	00008067          	ret
    if(!head) return nullptr;
    800029ec:	00050493          	mv	s1,a0
    800029f0:	fe5ff06f          	j	800029d4 <_ZN3sem12remove_firstEv+0x34>

00000000800029f4 <_ZN3sem6signalEv>:
    if(closed) return -1;
    800029f4:	00054783          	lbu	a5,0(a0)
    800029f8:	06079263          	bnez	a5,80002a5c <_ZN3sem6signalEv+0x68>
    val++;
    800029fc:	00452783          	lw	a5,4(a0)
    80002a00:	0017879b          	addiw	a5,a5,1
    80002a04:	0007871b          	sext.w	a4,a5
    80002a08:	00f52223          	sw	a5,4(a0)
    if(val <= 0){
    80002a0c:	00e05663          	blez	a4,80002a18 <_ZN3sem6signalEv+0x24>
    return 0;
    80002a10:	00000513          	li	a0,0
}
    80002a14:	00008067          	ret
int sem::signal() {
    80002a18:	ff010113          	addi	sp,sp,-16
    80002a1c:	00113423          	sd	ra,8(sp)
    80002a20:	00813023          	sd	s0,0(sp)
    80002a24:	01010413          	addi	s0,sp,16
        num_of_blocked_threads--;
    80002a28:	00852783          	lw	a5,8(a0)
    80002a2c:	fff7879b          	addiw	a5,a5,-1
    80002a30:	00f52423          	sw	a5,8(a0)
        TCB* tcb = remove_first();
    80002a34:	00000097          	auipc	ra,0x0
    80002a38:	f6c080e7          	jalr	-148(ra) # 800029a0 <_ZN3sem12remove_firstEv>
    80002a3c:	02050aa3          	sb	zero,53(a0)
        Scheduler::put(tcb);
    80002a40:	00000097          	auipc	ra,0x0
    80002a44:	104080e7          	jalr	260(ra) # 80002b44 <_ZN9Scheduler3putEP3TCB>
    return 0;
    80002a48:	00000513          	li	a0,0
}
    80002a4c:	00813083          	ld	ra,8(sp)
    80002a50:	00013403          	ld	s0,0(sp)
    80002a54:	01010113          	addi	sp,sp,16
    80002a58:	00008067          	ret
    if(closed) return -1;
    80002a5c:	fff00513          	li	a0,-1
    80002a60:	00008067          	ret

0000000080002a64 <_ZN3sem5closeEv>:
int sem::close(){
    80002a64:	fe010113          	addi	sp,sp,-32
    80002a68:	00113c23          	sd	ra,24(sp)
    80002a6c:	00813823          	sd	s0,16(sp)
    80002a70:	00913423          	sd	s1,8(sp)
    80002a74:	02010413          	addi	s0,sp,32
    80002a78:	00050493          	mv	s1,a0
    closed = true;
    80002a7c:	00100793          	li	a5,1
    80002a80:	00f50023          	sb	a5,0(a0)
    while(peek_first()){
    80002a84:	00048513          	mv	a0,s1
    80002a88:	00000097          	auipc	ra,0x0
    80002a8c:	dec080e7          	jalr	-532(ra) # 80002874 <_ZN3sem10peek_firstEv>
    80002a90:	02050063          	beqz	a0,80002ab0 <_ZN3sem5closeEv+0x4c>
        TCB* tcb = remove_first();
    80002a94:	00048513          	mv	a0,s1
    80002a98:	00000097          	auipc	ra,0x0
    80002a9c:	f08080e7          	jalr	-248(ra) # 800029a0 <_ZN3sem12remove_firstEv>
    80002aa0:	02050aa3          	sb	zero,53(a0)
        Scheduler::put(tcb);
    80002aa4:	00000097          	auipc	ra,0x0
    80002aa8:	0a0080e7          	jalr	160(ra) # 80002b44 <_ZN9Scheduler3putEP3TCB>
    while(peek_first()){
    80002aac:	fd9ff06f          	j	80002a84 <_ZN3sem5closeEv+0x20>
}
    80002ab0:	00000513          	li	a0,0
    80002ab4:	01813083          	ld	ra,24(sp)
    80002ab8:	01013403          	ld	s0,16(sp)
    80002abc:	00813483          	ld	s1,8(sp)
    80002ac0:	02010113          	addi	sp,sp,32
    80002ac4:	00008067          	ret

0000000080002ac8 <_ZN9Scheduler3getEv>:
#include "../h/MemoryAllocator.hpp"

Scheduler::Node* Scheduler::head = nullptr;
Scheduler::Node* Scheduler::tail = nullptr;

TCB* Scheduler::get() {
    80002ac8:	fe010113          	addi	sp,sp,-32
    80002acc:	00113c23          	sd	ra,24(sp)
    80002ad0:	00813823          	sd	s0,16(sp)
    80002ad4:	00913423          	sd	s1,8(sp)
    80002ad8:	01213023          	sd	s2,0(sp)
    80002adc:	02010413          	addi	s0,sp,32
    if(!head) return nullptr;
    80002ae0:	00009497          	auipc	s1,0x9
    80002ae4:	d584b483          	ld	s1,-680(s1) # 8000b838 <_ZN9Scheduler4headE>
    80002ae8:	04048a63          	beqz	s1,80002b3c <_ZN9Scheduler3getEv+0x74>

    Node* res = head;
    head = head->next;
    80002aec:	0084b783          	ld	a5,8(s1)
    80002af0:	00009717          	auipc	a4,0x9
    80002af4:	d4f73423          	sd	a5,-696(a4) # 8000b838 <_ZN9Scheduler4headE>
    if(!head) tail = nullptr;
    80002af8:	02078c63          	beqz	a5,80002b30 <_ZN9Scheduler3getEv+0x68>
    TCB* tcb = res->tcb;
    80002afc:	0004b903          	ld	s2,0(s1)
    MemoryAllocator::getInstance().free(res);
    80002b00:	00000097          	auipc	ra,0x0
    80002b04:	144080e7          	jalr	324(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    80002b08:	00048593          	mv	a1,s1
    80002b0c:	00000097          	auipc	ra,0x0
    80002b10:	2f8080e7          	jalr	760(ra) # 80002e04 <_ZN15MemoryAllocator4freeEPv>

    return tcb;
}
    80002b14:	00090513          	mv	a0,s2
    80002b18:	01813083          	ld	ra,24(sp)
    80002b1c:	01013403          	ld	s0,16(sp)
    80002b20:	00813483          	ld	s1,8(sp)
    80002b24:	00013903          	ld	s2,0(sp)
    80002b28:	02010113          	addi	sp,sp,32
    80002b2c:	00008067          	ret
    if(!head) tail = nullptr;
    80002b30:	00009797          	auipc	a5,0x9
    80002b34:	d007b823          	sd	zero,-752(a5) # 8000b840 <_ZN9Scheduler4tailE>
    80002b38:	fc5ff06f          	j	80002afc <_ZN9Scheduler3getEv+0x34>
    if(!head) return nullptr;
    80002b3c:	00048913          	mv	s2,s1
    80002b40:	fd5ff06f          	j	80002b14 <_ZN9Scheduler3getEv+0x4c>

0000000080002b44 <_ZN9Scheduler3putEP3TCB>:

void Scheduler::put(TCB *tcb) {
    80002b44:	fe010113          	addi	sp,sp,-32
    80002b48:	00113c23          	sd	ra,24(sp)
    80002b4c:	00813823          	sd	s0,16(sp)
    80002b50:	00913423          	sd	s1,8(sp)
    80002b54:	02010413          	addi	s0,sp,32
    80002b58:	00050493          	mv	s1,a0
    Node* new_node = (Node*) MemoryAllocator::getInstance().mallocBytes(sizeof(Node));
    80002b5c:	00000097          	auipc	ra,0x0
    80002b60:	0e8080e7          	jalr	232(ra) # 80002c44 <_ZN15MemoryAllocator11getInstanceEv>
    80002b64:	01000593          	li	a1,16
    80002b68:	00000097          	auipc	ra,0x0
    80002b6c:	26c080e7          	jalr	620(ra) # 80002dd4 <_ZN15MemoryAllocator11mallocBytesEm>
    new_node->tcb = tcb;
    80002b70:	00953023          	sd	s1,0(a0)
    new_node->next = nullptr;
    80002b74:	00053423          	sd	zero,8(a0)

    if(!head) head =  new_node;
    80002b78:	00009797          	auipc	a5,0x9
    80002b7c:	cc07b783          	ld	a5,-832(a5) # 8000b838 <_ZN9Scheduler4headE>
    80002b80:	02078863          	beqz	a5,80002bb0 <_ZN9Scheduler3putEP3TCB+0x6c>
    if(tail) tail->next = new_node;
    80002b84:	00009797          	auipc	a5,0x9
    80002b88:	cbc7b783          	ld	a5,-836(a5) # 8000b840 <_ZN9Scheduler4tailE>
    80002b8c:	00078463          	beqz	a5,80002b94 <_ZN9Scheduler3putEP3TCB+0x50>
    80002b90:	00a7b423          	sd	a0,8(a5)
    tail = new_node;
    80002b94:	00009797          	auipc	a5,0x9
    80002b98:	caa7b623          	sd	a0,-852(a5) # 8000b840 <_ZN9Scheduler4tailE>
    80002b9c:	01813083          	ld	ra,24(sp)
    80002ba0:	01013403          	ld	s0,16(sp)
    80002ba4:	00813483          	ld	s1,8(sp)
    80002ba8:	02010113          	addi	sp,sp,32
    80002bac:	00008067          	ret
    if(!head) head =  new_node;
    80002bb0:	00009797          	auipc	a5,0x9
    80002bb4:	c8a7b423          	sd	a0,-888(a5) # 8000b838 <_ZN9Scheduler4headE>
    80002bb8:	fcdff06f          	j	80002b84 <_ZN9Scheduler3putEP3TCB+0x40>

0000000080002bbc <_ZN15MemoryAllocatorC1Ev>:
#include "../h/MemoryAllocator.hpp"

MemoryAllocator::MemoryAllocator() {
    80002bbc:	ff010113          	addi	sp,sp,-16
    80002bc0:	00813423          	sd	s0,8(sp)
    80002bc4:	01010413          	addi	s0,sp,16
    80002bc8:	00053023          	sd	zero,0(a0)
    const size_t heap_start = (size_t) HEAP_START_ADDR - ((size_t) HEAP_START_ADDR % MEM_BLOCK_SIZE) + MEM_BLOCK_SIZE;
    80002bcc:	00009797          	auipc	a5,0x9
    80002bd0:	bb47b783          	ld	a5,-1100(a5) # 8000b780 <_GLOBAL_OFFSET_TABLE_+0x8>
    80002bd4:	0007b783          	ld	a5,0(a5)
    80002bd8:	fc07f793          	andi	a5,a5,-64
    80002bdc:	04078693          	addi	a3,a5,64
    const auto heap_end = (size_t) HEAP_END_ADDR;
    80002be0:	00009717          	auipc	a4,0x9
    80002be4:	bc873703          	ld	a4,-1080(a4) # 8000b7a8 <_GLOBAL_OFFSET_TABLE_+0x30>
    80002be8:	00073703          	ld	a4,0(a4)

    head = (Segment*) (heap_start - sizeof(Segment::size));
    80002bec:	03878613          	addi	a2,a5,56
    80002bf0:	00c53023          	sd	a2,0(a0)
    head->size = (heap_end - heap_start) / MEM_BLOCK_SIZE;
    80002bf4:	40d70733          	sub	a4,a4,a3
    80002bf8:	00675713          	srli	a4,a4,0x6
    80002bfc:	02e7bc23          	sd	a4,56(a5)
    head->next = nullptr;
    80002c00:	00053783          	ld	a5,0(a0)
    80002c04:	0007b423          	sd	zero,8(a5)
}
    80002c08:	00813403          	ld	s0,8(sp)
    80002c0c:	01010113          	addi	sp,sp,16
    80002c10:	00008067          	ret

0000000080002c14 <_ZN15MemoryAllocator9tryToJoinEPKNS_7SegmentES2_>:

bool MemoryAllocator::tryToJoin(const MemoryAllocator::Segment *left, const MemoryAllocator::Segment *right) {
    80002c14:	ff010113          	addi	sp,sp,-16
    80002c18:	00813423          	sd	s0,8(sp)
    80002c1c:	01010413          	addi	s0,sp,16
    return (size_t) left + (left->size + 1) * MEM_BLOCK_SIZE == (size_t) right;
    80002c20:	00053783          	ld	a5,0(a0)
    80002c24:	00178793          	addi	a5,a5,1
    80002c28:	00679793          	slli	a5,a5,0x6
    80002c2c:	00f50533          	add	a0,a0,a5
    80002c30:	40b50533          	sub	a0,a0,a1
}
    80002c34:	00153513          	seqz	a0,a0
    80002c38:	00813403          	ld	s0,8(sp)
    80002c3c:	01010113          	addi	sp,sp,16
    80002c40:	00008067          	ret

0000000080002c44 <_ZN15MemoryAllocator11getInstanceEv>:

MemoryAllocator& MemoryAllocator::getInstance() {
    static MemoryAllocator instance;
    80002c44:	00009797          	auipc	a5,0x9
    80002c48:	c047c783          	lbu	a5,-1020(a5) # 8000b848 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
    80002c4c:	00078863          	beqz	a5,80002c5c <_ZN15MemoryAllocator11getInstanceEv+0x18>

    return instance;
}
    80002c50:	00009517          	auipc	a0,0x9
    80002c54:	c0050513          	addi	a0,a0,-1024 # 8000b850 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002c58:	00008067          	ret
MemoryAllocator& MemoryAllocator::getInstance() {
    80002c5c:	ff010113          	addi	sp,sp,-16
    80002c60:	00113423          	sd	ra,8(sp)
    80002c64:	00813023          	sd	s0,0(sp)
    80002c68:	01010413          	addi	s0,sp,16
    static MemoryAllocator instance;
    80002c6c:	00009517          	auipc	a0,0x9
    80002c70:	be450513          	addi	a0,a0,-1052 # 8000b850 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002c74:	00000097          	auipc	ra,0x0
    80002c78:	f48080e7          	jalr	-184(ra) # 80002bbc <_ZN15MemoryAllocatorC1Ev>
    80002c7c:	00100793          	li	a5,1
    80002c80:	00009717          	auipc	a4,0x9
    80002c84:	bcf70423          	sb	a5,-1080(a4) # 8000b848 <_ZGVZN15MemoryAllocator11getInstanceEvE8instance>
}
    80002c88:	00009517          	auipc	a0,0x9
    80002c8c:	bc850513          	addi	a0,a0,-1080 # 8000b850 <_ZZN15MemoryAllocator11getInstanceEvE8instance>
    80002c90:	00813083          	ld	ra,8(sp)
    80002c94:	00013403          	ld	s0,0(sp)
    80002c98:	01010113          	addi	sp,sp,16
    80002c9c:	00008067          	ret

0000000080002ca0 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm>:
    head = cur;
    return allocated;

}

void* MemoryAllocator::allocateBlocks(MemoryAllocator::Segment *&header, size_t requested_blocks) {
    80002ca0:	ff010113          	addi	sp,sp,-16
    80002ca4:	00813423          	sd	s0,8(sp)
    80002ca8:	01010413          	addi	s0,sp,16
    if(!header) return nullptr;
    80002cac:	00053703          	ld	a4,0(a0)
    80002cb0:	06070463          	beqz	a4,80002d18 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm+0x78>
    80002cb4:	00050793          	mv	a5,a0
    if(!requested_blocks) return nullptr;
    80002cb8:	06058463          	beqz	a1,80002d20 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm+0x80>

    if(header->size < requested_blocks) return nullptr;
    80002cbc:	00073603          	ld	a2,0(a4)
    80002cc0:	06b66463          	bltu	a2,a1,80002d28 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm+0x88>
    void* memory_start = (void*) ((size_t) header + sizeof(Segment::size));
    80002cc4:	00870513          	addi	a0,a4,8

    if(header->size > requested_blocks + 1){
    80002cc8:	00158693          	addi	a3,a1,1
    80002ccc:	00c6ec63          	bltu	a3,a2,80002ce4 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm+0x44>
        header = leftover;

        return memory_start;
    }

    header = header->next;
    80002cd0:	00873703          	ld	a4,8(a4)
    80002cd4:	00e7b023          	sd	a4,0(a5)
    return memory_start;
}
    80002cd8:	00813403          	ld	s0,8(sp)
    80002cdc:	01010113          	addi	sp,sp,16
    80002ce0:	00008067          	ret
        auto* leftover = (Segment*) ((size_t) header + MEM_BLOCK_SIZE * (requested_blocks + 1));
    80002ce4:	00669693          	slli	a3,a3,0x6
    80002ce8:	00d706b3          	add	a3,a4,a3
        leftover->next = header->next;
    80002cec:	00873703          	ld	a4,8(a4)
    80002cf0:	00e6b423          	sd	a4,8(a3) # 8008 <_entry-0x7fff7ff8>
        leftover->size = header->size - (requested_blocks + 1);
    80002cf4:	0007b703          	ld	a4,0(a5)
    80002cf8:	00073703          	ld	a4,0(a4)
    80002cfc:	40b70733          	sub	a4,a4,a1
    80002d00:	fff70713          	addi	a4,a4,-1
    80002d04:	00e6b023          	sd	a4,0(a3)
        header->size = requested_blocks;
    80002d08:	0007b703          	ld	a4,0(a5)
    80002d0c:	00b73023          	sd	a1,0(a4)
        header = leftover;
    80002d10:	00d7b023          	sd	a3,0(a5)
        return memory_start;
    80002d14:	fc5ff06f          	j	80002cd8 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm+0x38>
    if(!header) return nullptr;
    80002d18:	00070513          	mv	a0,a4
    80002d1c:	fbdff06f          	j	80002cd8 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm+0x38>
    if(!requested_blocks) return nullptr;
    80002d20:	00000513          	li	a0,0
    80002d24:	fb5ff06f          	j	80002cd8 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm+0x38>
    if(header->size < requested_blocks) return nullptr;
    80002d28:	00000513          	li	a0,0
    80002d2c:	fadff06f          	j	80002cd8 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm+0x38>

0000000080002d30 <_ZN15MemoryAllocator6mallocEm>:
void* MemoryAllocator::malloc(size_t size) {
    80002d30:	fd010113          	addi	sp,sp,-48
    80002d34:	02113423          	sd	ra,40(sp)
    80002d38:	02813023          	sd	s0,32(sp)
    80002d3c:	00913c23          	sd	s1,24(sp)
    80002d40:	01213823          	sd	s2,16(sp)
    80002d44:	03010413          	addi	s0,sp,48
    80002d48:	00050913          	mv	s2,a0
    if(!head) return nullptr;
    80002d4c:	00053503          	ld	a0,0(a0)
    80002d50:	02050463          	beqz	a0,80002d78 <_ZN15MemoryAllocator6mallocEm+0x48>
    80002d54:	00058493          	mv	s1,a1
    if(size <= 0) return nullptr;
    80002d58:	06058a63          	beqz	a1,80002dcc <_ZN15MemoryAllocator6mallocEm+0x9c>
    Segment* cur = head;
    80002d5c:	fca43c23          	sd	a0,-40(s0)
    void* allocated = allocateBlocks(cur, size);
    80002d60:	fd840513          	addi	a0,s0,-40
    80002d64:	00000097          	auipc	ra,0x0
    80002d68:	f3c080e7          	jalr	-196(ra) # 80002ca0 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm>
    if(!allocated){
    80002d6c:	02050263          	beqz	a0,80002d90 <_ZN15MemoryAllocator6mallocEm+0x60>
    head = cur;
    80002d70:	fd843783          	ld	a5,-40(s0)
    80002d74:	00f93023          	sd	a5,0(s2)
}
    80002d78:	02813083          	ld	ra,40(sp)
    80002d7c:	02013403          	ld	s0,32(sp)
    80002d80:	01813483          	ld	s1,24(sp)
    80002d84:	01013903          	ld	s2,16(sp)
    80002d88:	03010113          	addi	sp,sp,48
    80002d8c:	00008067          	ret
        for(Segment* prev = head; cur; cur = cur->next){
    80002d90:	00093903          	ld	s2,0(s2)
    80002d94:	fd843503          	ld	a0,-40(s0)
    80002d98:	fe0500e3          	beqz	a0,80002d78 <_ZN15MemoryAllocator6mallocEm+0x48>
            if((allocated = allocateBlocks(cur, size))){
    80002d9c:	00048593          	mv	a1,s1
    80002da0:	fd840513          	addi	a0,s0,-40
    80002da4:	00000097          	auipc	ra,0x0
    80002da8:	efc080e7          	jalr	-260(ra) # 80002ca0 <_ZN15MemoryAllocator14allocateBlocksERPNS_7SegmentEm>
    80002dac:	00051a63          	bnez	a0,80002dc0 <_ZN15MemoryAllocator6mallocEm+0x90>
        for(Segment* prev = head; cur; cur = cur->next){
    80002db0:	fd843783          	ld	a5,-40(s0)
    80002db4:	0087b783          	ld	a5,8(a5)
    80002db8:	fcf43c23          	sd	a5,-40(s0)
    80002dbc:	fd9ff06f          	j	80002d94 <_ZN15MemoryAllocator6mallocEm+0x64>
                prev->next = cur;
    80002dc0:	fd843783          	ld	a5,-40(s0)
    80002dc4:	00f93423          	sd	a5,8(s2)
                return allocated;
    80002dc8:	fb1ff06f          	j	80002d78 <_ZN15MemoryAllocator6mallocEm+0x48>
    if(size <= 0) return nullptr;
    80002dcc:	00000513          	li	a0,0
    80002dd0:	fa9ff06f          	j	80002d78 <_ZN15MemoryAllocator6mallocEm+0x48>

0000000080002dd4 <_ZN15MemoryAllocator11mallocBytesEm>:
void* MemoryAllocator::mallocBytes(size_t size) {
    80002dd4:	ff010113          	addi	sp,sp,-16
    80002dd8:	00113423          	sd	ra,8(sp)
    80002ddc:	00813023          	sd	s0,0(sp)
    80002de0:	01010413          	addi	s0,sp,16
    void* mallocBytes(size_t);

    int free(void*);

    static MemoryAllocator& getInstance();
    static size_t convert(size_t bytes) { return (bytes + MEM_BLOCK_SIZE - 1) / MEM_BLOCK_SIZE; }
    80002de4:	03f58593          	addi	a1,a1,63
    return malloc(convert(size));
    80002de8:	0065d593          	srli	a1,a1,0x6
    80002dec:	00000097          	auipc	ra,0x0
    80002df0:	f44080e7          	jalr	-188(ra) # 80002d30 <_ZN15MemoryAllocator6mallocEm>
}
    80002df4:	00813083          	ld	ra,8(sp)
    80002df8:	00013403          	ld	s0,0(sp)
    80002dfc:	01010113          	addi	sp,sp,16
    80002e00:	00008067          	ret

0000000080002e04 <_ZN15MemoryAllocator4freeEPv>:

int MemoryAllocator::free(void* data) {
    if(!data) return -1;
    80002e04:	16058263          	beqz	a1,80002f68 <_ZN15MemoryAllocator4freeEPv+0x164>
int MemoryAllocator::free(void* data) {
    80002e08:	fd010113          	addi	sp,sp,-48
    80002e0c:	02113423          	sd	ra,40(sp)
    80002e10:	02813023          	sd	s0,32(sp)
    80002e14:	00913c23          	sd	s1,24(sp)
    80002e18:	01213823          	sd	s2,16(sp)
    80002e1c:	01313423          	sd	s3,8(sp)
    80002e20:	01413023          	sd	s4,0(sp)
    80002e24:	03010413          	addi	s0,sp,48
    80002e28:	00058a13          	mv	s4,a1

    auto* data_header = (Segment*) ((size_t) data - sizeof(Segment::size));
    80002e2c:	ff858993          	addi	s3,a1,-8

    Segment* prev = nullptr, *succ = head;
    80002e30:	00053483          	ld	s1,0(a0)
    80002e34:	00000913          	li	s2,0
    while(succ && (size_t) succ < (size_t) data_header){
    80002e38:	00048a63          	beqz	s1,80002e4c <_ZN15MemoryAllocator4freeEPv+0x48>
    80002e3c:	0134f863          	bgeu	s1,s3,80002e4c <_ZN15MemoryAllocator4freeEPv+0x48>
        prev = succ;
    80002e40:	00048913          	mv	s2,s1
        succ = succ->next;
    80002e44:	0084b483          	ld	s1,8(s1)
    while(succ && (size_t) succ < (size_t) data_header){
    80002e48:	ff1ff06f          	j	80002e38 <_ZN15MemoryAllocator4freeEPv+0x34>
    }

    if(!prev){
    80002e4c:	06090263          	beqz	s2,80002eb0 <_ZN15MemoryAllocator4freeEPv+0xac>
        data_header->next = succ;

        return 1;
    }

    if(tryToJoin(prev, data_header)){
    80002e50:	00098593          	mv	a1,s3
    80002e54:	00090513          	mv	a0,s2
    80002e58:	00000097          	auipc	ra,0x0
    80002e5c:	dbc080e7          	jalr	-580(ra) # 80002c14 <_ZN15MemoryAllocator9tryToJoinEPKNS_7SegmentES2_>
    80002e60:	08050e63          	beqz	a0,80002efc <_ZN15MemoryAllocator4freeEPv+0xf8>
        prev->size += data_header->size + 1;
    80002e64:	ff8a3983          	ld	s3,-8(s4)
    80002e68:	00093783          	ld	a5,0(s2)
    80002e6c:	00f989b3          	add	s3,s3,a5
    80002e70:	00198993          	addi	s3,s3,1
    80002e74:	01393023          	sd	s3,0(s2)

        if(succ && this->tryToJoin(prev, succ)){
    80002e78:	10048063          	beqz	s1,80002f78 <_ZN15MemoryAllocator4freeEPv+0x174>
    80002e7c:	00048593          	mv	a1,s1
    80002e80:	00090513          	mv	a0,s2
    80002e84:	00000097          	auipc	ra,0x0
    80002e88:	d90080e7          	jalr	-624(ra) # 80002c14 <_ZN15MemoryAllocator9tryToJoinEPKNS_7SegmentES2_>
    80002e8c:	0e050a63          	beqz	a0,80002f80 <_ZN15MemoryAllocator4freeEPv+0x17c>
            prev->size += succ->size + 1;
    80002e90:	0004b783          	ld	a5,0(s1)
    80002e94:	00f987b3          	add	a5,s3,a5
    80002e98:	00178793          	addi	a5,a5,1
    80002e9c:	00f93023          	sd	a5,0(s2)
            prev->next = succ->next;
    80002ea0:	0084b783          	ld	a5,8(s1)
    80002ea4:	00f93423          	sd	a5,8(s2)

            return 1;
    80002ea8:	00100513          	li	a0,1
    80002eac:	0740006f          	j	80002f20 <_ZN15MemoryAllocator4freeEPv+0x11c>
        head = data_header;
    80002eb0:	01353023          	sd	s3,0(a0)
        if(!succ) return 1;
    80002eb4:	0a048e63          	beqz	s1,80002f70 <_ZN15MemoryAllocator4freeEPv+0x16c>
        if(tryToJoin(data_header, succ)){
    80002eb8:	00048593          	mv	a1,s1
    80002ebc:	00098513          	mv	a0,s3
    80002ec0:	00000097          	auipc	ra,0x0
    80002ec4:	d54080e7          	jalr	-684(ra) # 80002c14 <_ZN15MemoryAllocator9tryToJoinEPKNS_7SegmentES2_>
    80002ec8:	02050463          	beqz	a0,80002ef0 <_ZN15MemoryAllocator4freeEPv+0xec>
            data_header->next = succ->next;
    80002ecc:	0084b783          	ld	a5,8(s1)
    80002ed0:	00f9b423          	sd	a5,8(s3)
            data_header->size += succ->size + 1;
    80002ed4:	0004b783          	ld	a5,0(s1)
    80002ed8:	ff8a3703          	ld	a4,-8(s4)
    80002edc:	00e787b3          	add	a5,a5,a4
    80002ee0:	00178793          	addi	a5,a5,1
    80002ee4:	fefa3c23          	sd	a5,-8(s4)
            return 1;
    80002ee8:	00100513          	li	a0,1
    80002eec:	0340006f          	j	80002f20 <_ZN15MemoryAllocator4freeEPv+0x11c>
        data_header->next = succ;
    80002ef0:	0099b423          	sd	s1,8(s3)
        return 1;
    80002ef4:	00100513          	li	a0,1
    80002ef8:	0280006f          	j	80002f20 <_ZN15MemoryAllocator4freeEPv+0x11c>
        }

        return 1;
    }

    if(succ && tryToJoin(data_header, succ)){
    80002efc:	00048c63          	beqz	s1,80002f14 <_ZN15MemoryAllocator4freeEPv+0x110>
    80002f00:	00048593          	mv	a1,s1
    80002f04:	00098513          	mv	a0,s3
    80002f08:	00000097          	auipc	ra,0x0
    80002f0c:	d0c080e7          	jalr	-756(ra) # 80002c14 <_ZN15MemoryAllocator9tryToJoinEPKNS_7SegmentES2_>
    80002f10:	02051863          	bnez	a0,80002f40 <_ZN15MemoryAllocator4freeEPv+0x13c>
        prev->next = data_header;

        return 1;
    }

    prev->next = data_header;
    80002f14:	01393423          	sd	s3,8(s2)
    data_header->next = succ;
    80002f18:	0099b423          	sd	s1,8(s3)

    return 1;
    80002f1c:	00100513          	li	a0,1
}
    80002f20:	02813083          	ld	ra,40(sp)
    80002f24:	02013403          	ld	s0,32(sp)
    80002f28:	01813483          	ld	s1,24(sp)
    80002f2c:	01013903          	ld	s2,16(sp)
    80002f30:	00813983          	ld	s3,8(sp)
    80002f34:	00013a03          	ld	s4,0(sp)
    80002f38:	03010113          	addi	sp,sp,48
    80002f3c:	00008067          	ret
        data_header->size += succ->size + 1;
    80002f40:	0004b783          	ld	a5,0(s1)
    80002f44:	ff8a3703          	ld	a4,-8(s4)
    80002f48:	00e787b3          	add	a5,a5,a4
    80002f4c:	00178793          	addi	a5,a5,1
    80002f50:	fefa3c23          	sd	a5,-8(s4)
        data_header->next = succ->next;
    80002f54:	0084b783          	ld	a5,8(s1)
    80002f58:	00f9b423          	sd	a5,8(s3)
        prev->next = data_header;
    80002f5c:	01393423          	sd	s3,8(s2)
        return 1;
    80002f60:	00100513          	li	a0,1
    80002f64:	fbdff06f          	j	80002f20 <_ZN15MemoryAllocator4freeEPv+0x11c>
    if(!data) return -1;
    80002f68:	fff00513          	li	a0,-1
}
    80002f6c:	00008067          	ret
        if(!succ) return 1;
    80002f70:	00100513          	li	a0,1
    80002f74:	fadff06f          	j	80002f20 <_ZN15MemoryAllocator4freeEPv+0x11c>
        return 1;
    80002f78:	00100513          	li	a0,1
    80002f7c:	fa5ff06f          	j	80002f20 <_ZN15MemoryAllocator4freeEPv+0x11c>
    80002f80:	00100513          	li	a0,1
    80002f84:	f9dff06f          	j	80002f20 <_ZN15MemoryAllocator4freeEPv+0x11c>

0000000080002f88 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80002f88:	fe010113          	addi	sp,sp,-32
    80002f8c:	00113c23          	sd	ra,24(sp)
    80002f90:	00813823          	sd	s0,16(sp)
    80002f94:	00913423          	sd	s1,8(sp)
    80002f98:	01213023          	sd	s2,0(sp)
    80002f9c:	02010413          	addi	s0,sp,32
    80002fa0:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002fa4:	00000913          	li	s2,0
    80002fa8:	00c0006f          	j	80002fb4 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002fac:	ffffe097          	auipc	ra,0xffffe
    80002fb0:	4fc080e7          	jalr	1276(ra) # 800014a8 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80002fb4:	ffffe097          	auipc	ra,0xffffe
    80002fb8:	650080e7          	jalr	1616(ra) # 80001604 <_Z4getcv>
    80002fbc:	0005059b          	sext.w	a1,a0
    80002fc0:	01b00793          	li	a5,27
    80002fc4:	02f58a63          	beq	a1,a5,80002ff8 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80002fc8:	0084b503          	ld	a0,8(s1)
    80002fcc:	00003097          	auipc	ra,0x3
    80002fd0:	400080e7          	jalr	1024(ra) # 800063cc <_ZN6Buffer3putEi>
        i++;
    80002fd4:	0019071b          	addiw	a4,s2,1
    80002fd8:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002fdc:	0004a683          	lw	a3,0(s1)
    80002fe0:	0026979b          	slliw	a5,a3,0x2
    80002fe4:	00d787bb          	addw	a5,a5,a3
    80002fe8:	0017979b          	slliw	a5,a5,0x1
    80002fec:	02f767bb          	remw	a5,a4,a5
    80002ff0:	fc0792e3          	bnez	a5,80002fb4 <_ZL16producerKeyboardPv+0x2c>
    80002ff4:	fb9ff06f          	j	80002fac <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80002ff8:	00100793          	li	a5,1
    80002ffc:	00009717          	auipc	a4,0x9
    80003000:	84f72e23          	sw	a5,-1956(a4) # 8000b858 <_ZL9threadEnd>
    data->buffer->put('!');
    80003004:	02100593          	li	a1,33
    80003008:	0084b503          	ld	a0,8(s1)
    8000300c:	00003097          	auipc	ra,0x3
    80003010:	3c0080e7          	jalr	960(ra) # 800063cc <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80003014:	0104b503          	ld	a0,16(s1)
    80003018:	ffffe097          	auipc	ra,0xffffe
    8000301c:	588080e7          	jalr	1416(ra) # 800015a0 <_Z10sem_signalP3sem>
}
    80003020:	01813083          	ld	ra,24(sp)
    80003024:	01013403          	ld	s0,16(sp)
    80003028:	00813483          	ld	s1,8(sp)
    8000302c:	00013903          	ld	s2,0(sp)
    80003030:	02010113          	addi	sp,sp,32
    80003034:	00008067          	ret

0000000080003038 <_ZL8producerPv>:

static void producer(void *arg) {
    80003038:	fe010113          	addi	sp,sp,-32
    8000303c:	00113c23          	sd	ra,24(sp)
    80003040:	00813823          	sd	s0,16(sp)
    80003044:	00913423          	sd	s1,8(sp)
    80003048:	01213023          	sd	s2,0(sp)
    8000304c:	02010413          	addi	s0,sp,32
    80003050:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;
    int i = 0;
    80003054:	00000913          	li	s2,0
    80003058:	00c0006f          	j	80003064 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    8000305c:	ffffe097          	auipc	ra,0xffffe
    80003060:	44c080e7          	jalr	1100(ra) # 800014a8 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80003064:	00008797          	auipc	a5,0x8
    80003068:	7f47a783          	lw	a5,2036(a5) # 8000b858 <_ZL9threadEnd>
    8000306c:	02079e63          	bnez	a5,800030a8 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80003070:	0004a583          	lw	a1,0(s1)
    80003074:	0305859b          	addiw	a1,a1,48
    80003078:	0084b503          	ld	a0,8(s1)
    8000307c:	00003097          	auipc	ra,0x3
    80003080:	350080e7          	jalr	848(ra) # 800063cc <_ZN6Buffer3putEi>
        i++;
    80003084:	0019071b          	addiw	a4,s2,1
    80003088:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000308c:	0004a683          	lw	a3,0(s1)
    80003090:	0026979b          	slliw	a5,a3,0x2
    80003094:	00d787bb          	addw	a5,a5,a3
    80003098:	0017979b          	slliw	a5,a5,0x1
    8000309c:	02f767bb          	remw	a5,a4,a5
    800030a0:	fc0792e3          	bnez	a5,80003064 <_ZL8producerPv+0x2c>
    800030a4:	fb9ff06f          	j	8000305c <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    800030a8:	0104b503          	ld	a0,16(s1)
    800030ac:	ffffe097          	auipc	ra,0xffffe
    800030b0:	4f4080e7          	jalr	1268(ra) # 800015a0 <_Z10sem_signalP3sem>
}
    800030b4:	01813083          	ld	ra,24(sp)
    800030b8:	01013403          	ld	s0,16(sp)
    800030bc:	00813483          	ld	s1,8(sp)
    800030c0:	00013903          	ld	s2,0(sp)
    800030c4:	02010113          	addi	sp,sp,32
    800030c8:	00008067          	ret

00000000800030cc <_ZL8consumerPv>:

static void consumer(void *arg) {
    800030cc:	fd010113          	addi	sp,sp,-48
    800030d0:	02113423          	sd	ra,40(sp)
    800030d4:	02813023          	sd	s0,32(sp)
    800030d8:	00913c23          	sd	s1,24(sp)
    800030dc:	01213823          	sd	s2,16(sp)
    800030e0:	01313423          	sd	s3,8(sp)
    800030e4:	03010413          	addi	s0,sp,48
    800030e8:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800030ec:	00000993          	li	s3,0
    800030f0:	01c0006f          	j	8000310c <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    800030f4:	ffffe097          	auipc	ra,0xffffe
    800030f8:	3b4080e7          	jalr	948(ra) # 800014a8 <_Z15thread_dispatchv>
    800030fc:	0500006f          	j	8000314c <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80003100:	00a00513          	li	a0,10
    80003104:	ffffe097          	auipc	ra,0xffffe
    80003108:	534080e7          	jalr	1332(ra) # 80001638 <_Z4putcc>
    while (!threadEnd) {
    8000310c:	00008797          	auipc	a5,0x8
    80003110:	74c7a783          	lw	a5,1868(a5) # 8000b858 <_ZL9threadEnd>
    80003114:	06079063          	bnez	a5,80003174 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80003118:	00893503          	ld	a0,8(s2)
    8000311c:	00003097          	auipc	ra,0x3
    80003120:	340080e7          	jalr	832(ra) # 8000645c <_ZN6Buffer3getEv>
        i++;
    80003124:	0019849b          	addiw	s1,s3,1
    80003128:	0004899b          	sext.w	s3,s1
        putc(key);
    8000312c:	0ff57513          	andi	a0,a0,255
    80003130:	ffffe097          	auipc	ra,0xffffe
    80003134:	508080e7          	jalr	1288(ra) # 80001638 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80003138:	00092703          	lw	a4,0(s2)
    8000313c:	0027179b          	slliw	a5,a4,0x2
    80003140:	00e787bb          	addw	a5,a5,a4
    80003144:	02f4e7bb          	remw	a5,s1,a5
    80003148:	fa0786e3          	beqz	a5,800030f4 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    8000314c:	05000793          	li	a5,80
    80003150:	02f4e4bb          	remw	s1,s1,a5
    80003154:	fa049ce3          	bnez	s1,8000310c <_ZL8consumerPv+0x40>
    80003158:	fa9ff06f          	j	80003100 <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    8000315c:	00893503          	ld	a0,8(s2)
    80003160:	00003097          	auipc	ra,0x3
    80003164:	2fc080e7          	jalr	764(ra) # 8000645c <_ZN6Buffer3getEv>
        putc(key);
    80003168:	0ff57513          	andi	a0,a0,255
    8000316c:	ffffe097          	auipc	ra,0xffffe
    80003170:	4cc080e7          	jalr	1228(ra) # 80001638 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80003174:	00893503          	ld	a0,8(s2)
    80003178:	00003097          	auipc	ra,0x3
    8000317c:	370080e7          	jalr	880(ra) # 800064e8 <_ZN6Buffer6getCntEv>
    80003180:	fca04ee3          	bgtz	a0,8000315c <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80003184:	01093503          	ld	a0,16(s2)
    80003188:	ffffe097          	auipc	ra,0xffffe
    8000318c:	418080e7          	jalr	1048(ra) # 800015a0 <_Z10sem_signalP3sem>
}
    80003190:	02813083          	ld	ra,40(sp)
    80003194:	02013403          	ld	s0,32(sp)
    80003198:	01813483          	ld	s1,24(sp)
    8000319c:	01013903          	ld	s2,16(sp)
    800031a0:	00813983          	ld	s3,8(sp)
    800031a4:	03010113          	addi	sp,sp,48
    800031a8:	00008067          	ret

00000000800031ac <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    800031ac:	f9010113          	addi	sp,sp,-112
    800031b0:	06113423          	sd	ra,104(sp)
    800031b4:	06813023          	sd	s0,96(sp)
    800031b8:	04913c23          	sd	s1,88(sp)
    800031bc:	05213823          	sd	s2,80(sp)
    800031c0:	05313423          	sd	s3,72(sp)
    800031c4:	05413023          	sd	s4,64(sp)
    800031c8:	03513c23          	sd	s5,56(sp)
    800031cc:	03613823          	sd	s6,48(sp)
    800031d0:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    800031d4:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    800031d8:	00006517          	auipc	a0,0x6
    800031dc:	ea850513          	addi	a0,a0,-344 # 80009080 <CONSOLE_STATUS+0x70>
    800031e0:	00002097          	auipc	ra,0x2
    800031e4:	220080e7          	jalr	544(ra) # 80005400 <_Z11printStringPKc>
    getString(input, 30);
    800031e8:	01e00593          	li	a1,30
    800031ec:	fa040493          	addi	s1,s0,-96
    800031f0:	00048513          	mv	a0,s1
    800031f4:	00002097          	auipc	ra,0x2
    800031f8:	294080e7          	jalr	660(ra) # 80005488 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800031fc:	00048513          	mv	a0,s1
    80003200:	00002097          	auipc	ra,0x2
    80003204:	360080e7          	jalr	864(ra) # 80005560 <_Z11stringToIntPKc>
    80003208:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    8000320c:	00006517          	auipc	a0,0x6
    80003210:	e9450513          	addi	a0,a0,-364 # 800090a0 <CONSOLE_STATUS+0x90>
    80003214:	00002097          	auipc	ra,0x2
    80003218:	1ec080e7          	jalr	492(ra) # 80005400 <_Z11printStringPKc>
    getString(input, 30);
    8000321c:	01e00593          	li	a1,30
    80003220:	00048513          	mv	a0,s1
    80003224:	00002097          	auipc	ra,0x2
    80003228:	264080e7          	jalr	612(ra) # 80005488 <_Z9getStringPci>
    n = stringToInt(input);
    8000322c:	00048513          	mv	a0,s1
    80003230:	00002097          	auipc	ra,0x2
    80003234:	330080e7          	jalr	816(ra) # 80005560 <_Z11stringToIntPKc>
    80003238:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    8000323c:	00006517          	auipc	a0,0x6
    80003240:	e8450513          	addi	a0,a0,-380 # 800090c0 <CONSOLE_STATUS+0xb0>
    80003244:	00002097          	auipc	ra,0x2
    80003248:	1bc080e7          	jalr	444(ra) # 80005400 <_Z11printStringPKc>
    8000324c:	00000613          	li	a2,0
    80003250:	00a00593          	li	a1,10
    80003254:	00090513          	mv	a0,s2
    80003258:	00002097          	auipc	ra,0x2
    8000325c:	358080e7          	jalr	856(ra) # 800055b0 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80003260:	00006517          	auipc	a0,0x6
    80003264:	e7850513          	addi	a0,a0,-392 # 800090d8 <CONSOLE_STATUS+0xc8>
    80003268:	00002097          	auipc	ra,0x2
    8000326c:	198080e7          	jalr	408(ra) # 80005400 <_Z11printStringPKc>
    80003270:	00000613          	li	a2,0
    80003274:	00a00593          	li	a1,10
    80003278:	00048513          	mv	a0,s1
    8000327c:	00002097          	auipc	ra,0x2
    80003280:	334080e7          	jalr	820(ra) # 800055b0 <_Z8printIntiii>
    printString(".\n");
    80003284:	00006517          	auipc	a0,0x6
    80003288:	dc450513          	addi	a0,a0,-572 # 80009048 <CONSOLE_STATUS+0x38>
    8000328c:	00002097          	auipc	ra,0x2
    80003290:	174080e7          	jalr	372(ra) # 80005400 <_Z11printStringPKc>
    if(threadNum > n) {
    80003294:	0324c463          	blt	s1,s2,800032bc <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80003298:	03205c63          	blez	s2,800032d0 <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    8000329c:	03800513          	li	a0,56
    800032a0:	fffff097          	auipc	ra,0xfffff
    800032a4:	b78080e7          	jalr	-1160(ra) # 80001e18 <_Znwm>
    800032a8:	00050a13          	mv	s4,a0
    800032ac:	00048593          	mv	a1,s1
    800032b0:	00003097          	auipc	ra,0x3
    800032b4:	080080e7          	jalr	128(ra) # 80006330 <_ZN6BufferC1Ei>
    800032b8:	0300006f          	j	800032e8 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    800032bc:	00006517          	auipc	a0,0x6
    800032c0:	e3450513          	addi	a0,a0,-460 # 800090f0 <CONSOLE_STATUS+0xe0>
    800032c4:	00002097          	auipc	ra,0x2
    800032c8:	13c080e7          	jalr	316(ra) # 80005400 <_Z11printStringPKc>
        return;
    800032cc:	0140006f          	j	800032e0 <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    800032d0:	00006517          	auipc	a0,0x6
    800032d4:	e6050513          	addi	a0,a0,-416 # 80009130 <CONSOLE_STATUS+0x120>
    800032d8:	00002097          	auipc	ra,0x2
    800032dc:	128080e7          	jalr	296(ra) # 80005400 <_Z11printStringPKc>
        return;
    800032e0:	000b0113          	mv	sp,s6
    800032e4:	1500006f          	j	80003434 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    800032e8:	00000593          	li	a1,0
    800032ec:	00008517          	auipc	a0,0x8
    800032f0:	57450513          	addi	a0,a0,1396 # 8000b860 <_ZL10waitForAll>
    800032f4:	ffffe097          	auipc	ra,0xffffe
    800032f8:	200080e7          	jalr	512(ra) # 800014f4 <_Z8sem_openPP3semj>
    thread_t threads[threadNum];
    800032fc:	00391793          	slli	a5,s2,0x3
    80003300:	00f78793          	addi	a5,a5,15
    80003304:	ff07f793          	andi	a5,a5,-16
    80003308:	40f10133          	sub	sp,sp,a5
    8000330c:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80003310:	0019071b          	addiw	a4,s2,1
    80003314:	00171793          	slli	a5,a4,0x1
    80003318:	00e787b3          	add	a5,a5,a4
    8000331c:	00379793          	slli	a5,a5,0x3
    80003320:	00f78793          	addi	a5,a5,15
    80003324:	ff07f793          	andi	a5,a5,-16
    80003328:	40f10133          	sub	sp,sp,a5
    8000332c:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80003330:	00191613          	slli	a2,s2,0x1
    80003334:	012607b3          	add	a5,a2,s2
    80003338:	00379793          	slli	a5,a5,0x3
    8000333c:	00f987b3          	add	a5,s3,a5
    80003340:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80003344:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80003348:	00008717          	auipc	a4,0x8
    8000334c:	51873703          	ld	a4,1304(a4) # 8000b860 <_ZL10waitForAll>
    80003350:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80003354:	00078613          	mv	a2,a5
    80003358:	00000597          	auipc	a1,0x0
    8000335c:	d7458593          	addi	a1,a1,-652 # 800030cc <_ZL8consumerPv>
    80003360:	f9840513          	addi	a0,s0,-104
    80003364:	ffffe097          	auipc	ra,0xffffe
    80003368:	0a0080e7          	jalr	160(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    8000336c:	00000493          	li	s1,0
    80003370:	0280006f          	j	80003398 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80003374:	00000597          	auipc	a1,0x0
    80003378:	c1458593          	addi	a1,a1,-1004 # 80002f88 <_ZL16producerKeyboardPv>
                      data + i);
    8000337c:	00179613          	slli	a2,a5,0x1
    80003380:	00f60633          	add	a2,a2,a5
    80003384:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80003388:	00c98633          	add	a2,s3,a2
    8000338c:	ffffe097          	auipc	ra,0xffffe
    80003390:	078080e7          	jalr	120(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80003394:	0014849b          	addiw	s1,s1,1
    80003398:	0524d263          	bge	s1,s2,800033dc <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    8000339c:	00149793          	slli	a5,s1,0x1
    800033a0:	009787b3          	add	a5,a5,s1
    800033a4:	00379793          	slli	a5,a5,0x3
    800033a8:	00f987b3          	add	a5,s3,a5
    800033ac:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    800033b0:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    800033b4:	00008717          	auipc	a4,0x8
    800033b8:	4ac73703          	ld	a4,1196(a4) # 8000b860 <_ZL10waitForAll>
    800033bc:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    800033c0:	00048793          	mv	a5,s1
    800033c4:	00349513          	slli	a0,s1,0x3
    800033c8:	00aa8533          	add	a0,s5,a0
    800033cc:	fa9054e3          	blez	s1,80003374 <_Z22producerConsumer_C_APIv+0x1c8>
    800033d0:	00000597          	auipc	a1,0x0
    800033d4:	c6858593          	addi	a1,a1,-920 # 80003038 <_ZL8producerPv>
    800033d8:	fa5ff06f          	j	8000337c <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    800033dc:	ffffe097          	auipc	ra,0xffffe
    800033e0:	0cc080e7          	jalr	204(ra) # 800014a8 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    800033e4:	00000493          	li	s1,0
    800033e8:	00994e63          	blt	s2,s1,80003404 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    800033ec:	00008517          	auipc	a0,0x8
    800033f0:	47453503          	ld	a0,1140(a0) # 8000b860 <_ZL10waitForAll>
    800033f4:	ffffe097          	auipc	ra,0xffffe
    800033f8:	174080e7          	jalr	372(ra) # 80001568 <_Z8sem_waitP3sem>
    for (int i = 0; i <= threadNum; i++) {
    800033fc:	0014849b          	addiw	s1,s1,1
    80003400:	fe9ff06f          	j	800033e8 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80003404:	00008517          	auipc	a0,0x8
    80003408:	45c53503          	ld	a0,1116(a0) # 8000b860 <_ZL10waitForAll>
    8000340c:	ffffe097          	auipc	ra,0xffffe
    80003410:	124080e7          	jalr	292(ra) # 80001530 <_Z9sem_closeP3sem>
    delete buffer;
    80003414:	000a0e63          	beqz	s4,80003430 <_Z22producerConsumer_C_APIv+0x284>
    80003418:	000a0513          	mv	a0,s4
    8000341c:	00003097          	auipc	ra,0x3
    80003420:	154080e7          	jalr	340(ra) # 80006570 <_ZN6BufferD1Ev>
    80003424:	000a0513          	mv	a0,s4
    80003428:	fffff097          	auipc	ra,0xfffff
    8000342c:	a40080e7          	jalr	-1472(ra) # 80001e68 <_ZdlPv>
    80003430:	000b0113          	mv	sp,s6

}
    80003434:	f9040113          	addi	sp,s0,-112
    80003438:	06813083          	ld	ra,104(sp)
    8000343c:	06013403          	ld	s0,96(sp)
    80003440:	05813483          	ld	s1,88(sp)
    80003444:	05013903          	ld	s2,80(sp)
    80003448:	04813983          	ld	s3,72(sp)
    8000344c:	04013a03          	ld	s4,64(sp)
    80003450:	03813a83          	ld	s5,56(sp)
    80003454:	03013b03          	ld	s6,48(sp)
    80003458:	07010113          	addi	sp,sp,112
    8000345c:	00008067          	ret
    80003460:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003464:	000a0513          	mv	a0,s4
    80003468:	fffff097          	auipc	ra,0xfffff
    8000346c:	a00080e7          	jalr	-1536(ra) # 80001e68 <_ZdlPv>
    80003470:	00048513          	mv	a0,s1
    80003474:	00009097          	auipc	ra,0x9
    80003478:	504080e7          	jalr	1284(ra) # 8000c978 <_Unwind_Resume>

000000008000347c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000347c:	fe010113          	addi	sp,sp,-32
    80003480:	00113c23          	sd	ra,24(sp)
    80003484:	00813823          	sd	s0,16(sp)
    80003488:	00913423          	sd	s1,8(sp)
    8000348c:	01213023          	sd	s2,0(sp)
    80003490:	02010413          	addi	s0,sp,32
    80003494:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003498:	00100793          	li	a5,1
    8000349c:	02a7f863          	bgeu	a5,a0,800034cc <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800034a0:	00a00793          	li	a5,10
    800034a4:	02f577b3          	remu	a5,a0,a5
    800034a8:	02078e63          	beqz	a5,800034e4 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800034ac:	fff48513          	addi	a0,s1,-1
    800034b0:	00000097          	auipc	ra,0x0
    800034b4:	fcc080e7          	jalr	-52(ra) # 8000347c <_ZL9fibonaccim>
    800034b8:	00050913          	mv	s2,a0
    800034bc:	ffe48513          	addi	a0,s1,-2
    800034c0:	00000097          	auipc	ra,0x0
    800034c4:	fbc080e7          	jalr	-68(ra) # 8000347c <_ZL9fibonaccim>
    800034c8:	00a90533          	add	a0,s2,a0
}
    800034cc:	01813083          	ld	ra,24(sp)
    800034d0:	01013403          	ld	s0,16(sp)
    800034d4:	00813483          	ld	s1,8(sp)
    800034d8:	00013903          	ld	s2,0(sp)
    800034dc:	02010113          	addi	sp,sp,32
    800034e0:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800034e4:	ffffe097          	auipc	ra,0xffffe
    800034e8:	fc4080e7          	jalr	-60(ra) # 800014a8 <_Z15thread_dispatchv>
    800034ec:	fc1ff06f          	j	800034ac <_ZL9fibonaccim+0x30>

00000000800034f0 <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    800034f0:	fe010113          	addi	sp,sp,-32
    800034f4:	00113c23          	sd	ra,24(sp)
    800034f8:	00813823          	sd	s0,16(sp)
    800034fc:	00913423          	sd	s1,8(sp)
    80003500:	01213023          	sd	s2,0(sp)
    80003504:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80003508:	00000913          	li	s2,0
    8000350c:	0380006f          	j	80003544 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003510:	ffffe097          	auipc	ra,0xffffe
    80003514:	f98080e7          	jalr	-104(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003518:	00148493          	addi	s1,s1,1
    8000351c:	000027b7          	lui	a5,0x2
    80003520:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80003524:	0097ee63          	bltu	a5,s1,80003540 <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003528:	00000713          	li	a4,0
    8000352c:	000077b7          	lui	a5,0x7
    80003530:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003534:	fce7eee3          	bltu	a5,a4,80003510 <_ZN7WorkerA11workerBodyAEPv+0x20>
    80003538:	00170713          	addi	a4,a4,1
    8000353c:	ff1ff06f          	j	8000352c <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80003540:	00190913          	addi	s2,s2,1
    80003544:	00900793          	li	a5,9
    80003548:	0527e063          	bltu	a5,s2,80003588 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    8000354c:	00006517          	auipc	a0,0x6
    80003550:	c1450513          	addi	a0,a0,-1004 # 80009160 <CONSOLE_STATUS+0x150>
    80003554:	00002097          	auipc	ra,0x2
    80003558:	eac080e7          	jalr	-340(ra) # 80005400 <_Z11printStringPKc>
    8000355c:	00000613          	li	a2,0
    80003560:	00a00593          	li	a1,10
    80003564:	0009051b          	sext.w	a0,s2
    80003568:	00002097          	auipc	ra,0x2
    8000356c:	048080e7          	jalr	72(ra) # 800055b0 <_Z8printIntiii>
    80003570:	00006517          	auipc	a0,0x6
    80003574:	e4050513          	addi	a0,a0,-448 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80003578:	00002097          	auipc	ra,0x2
    8000357c:	e88080e7          	jalr	-376(ra) # 80005400 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80003580:	00000493          	li	s1,0
    80003584:	f99ff06f          	j	8000351c <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003588:	00006517          	auipc	a0,0x6
    8000358c:	be050513          	addi	a0,a0,-1056 # 80009168 <CONSOLE_STATUS+0x158>
    80003590:	00002097          	auipc	ra,0x2
    80003594:	e70080e7          	jalr	-400(ra) # 80005400 <_Z11printStringPKc>
    finishedA = true;
    80003598:	00100793          	li	a5,1
    8000359c:	00008717          	auipc	a4,0x8
    800035a0:	2cf70623          	sb	a5,716(a4) # 8000b868 <_ZL9finishedA>
}
    800035a4:	01813083          	ld	ra,24(sp)
    800035a8:	01013403          	ld	s0,16(sp)
    800035ac:	00813483          	ld	s1,8(sp)
    800035b0:	00013903          	ld	s2,0(sp)
    800035b4:	02010113          	addi	sp,sp,32
    800035b8:	00008067          	ret

00000000800035bc <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    800035bc:	fe010113          	addi	sp,sp,-32
    800035c0:	00113c23          	sd	ra,24(sp)
    800035c4:	00813823          	sd	s0,16(sp)
    800035c8:	00913423          	sd	s1,8(sp)
    800035cc:	01213023          	sd	s2,0(sp)
    800035d0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800035d4:	00000913          	li	s2,0
    800035d8:	0380006f          	j	80003610 <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800035dc:	ffffe097          	auipc	ra,0xffffe
    800035e0:	ecc080e7          	jalr	-308(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800035e4:	00148493          	addi	s1,s1,1
    800035e8:	000027b7          	lui	a5,0x2
    800035ec:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800035f0:	0097ee63          	bltu	a5,s1,8000360c <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800035f4:	00000713          	li	a4,0
    800035f8:	000077b7          	lui	a5,0x7
    800035fc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80003600:	fce7eee3          	bltu	a5,a4,800035dc <_ZN7WorkerB11workerBodyBEPv+0x20>
    80003604:	00170713          	addi	a4,a4,1
    80003608:	ff1ff06f          	j	800035f8 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    8000360c:	00190913          	addi	s2,s2,1
    80003610:	00f00793          	li	a5,15
    80003614:	0527e063          	bltu	a5,s2,80003654 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80003618:	00006517          	auipc	a0,0x6
    8000361c:	b6050513          	addi	a0,a0,-1184 # 80009178 <CONSOLE_STATUS+0x168>
    80003620:	00002097          	auipc	ra,0x2
    80003624:	de0080e7          	jalr	-544(ra) # 80005400 <_Z11printStringPKc>
    80003628:	00000613          	li	a2,0
    8000362c:	00a00593          	li	a1,10
    80003630:	0009051b          	sext.w	a0,s2
    80003634:	00002097          	auipc	ra,0x2
    80003638:	f7c080e7          	jalr	-132(ra) # 800055b0 <_Z8printIntiii>
    8000363c:	00006517          	auipc	a0,0x6
    80003640:	d7450513          	addi	a0,a0,-652 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80003644:	00002097          	auipc	ra,0x2
    80003648:	dbc080e7          	jalr	-580(ra) # 80005400 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000364c:	00000493          	li	s1,0
    80003650:	f99ff06f          	j	800035e8 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    80003654:	00006517          	auipc	a0,0x6
    80003658:	b2c50513          	addi	a0,a0,-1236 # 80009180 <CONSOLE_STATUS+0x170>
    8000365c:	00002097          	auipc	ra,0x2
    80003660:	da4080e7          	jalr	-604(ra) # 80005400 <_Z11printStringPKc>
    finishedB = true;
    80003664:	00100793          	li	a5,1
    80003668:	00008717          	auipc	a4,0x8
    8000366c:	20f700a3          	sb	a5,513(a4) # 8000b869 <_ZL9finishedB>
    thread_dispatch();
    80003670:	ffffe097          	auipc	ra,0xffffe
    80003674:	e38080e7          	jalr	-456(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80003678:	01813083          	ld	ra,24(sp)
    8000367c:	01013403          	ld	s0,16(sp)
    80003680:	00813483          	ld	s1,8(sp)
    80003684:	00013903          	ld	s2,0(sp)
    80003688:	02010113          	addi	sp,sp,32
    8000368c:	00008067          	ret

0000000080003690 <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    80003690:	fe010113          	addi	sp,sp,-32
    80003694:	00113c23          	sd	ra,24(sp)
    80003698:	00813823          	sd	s0,16(sp)
    8000369c:	00913423          	sd	s1,8(sp)
    800036a0:	01213023          	sd	s2,0(sp)
    800036a4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    800036a8:	00000493          	li	s1,0
    800036ac:	0400006f          	j	800036ec <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    800036b0:	00006517          	auipc	a0,0x6
    800036b4:	ae050513          	addi	a0,a0,-1312 # 80009190 <CONSOLE_STATUS+0x180>
    800036b8:	00002097          	auipc	ra,0x2
    800036bc:	d48080e7          	jalr	-696(ra) # 80005400 <_Z11printStringPKc>
    800036c0:	00000613          	li	a2,0
    800036c4:	00a00593          	li	a1,10
    800036c8:	00048513          	mv	a0,s1
    800036cc:	00002097          	auipc	ra,0x2
    800036d0:	ee4080e7          	jalr	-284(ra) # 800055b0 <_Z8printIntiii>
    800036d4:	00006517          	auipc	a0,0x6
    800036d8:	cdc50513          	addi	a0,a0,-804 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800036dc:	00002097          	auipc	ra,0x2
    800036e0:	d24080e7          	jalr	-732(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800036e4:	0014849b          	addiw	s1,s1,1
    800036e8:	0ff4f493          	andi	s1,s1,255
    800036ec:	00200793          	li	a5,2
    800036f0:	fc97f0e3          	bgeu	a5,s1,800036b0 <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    800036f4:	00006517          	auipc	a0,0x6
    800036f8:	aa450513          	addi	a0,a0,-1372 # 80009198 <CONSOLE_STATUS+0x188>
    800036fc:	00002097          	auipc	ra,0x2
    80003700:	d04080e7          	jalr	-764(ra) # 80005400 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80003704:	00700313          	li	t1,7
    thread_dispatch();
    80003708:	ffffe097          	auipc	ra,0xffffe
    8000370c:	da0080e7          	jalr	-608(ra) # 800014a8 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80003710:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    80003714:	00006517          	auipc	a0,0x6
    80003718:	a9450513          	addi	a0,a0,-1388 # 800091a8 <CONSOLE_STATUS+0x198>
    8000371c:	00002097          	auipc	ra,0x2
    80003720:	ce4080e7          	jalr	-796(ra) # 80005400 <_Z11printStringPKc>
    80003724:	00000613          	li	a2,0
    80003728:	00a00593          	li	a1,10
    8000372c:	0009051b          	sext.w	a0,s2
    80003730:	00002097          	auipc	ra,0x2
    80003734:	e80080e7          	jalr	-384(ra) # 800055b0 <_Z8printIntiii>
    80003738:	00006517          	auipc	a0,0x6
    8000373c:	c7850513          	addi	a0,a0,-904 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80003740:	00002097          	auipc	ra,0x2
    80003744:	cc0080e7          	jalr	-832(ra) # 80005400 <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    80003748:	00c00513          	li	a0,12
    8000374c:	00000097          	auipc	ra,0x0
    80003750:	d30080e7          	jalr	-720(ra) # 8000347c <_ZL9fibonaccim>
    80003754:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80003758:	00006517          	auipc	a0,0x6
    8000375c:	a5850513          	addi	a0,a0,-1448 # 800091b0 <CONSOLE_STATUS+0x1a0>
    80003760:	00002097          	auipc	ra,0x2
    80003764:	ca0080e7          	jalr	-864(ra) # 80005400 <_Z11printStringPKc>
    80003768:	00000613          	li	a2,0
    8000376c:	00a00593          	li	a1,10
    80003770:	0009051b          	sext.w	a0,s2
    80003774:	00002097          	auipc	ra,0x2
    80003778:	e3c080e7          	jalr	-452(ra) # 800055b0 <_Z8printIntiii>
    8000377c:	00006517          	auipc	a0,0x6
    80003780:	c3450513          	addi	a0,a0,-972 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80003784:	00002097          	auipc	ra,0x2
    80003788:	c7c080e7          	jalr	-900(ra) # 80005400 <_Z11printStringPKc>
    8000378c:	0400006f          	j	800037cc <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    80003790:	00006517          	auipc	a0,0x6
    80003794:	a0050513          	addi	a0,a0,-1536 # 80009190 <CONSOLE_STATUS+0x180>
    80003798:	00002097          	auipc	ra,0x2
    8000379c:	c68080e7          	jalr	-920(ra) # 80005400 <_Z11printStringPKc>
    800037a0:	00000613          	li	a2,0
    800037a4:	00a00593          	li	a1,10
    800037a8:	00048513          	mv	a0,s1
    800037ac:	00002097          	auipc	ra,0x2
    800037b0:	e04080e7          	jalr	-508(ra) # 800055b0 <_Z8printIntiii>
    800037b4:	00006517          	auipc	a0,0x6
    800037b8:	bfc50513          	addi	a0,a0,-1028 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800037bc:	00002097          	auipc	ra,0x2
    800037c0:	c44080e7          	jalr	-956(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 6; i++) {
    800037c4:	0014849b          	addiw	s1,s1,1
    800037c8:	0ff4f493          	andi	s1,s1,255
    800037cc:	00500793          	li	a5,5
    800037d0:	fc97f0e3          	bgeu	a5,s1,80003790 <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    800037d4:	00006517          	auipc	a0,0x6
    800037d8:	99450513          	addi	a0,a0,-1644 # 80009168 <CONSOLE_STATUS+0x158>
    800037dc:	00002097          	auipc	ra,0x2
    800037e0:	c24080e7          	jalr	-988(ra) # 80005400 <_Z11printStringPKc>
    finishedC = true;
    800037e4:	00100793          	li	a5,1
    800037e8:	00008717          	auipc	a4,0x8
    800037ec:	08f70123          	sb	a5,130(a4) # 8000b86a <_ZL9finishedC>
    thread_dispatch();
    800037f0:	ffffe097          	auipc	ra,0xffffe
    800037f4:	cb8080e7          	jalr	-840(ra) # 800014a8 <_Z15thread_dispatchv>
}
    800037f8:	01813083          	ld	ra,24(sp)
    800037fc:	01013403          	ld	s0,16(sp)
    80003800:	00813483          	ld	s1,8(sp)
    80003804:	00013903          	ld	s2,0(sp)
    80003808:	02010113          	addi	sp,sp,32
    8000380c:	00008067          	ret

0000000080003810 <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    80003810:	fe010113          	addi	sp,sp,-32
    80003814:	00113c23          	sd	ra,24(sp)
    80003818:	00813823          	sd	s0,16(sp)
    8000381c:	00913423          	sd	s1,8(sp)
    80003820:	01213023          	sd	s2,0(sp)
    80003824:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80003828:	00a00493          	li	s1,10
    8000382c:	0400006f          	j	8000386c <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003830:	00006517          	auipc	a0,0x6
    80003834:	99050513          	addi	a0,a0,-1648 # 800091c0 <CONSOLE_STATUS+0x1b0>
    80003838:	00002097          	auipc	ra,0x2
    8000383c:	bc8080e7          	jalr	-1080(ra) # 80005400 <_Z11printStringPKc>
    80003840:	00000613          	li	a2,0
    80003844:	00a00593          	li	a1,10
    80003848:	00048513          	mv	a0,s1
    8000384c:	00002097          	auipc	ra,0x2
    80003850:	d64080e7          	jalr	-668(ra) # 800055b0 <_Z8printIntiii>
    80003854:	00006517          	auipc	a0,0x6
    80003858:	b5c50513          	addi	a0,a0,-1188 # 800093b0 <CONSOLE_STATUS+0x3a0>
    8000385c:	00002097          	auipc	ra,0x2
    80003860:	ba4080e7          	jalr	-1116(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003864:	0014849b          	addiw	s1,s1,1
    80003868:	0ff4f493          	andi	s1,s1,255
    8000386c:	00c00793          	li	a5,12
    80003870:	fc97f0e3          	bgeu	a5,s1,80003830 <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003874:	00006517          	auipc	a0,0x6
    80003878:	95450513          	addi	a0,a0,-1708 # 800091c8 <CONSOLE_STATUS+0x1b8>
    8000387c:	00002097          	auipc	ra,0x2
    80003880:	b84080e7          	jalr	-1148(ra) # 80005400 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003884:	00500313          	li	t1,5
    thread_dispatch();
    80003888:	ffffe097          	auipc	ra,0xffffe
    8000388c:	c20080e7          	jalr	-992(ra) # 800014a8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80003890:	01000513          	li	a0,16
    80003894:	00000097          	auipc	ra,0x0
    80003898:	be8080e7          	jalr	-1048(ra) # 8000347c <_ZL9fibonaccim>
    8000389c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800038a0:	00006517          	auipc	a0,0x6
    800038a4:	93850513          	addi	a0,a0,-1736 # 800091d8 <CONSOLE_STATUS+0x1c8>
    800038a8:	00002097          	auipc	ra,0x2
    800038ac:	b58080e7          	jalr	-1192(ra) # 80005400 <_Z11printStringPKc>
    800038b0:	00000613          	li	a2,0
    800038b4:	00a00593          	li	a1,10
    800038b8:	0009051b          	sext.w	a0,s2
    800038bc:	00002097          	auipc	ra,0x2
    800038c0:	cf4080e7          	jalr	-780(ra) # 800055b0 <_Z8printIntiii>
    800038c4:	00006517          	auipc	a0,0x6
    800038c8:	aec50513          	addi	a0,a0,-1300 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800038cc:	00002097          	auipc	ra,0x2
    800038d0:	b34080e7          	jalr	-1228(ra) # 80005400 <_Z11printStringPKc>
    800038d4:	0400006f          	j	80003914 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800038d8:	00006517          	auipc	a0,0x6
    800038dc:	8e850513          	addi	a0,a0,-1816 # 800091c0 <CONSOLE_STATUS+0x1b0>
    800038e0:	00002097          	auipc	ra,0x2
    800038e4:	b20080e7          	jalr	-1248(ra) # 80005400 <_Z11printStringPKc>
    800038e8:	00000613          	li	a2,0
    800038ec:	00a00593          	li	a1,10
    800038f0:	00048513          	mv	a0,s1
    800038f4:	00002097          	auipc	ra,0x2
    800038f8:	cbc080e7          	jalr	-836(ra) # 800055b0 <_Z8printIntiii>
    800038fc:	00006517          	auipc	a0,0x6
    80003900:	ab450513          	addi	a0,a0,-1356 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80003904:	00002097          	auipc	ra,0x2
    80003908:	afc080e7          	jalr	-1284(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000390c:	0014849b          	addiw	s1,s1,1
    80003910:	0ff4f493          	andi	s1,s1,255
    80003914:	00f00793          	li	a5,15
    80003918:	fc97f0e3          	bgeu	a5,s1,800038d8 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    8000391c:	00006517          	auipc	a0,0x6
    80003920:	8cc50513          	addi	a0,a0,-1844 # 800091e8 <CONSOLE_STATUS+0x1d8>
    80003924:	00002097          	auipc	ra,0x2
    80003928:	adc080e7          	jalr	-1316(ra) # 80005400 <_Z11printStringPKc>
    finishedD = true;
    8000392c:	00100793          	li	a5,1
    80003930:	00008717          	auipc	a4,0x8
    80003934:	f2f70da3          	sb	a5,-197(a4) # 8000b86b <_ZL9finishedD>
    thread_dispatch();
    80003938:	ffffe097          	auipc	ra,0xffffe
    8000393c:	b70080e7          	jalr	-1168(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80003940:	01813083          	ld	ra,24(sp)
    80003944:	01013403          	ld	s0,16(sp)
    80003948:	00813483          	ld	s1,8(sp)
    8000394c:	00013903          	ld	s2,0(sp)
    80003950:	02010113          	addi	sp,sp,32
    80003954:	00008067          	ret

0000000080003958 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    80003958:	fc010113          	addi	sp,sp,-64
    8000395c:	02113c23          	sd	ra,56(sp)
    80003960:	02813823          	sd	s0,48(sp)
    80003964:	02913423          	sd	s1,40(sp)
    80003968:	03213023          	sd	s2,32(sp)
    8000396c:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    80003970:	01000513          	li	a0,16
    80003974:	ffffe097          	auipc	ra,0xffffe
    80003978:	4a4080e7          	jalr	1188(ra) # 80001e18 <_Znwm>
    8000397c:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    80003980:	ffffe097          	auipc	ra,0xffffe
    80003984:	6fc080e7          	jalr	1788(ra) # 8000207c <_ZN6ThreadC1Ev>
    80003988:	00008797          	auipc	a5,0x8
    8000398c:	c5878793          	addi	a5,a5,-936 # 8000b5e0 <_ZTV7WorkerA+0x10>
    80003990:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003994:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003998:	00006517          	auipc	a0,0x6
    8000399c:	86050513          	addi	a0,a0,-1952 # 800091f8 <CONSOLE_STATUS+0x1e8>
    800039a0:	00002097          	auipc	ra,0x2
    800039a4:	a60080e7          	jalr	-1440(ra) # 80005400 <_Z11printStringPKc>

    threads[1] = new WorkerB();
    800039a8:	01000513          	li	a0,16
    800039ac:	ffffe097          	auipc	ra,0xffffe
    800039b0:	46c080e7          	jalr	1132(ra) # 80001e18 <_Znwm>
    800039b4:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    800039b8:	ffffe097          	auipc	ra,0xffffe
    800039bc:	6c4080e7          	jalr	1732(ra) # 8000207c <_ZN6ThreadC1Ev>
    800039c0:	00008797          	auipc	a5,0x8
    800039c4:	c4878793          	addi	a5,a5,-952 # 8000b608 <_ZTV7WorkerB+0x10>
    800039c8:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    800039cc:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    800039d0:	00006517          	auipc	a0,0x6
    800039d4:	84050513          	addi	a0,a0,-1984 # 80009210 <CONSOLE_STATUS+0x200>
    800039d8:	00002097          	auipc	ra,0x2
    800039dc:	a28080e7          	jalr	-1496(ra) # 80005400 <_Z11printStringPKc>

    threads[2] = new WorkerC();
    800039e0:	01000513          	li	a0,16
    800039e4:	ffffe097          	auipc	ra,0xffffe
    800039e8:	434080e7          	jalr	1076(ra) # 80001e18 <_Znwm>
    800039ec:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    800039f0:	ffffe097          	auipc	ra,0xffffe
    800039f4:	68c080e7          	jalr	1676(ra) # 8000207c <_ZN6ThreadC1Ev>
    800039f8:	00008797          	auipc	a5,0x8
    800039fc:	c3878793          	addi	a5,a5,-968 # 8000b630 <_ZTV7WorkerC+0x10>
    80003a00:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    80003a04:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    80003a08:	00006517          	auipc	a0,0x6
    80003a0c:	82050513          	addi	a0,a0,-2016 # 80009228 <CONSOLE_STATUS+0x218>
    80003a10:	00002097          	auipc	ra,0x2
    80003a14:	9f0080e7          	jalr	-1552(ra) # 80005400 <_Z11printStringPKc>

    threads[3] = new WorkerD();
    80003a18:	01000513          	li	a0,16
    80003a1c:	ffffe097          	auipc	ra,0xffffe
    80003a20:	3fc080e7          	jalr	1020(ra) # 80001e18 <_Znwm>
    80003a24:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    80003a28:	ffffe097          	auipc	ra,0xffffe
    80003a2c:	654080e7          	jalr	1620(ra) # 8000207c <_ZN6ThreadC1Ev>
    80003a30:	00008797          	auipc	a5,0x8
    80003a34:	c2878793          	addi	a5,a5,-984 # 8000b658 <_ZTV7WorkerD+0x10>
    80003a38:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    80003a3c:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    80003a40:	00006517          	auipc	a0,0x6
    80003a44:	80050513          	addi	a0,a0,-2048 # 80009240 <CONSOLE_STATUS+0x230>
    80003a48:	00002097          	auipc	ra,0x2
    80003a4c:	9b8080e7          	jalr	-1608(ra) # 80005400 <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    80003a50:	00000493          	li	s1,0
    80003a54:	00300793          	li	a5,3
    80003a58:	0297c663          	blt	a5,s1,80003a84 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    80003a5c:	00349793          	slli	a5,s1,0x3
    80003a60:	fe040713          	addi	a4,s0,-32
    80003a64:	00f707b3          	add	a5,a4,a5
    80003a68:	fe07b503          	ld	a0,-32(a5)
    80003a6c:	ffffe097          	auipc	ra,0xffffe
    80003a70:	56c080e7          	jalr	1388(ra) # 80001fd8 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003a74:	0014849b          	addiw	s1,s1,1
    80003a78:	fddff06f          	j	80003a54 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003a7c:	ffffe097          	auipc	ra,0xffffe
    80003a80:	5ac080e7          	jalr	1452(ra) # 80002028 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003a84:	00008797          	auipc	a5,0x8
    80003a88:	de47c783          	lbu	a5,-540(a5) # 8000b868 <_ZL9finishedA>
    80003a8c:	fe0788e3          	beqz	a5,80003a7c <_Z20Threads_CPP_API_testv+0x124>
    80003a90:	00008797          	auipc	a5,0x8
    80003a94:	dd97c783          	lbu	a5,-551(a5) # 8000b869 <_ZL9finishedB>
    80003a98:	fe0782e3          	beqz	a5,80003a7c <_Z20Threads_CPP_API_testv+0x124>
    80003a9c:	00008797          	auipc	a5,0x8
    80003aa0:	dce7c783          	lbu	a5,-562(a5) # 8000b86a <_ZL9finishedC>
    80003aa4:	fc078ce3          	beqz	a5,80003a7c <_Z20Threads_CPP_API_testv+0x124>
    80003aa8:	00008797          	auipc	a5,0x8
    80003aac:	dc37c783          	lbu	a5,-573(a5) # 8000b86b <_ZL9finishedD>
    80003ab0:	fc0786e3          	beqz	a5,80003a7c <_Z20Threads_CPP_API_testv+0x124>
    80003ab4:	fc040493          	addi	s1,s0,-64
    80003ab8:	0080006f          	j	80003ac0 <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003abc:	00848493          	addi	s1,s1,8
    80003ac0:	fe040793          	addi	a5,s0,-32
    80003ac4:	08f48663          	beq	s1,a5,80003b50 <_Z20Threads_CPP_API_testv+0x1f8>
    80003ac8:	0004b503          	ld	a0,0(s1)
    80003acc:	fe0508e3          	beqz	a0,80003abc <_Z20Threads_CPP_API_testv+0x164>
    80003ad0:	00053783          	ld	a5,0(a0)
    80003ad4:	0087b783          	ld	a5,8(a5)
    80003ad8:	000780e7          	jalr	a5
    80003adc:	fe1ff06f          	j	80003abc <_Z20Threads_CPP_API_testv+0x164>
    80003ae0:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003ae4:	00048513          	mv	a0,s1
    80003ae8:	ffffe097          	auipc	ra,0xffffe
    80003aec:	380080e7          	jalr	896(ra) # 80001e68 <_ZdlPv>
    80003af0:	00090513          	mv	a0,s2
    80003af4:	00009097          	auipc	ra,0x9
    80003af8:	e84080e7          	jalr	-380(ra) # 8000c978 <_Unwind_Resume>
    80003afc:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    80003b00:	00048513          	mv	a0,s1
    80003b04:	ffffe097          	auipc	ra,0xffffe
    80003b08:	364080e7          	jalr	868(ra) # 80001e68 <_ZdlPv>
    80003b0c:	00090513          	mv	a0,s2
    80003b10:	00009097          	auipc	ra,0x9
    80003b14:	e68080e7          	jalr	-408(ra) # 8000c978 <_Unwind_Resume>
    80003b18:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    80003b1c:	00048513          	mv	a0,s1
    80003b20:	ffffe097          	auipc	ra,0xffffe
    80003b24:	348080e7          	jalr	840(ra) # 80001e68 <_ZdlPv>
    80003b28:	00090513          	mv	a0,s2
    80003b2c:	00009097          	auipc	ra,0x9
    80003b30:	e4c080e7          	jalr	-436(ra) # 8000c978 <_Unwind_Resume>
    80003b34:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    80003b38:	00048513          	mv	a0,s1
    80003b3c:	ffffe097          	auipc	ra,0xffffe
    80003b40:	32c080e7          	jalr	812(ra) # 80001e68 <_ZdlPv>
    80003b44:	00090513          	mv	a0,s2
    80003b48:	00009097          	auipc	ra,0x9
    80003b4c:	e30080e7          	jalr	-464(ra) # 8000c978 <_Unwind_Resume>
}
    80003b50:	03813083          	ld	ra,56(sp)
    80003b54:	03013403          	ld	s0,48(sp)
    80003b58:	02813483          	ld	s1,40(sp)
    80003b5c:	02013903          	ld	s2,32(sp)
    80003b60:	04010113          	addi	sp,sp,64
    80003b64:	00008067          	ret

0000000080003b68 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003b68:	ff010113          	addi	sp,sp,-16
    80003b6c:	00113423          	sd	ra,8(sp)
    80003b70:	00813023          	sd	s0,0(sp)
    80003b74:	01010413          	addi	s0,sp,16
    80003b78:	00008797          	auipc	a5,0x8
    80003b7c:	a6878793          	addi	a5,a5,-1432 # 8000b5e0 <_ZTV7WorkerA+0x10>
    80003b80:	00f53023          	sd	a5,0(a0)
    80003b84:	ffffe097          	auipc	ra,0xffffe
    80003b88:	374080e7          	jalr	884(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80003b8c:	00813083          	ld	ra,8(sp)
    80003b90:	00013403          	ld	s0,0(sp)
    80003b94:	01010113          	addi	sp,sp,16
    80003b98:	00008067          	ret

0000000080003b9c <_ZN7WorkerAD0Ev>:
    80003b9c:	fe010113          	addi	sp,sp,-32
    80003ba0:	00113c23          	sd	ra,24(sp)
    80003ba4:	00813823          	sd	s0,16(sp)
    80003ba8:	00913423          	sd	s1,8(sp)
    80003bac:	02010413          	addi	s0,sp,32
    80003bb0:	00050493          	mv	s1,a0
    80003bb4:	00008797          	auipc	a5,0x8
    80003bb8:	a2c78793          	addi	a5,a5,-1492 # 8000b5e0 <_ZTV7WorkerA+0x10>
    80003bbc:	00f53023          	sd	a5,0(a0)
    80003bc0:	ffffe097          	auipc	ra,0xffffe
    80003bc4:	338080e7          	jalr	824(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80003bc8:	00048513          	mv	a0,s1
    80003bcc:	ffffe097          	auipc	ra,0xffffe
    80003bd0:	29c080e7          	jalr	668(ra) # 80001e68 <_ZdlPv>
    80003bd4:	01813083          	ld	ra,24(sp)
    80003bd8:	01013403          	ld	s0,16(sp)
    80003bdc:	00813483          	ld	s1,8(sp)
    80003be0:	02010113          	addi	sp,sp,32
    80003be4:	00008067          	ret

0000000080003be8 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003be8:	ff010113          	addi	sp,sp,-16
    80003bec:	00113423          	sd	ra,8(sp)
    80003bf0:	00813023          	sd	s0,0(sp)
    80003bf4:	01010413          	addi	s0,sp,16
    80003bf8:	00008797          	auipc	a5,0x8
    80003bfc:	a1078793          	addi	a5,a5,-1520 # 8000b608 <_ZTV7WorkerB+0x10>
    80003c00:	00f53023          	sd	a5,0(a0)
    80003c04:	ffffe097          	auipc	ra,0xffffe
    80003c08:	2f4080e7          	jalr	756(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80003c0c:	00813083          	ld	ra,8(sp)
    80003c10:	00013403          	ld	s0,0(sp)
    80003c14:	01010113          	addi	sp,sp,16
    80003c18:	00008067          	ret

0000000080003c1c <_ZN7WorkerBD0Ev>:
    80003c1c:	fe010113          	addi	sp,sp,-32
    80003c20:	00113c23          	sd	ra,24(sp)
    80003c24:	00813823          	sd	s0,16(sp)
    80003c28:	00913423          	sd	s1,8(sp)
    80003c2c:	02010413          	addi	s0,sp,32
    80003c30:	00050493          	mv	s1,a0
    80003c34:	00008797          	auipc	a5,0x8
    80003c38:	9d478793          	addi	a5,a5,-1580 # 8000b608 <_ZTV7WorkerB+0x10>
    80003c3c:	00f53023          	sd	a5,0(a0)
    80003c40:	ffffe097          	auipc	ra,0xffffe
    80003c44:	2b8080e7          	jalr	696(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80003c48:	00048513          	mv	a0,s1
    80003c4c:	ffffe097          	auipc	ra,0xffffe
    80003c50:	21c080e7          	jalr	540(ra) # 80001e68 <_ZdlPv>
    80003c54:	01813083          	ld	ra,24(sp)
    80003c58:	01013403          	ld	s0,16(sp)
    80003c5c:	00813483          	ld	s1,8(sp)
    80003c60:	02010113          	addi	sp,sp,32
    80003c64:	00008067          	ret

0000000080003c68 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003c68:	ff010113          	addi	sp,sp,-16
    80003c6c:	00113423          	sd	ra,8(sp)
    80003c70:	00813023          	sd	s0,0(sp)
    80003c74:	01010413          	addi	s0,sp,16
    80003c78:	00008797          	auipc	a5,0x8
    80003c7c:	9b878793          	addi	a5,a5,-1608 # 8000b630 <_ZTV7WorkerC+0x10>
    80003c80:	00f53023          	sd	a5,0(a0)
    80003c84:	ffffe097          	auipc	ra,0xffffe
    80003c88:	274080e7          	jalr	628(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80003c8c:	00813083          	ld	ra,8(sp)
    80003c90:	00013403          	ld	s0,0(sp)
    80003c94:	01010113          	addi	sp,sp,16
    80003c98:	00008067          	ret

0000000080003c9c <_ZN7WorkerCD0Ev>:
    80003c9c:	fe010113          	addi	sp,sp,-32
    80003ca0:	00113c23          	sd	ra,24(sp)
    80003ca4:	00813823          	sd	s0,16(sp)
    80003ca8:	00913423          	sd	s1,8(sp)
    80003cac:	02010413          	addi	s0,sp,32
    80003cb0:	00050493          	mv	s1,a0
    80003cb4:	00008797          	auipc	a5,0x8
    80003cb8:	97c78793          	addi	a5,a5,-1668 # 8000b630 <_ZTV7WorkerC+0x10>
    80003cbc:	00f53023          	sd	a5,0(a0)
    80003cc0:	ffffe097          	auipc	ra,0xffffe
    80003cc4:	238080e7          	jalr	568(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80003cc8:	00048513          	mv	a0,s1
    80003ccc:	ffffe097          	auipc	ra,0xffffe
    80003cd0:	19c080e7          	jalr	412(ra) # 80001e68 <_ZdlPv>
    80003cd4:	01813083          	ld	ra,24(sp)
    80003cd8:	01013403          	ld	s0,16(sp)
    80003cdc:	00813483          	ld	s1,8(sp)
    80003ce0:	02010113          	addi	sp,sp,32
    80003ce4:	00008067          	ret

0000000080003ce8 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003ce8:	ff010113          	addi	sp,sp,-16
    80003cec:	00113423          	sd	ra,8(sp)
    80003cf0:	00813023          	sd	s0,0(sp)
    80003cf4:	01010413          	addi	s0,sp,16
    80003cf8:	00008797          	auipc	a5,0x8
    80003cfc:	96078793          	addi	a5,a5,-1696 # 8000b658 <_ZTV7WorkerD+0x10>
    80003d00:	00f53023          	sd	a5,0(a0)
    80003d04:	ffffe097          	auipc	ra,0xffffe
    80003d08:	1f4080e7          	jalr	500(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80003d0c:	00813083          	ld	ra,8(sp)
    80003d10:	00013403          	ld	s0,0(sp)
    80003d14:	01010113          	addi	sp,sp,16
    80003d18:	00008067          	ret

0000000080003d1c <_ZN7WorkerDD0Ev>:
    80003d1c:	fe010113          	addi	sp,sp,-32
    80003d20:	00113c23          	sd	ra,24(sp)
    80003d24:	00813823          	sd	s0,16(sp)
    80003d28:	00913423          	sd	s1,8(sp)
    80003d2c:	02010413          	addi	s0,sp,32
    80003d30:	00050493          	mv	s1,a0
    80003d34:	00008797          	auipc	a5,0x8
    80003d38:	92478793          	addi	a5,a5,-1756 # 8000b658 <_ZTV7WorkerD+0x10>
    80003d3c:	00f53023          	sd	a5,0(a0)
    80003d40:	ffffe097          	auipc	ra,0xffffe
    80003d44:	1b8080e7          	jalr	440(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80003d48:	00048513          	mv	a0,s1
    80003d4c:	ffffe097          	auipc	ra,0xffffe
    80003d50:	11c080e7          	jalr	284(ra) # 80001e68 <_ZdlPv>
    80003d54:	01813083          	ld	ra,24(sp)
    80003d58:	01013403          	ld	s0,16(sp)
    80003d5c:	00813483          	ld	s1,8(sp)
    80003d60:	02010113          	addi	sp,sp,32
    80003d64:	00008067          	ret

0000000080003d68 <_ZN7WorkerA3runEv>:
    void run() override {
    80003d68:	ff010113          	addi	sp,sp,-16
    80003d6c:	00113423          	sd	ra,8(sp)
    80003d70:	00813023          	sd	s0,0(sp)
    80003d74:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003d78:	00000593          	li	a1,0
    80003d7c:	fffff097          	auipc	ra,0xfffff
    80003d80:	774080e7          	jalr	1908(ra) # 800034f0 <_ZN7WorkerA11workerBodyAEPv>
    }
    80003d84:	00813083          	ld	ra,8(sp)
    80003d88:	00013403          	ld	s0,0(sp)
    80003d8c:	01010113          	addi	sp,sp,16
    80003d90:	00008067          	ret

0000000080003d94 <_ZN7WorkerB3runEv>:
    void run() override {
    80003d94:	ff010113          	addi	sp,sp,-16
    80003d98:	00113423          	sd	ra,8(sp)
    80003d9c:	00813023          	sd	s0,0(sp)
    80003da0:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003da4:	00000593          	li	a1,0
    80003da8:	00000097          	auipc	ra,0x0
    80003dac:	814080e7          	jalr	-2028(ra) # 800035bc <_ZN7WorkerB11workerBodyBEPv>
    }
    80003db0:	00813083          	ld	ra,8(sp)
    80003db4:	00013403          	ld	s0,0(sp)
    80003db8:	01010113          	addi	sp,sp,16
    80003dbc:	00008067          	ret

0000000080003dc0 <_ZN7WorkerC3runEv>:
    void run() override {
    80003dc0:	ff010113          	addi	sp,sp,-16
    80003dc4:	00113423          	sd	ra,8(sp)
    80003dc8:	00813023          	sd	s0,0(sp)
    80003dcc:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    80003dd0:	00000593          	li	a1,0
    80003dd4:	00000097          	auipc	ra,0x0
    80003dd8:	8bc080e7          	jalr	-1860(ra) # 80003690 <_ZN7WorkerC11workerBodyCEPv>
    }
    80003ddc:	00813083          	ld	ra,8(sp)
    80003de0:	00013403          	ld	s0,0(sp)
    80003de4:	01010113          	addi	sp,sp,16
    80003de8:	00008067          	ret

0000000080003dec <_ZN7WorkerD3runEv>:
    void run() override {
    80003dec:	ff010113          	addi	sp,sp,-16
    80003df0:	00113423          	sd	ra,8(sp)
    80003df4:	00813023          	sd	s0,0(sp)
    80003df8:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80003dfc:	00000593          	li	a1,0
    80003e00:	00000097          	auipc	ra,0x0
    80003e04:	a10080e7          	jalr	-1520(ra) # 80003810 <_ZN7WorkerD11workerBodyDEPv>
    }
    80003e08:	00813083          	ld	ra,8(sp)
    80003e0c:	00013403          	ld	s0,0(sp)
    80003e10:	01010113          	addi	sp,sp,16
    80003e14:	00008067          	ret

0000000080003e18 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    80003e18:	f8010113          	addi	sp,sp,-128
    80003e1c:	06113c23          	sd	ra,120(sp)
    80003e20:	06813823          	sd	s0,112(sp)
    80003e24:	06913423          	sd	s1,104(sp)
    80003e28:	07213023          	sd	s2,96(sp)
    80003e2c:	05313c23          	sd	s3,88(sp)
    80003e30:	05413823          	sd	s4,80(sp)
    80003e34:	05513423          	sd	s5,72(sp)
    80003e38:	05613023          	sd	s6,64(sp)
    80003e3c:	03713c23          	sd	s7,56(sp)
    80003e40:	03813823          	sd	s8,48(sp)
    80003e44:	03913423          	sd	s9,40(sp)
    80003e48:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    80003e4c:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    80003e50:	00005517          	auipc	a0,0x5
    80003e54:	23050513          	addi	a0,a0,560 # 80009080 <CONSOLE_STATUS+0x70>
    80003e58:	00001097          	auipc	ra,0x1
    80003e5c:	5a8080e7          	jalr	1448(ra) # 80005400 <_Z11printStringPKc>
    getString(input, 30);
    80003e60:	01e00593          	li	a1,30
    80003e64:	f8040493          	addi	s1,s0,-128
    80003e68:	00048513          	mv	a0,s1
    80003e6c:	00001097          	auipc	ra,0x1
    80003e70:	61c080e7          	jalr	1564(ra) # 80005488 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003e74:	00048513          	mv	a0,s1
    80003e78:	00001097          	auipc	ra,0x1
    80003e7c:	6e8080e7          	jalr	1768(ra) # 80005560 <_Z11stringToIntPKc>
    80003e80:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80003e84:	00005517          	auipc	a0,0x5
    80003e88:	21c50513          	addi	a0,a0,540 # 800090a0 <CONSOLE_STATUS+0x90>
    80003e8c:	00001097          	auipc	ra,0x1
    80003e90:	574080e7          	jalr	1396(ra) # 80005400 <_Z11printStringPKc>
    getString(input, 30);
    80003e94:	01e00593          	li	a1,30
    80003e98:	00048513          	mv	a0,s1
    80003e9c:	00001097          	auipc	ra,0x1
    80003ea0:	5ec080e7          	jalr	1516(ra) # 80005488 <_Z9getStringPci>
    n = stringToInt(input);
    80003ea4:	00048513          	mv	a0,s1
    80003ea8:	00001097          	auipc	ra,0x1
    80003eac:	6b8080e7          	jalr	1720(ra) # 80005560 <_Z11stringToIntPKc>
    80003eb0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003eb4:	00005517          	auipc	a0,0x5
    80003eb8:	20c50513          	addi	a0,a0,524 # 800090c0 <CONSOLE_STATUS+0xb0>
    80003ebc:	00001097          	auipc	ra,0x1
    80003ec0:	544080e7          	jalr	1348(ra) # 80005400 <_Z11printStringPKc>
    printInt(threadNum);
    80003ec4:	00000613          	li	a2,0
    80003ec8:	00a00593          	li	a1,10
    80003ecc:	00098513          	mv	a0,s3
    80003ed0:	00001097          	auipc	ra,0x1
    80003ed4:	6e0080e7          	jalr	1760(ra) # 800055b0 <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003ed8:	00005517          	auipc	a0,0x5
    80003edc:	20050513          	addi	a0,a0,512 # 800090d8 <CONSOLE_STATUS+0xc8>
    80003ee0:	00001097          	auipc	ra,0x1
    80003ee4:	520080e7          	jalr	1312(ra) # 80005400 <_Z11printStringPKc>
    printInt(n);
    80003ee8:	00000613          	li	a2,0
    80003eec:	00a00593          	li	a1,10
    80003ef0:	00048513          	mv	a0,s1
    80003ef4:	00001097          	auipc	ra,0x1
    80003ef8:	6bc080e7          	jalr	1724(ra) # 800055b0 <_Z8printIntiii>
    printString(".\n");
    80003efc:	00005517          	auipc	a0,0x5
    80003f00:	14c50513          	addi	a0,a0,332 # 80009048 <CONSOLE_STATUS+0x38>
    80003f04:	00001097          	auipc	ra,0x1
    80003f08:	4fc080e7          	jalr	1276(ra) # 80005400 <_Z11printStringPKc>
    if (threadNum > n) {
    80003f0c:	0334c463          	blt	s1,s3,80003f34 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80003f10:	03305c63          	blez	s3,80003f48 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80003f14:	03800513          	li	a0,56
    80003f18:	ffffe097          	auipc	ra,0xffffe
    80003f1c:	f00080e7          	jalr	-256(ra) # 80001e18 <_Znwm>
    80003f20:	00050a93          	mv	s5,a0
    80003f24:	00048593          	mv	a1,s1
    80003f28:	00001097          	auipc	ra,0x1
    80003f2c:	7a8080e7          	jalr	1960(ra) # 800056d0 <_ZN9BufferCPPC1Ei>
    80003f30:	0300006f          	j	80003f60 <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003f34:	00005517          	auipc	a0,0x5
    80003f38:	1bc50513          	addi	a0,a0,444 # 800090f0 <CONSOLE_STATUS+0xe0>
    80003f3c:	00001097          	auipc	ra,0x1
    80003f40:	4c4080e7          	jalr	1220(ra) # 80005400 <_Z11printStringPKc>
        return;
    80003f44:	0140006f          	j	80003f58 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003f48:	00005517          	auipc	a0,0x5
    80003f4c:	1e850513          	addi	a0,a0,488 # 80009130 <CONSOLE_STATUS+0x120>
    80003f50:	00001097          	auipc	ra,0x1
    80003f54:	4b0080e7          	jalr	1200(ra) # 80005400 <_Z11printStringPKc>
        return;
    80003f58:	000c0113          	mv	sp,s8
    80003f5c:	2140006f          	j	80004170 <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80003f60:	01000513          	li	a0,16
    80003f64:	ffffe097          	auipc	ra,0xffffe
    80003f68:	eb4080e7          	jalr	-332(ra) # 80001e18 <_Znwm>
    80003f6c:	00050913          	mv	s2,a0
    80003f70:	00000593          	li	a1,0
    80003f74:	ffffe097          	auipc	ra,0xffffe
    80003f78:	150080e7          	jalr	336(ra) # 800020c4 <_ZN9SemaphoreC1Ej>
    80003f7c:	00008797          	auipc	a5,0x8
    80003f80:	8f27be23          	sd	s2,-1796(a5) # 8000b878 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80003f84:	00399793          	slli	a5,s3,0x3
    80003f88:	00f78793          	addi	a5,a5,15
    80003f8c:	ff07f793          	andi	a5,a5,-16
    80003f90:	40f10133          	sub	sp,sp,a5
    80003f94:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80003f98:	0019871b          	addiw	a4,s3,1
    80003f9c:	00171793          	slli	a5,a4,0x1
    80003fa0:	00e787b3          	add	a5,a5,a4
    80003fa4:	00379793          	slli	a5,a5,0x3
    80003fa8:	00f78793          	addi	a5,a5,15
    80003fac:	ff07f793          	andi	a5,a5,-16
    80003fb0:	40f10133          	sub	sp,sp,a5
    80003fb4:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80003fb8:	00199493          	slli	s1,s3,0x1
    80003fbc:	013484b3          	add	s1,s1,s3
    80003fc0:	00349493          	slli	s1,s1,0x3
    80003fc4:	009b04b3          	add	s1,s6,s1
    80003fc8:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80003fcc:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80003fd0:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003fd4:	01800513          	li	a0,24
    80003fd8:	ffffe097          	auipc	ra,0xffffe
    80003fdc:	e40080e7          	jalr	-448(ra) # 80001e18 <_Znwm>
    80003fe0:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80003fe4:	ffffe097          	auipc	ra,0xffffe
    80003fe8:	098080e7          	jalr	152(ra) # 8000207c <_ZN6ThreadC1Ev>
    80003fec:	00007797          	auipc	a5,0x7
    80003ff0:	6e478793          	addi	a5,a5,1764 # 8000b6d0 <_ZTV8Consumer+0x10>
    80003ff4:	00fbb023          	sd	a5,0(s7)
    80003ff8:	009bb823          	sd	s1,16(s7)
    consumer->start();
    80003ffc:	000b8513          	mv	a0,s7
    80004000:	ffffe097          	auipc	ra,0xffffe
    80004004:	fd8080e7          	jalr	-40(ra) # 80001fd8 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80004008:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    8000400c:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80004010:	00008797          	auipc	a5,0x8
    80004014:	8687b783          	ld	a5,-1944(a5) # 8000b878 <_ZL10waitForAll>
    80004018:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    8000401c:	01800513          	li	a0,24
    80004020:	ffffe097          	auipc	ra,0xffffe
    80004024:	df8080e7          	jalr	-520(ra) # 80001e18 <_Znwm>
    80004028:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    8000402c:	ffffe097          	auipc	ra,0xffffe
    80004030:	050080e7          	jalr	80(ra) # 8000207c <_ZN6ThreadC1Ev>
    80004034:	00007797          	auipc	a5,0x7
    80004038:	64c78793          	addi	a5,a5,1612 # 8000b680 <_ZTV16ProducerKeyborad+0x10>
    8000403c:	00f4b023          	sd	a5,0(s1)
    80004040:	0164b823          	sd	s6,16(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004044:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80004048:	00048513          	mv	a0,s1
    8000404c:	ffffe097          	auipc	ra,0xffffe
    80004050:	f8c080e7          	jalr	-116(ra) # 80001fd8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004054:	00100913          	li	s2,1
    80004058:	0300006f          	j	80004088 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    8000405c:	00007797          	auipc	a5,0x7
    80004060:	64c78793          	addi	a5,a5,1612 # 8000b6a8 <_ZTV8Producer+0x10>
    80004064:	00fcb023          	sd	a5,0(s9)
    80004068:	009cb823          	sd	s1,16(s9)
        producers[i] = new Producer(&threadData[i]);
    8000406c:	00391793          	slli	a5,s2,0x3
    80004070:	00fa07b3          	add	a5,s4,a5
    80004074:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80004078:	000c8513          	mv	a0,s9
    8000407c:	ffffe097          	auipc	ra,0xffffe
    80004080:	f5c080e7          	jalr	-164(ra) # 80001fd8 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80004084:	0019091b          	addiw	s2,s2,1
    80004088:	05395263          	bge	s2,s3,800040cc <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    8000408c:	00191493          	slli	s1,s2,0x1
    80004090:	012484b3          	add	s1,s1,s2
    80004094:	00349493          	slli	s1,s1,0x3
    80004098:	009b04b3          	add	s1,s6,s1
    8000409c:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    800040a0:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    800040a4:	00007797          	auipc	a5,0x7
    800040a8:	7d47b783          	ld	a5,2004(a5) # 8000b878 <_ZL10waitForAll>
    800040ac:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    800040b0:	01800513          	li	a0,24
    800040b4:	ffffe097          	auipc	ra,0xffffe
    800040b8:	d64080e7          	jalr	-668(ra) # 80001e18 <_Znwm>
    800040bc:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    800040c0:	ffffe097          	auipc	ra,0xffffe
    800040c4:	fbc080e7          	jalr	-68(ra) # 8000207c <_ZN6ThreadC1Ev>
    800040c8:	f95ff06f          	j	8000405c <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    800040cc:	ffffe097          	auipc	ra,0xffffe
    800040d0:	f5c080e7          	jalr	-164(ra) # 80002028 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    800040d4:	00000493          	li	s1,0
    800040d8:	0099ce63          	blt	s3,s1,800040f4 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    800040dc:	00007517          	auipc	a0,0x7
    800040e0:	79c53503          	ld	a0,1948(a0) # 8000b878 <_ZL10waitForAll>
    800040e4:	ffffe097          	auipc	ra,0xffffe
    800040e8:	01c080e7          	jalr	28(ra) # 80002100 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800040ec:	0014849b          	addiw	s1,s1,1
    800040f0:	fe9ff06f          	j	800040d8 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    800040f4:	00007517          	auipc	a0,0x7
    800040f8:	78453503          	ld	a0,1924(a0) # 8000b878 <_ZL10waitForAll>
    800040fc:	00050863          	beqz	a0,8000410c <_Z20testConsumerProducerv+0x2f4>
    80004100:	00053783          	ld	a5,0(a0)
    80004104:	0087b783          	ld	a5,8(a5)
    80004108:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    8000410c:	00000493          	li	s1,0
    80004110:	0080006f          	j	80004118 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80004114:	0014849b          	addiw	s1,s1,1
    80004118:	0334d263          	bge	s1,s3,8000413c <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    8000411c:	00349793          	slli	a5,s1,0x3
    80004120:	00fa07b3          	add	a5,s4,a5
    80004124:	0007b503          	ld	a0,0(a5)
    80004128:	fe0506e3          	beqz	a0,80004114 <_Z20testConsumerProducerv+0x2fc>
    8000412c:	00053783          	ld	a5,0(a0)
    80004130:	0087b783          	ld	a5,8(a5)
    80004134:	000780e7          	jalr	a5
    80004138:	fddff06f          	j	80004114 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    8000413c:	000b8a63          	beqz	s7,80004150 <_Z20testConsumerProducerv+0x338>
    80004140:	000bb783          	ld	a5,0(s7)
    80004144:	0087b783          	ld	a5,8(a5)
    80004148:	000b8513          	mv	a0,s7
    8000414c:	000780e7          	jalr	a5
    delete buffer;
    80004150:	000a8e63          	beqz	s5,8000416c <_Z20testConsumerProducerv+0x354>
    80004154:	000a8513          	mv	a0,s5
    80004158:	00002097          	auipc	ra,0x2
    8000415c:	870080e7          	jalr	-1936(ra) # 800059c8 <_ZN9BufferCPPD1Ev>
    80004160:	000a8513          	mv	a0,s5
    80004164:	ffffe097          	auipc	ra,0xffffe
    80004168:	d04080e7          	jalr	-764(ra) # 80001e68 <_ZdlPv>
    8000416c:	000c0113          	mv	sp,s8
}
    80004170:	f8040113          	addi	sp,s0,-128
    80004174:	07813083          	ld	ra,120(sp)
    80004178:	07013403          	ld	s0,112(sp)
    8000417c:	06813483          	ld	s1,104(sp)
    80004180:	06013903          	ld	s2,96(sp)
    80004184:	05813983          	ld	s3,88(sp)
    80004188:	05013a03          	ld	s4,80(sp)
    8000418c:	04813a83          	ld	s5,72(sp)
    80004190:	04013b03          	ld	s6,64(sp)
    80004194:	03813b83          	ld	s7,56(sp)
    80004198:	03013c03          	ld	s8,48(sp)
    8000419c:	02813c83          	ld	s9,40(sp)
    800041a0:	08010113          	addi	sp,sp,128
    800041a4:	00008067          	ret
    800041a8:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    800041ac:	000a8513          	mv	a0,s5
    800041b0:	ffffe097          	auipc	ra,0xffffe
    800041b4:	cb8080e7          	jalr	-840(ra) # 80001e68 <_ZdlPv>
    800041b8:	00048513          	mv	a0,s1
    800041bc:	00008097          	auipc	ra,0x8
    800041c0:	7bc080e7          	jalr	1980(ra) # 8000c978 <_Unwind_Resume>
    800041c4:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    800041c8:	00090513          	mv	a0,s2
    800041cc:	ffffe097          	auipc	ra,0xffffe
    800041d0:	c9c080e7          	jalr	-868(ra) # 80001e68 <_ZdlPv>
    800041d4:	00048513          	mv	a0,s1
    800041d8:	00008097          	auipc	ra,0x8
    800041dc:	7a0080e7          	jalr	1952(ra) # 8000c978 <_Unwind_Resume>
    800041e0:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    800041e4:	000b8513          	mv	a0,s7
    800041e8:	ffffe097          	auipc	ra,0xffffe
    800041ec:	c80080e7          	jalr	-896(ra) # 80001e68 <_ZdlPv>
    800041f0:	00048513          	mv	a0,s1
    800041f4:	00008097          	auipc	ra,0x8
    800041f8:	784080e7          	jalr	1924(ra) # 8000c978 <_Unwind_Resume>
    800041fc:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80004200:	00048513          	mv	a0,s1
    80004204:	ffffe097          	auipc	ra,0xffffe
    80004208:	c64080e7          	jalr	-924(ra) # 80001e68 <_ZdlPv>
    8000420c:	00090513          	mv	a0,s2
    80004210:	00008097          	auipc	ra,0x8
    80004214:	768080e7          	jalr	1896(ra) # 8000c978 <_Unwind_Resume>
    80004218:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    8000421c:	000c8513          	mv	a0,s9
    80004220:	ffffe097          	auipc	ra,0xffffe
    80004224:	c48080e7          	jalr	-952(ra) # 80001e68 <_ZdlPv>
    80004228:	00048513          	mv	a0,s1
    8000422c:	00008097          	auipc	ra,0x8
    80004230:	74c080e7          	jalr	1868(ra) # 8000c978 <_Unwind_Resume>

0000000080004234 <_ZN8Consumer3runEv>:
    void run() override {
    80004234:	fd010113          	addi	sp,sp,-48
    80004238:	02113423          	sd	ra,40(sp)
    8000423c:	02813023          	sd	s0,32(sp)
    80004240:	00913c23          	sd	s1,24(sp)
    80004244:	01213823          	sd	s2,16(sp)
    80004248:	01313423          	sd	s3,8(sp)
    8000424c:	03010413          	addi	s0,sp,48
    80004250:	00050913          	mv	s2,a0
        int i = 0;
    80004254:	00000993          	li	s3,0
    80004258:	0100006f          	j	80004268 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    8000425c:	00a00513          	li	a0,10
    80004260:	ffffe097          	auipc	ra,0xffffe
    80004264:	ff4080e7          	jalr	-12(ra) # 80002254 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80004268:	00007797          	auipc	a5,0x7
    8000426c:	6087a783          	lw	a5,1544(a5) # 8000b870 <_ZL9threadEnd>
    80004270:	04079a63          	bnez	a5,800042c4 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80004274:	01093783          	ld	a5,16(s2)
    80004278:	0087b503          	ld	a0,8(a5)
    8000427c:	00001097          	auipc	ra,0x1
    80004280:	638080e7          	jalr	1592(ra) # 800058b4 <_ZN9BufferCPP3getEv>
            i++;
    80004284:	0019849b          	addiw	s1,s3,1
    80004288:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    8000428c:	0ff57513          	andi	a0,a0,255
    80004290:	ffffe097          	auipc	ra,0xffffe
    80004294:	fc4080e7          	jalr	-60(ra) # 80002254 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80004298:	05000793          	li	a5,80
    8000429c:	02f4e4bb          	remw	s1,s1,a5
    800042a0:	fc0494e3          	bnez	s1,80004268 <_ZN8Consumer3runEv+0x34>
    800042a4:	fb9ff06f          	j	8000425c <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    800042a8:	01093783          	ld	a5,16(s2)
    800042ac:	0087b503          	ld	a0,8(a5)
    800042b0:	00001097          	auipc	ra,0x1
    800042b4:	604080e7          	jalr	1540(ra) # 800058b4 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    800042b8:	0ff57513          	andi	a0,a0,255
    800042bc:	ffffe097          	auipc	ra,0xffffe
    800042c0:	f98080e7          	jalr	-104(ra) # 80002254 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    800042c4:	01093783          	ld	a5,16(s2)
    800042c8:	0087b503          	ld	a0,8(a5)
    800042cc:	00001097          	auipc	ra,0x1
    800042d0:	674080e7          	jalr	1652(ra) # 80005940 <_ZN9BufferCPP6getCntEv>
    800042d4:	fca04ae3          	bgtz	a0,800042a8 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    800042d8:	01093783          	ld	a5,16(s2)
    800042dc:	0107b503          	ld	a0,16(a5)
    800042e0:	ffffe097          	auipc	ra,0xffffe
    800042e4:	e4c080e7          	jalr	-436(ra) # 8000212c <_ZN9Semaphore6signalEv>
    }
    800042e8:	02813083          	ld	ra,40(sp)
    800042ec:	02013403          	ld	s0,32(sp)
    800042f0:	01813483          	ld	s1,24(sp)
    800042f4:	01013903          	ld	s2,16(sp)
    800042f8:	00813983          	ld	s3,8(sp)
    800042fc:	03010113          	addi	sp,sp,48
    80004300:	00008067          	ret

0000000080004304 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80004304:	ff010113          	addi	sp,sp,-16
    80004308:	00113423          	sd	ra,8(sp)
    8000430c:	00813023          	sd	s0,0(sp)
    80004310:	01010413          	addi	s0,sp,16
    80004314:	00007797          	auipc	a5,0x7
    80004318:	3bc78793          	addi	a5,a5,956 # 8000b6d0 <_ZTV8Consumer+0x10>
    8000431c:	00f53023          	sd	a5,0(a0)
    80004320:	ffffe097          	auipc	ra,0xffffe
    80004324:	bd8080e7          	jalr	-1064(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80004328:	00813083          	ld	ra,8(sp)
    8000432c:	00013403          	ld	s0,0(sp)
    80004330:	01010113          	addi	sp,sp,16
    80004334:	00008067          	ret

0000000080004338 <_ZN8ConsumerD0Ev>:
    80004338:	fe010113          	addi	sp,sp,-32
    8000433c:	00113c23          	sd	ra,24(sp)
    80004340:	00813823          	sd	s0,16(sp)
    80004344:	00913423          	sd	s1,8(sp)
    80004348:	02010413          	addi	s0,sp,32
    8000434c:	00050493          	mv	s1,a0
    80004350:	00007797          	auipc	a5,0x7
    80004354:	38078793          	addi	a5,a5,896 # 8000b6d0 <_ZTV8Consumer+0x10>
    80004358:	00f53023          	sd	a5,0(a0)
    8000435c:	ffffe097          	auipc	ra,0xffffe
    80004360:	b9c080e7          	jalr	-1124(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80004364:	00048513          	mv	a0,s1
    80004368:	ffffe097          	auipc	ra,0xffffe
    8000436c:	b00080e7          	jalr	-1280(ra) # 80001e68 <_ZdlPv>
    80004370:	01813083          	ld	ra,24(sp)
    80004374:	01013403          	ld	s0,16(sp)
    80004378:	00813483          	ld	s1,8(sp)
    8000437c:	02010113          	addi	sp,sp,32
    80004380:	00008067          	ret

0000000080004384 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80004384:	ff010113          	addi	sp,sp,-16
    80004388:	00113423          	sd	ra,8(sp)
    8000438c:	00813023          	sd	s0,0(sp)
    80004390:	01010413          	addi	s0,sp,16
    80004394:	00007797          	auipc	a5,0x7
    80004398:	2ec78793          	addi	a5,a5,748 # 8000b680 <_ZTV16ProducerKeyborad+0x10>
    8000439c:	00f53023          	sd	a5,0(a0)
    800043a0:	ffffe097          	auipc	ra,0xffffe
    800043a4:	b58080e7          	jalr	-1192(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    800043a8:	00813083          	ld	ra,8(sp)
    800043ac:	00013403          	ld	s0,0(sp)
    800043b0:	01010113          	addi	sp,sp,16
    800043b4:	00008067          	ret

00000000800043b8 <_ZN16ProducerKeyboradD0Ev>:
    800043b8:	fe010113          	addi	sp,sp,-32
    800043bc:	00113c23          	sd	ra,24(sp)
    800043c0:	00813823          	sd	s0,16(sp)
    800043c4:	00913423          	sd	s1,8(sp)
    800043c8:	02010413          	addi	s0,sp,32
    800043cc:	00050493          	mv	s1,a0
    800043d0:	00007797          	auipc	a5,0x7
    800043d4:	2b078793          	addi	a5,a5,688 # 8000b680 <_ZTV16ProducerKeyborad+0x10>
    800043d8:	00f53023          	sd	a5,0(a0)
    800043dc:	ffffe097          	auipc	ra,0xffffe
    800043e0:	b1c080e7          	jalr	-1252(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    800043e4:	00048513          	mv	a0,s1
    800043e8:	ffffe097          	auipc	ra,0xffffe
    800043ec:	a80080e7          	jalr	-1408(ra) # 80001e68 <_ZdlPv>
    800043f0:	01813083          	ld	ra,24(sp)
    800043f4:	01013403          	ld	s0,16(sp)
    800043f8:	00813483          	ld	s1,8(sp)
    800043fc:	02010113          	addi	sp,sp,32
    80004400:	00008067          	ret

0000000080004404 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80004404:	ff010113          	addi	sp,sp,-16
    80004408:	00113423          	sd	ra,8(sp)
    8000440c:	00813023          	sd	s0,0(sp)
    80004410:	01010413          	addi	s0,sp,16
    80004414:	00007797          	auipc	a5,0x7
    80004418:	29478793          	addi	a5,a5,660 # 8000b6a8 <_ZTV8Producer+0x10>
    8000441c:	00f53023          	sd	a5,0(a0)
    80004420:	ffffe097          	auipc	ra,0xffffe
    80004424:	ad8080e7          	jalr	-1320(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80004428:	00813083          	ld	ra,8(sp)
    8000442c:	00013403          	ld	s0,0(sp)
    80004430:	01010113          	addi	sp,sp,16
    80004434:	00008067          	ret

0000000080004438 <_ZN8ProducerD0Ev>:
    80004438:	fe010113          	addi	sp,sp,-32
    8000443c:	00113c23          	sd	ra,24(sp)
    80004440:	00813823          	sd	s0,16(sp)
    80004444:	00913423          	sd	s1,8(sp)
    80004448:	02010413          	addi	s0,sp,32
    8000444c:	00050493          	mv	s1,a0
    80004450:	00007797          	auipc	a5,0x7
    80004454:	25878793          	addi	a5,a5,600 # 8000b6a8 <_ZTV8Producer+0x10>
    80004458:	00f53023          	sd	a5,0(a0)
    8000445c:	ffffe097          	auipc	ra,0xffffe
    80004460:	a9c080e7          	jalr	-1380(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80004464:	00048513          	mv	a0,s1
    80004468:	ffffe097          	auipc	ra,0xffffe
    8000446c:	a00080e7          	jalr	-1536(ra) # 80001e68 <_ZdlPv>
    80004470:	01813083          	ld	ra,24(sp)
    80004474:	01013403          	ld	s0,16(sp)
    80004478:	00813483          	ld	s1,8(sp)
    8000447c:	02010113          	addi	sp,sp,32
    80004480:	00008067          	ret

0000000080004484 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004484:	fe010113          	addi	sp,sp,-32
    80004488:	00113c23          	sd	ra,24(sp)
    8000448c:	00813823          	sd	s0,16(sp)
    80004490:	00913423          	sd	s1,8(sp)
    80004494:	02010413          	addi	s0,sp,32
    80004498:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    8000449c:	ffffd097          	auipc	ra,0xffffd
    800044a0:	168080e7          	jalr	360(ra) # 80001604 <_Z4getcv>
    800044a4:	0005059b          	sext.w	a1,a0
    800044a8:	01b00793          	li	a5,27
    800044ac:	00f58c63          	beq	a1,a5,800044c4 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    800044b0:	0104b783          	ld	a5,16(s1)
    800044b4:	0087b503          	ld	a0,8(a5)
    800044b8:	00001097          	auipc	ra,0x1
    800044bc:	36c080e7          	jalr	876(ra) # 80005824 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    800044c0:	fddff06f          	j	8000449c <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    800044c4:	00100793          	li	a5,1
    800044c8:	00007717          	auipc	a4,0x7
    800044cc:	3af72423          	sw	a5,936(a4) # 8000b870 <_ZL9threadEnd>
        td->buffer->put('!');
    800044d0:	0104b783          	ld	a5,16(s1)
    800044d4:	02100593          	li	a1,33
    800044d8:	0087b503          	ld	a0,8(a5)
    800044dc:	00001097          	auipc	ra,0x1
    800044e0:	348080e7          	jalr	840(ra) # 80005824 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    800044e4:	0104b783          	ld	a5,16(s1)
    800044e8:	0107b503          	ld	a0,16(a5)
    800044ec:	ffffe097          	auipc	ra,0xffffe
    800044f0:	c40080e7          	jalr	-960(ra) # 8000212c <_ZN9Semaphore6signalEv>
    }
    800044f4:	01813083          	ld	ra,24(sp)
    800044f8:	01013403          	ld	s0,16(sp)
    800044fc:	00813483          	ld	s1,8(sp)
    80004500:	02010113          	addi	sp,sp,32
    80004504:	00008067          	ret

0000000080004508 <_ZN8Producer3runEv>:
    void run() override {
    80004508:	fe010113          	addi	sp,sp,-32
    8000450c:	00113c23          	sd	ra,24(sp)
    80004510:	00813823          	sd	s0,16(sp)
    80004514:	00913423          	sd	s1,8(sp)
    80004518:	01213023          	sd	s2,0(sp)
    8000451c:	02010413          	addi	s0,sp,32
    80004520:	00050493          	mv	s1,a0
        int i = 0;
    80004524:	00000913          	li	s2,0
        while (!threadEnd) {
    80004528:	00007797          	auipc	a5,0x7
    8000452c:	3487a783          	lw	a5,840(a5) # 8000b870 <_ZL9threadEnd>
    80004530:	04079263          	bnez	a5,80004574 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    80004534:	0104b783          	ld	a5,16(s1)
    80004538:	0007a583          	lw	a1,0(a5)
    8000453c:	0305859b          	addiw	a1,a1,48
    80004540:	0087b503          	ld	a0,8(a5)
    80004544:	00001097          	auipc	ra,0x1
    80004548:	2e0080e7          	jalr	736(ra) # 80005824 <_ZN9BufferCPP3putEi>
            i++;
    8000454c:	0019071b          	addiw	a4,s2,1
    80004550:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    80004554:	0104b783          	ld	a5,16(s1)
    80004558:	0007a783          	lw	a5,0(a5)
    8000455c:	00e787bb          	addw	a5,a5,a4
    80004560:	00500513          	li	a0,5
    80004564:	02a7e53b          	remw	a0,a5,a0
    80004568:	ffffe097          	auipc	ra,0xffffe
    8000456c:	ae8080e7          	jalr	-1304(ra) # 80002050 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    80004570:	fb9ff06f          	j	80004528 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004574:	0104b783          	ld	a5,16(s1)
    80004578:	0107b503          	ld	a0,16(a5)
    8000457c:	ffffe097          	auipc	ra,0xffffe
    80004580:	bb0080e7          	jalr	-1104(ra) # 8000212c <_ZN9Semaphore6signalEv>
    }
    80004584:	01813083          	ld	ra,24(sp)
    80004588:	01013403          	ld	s0,16(sp)
    8000458c:	00813483          	ld	s1,8(sp)
    80004590:	00013903          	ld	s2,0(sp)
    80004594:	02010113          	addi	sp,sp,32
    80004598:	00008067          	ret

000000008000459c <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    8000459c:	fe010113          	addi	sp,sp,-32
    800045a0:	00113c23          	sd	ra,24(sp)
    800045a4:	00813823          	sd	s0,16(sp)
    800045a8:	00913423          	sd	s1,8(sp)
    800045ac:	01213023          	sd	s2,0(sp)
    800045b0:	02010413          	addi	s0,sp,32
    800045b4:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    800045b8:	00100793          	li	a5,1
    800045bc:	02a7f863          	bgeu	a5,a0,800045ec <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    800045c0:	00a00793          	li	a5,10
    800045c4:	02f577b3          	remu	a5,a0,a5
    800045c8:	02078e63          	beqz	a5,80004604 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    800045cc:	fff48513          	addi	a0,s1,-1
    800045d0:	00000097          	auipc	ra,0x0
    800045d4:	fcc080e7          	jalr	-52(ra) # 8000459c <_ZL9fibonaccim>
    800045d8:	00050913          	mv	s2,a0
    800045dc:	ffe48513          	addi	a0,s1,-2
    800045e0:	00000097          	auipc	ra,0x0
    800045e4:	fbc080e7          	jalr	-68(ra) # 8000459c <_ZL9fibonaccim>
    800045e8:	00a90533          	add	a0,s2,a0
}
    800045ec:	01813083          	ld	ra,24(sp)
    800045f0:	01013403          	ld	s0,16(sp)
    800045f4:	00813483          	ld	s1,8(sp)
    800045f8:	00013903          	ld	s2,0(sp)
    800045fc:	02010113          	addi	sp,sp,32
    80004600:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80004604:	ffffd097          	auipc	ra,0xffffd
    80004608:	ea4080e7          	jalr	-348(ra) # 800014a8 <_Z15thread_dispatchv>
    8000460c:	fc1ff06f          	j	800045cc <_ZL9fibonaccim+0x30>

0000000080004610 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80004610:	fe010113          	addi	sp,sp,-32
    80004614:	00113c23          	sd	ra,24(sp)
    80004618:	00813823          	sd	s0,16(sp)
    8000461c:	00913423          	sd	s1,8(sp)
    80004620:	01213023          	sd	s2,0(sp)
    80004624:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80004628:	00a00493          	li	s1,10
    8000462c:	0400006f          	j	8000466c <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004630:	00005517          	auipc	a0,0x5
    80004634:	b9050513          	addi	a0,a0,-1136 # 800091c0 <CONSOLE_STATUS+0x1b0>
    80004638:	00001097          	auipc	ra,0x1
    8000463c:	dc8080e7          	jalr	-568(ra) # 80005400 <_Z11printStringPKc>
    80004640:	00000613          	li	a2,0
    80004644:	00a00593          	li	a1,10
    80004648:	00048513          	mv	a0,s1
    8000464c:	00001097          	auipc	ra,0x1
    80004650:	f64080e7          	jalr	-156(ra) # 800055b0 <_Z8printIntiii>
    80004654:	00005517          	auipc	a0,0x5
    80004658:	d5c50513          	addi	a0,a0,-676 # 800093b0 <CONSOLE_STATUS+0x3a0>
    8000465c:	00001097          	auipc	ra,0x1
    80004660:	da4080e7          	jalr	-604(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004664:	0014849b          	addiw	s1,s1,1
    80004668:	0ff4f493          	andi	s1,s1,255
    8000466c:	00c00793          	li	a5,12
    80004670:	fc97f0e3          	bgeu	a5,s1,80004630 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004674:	00005517          	auipc	a0,0x5
    80004678:	b5450513          	addi	a0,a0,-1196 # 800091c8 <CONSOLE_STATUS+0x1b8>
    8000467c:	00001097          	auipc	ra,0x1
    80004680:	d84080e7          	jalr	-636(ra) # 80005400 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004684:	00500313          	li	t1,5
    thread_dispatch();
    80004688:	ffffd097          	auipc	ra,0xffffd
    8000468c:	e20080e7          	jalr	-480(ra) # 800014a8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80004690:	01000513          	li	a0,16
    80004694:	00000097          	auipc	ra,0x0
    80004698:	f08080e7          	jalr	-248(ra) # 8000459c <_ZL9fibonaccim>
    8000469c:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800046a0:	00005517          	auipc	a0,0x5
    800046a4:	b3850513          	addi	a0,a0,-1224 # 800091d8 <CONSOLE_STATUS+0x1c8>
    800046a8:	00001097          	auipc	ra,0x1
    800046ac:	d58080e7          	jalr	-680(ra) # 80005400 <_Z11printStringPKc>
    800046b0:	00000613          	li	a2,0
    800046b4:	00a00593          	li	a1,10
    800046b8:	0009051b          	sext.w	a0,s2
    800046bc:	00001097          	auipc	ra,0x1
    800046c0:	ef4080e7          	jalr	-268(ra) # 800055b0 <_Z8printIntiii>
    800046c4:	00005517          	auipc	a0,0x5
    800046c8:	cec50513          	addi	a0,a0,-788 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800046cc:	00001097          	auipc	ra,0x1
    800046d0:	d34080e7          	jalr	-716(ra) # 80005400 <_Z11printStringPKc>
    800046d4:	0400006f          	j	80004714 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800046d8:	00005517          	auipc	a0,0x5
    800046dc:	ae850513          	addi	a0,a0,-1304 # 800091c0 <CONSOLE_STATUS+0x1b0>
    800046e0:	00001097          	auipc	ra,0x1
    800046e4:	d20080e7          	jalr	-736(ra) # 80005400 <_Z11printStringPKc>
    800046e8:	00000613          	li	a2,0
    800046ec:	00a00593          	li	a1,10
    800046f0:	00048513          	mv	a0,s1
    800046f4:	00001097          	auipc	ra,0x1
    800046f8:	ebc080e7          	jalr	-324(ra) # 800055b0 <_Z8printIntiii>
    800046fc:	00005517          	auipc	a0,0x5
    80004700:	cb450513          	addi	a0,a0,-844 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004704:	00001097          	auipc	ra,0x1
    80004708:	cfc080e7          	jalr	-772(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 16; i++) {
    8000470c:	0014849b          	addiw	s1,s1,1
    80004710:	0ff4f493          	andi	s1,s1,255
    80004714:	00f00793          	li	a5,15
    80004718:	fc97f0e3          	bgeu	a5,s1,800046d8 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    8000471c:	00005517          	auipc	a0,0x5
    80004720:	acc50513          	addi	a0,a0,-1332 # 800091e8 <CONSOLE_STATUS+0x1d8>
    80004724:	00001097          	auipc	ra,0x1
    80004728:	cdc080e7          	jalr	-804(ra) # 80005400 <_Z11printStringPKc>
    finishedD = true;
    8000472c:	00100793          	li	a5,1
    80004730:	00007717          	auipc	a4,0x7
    80004734:	14f70823          	sb	a5,336(a4) # 8000b880 <_ZL9finishedD>
    thread_dispatch();
    80004738:	ffffd097          	auipc	ra,0xffffd
    8000473c:	d70080e7          	jalr	-656(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80004740:	01813083          	ld	ra,24(sp)
    80004744:	01013403          	ld	s0,16(sp)
    80004748:	00813483          	ld	s1,8(sp)
    8000474c:	00013903          	ld	s2,0(sp)
    80004750:	02010113          	addi	sp,sp,32
    80004754:	00008067          	ret

0000000080004758 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80004758:	fe010113          	addi	sp,sp,-32
    8000475c:	00113c23          	sd	ra,24(sp)
    80004760:	00813823          	sd	s0,16(sp)
    80004764:	00913423          	sd	s1,8(sp)
    80004768:	01213023          	sd	s2,0(sp)
    8000476c:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80004770:	00000493          	li	s1,0
    80004774:	0400006f          	j	800047b4 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004778:	00005517          	auipc	a0,0x5
    8000477c:	a1850513          	addi	a0,a0,-1512 # 80009190 <CONSOLE_STATUS+0x180>
    80004780:	00001097          	auipc	ra,0x1
    80004784:	c80080e7          	jalr	-896(ra) # 80005400 <_Z11printStringPKc>
    80004788:	00000613          	li	a2,0
    8000478c:	00a00593          	li	a1,10
    80004790:	00048513          	mv	a0,s1
    80004794:	00001097          	auipc	ra,0x1
    80004798:	e1c080e7          	jalr	-484(ra) # 800055b0 <_Z8printIntiii>
    8000479c:	00005517          	auipc	a0,0x5
    800047a0:	c1450513          	addi	a0,a0,-1004 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800047a4:	00001097          	auipc	ra,0x1
    800047a8:	c5c080e7          	jalr	-932(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 3; i++) {
    800047ac:	0014849b          	addiw	s1,s1,1
    800047b0:	0ff4f493          	andi	s1,s1,255
    800047b4:	00200793          	li	a5,2
    800047b8:	fc97f0e3          	bgeu	a5,s1,80004778 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    800047bc:	00005517          	auipc	a0,0x5
    800047c0:	9dc50513          	addi	a0,a0,-1572 # 80009198 <CONSOLE_STATUS+0x188>
    800047c4:	00001097          	auipc	ra,0x1
    800047c8:	c3c080e7          	jalr	-964(ra) # 80005400 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800047cc:	00700313          	li	t1,7
    thread_dispatch();
    800047d0:	ffffd097          	auipc	ra,0xffffd
    800047d4:	cd8080e7          	jalr	-808(ra) # 800014a8 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800047d8:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    800047dc:	00005517          	auipc	a0,0x5
    800047e0:	9cc50513          	addi	a0,a0,-1588 # 800091a8 <CONSOLE_STATUS+0x198>
    800047e4:	00001097          	auipc	ra,0x1
    800047e8:	c1c080e7          	jalr	-996(ra) # 80005400 <_Z11printStringPKc>
    800047ec:	00000613          	li	a2,0
    800047f0:	00a00593          	li	a1,10
    800047f4:	0009051b          	sext.w	a0,s2
    800047f8:	00001097          	auipc	ra,0x1
    800047fc:	db8080e7          	jalr	-584(ra) # 800055b0 <_Z8printIntiii>
    80004800:	00005517          	auipc	a0,0x5
    80004804:	bb050513          	addi	a0,a0,-1104 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004808:	00001097          	auipc	ra,0x1
    8000480c:	bf8080e7          	jalr	-1032(ra) # 80005400 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80004810:	00c00513          	li	a0,12
    80004814:	00000097          	auipc	ra,0x0
    80004818:	d88080e7          	jalr	-632(ra) # 8000459c <_ZL9fibonaccim>
    8000481c:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80004820:	00005517          	auipc	a0,0x5
    80004824:	99050513          	addi	a0,a0,-1648 # 800091b0 <CONSOLE_STATUS+0x1a0>
    80004828:	00001097          	auipc	ra,0x1
    8000482c:	bd8080e7          	jalr	-1064(ra) # 80005400 <_Z11printStringPKc>
    80004830:	00000613          	li	a2,0
    80004834:	00a00593          	li	a1,10
    80004838:	0009051b          	sext.w	a0,s2
    8000483c:	00001097          	auipc	ra,0x1
    80004840:	d74080e7          	jalr	-652(ra) # 800055b0 <_Z8printIntiii>
    80004844:	00005517          	auipc	a0,0x5
    80004848:	b6c50513          	addi	a0,a0,-1172 # 800093b0 <CONSOLE_STATUS+0x3a0>
    8000484c:	00001097          	auipc	ra,0x1
    80004850:	bb4080e7          	jalr	-1100(ra) # 80005400 <_Z11printStringPKc>
    80004854:	0400006f          	j	80004894 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80004858:	00005517          	auipc	a0,0x5
    8000485c:	93850513          	addi	a0,a0,-1736 # 80009190 <CONSOLE_STATUS+0x180>
    80004860:	00001097          	auipc	ra,0x1
    80004864:	ba0080e7          	jalr	-1120(ra) # 80005400 <_Z11printStringPKc>
    80004868:	00000613          	li	a2,0
    8000486c:	00a00593          	li	a1,10
    80004870:	00048513          	mv	a0,s1
    80004874:	00001097          	auipc	ra,0x1
    80004878:	d3c080e7          	jalr	-708(ra) # 800055b0 <_Z8printIntiii>
    8000487c:	00005517          	auipc	a0,0x5
    80004880:	b3450513          	addi	a0,a0,-1228 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004884:	00001097          	auipc	ra,0x1
    80004888:	b7c080e7          	jalr	-1156(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 6; i++) {
    8000488c:	0014849b          	addiw	s1,s1,1
    80004890:	0ff4f493          	andi	s1,s1,255
    80004894:	00500793          	li	a5,5
    80004898:	fc97f0e3          	bgeu	a5,s1,80004858 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    8000489c:	00005517          	auipc	a0,0x5
    800048a0:	8cc50513          	addi	a0,a0,-1844 # 80009168 <CONSOLE_STATUS+0x158>
    800048a4:	00001097          	auipc	ra,0x1
    800048a8:	b5c080e7          	jalr	-1188(ra) # 80005400 <_Z11printStringPKc>
    finishedC = true;
    800048ac:	00100793          	li	a5,1
    800048b0:	00007717          	auipc	a4,0x7
    800048b4:	fcf708a3          	sb	a5,-47(a4) # 8000b881 <_ZL9finishedC>
    thread_dispatch();
    800048b8:	ffffd097          	auipc	ra,0xffffd
    800048bc:	bf0080e7          	jalr	-1040(ra) # 800014a8 <_Z15thread_dispatchv>
}
    800048c0:	01813083          	ld	ra,24(sp)
    800048c4:	01013403          	ld	s0,16(sp)
    800048c8:	00813483          	ld	s1,8(sp)
    800048cc:	00013903          	ld	s2,0(sp)
    800048d0:	02010113          	addi	sp,sp,32
    800048d4:	00008067          	ret

00000000800048d8 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    800048d8:	fe010113          	addi	sp,sp,-32
    800048dc:	00113c23          	sd	ra,24(sp)
    800048e0:	00813823          	sd	s0,16(sp)
    800048e4:	00913423          	sd	s1,8(sp)
    800048e8:	01213023          	sd	s2,0(sp)
    800048ec:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    800048f0:	00000913          	li	s2,0
    800048f4:	0380006f          	j	8000492c <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    800048f8:	ffffd097          	auipc	ra,0xffffd
    800048fc:	bb0080e7          	jalr	-1104(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004900:	00148493          	addi	s1,s1,1
    80004904:	000027b7          	lui	a5,0x2
    80004908:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000490c:	0097ee63          	bltu	a5,s1,80004928 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004910:	00000713          	li	a4,0
    80004914:	000077b7          	lui	a5,0x7
    80004918:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000491c:	fce7eee3          	bltu	a5,a4,800048f8 <_ZL11workerBodyBPv+0x20>
    80004920:	00170713          	addi	a4,a4,1
    80004924:	ff1ff06f          	j	80004914 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    80004928:	00190913          	addi	s2,s2,1
    8000492c:	00f00793          	li	a5,15
    80004930:	0527e063          	bltu	a5,s2,80004970 <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    80004934:	00005517          	auipc	a0,0x5
    80004938:	84450513          	addi	a0,a0,-1980 # 80009178 <CONSOLE_STATUS+0x168>
    8000493c:	00001097          	auipc	ra,0x1
    80004940:	ac4080e7          	jalr	-1340(ra) # 80005400 <_Z11printStringPKc>
    80004944:	00000613          	li	a2,0
    80004948:	00a00593          	li	a1,10
    8000494c:	0009051b          	sext.w	a0,s2
    80004950:	00001097          	auipc	ra,0x1
    80004954:	c60080e7          	jalr	-928(ra) # 800055b0 <_Z8printIntiii>
    80004958:	00005517          	auipc	a0,0x5
    8000495c:	a5850513          	addi	a0,a0,-1448 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004960:	00001097          	auipc	ra,0x1
    80004964:	aa0080e7          	jalr	-1376(ra) # 80005400 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004968:	00000493          	li	s1,0
    8000496c:	f99ff06f          	j	80004904 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    80004970:	00005517          	auipc	a0,0x5
    80004974:	81050513          	addi	a0,a0,-2032 # 80009180 <CONSOLE_STATUS+0x170>
    80004978:	00001097          	auipc	ra,0x1
    8000497c:	a88080e7          	jalr	-1400(ra) # 80005400 <_Z11printStringPKc>
    finishedB = true;
    80004980:	00100793          	li	a5,1
    80004984:	00007717          	auipc	a4,0x7
    80004988:	eef70f23          	sb	a5,-258(a4) # 8000b882 <_ZL9finishedB>
    thread_dispatch();
    8000498c:	ffffd097          	auipc	ra,0xffffd
    80004990:	b1c080e7          	jalr	-1252(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80004994:	01813083          	ld	ra,24(sp)
    80004998:	01013403          	ld	s0,16(sp)
    8000499c:	00813483          	ld	s1,8(sp)
    800049a0:	00013903          	ld	s2,0(sp)
    800049a4:	02010113          	addi	sp,sp,32
    800049a8:	00008067          	ret

00000000800049ac <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    800049ac:	fe010113          	addi	sp,sp,-32
    800049b0:	00113c23          	sd	ra,24(sp)
    800049b4:	00813823          	sd	s0,16(sp)
    800049b8:	00913423          	sd	s1,8(sp)
    800049bc:	01213023          	sd	s2,0(sp)
    800049c0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800049c4:	00000913          	li	s2,0
    800049c8:	0380006f          	j	80004a00 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    800049cc:	ffffd097          	auipc	ra,0xffffd
    800049d0:	adc080e7          	jalr	-1316(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800049d4:	00148493          	addi	s1,s1,1
    800049d8:	000027b7          	lui	a5,0x2
    800049dc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800049e0:	0097ee63          	bltu	a5,s1,800049fc <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800049e4:	00000713          	li	a4,0
    800049e8:	000077b7          	lui	a5,0x7
    800049ec:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800049f0:	fce7eee3          	bltu	a5,a4,800049cc <_ZL11workerBodyAPv+0x20>
    800049f4:	00170713          	addi	a4,a4,1
    800049f8:	ff1ff06f          	j	800049e8 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800049fc:	00190913          	addi	s2,s2,1
    80004a00:	00900793          	li	a5,9
    80004a04:	0527e063          	bltu	a5,s2,80004a44 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80004a08:	00004517          	auipc	a0,0x4
    80004a0c:	75850513          	addi	a0,a0,1880 # 80009160 <CONSOLE_STATUS+0x150>
    80004a10:	00001097          	auipc	ra,0x1
    80004a14:	9f0080e7          	jalr	-1552(ra) # 80005400 <_Z11printStringPKc>
    80004a18:	00000613          	li	a2,0
    80004a1c:	00a00593          	li	a1,10
    80004a20:	0009051b          	sext.w	a0,s2
    80004a24:	00001097          	auipc	ra,0x1
    80004a28:	b8c080e7          	jalr	-1140(ra) # 800055b0 <_Z8printIntiii>
    80004a2c:	00005517          	auipc	a0,0x5
    80004a30:	98450513          	addi	a0,a0,-1660 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80004a34:	00001097          	auipc	ra,0x1
    80004a38:	9cc080e7          	jalr	-1588(ra) # 80005400 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004a3c:	00000493          	li	s1,0
    80004a40:	f99ff06f          	j	800049d8 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80004a44:	00004517          	auipc	a0,0x4
    80004a48:	72450513          	addi	a0,a0,1828 # 80009168 <CONSOLE_STATUS+0x158>
    80004a4c:	00001097          	auipc	ra,0x1
    80004a50:	9b4080e7          	jalr	-1612(ra) # 80005400 <_Z11printStringPKc>
    finishedA = true;
    80004a54:	00100793          	li	a5,1
    80004a58:	00007717          	auipc	a4,0x7
    80004a5c:	e2f705a3          	sb	a5,-469(a4) # 8000b883 <_ZL9finishedA>
}
    80004a60:	01813083          	ld	ra,24(sp)
    80004a64:	01013403          	ld	s0,16(sp)
    80004a68:	00813483          	ld	s1,8(sp)
    80004a6c:	00013903          	ld	s2,0(sp)
    80004a70:	02010113          	addi	sp,sp,32
    80004a74:	00008067          	ret

0000000080004a78 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004a78:	fd010113          	addi	sp,sp,-48
    80004a7c:	02113423          	sd	ra,40(sp)
    80004a80:	02813023          	sd	s0,32(sp)
    80004a84:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004a88:	00000613          	li	a2,0
    80004a8c:	00000597          	auipc	a1,0x0
    80004a90:	f2058593          	addi	a1,a1,-224 # 800049ac <_ZL11workerBodyAPv>
    80004a94:	fd040513          	addi	a0,s0,-48
    80004a98:	ffffd097          	auipc	ra,0xffffd
    80004a9c:	96c080e7          	jalr	-1684(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80004aa0:	00004517          	auipc	a0,0x4
    80004aa4:	75850513          	addi	a0,a0,1880 # 800091f8 <CONSOLE_STATUS+0x1e8>
    80004aa8:	00001097          	auipc	ra,0x1
    80004aac:	958080e7          	jalr	-1704(ra) # 80005400 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80004ab0:	00000613          	li	a2,0
    80004ab4:	00000597          	auipc	a1,0x0
    80004ab8:	e2458593          	addi	a1,a1,-476 # 800048d8 <_ZL11workerBodyBPv>
    80004abc:	fd840513          	addi	a0,s0,-40
    80004ac0:	ffffd097          	auipc	ra,0xffffd
    80004ac4:	944080e7          	jalr	-1724(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004ac8:	00004517          	auipc	a0,0x4
    80004acc:	74850513          	addi	a0,a0,1864 # 80009210 <CONSOLE_STATUS+0x200>
    80004ad0:	00001097          	auipc	ra,0x1
    80004ad4:	930080e7          	jalr	-1744(ra) # 80005400 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004ad8:	00000613          	li	a2,0
    80004adc:	00000597          	auipc	a1,0x0
    80004ae0:	c7c58593          	addi	a1,a1,-900 # 80004758 <_ZL11workerBodyCPv>
    80004ae4:	fe040513          	addi	a0,s0,-32
    80004ae8:	ffffd097          	auipc	ra,0xffffd
    80004aec:	91c080e7          	jalr	-1764(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80004af0:	00004517          	auipc	a0,0x4
    80004af4:	73850513          	addi	a0,a0,1848 # 80009228 <CONSOLE_STATUS+0x218>
    80004af8:	00001097          	auipc	ra,0x1
    80004afc:	908080e7          	jalr	-1784(ra) # 80005400 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80004b00:	00000613          	li	a2,0
    80004b04:	00000597          	auipc	a1,0x0
    80004b08:	b0c58593          	addi	a1,a1,-1268 # 80004610 <_ZL11workerBodyDPv>
    80004b0c:	fe840513          	addi	a0,s0,-24
    80004b10:	ffffd097          	auipc	ra,0xffffd
    80004b14:	8f4080e7          	jalr	-1804(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80004b18:	00004517          	auipc	a0,0x4
    80004b1c:	72850513          	addi	a0,a0,1832 # 80009240 <CONSOLE_STATUS+0x230>
    80004b20:	00001097          	auipc	ra,0x1
    80004b24:	8e0080e7          	jalr	-1824(ra) # 80005400 <_Z11printStringPKc>
    80004b28:	00c0006f          	j	80004b34 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80004b2c:	ffffd097          	auipc	ra,0xffffd
    80004b30:	97c080e7          	jalr	-1668(ra) # 800014a8 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80004b34:	00007797          	auipc	a5,0x7
    80004b38:	d4f7c783          	lbu	a5,-689(a5) # 8000b883 <_ZL9finishedA>
    80004b3c:	fe0788e3          	beqz	a5,80004b2c <_Z18Threads_C_API_testv+0xb4>
    80004b40:	00007797          	auipc	a5,0x7
    80004b44:	d427c783          	lbu	a5,-702(a5) # 8000b882 <_ZL9finishedB>
    80004b48:	fe0782e3          	beqz	a5,80004b2c <_Z18Threads_C_API_testv+0xb4>
    80004b4c:	00007797          	auipc	a5,0x7
    80004b50:	d357c783          	lbu	a5,-715(a5) # 8000b881 <_ZL9finishedC>
    80004b54:	fc078ce3          	beqz	a5,80004b2c <_Z18Threads_C_API_testv+0xb4>
    80004b58:	00007797          	auipc	a5,0x7
    80004b5c:	d287c783          	lbu	a5,-728(a5) # 8000b880 <_ZL9finishedD>
    80004b60:	fc0786e3          	beqz	a5,80004b2c <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004b64:	02813083          	ld	ra,40(sp)
    80004b68:	02013403          	ld	s0,32(sp)
    80004b6c:	03010113          	addi	sp,sp,48
    80004b70:	00008067          	ret

0000000080004b74 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004b74:	fd010113          	addi	sp,sp,-48
    80004b78:	02113423          	sd	ra,40(sp)
    80004b7c:	02813023          	sd	s0,32(sp)
    80004b80:	00913c23          	sd	s1,24(sp)
    80004b84:	01213823          	sd	s2,16(sp)
    80004b88:	01313423          	sd	s3,8(sp)
    80004b8c:	03010413          	addi	s0,sp,48
    80004b90:	00050993          	mv	s3,a0
    80004b94:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004b98:	00000913          	li	s2,0
    80004b9c:	00c0006f          	j	80004ba8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004ba0:	ffffd097          	auipc	ra,0xffffd
    80004ba4:	488080e7          	jalr	1160(ra) # 80002028 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004ba8:	ffffd097          	auipc	ra,0xffffd
    80004bac:	a5c080e7          	jalr	-1444(ra) # 80001604 <_Z4getcv>
    80004bb0:	0005059b          	sext.w	a1,a0
    80004bb4:	01b00793          	li	a5,27
    80004bb8:	02f58a63          	beq	a1,a5,80004bec <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004bbc:	0084b503          	ld	a0,8(s1)
    80004bc0:	00001097          	auipc	ra,0x1
    80004bc4:	c64080e7          	jalr	-924(ra) # 80005824 <_ZN9BufferCPP3putEi>
        i++;
    80004bc8:	0019071b          	addiw	a4,s2,1
    80004bcc:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004bd0:	0004a683          	lw	a3,0(s1)
    80004bd4:	0026979b          	slliw	a5,a3,0x2
    80004bd8:	00d787bb          	addw	a5,a5,a3
    80004bdc:	0017979b          	slliw	a5,a5,0x1
    80004be0:	02f767bb          	remw	a5,a4,a5
    80004be4:	fc0792e3          	bnez	a5,80004ba8 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004be8:	fb9ff06f          	j	80004ba0 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004bec:	00100793          	li	a5,1
    80004bf0:	00007717          	auipc	a4,0x7
    80004bf4:	c8f72c23          	sw	a5,-872(a4) # 8000b888 <_ZL9threadEnd>
    td->buffer->put('!');
    80004bf8:	0109b783          	ld	a5,16(s3)
    80004bfc:	02100593          	li	a1,33
    80004c00:	0087b503          	ld	a0,8(a5)
    80004c04:	00001097          	auipc	ra,0x1
    80004c08:	c20080e7          	jalr	-992(ra) # 80005824 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    80004c0c:	0104b503          	ld	a0,16(s1)
    80004c10:	ffffd097          	auipc	ra,0xffffd
    80004c14:	51c080e7          	jalr	1308(ra) # 8000212c <_ZN9Semaphore6signalEv>
}
    80004c18:	02813083          	ld	ra,40(sp)
    80004c1c:	02013403          	ld	s0,32(sp)
    80004c20:	01813483          	ld	s1,24(sp)
    80004c24:	01013903          	ld	s2,16(sp)
    80004c28:	00813983          	ld	s3,8(sp)
    80004c2c:	03010113          	addi	sp,sp,48
    80004c30:	00008067          	ret

0000000080004c34 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    80004c34:	fe010113          	addi	sp,sp,-32
    80004c38:	00113c23          	sd	ra,24(sp)
    80004c3c:	00813823          	sd	s0,16(sp)
    80004c40:	00913423          	sd	s1,8(sp)
    80004c44:	01213023          	sd	s2,0(sp)
    80004c48:	02010413          	addi	s0,sp,32
    80004c4c:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004c50:	00000913          	li	s2,0
    80004c54:	00c0006f          	j	80004c60 <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    80004c58:	ffffd097          	auipc	ra,0xffffd
    80004c5c:	3d0080e7          	jalr	976(ra) # 80002028 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    80004c60:	00007797          	auipc	a5,0x7
    80004c64:	c287a783          	lw	a5,-984(a5) # 8000b888 <_ZL9threadEnd>
    80004c68:	02079e63          	bnez	a5,80004ca4 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004c6c:	0004a583          	lw	a1,0(s1)
    80004c70:	0305859b          	addiw	a1,a1,48
    80004c74:	0084b503          	ld	a0,8(s1)
    80004c78:	00001097          	auipc	ra,0x1
    80004c7c:	bac080e7          	jalr	-1108(ra) # 80005824 <_ZN9BufferCPP3putEi>
        i++;
    80004c80:	0019071b          	addiw	a4,s2,1
    80004c84:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004c88:	0004a683          	lw	a3,0(s1)
    80004c8c:	0026979b          	slliw	a5,a3,0x2
    80004c90:	00d787bb          	addw	a5,a5,a3
    80004c94:	0017979b          	slliw	a5,a5,0x1
    80004c98:	02f767bb          	remw	a5,a4,a5
    80004c9c:	fc0792e3          	bnez	a5,80004c60 <_ZN12ProducerSync8producerEPv+0x2c>
    80004ca0:	fb9ff06f          	j	80004c58 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004ca4:	0104b503          	ld	a0,16(s1)
    80004ca8:	ffffd097          	auipc	ra,0xffffd
    80004cac:	484080e7          	jalr	1156(ra) # 8000212c <_ZN9Semaphore6signalEv>
}
    80004cb0:	01813083          	ld	ra,24(sp)
    80004cb4:	01013403          	ld	s0,16(sp)
    80004cb8:	00813483          	ld	s1,8(sp)
    80004cbc:	00013903          	ld	s2,0(sp)
    80004cc0:	02010113          	addi	sp,sp,32
    80004cc4:	00008067          	ret

0000000080004cc8 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80004cc8:	fd010113          	addi	sp,sp,-48
    80004ccc:	02113423          	sd	ra,40(sp)
    80004cd0:	02813023          	sd	s0,32(sp)
    80004cd4:	00913c23          	sd	s1,24(sp)
    80004cd8:	01213823          	sd	s2,16(sp)
    80004cdc:	01313423          	sd	s3,8(sp)
    80004ce0:	01413023          	sd	s4,0(sp)
    80004ce4:	03010413          	addi	s0,sp,48
    80004ce8:	00050993          	mv	s3,a0
    80004cec:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80004cf0:	00000a13          	li	s4,0
    80004cf4:	01c0006f          	j	80004d10 <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80004cf8:	ffffd097          	auipc	ra,0xffffd
    80004cfc:	330080e7          	jalr	816(ra) # 80002028 <_ZN6Thread8dispatchEv>
    80004d00:	0500006f          	j	80004d50 <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    80004d04:	00a00513          	li	a0,10
    80004d08:	ffffd097          	auipc	ra,0xffffd
    80004d0c:	930080e7          	jalr	-1744(ra) # 80001638 <_Z4putcc>
    while (!threadEnd) {
    80004d10:	00007797          	auipc	a5,0x7
    80004d14:	b787a783          	lw	a5,-1160(a5) # 8000b888 <_ZL9threadEnd>
    80004d18:	06079263          	bnez	a5,80004d7c <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    80004d1c:	00893503          	ld	a0,8(s2)
    80004d20:	00001097          	auipc	ra,0x1
    80004d24:	b94080e7          	jalr	-1132(ra) # 800058b4 <_ZN9BufferCPP3getEv>
        i++;
    80004d28:	001a049b          	addiw	s1,s4,1
    80004d2c:	00048a1b          	sext.w	s4,s1
        putc(key);
    80004d30:	0ff57513          	andi	a0,a0,255
    80004d34:	ffffd097          	auipc	ra,0xffffd
    80004d38:	904080e7          	jalr	-1788(ra) # 80001638 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80004d3c:	00092703          	lw	a4,0(s2)
    80004d40:	0027179b          	slliw	a5,a4,0x2
    80004d44:	00e787bb          	addw	a5,a5,a4
    80004d48:	02f4e7bb          	remw	a5,s1,a5
    80004d4c:	fa0786e3          	beqz	a5,80004cf8 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    80004d50:	05000793          	li	a5,80
    80004d54:	02f4e4bb          	remw	s1,s1,a5
    80004d58:	fa049ce3          	bnez	s1,80004d10 <_ZN12ConsumerSync8consumerEPv+0x48>
    80004d5c:	fa9ff06f          	j	80004d04 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    80004d60:	0109b783          	ld	a5,16(s3)
    80004d64:	0087b503          	ld	a0,8(a5)
    80004d68:	00001097          	auipc	ra,0x1
    80004d6c:	b4c080e7          	jalr	-1204(ra) # 800058b4 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    80004d70:	0ff57513          	andi	a0,a0,255
    80004d74:	ffffd097          	auipc	ra,0xffffd
    80004d78:	4e0080e7          	jalr	1248(ra) # 80002254 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80004d7c:	0109b783          	ld	a5,16(s3)
    80004d80:	0087b503          	ld	a0,8(a5)
    80004d84:	00001097          	auipc	ra,0x1
    80004d88:	bbc080e7          	jalr	-1092(ra) # 80005940 <_ZN9BufferCPP6getCntEv>
    80004d8c:	fca04ae3          	bgtz	a0,80004d60 <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    80004d90:	01093503          	ld	a0,16(s2)
    80004d94:	ffffd097          	auipc	ra,0xffffd
    80004d98:	398080e7          	jalr	920(ra) # 8000212c <_ZN9Semaphore6signalEv>
}
    80004d9c:	02813083          	ld	ra,40(sp)
    80004da0:	02013403          	ld	s0,32(sp)
    80004da4:	01813483          	ld	s1,24(sp)
    80004da8:	01013903          	ld	s2,16(sp)
    80004dac:	00813983          	ld	s3,8(sp)
    80004db0:	00013a03          	ld	s4,0(sp)
    80004db4:	03010113          	addi	sp,sp,48
    80004db8:	00008067          	ret

0000000080004dbc <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80004dbc:	f8010113          	addi	sp,sp,-128
    80004dc0:	06113c23          	sd	ra,120(sp)
    80004dc4:	06813823          	sd	s0,112(sp)
    80004dc8:	06913423          	sd	s1,104(sp)
    80004dcc:	07213023          	sd	s2,96(sp)
    80004dd0:	05313c23          	sd	s3,88(sp)
    80004dd4:	05413823          	sd	s4,80(sp)
    80004dd8:	05513423          	sd	s5,72(sp)
    80004ddc:	05613023          	sd	s6,64(sp)
    80004de0:	03713c23          	sd	s7,56(sp)
    80004de4:	03813823          	sd	s8,48(sp)
    80004de8:	03913423          	sd	s9,40(sp)
    80004dec:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    80004df0:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80004df4:	00004517          	auipc	a0,0x4
    80004df8:	28c50513          	addi	a0,a0,652 # 80009080 <CONSOLE_STATUS+0x70>
    80004dfc:	00000097          	auipc	ra,0x0
    80004e00:	604080e7          	jalr	1540(ra) # 80005400 <_Z11printStringPKc>
    getString(input, 30);
    80004e04:	01e00593          	li	a1,30
    80004e08:	f8040493          	addi	s1,s0,-128
    80004e0c:	00048513          	mv	a0,s1
    80004e10:	00000097          	auipc	ra,0x0
    80004e14:	678080e7          	jalr	1656(ra) # 80005488 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80004e18:	00048513          	mv	a0,s1
    80004e1c:	00000097          	auipc	ra,0x0
    80004e20:	744080e7          	jalr	1860(ra) # 80005560 <_Z11stringToIntPKc>
    80004e24:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80004e28:	00004517          	auipc	a0,0x4
    80004e2c:	27850513          	addi	a0,a0,632 # 800090a0 <CONSOLE_STATUS+0x90>
    80004e30:	00000097          	auipc	ra,0x0
    80004e34:	5d0080e7          	jalr	1488(ra) # 80005400 <_Z11printStringPKc>
    getString(input, 30);
    80004e38:	01e00593          	li	a1,30
    80004e3c:	00048513          	mv	a0,s1
    80004e40:	00000097          	auipc	ra,0x0
    80004e44:	648080e7          	jalr	1608(ra) # 80005488 <_Z9getStringPci>
    n = stringToInt(input);
    80004e48:	00048513          	mv	a0,s1
    80004e4c:	00000097          	auipc	ra,0x0
    80004e50:	714080e7          	jalr	1812(ra) # 80005560 <_Z11stringToIntPKc>
    80004e54:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80004e58:	00004517          	auipc	a0,0x4
    80004e5c:	26850513          	addi	a0,a0,616 # 800090c0 <CONSOLE_STATUS+0xb0>
    80004e60:	00000097          	auipc	ra,0x0
    80004e64:	5a0080e7          	jalr	1440(ra) # 80005400 <_Z11printStringPKc>
    80004e68:	00000613          	li	a2,0
    80004e6c:	00a00593          	li	a1,10
    80004e70:	00090513          	mv	a0,s2
    80004e74:	00000097          	auipc	ra,0x0
    80004e78:	73c080e7          	jalr	1852(ra) # 800055b0 <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004e7c:	00004517          	auipc	a0,0x4
    80004e80:	25c50513          	addi	a0,a0,604 # 800090d8 <CONSOLE_STATUS+0xc8>
    80004e84:	00000097          	auipc	ra,0x0
    80004e88:	57c080e7          	jalr	1404(ra) # 80005400 <_Z11printStringPKc>
    80004e8c:	00000613          	li	a2,0
    80004e90:	00a00593          	li	a1,10
    80004e94:	00048513          	mv	a0,s1
    80004e98:	00000097          	auipc	ra,0x0
    80004e9c:	718080e7          	jalr	1816(ra) # 800055b0 <_Z8printIntiii>
    printString(".\n");
    80004ea0:	00004517          	auipc	a0,0x4
    80004ea4:	1a850513          	addi	a0,a0,424 # 80009048 <CONSOLE_STATUS+0x38>
    80004ea8:	00000097          	auipc	ra,0x0
    80004eac:	558080e7          	jalr	1368(ra) # 80005400 <_Z11printStringPKc>
    if(threadNum > n) {
    80004eb0:	0324c463          	blt	s1,s2,80004ed8 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80004eb4:	03205c63          	blez	s2,80004eec <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004eb8:	03800513          	li	a0,56
    80004ebc:	ffffd097          	auipc	ra,0xffffd
    80004ec0:	f5c080e7          	jalr	-164(ra) # 80001e18 <_Znwm>
    80004ec4:	00050a93          	mv	s5,a0
    80004ec8:	00048593          	mv	a1,s1
    80004ecc:	00001097          	auipc	ra,0x1
    80004ed0:	804080e7          	jalr	-2044(ra) # 800056d0 <_ZN9BufferCPPC1Ei>
    80004ed4:	0300006f          	j	80004f04 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004ed8:	00004517          	auipc	a0,0x4
    80004edc:	21850513          	addi	a0,a0,536 # 800090f0 <CONSOLE_STATUS+0xe0>
    80004ee0:	00000097          	auipc	ra,0x0
    80004ee4:	520080e7          	jalr	1312(ra) # 80005400 <_Z11printStringPKc>
        return;
    80004ee8:	0140006f          	j	80004efc <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004eec:	00004517          	auipc	a0,0x4
    80004ef0:	24450513          	addi	a0,a0,580 # 80009130 <CONSOLE_STATUS+0x120>
    80004ef4:	00000097          	auipc	ra,0x0
    80004ef8:	50c080e7          	jalr	1292(ra) # 80005400 <_Z11printStringPKc>
        return;
    80004efc:	000b8113          	mv	sp,s7
    80004f00:	2380006f          	j	80005138 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80004f04:	01000513          	li	a0,16
    80004f08:	ffffd097          	auipc	ra,0xffffd
    80004f0c:	f10080e7          	jalr	-240(ra) # 80001e18 <_Znwm>
    80004f10:	00050493          	mv	s1,a0
    80004f14:	00000593          	li	a1,0
    80004f18:	ffffd097          	auipc	ra,0xffffd
    80004f1c:	1ac080e7          	jalr	428(ra) # 800020c4 <_ZN9SemaphoreC1Ej>
    80004f20:	00007797          	auipc	a5,0x7
    80004f24:	9697b823          	sd	s1,-1680(a5) # 8000b890 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80004f28:	00391793          	slli	a5,s2,0x3
    80004f2c:	00f78793          	addi	a5,a5,15
    80004f30:	ff07f793          	andi	a5,a5,-16
    80004f34:	40f10133          	sub	sp,sp,a5
    80004f38:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80004f3c:	0019071b          	addiw	a4,s2,1
    80004f40:	00171793          	slli	a5,a4,0x1
    80004f44:	00e787b3          	add	a5,a5,a4
    80004f48:	00379793          	slli	a5,a5,0x3
    80004f4c:	00f78793          	addi	a5,a5,15
    80004f50:	ff07f793          	andi	a5,a5,-16
    80004f54:	40f10133          	sub	sp,sp,a5
    80004f58:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80004f5c:	00191c13          	slli	s8,s2,0x1
    80004f60:	012c07b3          	add	a5,s8,s2
    80004f64:	00379793          	slli	a5,a5,0x3
    80004f68:	00fa07b3          	add	a5,s4,a5
    80004f6c:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004f70:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80004f74:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80004f78:	01800513          	li	a0,24
    80004f7c:	ffffd097          	auipc	ra,0xffffd
    80004f80:	e9c080e7          	jalr	-356(ra) # 80001e18 <_Znwm>
    80004f84:	00050b13          	mv	s6,a0
    80004f88:	012c0c33          	add	s8,s8,s2
    80004f8c:	003c1c13          	slli	s8,s8,0x3
    80004f90:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80004f94:	ffffd097          	auipc	ra,0xffffd
    80004f98:	0e8080e7          	jalr	232(ra) # 8000207c <_ZN6ThreadC1Ev>
    80004f9c:	00006797          	auipc	a5,0x6
    80004fa0:	7ac78793          	addi	a5,a5,1964 # 8000b748 <_ZTV12ConsumerSync+0x10>
    80004fa4:	00fb3023          	sd	a5,0(s6)
    80004fa8:	018b3823          	sd	s8,16(s6)
    consumerThread->start();
    80004fac:	000b0513          	mv	a0,s6
    80004fb0:	ffffd097          	auipc	ra,0xffffd
    80004fb4:	028080e7          	jalr	40(ra) # 80001fd8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004fb8:	00000493          	li	s1,0
    80004fbc:	0380006f          	j	80004ff4 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004fc0:	00006797          	auipc	a5,0x6
    80004fc4:	76078793          	addi	a5,a5,1888 # 8000b720 <_ZTV12ProducerSync+0x10>
    80004fc8:	00fcb023          	sd	a5,0(s9)
    80004fcc:	018cb823          	sd	s8,16(s9)
            threads[i] = new ProducerSync(data+i);
    80004fd0:	00349793          	slli	a5,s1,0x3
    80004fd4:	00f987b3          	add	a5,s3,a5
    80004fd8:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80004fdc:	00349793          	slli	a5,s1,0x3
    80004fe0:	00f987b3          	add	a5,s3,a5
    80004fe4:	0007b503          	ld	a0,0(a5)
    80004fe8:	ffffd097          	auipc	ra,0xffffd
    80004fec:	ff0080e7          	jalr	-16(ra) # 80001fd8 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004ff0:	0014849b          	addiw	s1,s1,1
    80004ff4:	0b24d063          	bge	s1,s2,80005094 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80004ff8:	00149793          	slli	a5,s1,0x1
    80004ffc:	009787b3          	add	a5,a5,s1
    80005000:	00379793          	slli	a5,a5,0x3
    80005004:	00fa07b3          	add	a5,s4,a5
    80005008:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    8000500c:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80005010:	00007717          	auipc	a4,0x7
    80005014:	88073703          	ld	a4,-1920(a4) # 8000b890 <_ZL10waitForAll>
    80005018:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    8000501c:	02905863          	blez	s1,8000504c <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80005020:	01800513          	li	a0,24
    80005024:	ffffd097          	auipc	ra,0xffffd
    80005028:	df4080e7          	jalr	-524(ra) # 80001e18 <_Znwm>
    8000502c:	00050c93          	mv	s9,a0
    80005030:	00149c13          	slli	s8,s1,0x1
    80005034:	009c0c33          	add	s8,s8,s1
    80005038:	003c1c13          	slli	s8,s8,0x3
    8000503c:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80005040:	ffffd097          	auipc	ra,0xffffd
    80005044:	03c080e7          	jalr	60(ra) # 8000207c <_ZN6ThreadC1Ev>
    80005048:	f79ff06f          	j	80004fc0 <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    8000504c:	01800513          	li	a0,24
    80005050:	ffffd097          	auipc	ra,0xffffd
    80005054:	dc8080e7          	jalr	-568(ra) # 80001e18 <_Znwm>
    80005058:	00050c93          	mv	s9,a0
    8000505c:	00149c13          	slli	s8,s1,0x1
    80005060:	009c0c33          	add	s8,s8,s1
    80005064:	003c1c13          	slli	s8,s8,0x3
    80005068:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    8000506c:	ffffd097          	auipc	ra,0xffffd
    80005070:	010080e7          	jalr	16(ra) # 8000207c <_ZN6ThreadC1Ev>
    80005074:	00006797          	auipc	a5,0x6
    80005078:	68478793          	addi	a5,a5,1668 # 8000b6f8 <_ZTV16ProducerKeyboard+0x10>
    8000507c:	00fcb023          	sd	a5,0(s9)
    80005080:	018cb823          	sd	s8,16(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80005084:	00349793          	slli	a5,s1,0x3
    80005088:	00f987b3          	add	a5,s3,a5
    8000508c:	0197b023          	sd	s9,0(a5)
    80005090:	f4dff06f          	j	80004fdc <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80005094:	ffffd097          	auipc	ra,0xffffd
    80005098:	f94080e7          	jalr	-108(ra) # 80002028 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    8000509c:	00000493          	li	s1,0
    800050a0:	00994e63          	blt	s2,s1,800050bc <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    800050a4:	00006517          	auipc	a0,0x6
    800050a8:	7ec53503          	ld	a0,2028(a0) # 8000b890 <_ZL10waitForAll>
    800050ac:	ffffd097          	auipc	ra,0xffffd
    800050b0:	054080e7          	jalr	84(ra) # 80002100 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    800050b4:	0014849b          	addiw	s1,s1,1
    800050b8:	fe9ff06f          	j	800050a0 <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    800050bc:	00000493          	li	s1,0
    800050c0:	0080006f          	j	800050c8 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    800050c4:	0014849b          	addiw	s1,s1,1
    800050c8:	0324d263          	bge	s1,s2,800050ec <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    800050cc:	00349793          	slli	a5,s1,0x3
    800050d0:	00f987b3          	add	a5,s3,a5
    800050d4:	0007b503          	ld	a0,0(a5)
    800050d8:	fe0506e3          	beqz	a0,800050c4 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    800050dc:	00053783          	ld	a5,0(a0)
    800050e0:	0087b783          	ld	a5,8(a5)
    800050e4:	000780e7          	jalr	a5
    800050e8:	fddff06f          	j	800050c4 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    800050ec:	000b0a63          	beqz	s6,80005100 <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    800050f0:	000b3783          	ld	a5,0(s6)
    800050f4:	0087b783          	ld	a5,8(a5)
    800050f8:	000b0513          	mv	a0,s6
    800050fc:	000780e7          	jalr	a5
    delete waitForAll;
    80005100:	00006517          	auipc	a0,0x6
    80005104:	79053503          	ld	a0,1936(a0) # 8000b890 <_ZL10waitForAll>
    80005108:	00050863          	beqz	a0,80005118 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    8000510c:	00053783          	ld	a5,0(a0)
    80005110:	0087b783          	ld	a5,8(a5)
    80005114:	000780e7          	jalr	a5
    delete buffer;
    80005118:	000a8e63          	beqz	s5,80005134 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    8000511c:	000a8513          	mv	a0,s5
    80005120:	00001097          	auipc	ra,0x1
    80005124:	8a8080e7          	jalr	-1880(ra) # 800059c8 <_ZN9BufferCPPD1Ev>
    80005128:	000a8513          	mv	a0,s5
    8000512c:	ffffd097          	auipc	ra,0xffffd
    80005130:	d3c080e7          	jalr	-708(ra) # 80001e68 <_ZdlPv>
    80005134:	000b8113          	mv	sp,s7

}
    80005138:	f8040113          	addi	sp,s0,-128
    8000513c:	07813083          	ld	ra,120(sp)
    80005140:	07013403          	ld	s0,112(sp)
    80005144:	06813483          	ld	s1,104(sp)
    80005148:	06013903          	ld	s2,96(sp)
    8000514c:	05813983          	ld	s3,88(sp)
    80005150:	05013a03          	ld	s4,80(sp)
    80005154:	04813a83          	ld	s5,72(sp)
    80005158:	04013b03          	ld	s6,64(sp)
    8000515c:	03813b83          	ld	s7,56(sp)
    80005160:	03013c03          	ld	s8,48(sp)
    80005164:	02813c83          	ld	s9,40(sp)
    80005168:	08010113          	addi	sp,sp,128
    8000516c:	00008067          	ret
    80005170:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80005174:	000a8513          	mv	a0,s5
    80005178:	ffffd097          	auipc	ra,0xffffd
    8000517c:	cf0080e7          	jalr	-784(ra) # 80001e68 <_ZdlPv>
    80005180:	00048513          	mv	a0,s1
    80005184:	00007097          	auipc	ra,0x7
    80005188:	7f4080e7          	jalr	2036(ra) # 8000c978 <_Unwind_Resume>
    8000518c:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80005190:	00048513          	mv	a0,s1
    80005194:	ffffd097          	auipc	ra,0xffffd
    80005198:	cd4080e7          	jalr	-812(ra) # 80001e68 <_ZdlPv>
    8000519c:	00090513          	mv	a0,s2
    800051a0:	00007097          	auipc	ra,0x7
    800051a4:	7d8080e7          	jalr	2008(ra) # 8000c978 <_Unwind_Resume>
    800051a8:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    800051ac:	000b0513          	mv	a0,s6
    800051b0:	ffffd097          	auipc	ra,0xffffd
    800051b4:	cb8080e7          	jalr	-840(ra) # 80001e68 <_ZdlPv>
    800051b8:	00048513          	mv	a0,s1
    800051bc:	00007097          	auipc	ra,0x7
    800051c0:	7bc080e7          	jalr	1980(ra) # 8000c978 <_Unwind_Resume>
    800051c4:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    800051c8:	000c8513          	mv	a0,s9
    800051cc:	ffffd097          	auipc	ra,0xffffd
    800051d0:	c9c080e7          	jalr	-868(ra) # 80001e68 <_ZdlPv>
    800051d4:	00048513          	mv	a0,s1
    800051d8:	00007097          	auipc	ra,0x7
    800051dc:	7a0080e7          	jalr	1952(ra) # 8000c978 <_Unwind_Resume>
    800051e0:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    800051e4:	000c8513          	mv	a0,s9
    800051e8:	ffffd097          	auipc	ra,0xffffd
    800051ec:	c80080e7          	jalr	-896(ra) # 80001e68 <_ZdlPv>
    800051f0:	00048513          	mv	a0,s1
    800051f4:	00007097          	auipc	ra,0x7
    800051f8:	784080e7          	jalr	1924(ra) # 8000c978 <_Unwind_Resume>

00000000800051fc <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    800051fc:	ff010113          	addi	sp,sp,-16
    80005200:	00113423          	sd	ra,8(sp)
    80005204:	00813023          	sd	s0,0(sp)
    80005208:	01010413          	addi	s0,sp,16
    8000520c:	00006797          	auipc	a5,0x6
    80005210:	53c78793          	addi	a5,a5,1340 # 8000b748 <_ZTV12ConsumerSync+0x10>
    80005214:	00f53023          	sd	a5,0(a0)
    80005218:	ffffd097          	auipc	ra,0xffffd
    8000521c:	ce0080e7          	jalr	-800(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80005220:	00813083          	ld	ra,8(sp)
    80005224:	00013403          	ld	s0,0(sp)
    80005228:	01010113          	addi	sp,sp,16
    8000522c:	00008067          	ret

0000000080005230 <_ZN12ConsumerSyncD0Ev>:
    80005230:	fe010113          	addi	sp,sp,-32
    80005234:	00113c23          	sd	ra,24(sp)
    80005238:	00813823          	sd	s0,16(sp)
    8000523c:	00913423          	sd	s1,8(sp)
    80005240:	02010413          	addi	s0,sp,32
    80005244:	00050493          	mv	s1,a0
    80005248:	00006797          	auipc	a5,0x6
    8000524c:	50078793          	addi	a5,a5,1280 # 8000b748 <_ZTV12ConsumerSync+0x10>
    80005250:	00f53023          	sd	a5,0(a0)
    80005254:	ffffd097          	auipc	ra,0xffffd
    80005258:	ca4080e7          	jalr	-860(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    8000525c:	00048513          	mv	a0,s1
    80005260:	ffffd097          	auipc	ra,0xffffd
    80005264:	c08080e7          	jalr	-1016(ra) # 80001e68 <_ZdlPv>
    80005268:	01813083          	ld	ra,24(sp)
    8000526c:	01013403          	ld	s0,16(sp)
    80005270:	00813483          	ld	s1,8(sp)
    80005274:	02010113          	addi	sp,sp,32
    80005278:	00008067          	ret

000000008000527c <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    8000527c:	ff010113          	addi	sp,sp,-16
    80005280:	00113423          	sd	ra,8(sp)
    80005284:	00813023          	sd	s0,0(sp)
    80005288:	01010413          	addi	s0,sp,16
    8000528c:	00006797          	auipc	a5,0x6
    80005290:	49478793          	addi	a5,a5,1172 # 8000b720 <_ZTV12ProducerSync+0x10>
    80005294:	00f53023          	sd	a5,0(a0)
    80005298:	ffffd097          	auipc	ra,0xffffd
    8000529c:	c60080e7          	jalr	-928(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    800052a0:	00813083          	ld	ra,8(sp)
    800052a4:	00013403          	ld	s0,0(sp)
    800052a8:	01010113          	addi	sp,sp,16
    800052ac:	00008067          	ret

00000000800052b0 <_ZN12ProducerSyncD0Ev>:
    800052b0:	fe010113          	addi	sp,sp,-32
    800052b4:	00113c23          	sd	ra,24(sp)
    800052b8:	00813823          	sd	s0,16(sp)
    800052bc:	00913423          	sd	s1,8(sp)
    800052c0:	02010413          	addi	s0,sp,32
    800052c4:	00050493          	mv	s1,a0
    800052c8:	00006797          	auipc	a5,0x6
    800052cc:	45878793          	addi	a5,a5,1112 # 8000b720 <_ZTV12ProducerSync+0x10>
    800052d0:	00f53023          	sd	a5,0(a0)
    800052d4:	ffffd097          	auipc	ra,0xffffd
    800052d8:	c24080e7          	jalr	-988(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    800052dc:	00048513          	mv	a0,s1
    800052e0:	ffffd097          	auipc	ra,0xffffd
    800052e4:	b88080e7          	jalr	-1144(ra) # 80001e68 <_ZdlPv>
    800052e8:	01813083          	ld	ra,24(sp)
    800052ec:	01013403          	ld	s0,16(sp)
    800052f0:	00813483          	ld	s1,8(sp)
    800052f4:	02010113          	addi	sp,sp,32
    800052f8:	00008067          	ret

00000000800052fc <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    800052fc:	ff010113          	addi	sp,sp,-16
    80005300:	00113423          	sd	ra,8(sp)
    80005304:	00813023          	sd	s0,0(sp)
    80005308:	01010413          	addi	s0,sp,16
    8000530c:	00006797          	auipc	a5,0x6
    80005310:	3ec78793          	addi	a5,a5,1004 # 8000b6f8 <_ZTV16ProducerKeyboard+0x10>
    80005314:	00f53023          	sd	a5,0(a0)
    80005318:	ffffd097          	auipc	ra,0xffffd
    8000531c:	be0080e7          	jalr	-1056(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    80005320:	00813083          	ld	ra,8(sp)
    80005324:	00013403          	ld	s0,0(sp)
    80005328:	01010113          	addi	sp,sp,16
    8000532c:	00008067          	ret

0000000080005330 <_ZN16ProducerKeyboardD0Ev>:
    80005330:	fe010113          	addi	sp,sp,-32
    80005334:	00113c23          	sd	ra,24(sp)
    80005338:	00813823          	sd	s0,16(sp)
    8000533c:	00913423          	sd	s1,8(sp)
    80005340:	02010413          	addi	s0,sp,32
    80005344:	00050493          	mv	s1,a0
    80005348:	00006797          	auipc	a5,0x6
    8000534c:	3b078793          	addi	a5,a5,944 # 8000b6f8 <_ZTV16ProducerKeyboard+0x10>
    80005350:	00f53023          	sd	a5,0(a0)
    80005354:	ffffd097          	auipc	ra,0xffffd
    80005358:	ba4080e7          	jalr	-1116(ra) # 80001ef8 <_ZN6ThreadD1Ev>
    8000535c:	00048513          	mv	a0,s1
    80005360:	ffffd097          	auipc	ra,0xffffd
    80005364:	b08080e7          	jalr	-1272(ra) # 80001e68 <_ZdlPv>
    80005368:	01813083          	ld	ra,24(sp)
    8000536c:	01013403          	ld	s0,16(sp)
    80005370:	00813483          	ld	s1,8(sp)
    80005374:	02010113          	addi	sp,sp,32
    80005378:	00008067          	ret

000000008000537c <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    8000537c:	ff010113          	addi	sp,sp,-16
    80005380:	00113423          	sd	ra,8(sp)
    80005384:	00813023          	sd	s0,0(sp)
    80005388:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    8000538c:	01053583          	ld	a1,16(a0)
    80005390:	fffff097          	auipc	ra,0xfffff
    80005394:	7e4080e7          	jalr	2020(ra) # 80004b74 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80005398:	00813083          	ld	ra,8(sp)
    8000539c:	00013403          	ld	s0,0(sp)
    800053a0:	01010113          	addi	sp,sp,16
    800053a4:	00008067          	ret

00000000800053a8 <_ZN12ProducerSync3runEv>:
    void run() override {
    800053a8:	ff010113          	addi	sp,sp,-16
    800053ac:	00113423          	sd	ra,8(sp)
    800053b0:	00813023          	sd	s0,0(sp)
    800053b4:	01010413          	addi	s0,sp,16
        producer(td);
    800053b8:	01053583          	ld	a1,16(a0)
    800053bc:	00000097          	auipc	ra,0x0
    800053c0:	878080e7          	jalr	-1928(ra) # 80004c34 <_ZN12ProducerSync8producerEPv>
    }
    800053c4:	00813083          	ld	ra,8(sp)
    800053c8:	00013403          	ld	s0,0(sp)
    800053cc:	01010113          	addi	sp,sp,16
    800053d0:	00008067          	ret

00000000800053d4 <_ZN12ConsumerSync3runEv>:
    void run() override {
    800053d4:	ff010113          	addi	sp,sp,-16
    800053d8:	00113423          	sd	ra,8(sp)
    800053dc:	00813023          	sd	s0,0(sp)
    800053e0:	01010413          	addi	s0,sp,16
        consumer(td);
    800053e4:	01053583          	ld	a1,16(a0)
    800053e8:	00000097          	auipc	ra,0x0
    800053ec:	8e0080e7          	jalr	-1824(ra) # 80004cc8 <_ZN12ConsumerSync8consumerEPv>
    }
    800053f0:	00813083          	ld	ra,8(sp)
    800053f4:	00013403          	ld	s0,0(sp)
    800053f8:	01010113          	addi	sp,sp,16
    800053fc:	00008067          	ret

0000000080005400 <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80005400:	fe010113          	addi	sp,sp,-32
    80005404:	00113c23          	sd	ra,24(sp)
    80005408:	00813823          	sd	s0,16(sp)
    8000540c:	00913423          	sd	s1,8(sp)
    80005410:	02010413          	addi	s0,sp,32
    80005414:	00050493          	mv	s1,a0
    LOCK();
    80005418:	00100613          	li	a2,1
    8000541c:	00000593          	li	a1,0
    80005420:	00006517          	auipc	a0,0x6
    80005424:	47850513          	addi	a0,a0,1144 # 8000b898 <lockPrint>
    80005428:	ffffc097          	auipc	ra,0xffffc
    8000542c:	f44080e7          	jalr	-188(ra) # 8000136c <copy_and_swap>
    80005430:	00050863          	beqz	a0,80005440 <_Z11printStringPKc+0x40>
    80005434:	ffffc097          	auipc	ra,0xffffc
    80005438:	074080e7          	jalr	116(ra) # 800014a8 <_Z15thread_dispatchv>
    8000543c:	fddff06f          	j	80005418 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80005440:	0004c503          	lbu	a0,0(s1)
    80005444:	00050a63          	beqz	a0,80005458 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80005448:	ffffc097          	auipc	ra,0xffffc
    8000544c:	1f0080e7          	jalr	496(ra) # 80001638 <_Z4putcc>
        string++;
    80005450:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80005454:	fedff06f          	j	80005440 <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80005458:	00000613          	li	a2,0
    8000545c:	00100593          	li	a1,1
    80005460:	00006517          	auipc	a0,0x6
    80005464:	43850513          	addi	a0,a0,1080 # 8000b898 <lockPrint>
    80005468:	ffffc097          	auipc	ra,0xffffc
    8000546c:	f04080e7          	jalr	-252(ra) # 8000136c <copy_and_swap>
    80005470:	fe0514e3          	bnez	a0,80005458 <_Z11printStringPKc+0x58>
}
    80005474:	01813083          	ld	ra,24(sp)
    80005478:	01013403          	ld	s0,16(sp)
    8000547c:	00813483          	ld	s1,8(sp)
    80005480:	02010113          	addi	sp,sp,32
    80005484:	00008067          	ret

0000000080005488 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005488:	fd010113          	addi	sp,sp,-48
    8000548c:	02113423          	sd	ra,40(sp)
    80005490:	02813023          	sd	s0,32(sp)
    80005494:	00913c23          	sd	s1,24(sp)
    80005498:	01213823          	sd	s2,16(sp)
    8000549c:	01313423          	sd	s3,8(sp)
    800054a0:	01413023          	sd	s4,0(sp)
    800054a4:	03010413          	addi	s0,sp,48
    800054a8:	00050993          	mv	s3,a0
    800054ac:	00058a13          	mv	s4,a1
    LOCK();
    800054b0:	00100613          	li	a2,1
    800054b4:	00000593          	li	a1,0
    800054b8:	00006517          	auipc	a0,0x6
    800054bc:	3e050513          	addi	a0,a0,992 # 8000b898 <lockPrint>
    800054c0:	ffffc097          	auipc	ra,0xffffc
    800054c4:	eac080e7          	jalr	-340(ra) # 8000136c <copy_and_swap>
    800054c8:	00050863          	beqz	a0,800054d8 <_Z9getStringPci+0x50>
    800054cc:	ffffc097          	auipc	ra,0xffffc
    800054d0:	fdc080e7          	jalr	-36(ra) # 800014a8 <_Z15thread_dispatchv>
    800054d4:	fddff06f          	j	800054b0 <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    800054d8:	00000913          	li	s2,0
    800054dc:	00090493          	mv	s1,s2
    800054e0:	0019091b          	addiw	s2,s2,1
    800054e4:	03495a63          	bge	s2,s4,80005518 <_Z9getStringPci+0x90>
        cc = getc();
    800054e8:	ffffc097          	auipc	ra,0xffffc
    800054ec:	11c080e7          	jalr	284(ra) # 80001604 <_Z4getcv>
        if(cc < 1)
    800054f0:	02050463          	beqz	a0,80005518 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    800054f4:	009984b3          	add	s1,s3,s1
    800054f8:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    800054fc:	00a00793          	li	a5,10
    80005500:	00f50a63          	beq	a0,a5,80005514 <_Z9getStringPci+0x8c>
    80005504:	00d00793          	li	a5,13
    80005508:	fcf51ae3          	bne	a0,a5,800054dc <_Z9getStringPci+0x54>
        buf[i++] = c;
    8000550c:	00090493          	mv	s1,s2
    80005510:	0080006f          	j	80005518 <_Z9getStringPci+0x90>
    80005514:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    80005518:	009984b3          	add	s1,s3,s1
    8000551c:	00048023          	sb	zero,0(s1)

    UNLOCK();
    80005520:	00000613          	li	a2,0
    80005524:	00100593          	li	a1,1
    80005528:	00006517          	auipc	a0,0x6
    8000552c:	37050513          	addi	a0,a0,880 # 8000b898 <lockPrint>
    80005530:	ffffc097          	auipc	ra,0xffffc
    80005534:	e3c080e7          	jalr	-452(ra) # 8000136c <copy_and_swap>
    80005538:	fe0514e3          	bnez	a0,80005520 <_Z9getStringPci+0x98>
    return buf;
}
    8000553c:	00098513          	mv	a0,s3
    80005540:	02813083          	ld	ra,40(sp)
    80005544:	02013403          	ld	s0,32(sp)
    80005548:	01813483          	ld	s1,24(sp)
    8000554c:	01013903          	ld	s2,16(sp)
    80005550:	00813983          	ld	s3,8(sp)
    80005554:	00013a03          	ld	s4,0(sp)
    80005558:	03010113          	addi	sp,sp,48
    8000555c:	00008067          	ret

0000000080005560 <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    80005560:	ff010113          	addi	sp,sp,-16
    80005564:	00813423          	sd	s0,8(sp)
    80005568:	01010413          	addi	s0,sp,16
    8000556c:	00050693          	mv	a3,a0
    int n;

    n = 0;
    80005570:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005574:	0006c603          	lbu	a2,0(a3)
    80005578:	fd06071b          	addiw	a4,a2,-48
    8000557c:	0ff77713          	andi	a4,a4,255
    80005580:	00900793          	li	a5,9
    80005584:	02e7e063          	bltu	a5,a4,800055a4 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005588:	0025179b          	slliw	a5,a0,0x2
    8000558c:	00a787bb          	addw	a5,a5,a0
    80005590:	0017979b          	slliw	a5,a5,0x1
    80005594:	00168693          	addi	a3,a3,1
    80005598:	00c787bb          	addw	a5,a5,a2
    8000559c:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    800055a0:	fd5ff06f          	j	80005574 <_Z11stringToIntPKc+0x14>
    return n;
}
    800055a4:	00813403          	ld	s0,8(sp)
    800055a8:	01010113          	addi	sp,sp,16
    800055ac:	00008067          	ret

00000000800055b0 <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    800055b0:	fc010113          	addi	sp,sp,-64
    800055b4:	02113c23          	sd	ra,56(sp)
    800055b8:	02813823          	sd	s0,48(sp)
    800055bc:	02913423          	sd	s1,40(sp)
    800055c0:	03213023          	sd	s2,32(sp)
    800055c4:	01313c23          	sd	s3,24(sp)
    800055c8:	04010413          	addi	s0,sp,64
    800055cc:	00050493          	mv	s1,a0
    800055d0:	00058913          	mv	s2,a1
    800055d4:	00060993          	mv	s3,a2
    LOCK();
    800055d8:	00100613          	li	a2,1
    800055dc:	00000593          	li	a1,0
    800055e0:	00006517          	auipc	a0,0x6
    800055e4:	2b850513          	addi	a0,a0,696 # 8000b898 <lockPrint>
    800055e8:	ffffc097          	auipc	ra,0xffffc
    800055ec:	d84080e7          	jalr	-636(ra) # 8000136c <copy_and_swap>
    800055f0:	00050863          	beqz	a0,80005600 <_Z8printIntiii+0x50>
    800055f4:	ffffc097          	auipc	ra,0xffffc
    800055f8:	eb4080e7          	jalr	-332(ra) # 800014a8 <_Z15thread_dispatchv>
    800055fc:	fddff06f          	j	800055d8 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    80005600:	00098463          	beqz	s3,80005608 <_Z8printIntiii+0x58>
    80005604:	0804c463          	bltz	s1,8000568c <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    80005608:	0004851b          	sext.w	a0,s1
    neg = 0;
    8000560c:	00000593          	li	a1,0
    }

    i = 0;
    80005610:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    80005614:	0009079b          	sext.w	a5,s2
    80005618:	0325773b          	remuw	a4,a0,s2
    8000561c:	00048613          	mv	a2,s1
    80005620:	0014849b          	addiw	s1,s1,1
    80005624:	02071693          	slli	a3,a4,0x20
    80005628:	0206d693          	srli	a3,a3,0x20
    8000562c:	00006717          	auipc	a4,0x6
    80005630:	13470713          	addi	a4,a4,308 # 8000b760 <digits>
    80005634:	00d70733          	add	a4,a4,a3
    80005638:	00074683          	lbu	a3,0(a4)
    8000563c:	fd040713          	addi	a4,s0,-48
    80005640:	00c70733          	add	a4,a4,a2
    80005644:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    80005648:	0005071b          	sext.w	a4,a0
    8000564c:	0325553b          	divuw	a0,a0,s2
    80005650:	fcf772e3          	bgeu	a4,a5,80005614 <_Z8printIntiii+0x64>
    if(neg)
    80005654:	00058c63          	beqz	a1,8000566c <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    80005658:	fd040793          	addi	a5,s0,-48
    8000565c:	009784b3          	add	s1,a5,s1
    80005660:	02d00793          	li	a5,45
    80005664:	fef48823          	sb	a5,-16(s1)
    80005668:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    8000566c:	fff4849b          	addiw	s1,s1,-1
    80005670:	0204c463          	bltz	s1,80005698 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005674:	fd040793          	addi	a5,s0,-48
    80005678:	009787b3          	add	a5,a5,s1
    8000567c:	ff07c503          	lbu	a0,-16(a5)
    80005680:	ffffc097          	auipc	ra,0xffffc
    80005684:	fb8080e7          	jalr	-72(ra) # 80001638 <_Z4putcc>
    80005688:	fe5ff06f          	j	8000566c <_Z8printIntiii+0xbc>
        x = -xx;
    8000568c:	4090053b          	negw	a0,s1
        neg = 1;
    80005690:	00100593          	li	a1,1
        x = -xx;
    80005694:	f7dff06f          	j	80005610 <_Z8printIntiii+0x60>

    UNLOCK();
    80005698:	00000613          	li	a2,0
    8000569c:	00100593          	li	a1,1
    800056a0:	00006517          	auipc	a0,0x6
    800056a4:	1f850513          	addi	a0,a0,504 # 8000b898 <lockPrint>
    800056a8:	ffffc097          	auipc	ra,0xffffc
    800056ac:	cc4080e7          	jalr	-828(ra) # 8000136c <copy_and_swap>
    800056b0:	fe0514e3          	bnez	a0,80005698 <_Z8printIntiii+0xe8>
    800056b4:	03813083          	ld	ra,56(sp)
    800056b8:	03013403          	ld	s0,48(sp)
    800056bc:	02813483          	ld	s1,40(sp)
    800056c0:	02013903          	ld	s2,32(sp)
    800056c4:	01813983          	ld	s3,24(sp)
    800056c8:	04010113          	addi	sp,sp,64
    800056cc:	00008067          	ret

00000000800056d0 <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    800056d0:	fd010113          	addi	sp,sp,-48
    800056d4:	02113423          	sd	ra,40(sp)
    800056d8:	02813023          	sd	s0,32(sp)
    800056dc:	00913c23          	sd	s1,24(sp)
    800056e0:	01213823          	sd	s2,16(sp)
    800056e4:	01313423          	sd	s3,8(sp)
    800056e8:	03010413          	addi	s0,sp,48
    800056ec:	00050493          	mv	s1,a0
    800056f0:	00058913          	mv	s2,a1
    800056f4:	0015879b          	addiw	a5,a1,1
    800056f8:	0007851b          	sext.w	a0,a5
    800056fc:	00f4a023          	sw	a5,0(s1)
    80005700:	0004a823          	sw	zero,16(s1)
    80005704:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005708:	00251513          	slli	a0,a0,0x2
    8000570c:	ffffc097          	auipc	ra,0xffffc
    80005710:	c80080e7          	jalr	-896(ra) # 8000138c <_Z9mem_allocm>
    80005714:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    80005718:	01000513          	li	a0,16
    8000571c:	ffffc097          	auipc	ra,0xffffc
    80005720:	6fc080e7          	jalr	1788(ra) # 80001e18 <_Znwm>
    80005724:	00050993          	mv	s3,a0
    80005728:	00000593          	li	a1,0
    8000572c:	ffffd097          	auipc	ra,0xffffd
    80005730:	998080e7          	jalr	-1640(ra) # 800020c4 <_ZN9SemaphoreC1Ej>
    80005734:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    80005738:	01000513          	li	a0,16
    8000573c:	ffffc097          	auipc	ra,0xffffc
    80005740:	6dc080e7          	jalr	1756(ra) # 80001e18 <_Znwm>
    80005744:	00050993          	mv	s3,a0
    80005748:	00090593          	mv	a1,s2
    8000574c:	ffffd097          	auipc	ra,0xffffd
    80005750:	978080e7          	jalr	-1672(ra) # 800020c4 <_ZN9SemaphoreC1Ej>
    80005754:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    80005758:	01000513          	li	a0,16
    8000575c:	ffffc097          	auipc	ra,0xffffc
    80005760:	6bc080e7          	jalr	1724(ra) # 80001e18 <_Znwm>
    80005764:	00050913          	mv	s2,a0
    80005768:	00100593          	li	a1,1
    8000576c:	ffffd097          	auipc	ra,0xffffd
    80005770:	958080e7          	jalr	-1704(ra) # 800020c4 <_ZN9SemaphoreC1Ej>
    80005774:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005778:	01000513          	li	a0,16
    8000577c:	ffffc097          	auipc	ra,0xffffc
    80005780:	69c080e7          	jalr	1692(ra) # 80001e18 <_Znwm>
    80005784:	00050913          	mv	s2,a0
    80005788:	00100593          	li	a1,1
    8000578c:	ffffd097          	auipc	ra,0xffffd
    80005790:	938080e7          	jalr	-1736(ra) # 800020c4 <_ZN9SemaphoreC1Ej>
    80005794:	0324b823          	sd	s2,48(s1)
}
    80005798:	02813083          	ld	ra,40(sp)
    8000579c:	02013403          	ld	s0,32(sp)
    800057a0:	01813483          	ld	s1,24(sp)
    800057a4:	01013903          	ld	s2,16(sp)
    800057a8:	00813983          	ld	s3,8(sp)
    800057ac:	03010113          	addi	sp,sp,48
    800057b0:	00008067          	ret
    800057b4:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    800057b8:	00098513          	mv	a0,s3
    800057bc:	ffffc097          	auipc	ra,0xffffc
    800057c0:	6ac080e7          	jalr	1708(ra) # 80001e68 <_ZdlPv>
    800057c4:	00048513          	mv	a0,s1
    800057c8:	00007097          	auipc	ra,0x7
    800057cc:	1b0080e7          	jalr	432(ra) # 8000c978 <_Unwind_Resume>
    800057d0:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    800057d4:	00098513          	mv	a0,s3
    800057d8:	ffffc097          	auipc	ra,0xffffc
    800057dc:	690080e7          	jalr	1680(ra) # 80001e68 <_ZdlPv>
    800057e0:	00048513          	mv	a0,s1
    800057e4:	00007097          	auipc	ra,0x7
    800057e8:	194080e7          	jalr	404(ra) # 8000c978 <_Unwind_Resume>
    800057ec:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    800057f0:	00090513          	mv	a0,s2
    800057f4:	ffffc097          	auipc	ra,0xffffc
    800057f8:	674080e7          	jalr	1652(ra) # 80001e68 <_ZdlPv>
    800057fc:	00048513          	mv	a0,s1
    80005800:	00007097          	auipc	ra,0x7
    80005804:	178080e7          	jalr	376(ra) # 8000c978 <_Unwind_Resume>
    80005808:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    8000580c:	00090513          	mv	a0,s2
    80005810:	ffffc097          	auipc	ra,0xffffc
    80005814:	658080e7          	jalr	1624(ra) # 80001e68 <_ZdlPv>
    80005818:	00048513          	mv	a0,s1
    8000581c:	00007097          	auipc	ra,0x7
    80005820:	15c080e7          	jalr	348(ra) # 8000c978 <_Unwind_Resume>

0000000080005824 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    80005824:	fe010113          	addi	sp,sp,-32
    80005828:	00113c23          	sd	ra,24(sp)
    8000582c:	00813823          	sd	s0,16(sp)
    80005830:	00913423          	sd	s1,8(sp)
    80005834:	01213023          	sd	s2,0(sp)
    80005838:	02010413          	addi	s0,sp,32
    8000583c:	00050493          	mv	s1,a0
    80005840:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    80005844:	01853503          	ld	a0,24(a0)
    80005848:	ffffd097          	auipc	ra,0xffffd
    8000584c:	8b8080e7          	jalr	-1864(ra) # 80002100 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    80005850:	0304b503          	ld	a0,48(s1)
    80005854:	ffffd097          	auipc	ra,0xffffd
    80005858:	8ac080e7          	jalr	-1876(ra) # 80002100 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    8000585c:	0084b783          	ld	a5,8(s1)
    80005860:	0144a703          	lw	a4,20(s1)
    80005864:	00271713          	slli	a4,a4,0x2
    80005868:	00e787b3          	add	a5,a5,a4
    8000586c:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005870:	0144a783          	lw	a5,20(s1)
    80005874:	0017879b          	addiw	a5,a5,1
    80005878:	0004a703          	lw	a4,0(s1)
    8000587c:	02e7e7bb          	remw	a5,a5,a4
    80005880:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005884:	0304b503          	ld	a0,48(s1)
    80005888:	ffffd097          	auipc	ra,0xffffd
    8000588c:	8a4080e7          	jalr	-1884(ra) # 8000212c <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    80005890:	0204b503          	ld	a0,32(s1)
    80005894:	ffffd097          	auipc	ra,0xffffd
    80005898:	898080e7          	jalr	-1896(ra) # 8000212c <_ZN9Semaphore6signalEv>

}
    8000589c:	01813083          	ld	ra,24(sp)
    800058a0:	01013403          	ld	s0,16(sp)
    800058a4:	00813483          	ld	s1,8(sp)
    800058a8:	00013903          	ld	s2,0(sp)
    800058ac:	02010113          	addi	sp,sp,32
    800058b0:	00008067          	ret

00000000800058b4 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    800058b4:	fe010113          	addi	sp,sp,-32
    800058b8:	00113c23          	sd	ra,24(sp)
    800058bc:	00813823          	sd	s0,16(sp)
    800058c0:	00913423          	sd	s1,8(sp)
    800058c4:	01213023          	sd	s2,0(sp)
    800058c8:	02010413          	addi	s0,sp,32
    800058cc:	00050493          	mv	s1,a0
    itemAvailable->wait();
    800058d0:	02053503          	ld	a0,32(a0)
    800058d4:	ffffd097          	auipc	ra,0xffffd
    800058d8:	82c080e7          	jalr	-2004(ra) # 80002100 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    800058dc:	0284b503          	ld	a0,40(s1)
    800058e0:	ffffd097          	auipc	ra,0xffffd
    800058e4:	820080e7          	jalr	-2016(ra) # 80002100 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    800058e8:	0084b703          	ld	a4,8(s1)
    800058ec:	0104a783          	lw	a5,16(s1)
    800058f0:	00279693          	slli	a3,a5,0x2
    800058f4:	00d70733          	add	a4,a4,a3
    800058f8:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800058fc:	0017879b          	addiw	a5,a5,1
    80005900:	0004a703          	lw	a4,0(s1)
    80005904:	02e7e7bb          	remw	a5,a5,a4
    80005908:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    8000590c:	0284b503          	ld	a0,40(s1)
    80005910:	ffffd097          	auipc	ra,0xffffd
    80005914:	81c080e7          	jalr	-2020(ra) # 8000212c <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    80005918:	0184b503          	ld	a0,24(s1)
    8000591c:	ffffd097          	auipc	ra,0xffffd
    80005920:	810080e7          	jalr	-2032(ra) # 8000212c <_ZN9Semaphore6signalEv>

    return ret;
}
    80005924:	00090513          	mv	a0,s2
    80005928:	01813083          	ld	ra,24(sp)
    8000592c:	01013403          	ld	s0,16(sp)
    80005930:	00813483          	ld	s1,8(sp)
    80005934:	00013903          	ld	s2,0(sp)
    80005938:	02010113          	addi	sp,sp,32
    8000593c:	00008067          	ret

0000000080005940 <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    80005940:	fe010113          	addi	sp,sp,-32
    80005944:	00113c23          	sd	ra,24(sp)
    80005948:	00813823          	sd	s0,16(sp)
    8000594c:	00913423          	sd	s1,8(sp)
    80005950:	01213023          	sd	s2,0(sp)
    80005954:	02010413          	addi	s0,sp,32
    80005958:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    8000595c:	02853503          	ld	a0,40(a0)
    80005960:	ffffc097          	auipc	ra,0xffffc
    80005964:	7a0080e7          	jalr	1952(ra) # 80002100 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005968:	0304b503          	ld	a0,48(s1)
    8000596c:	ffffc097          	auipc	ra,0xffffc
    80005970:	794080e7          	jalr	1940(ra) # 80002100 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005974:	0144a783          	lw	a5,20(s1)
    80005978:	0104a903          	lw	s2,16(s1)
    8000597c:	0327ce63          	blt	a5,s2,800059b8 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    80005980:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005984:	0304b503          	ld	a0,48(s1)
    80005988:	ffffc097          	auipc	ra,0xffffc
    8000598c:	7a4080e7          	jalr	1956(ra) # 8000212c <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    80005990:	0284b503          	ld	a0,40(s1)
    80005994:	ffffc097          	auipc	ra,0xffffc
    80005998:	798080e7          	jalr	1944(ra) # 8000212c <_ZN9Semaphore6signalEv>

    return ret;
}
    8000599c:	00090513          	mv	a0,s2
    800059a0:	01813083          	ld	ra,24(sp)
    800059a4:	01013403          	ld	s0,16(sp)
    800059a8:	00813483          	ld	s1,8(sp)
    800059ac:	00013903          	ld	s2,0(sp)
    800059b0:	02010113          	addi	sp,sp,32
    800059b4:	00008067          	ret
        ret = cap - head + tail;
    800059b8:	0004a703          	lw	a4,0(s1)
    800059bc:	4127093b          	subw	s2,a4,s2
    800059c0:	00f9093b          	addw	s2,s2,a5
    800059c4:	fc1ff06f          	j	80005984 <_ZN9BufferCPP6getCntEv+0x44>

00000000800059c8 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    800059c8:	fe010113          	addi	sp,sp,-32
    800059cc:	00113c23          	sd	ra,24(sp)
    800059d0:	00813823          	sd	s0,16(sp)
    800059d4:	00913423          	sd	s1,8(sp)
    800059d8:	02010413          	addi	s0,sp,32
    800059dc:	00050493          	mv	s1,a0
    Console::putc('\n');
    800059e0:	00a00513          	li	a0,10
    800059e4:	ffffd097          	auipc	ra,0xffffd
    800059e8:	870080e7          	jalr	-1936(ra) # 80002254 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    800059ec:	00004517          	auipc	a0,0x4
    800059f0:	86c50513          	addi	a0,a0,-1940 # 80009258 <CONSOLE_STATUS+0x248>
    800059f4:	00000097          	auipc	ra,0x0
    800059f8:	a0c080e7          	jalr	-1524(ra) # 80005400 <_Z11printStringPKc>
    while (getCnt()) {
    800059fc:	00048513          	mv	a0,s1
    80005a00:	00000097          	auipc	ra,0x0
    80005a04:	f40080e7          	jalr	-192(ra) # 80005940 <_ZN9BufferCPP6getCntEv>
    80005a08:	02050c63          	beqz	a0,80005a40 <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    80005a0c:	0084b783          	ld	a5,8(s1)
    80005a10:	0104a703          	lw	a4,16(s1)
    80005a14:	00271713          	slli	a4,a4,0x2
    80005a18:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    80005a1c:	0007c503          	lbu	a0,0(a5)
    80005a20:	ffffd097          	auipc	ra,0xffffd
    80005a24:	834080e7          	jalr	-1996(ra) # 80002254 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    80005a28:	0104a783          	lw	a5,16(s1)
    80005a2c:	0017879b          	addiw	a5,a5,1
    80005a30:	0004a703          	lw	a4,0(s1)
    80005a34:	02e7e7bb          	remw	a5,a5,a4
    80005a38:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    80005a3c:	fc1ff06f          	j	800059fc <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    80005a40:	02100513          	li	a0,33
    80005a44:	ffffd097          	auipc	ra,0xffffd
    80005a48:	810080e7          	jalr	-2032(ra) # 80002254 <_ZN7Console4putcEc>
    Console::putc('\n');
    80005a4c:	00a00513          	li	a0,10
    80005a50:	ffffd097          	auipc	ra,0xffffd
    80005a54:	804080e7          	jalr	-2044(ra) # 80002254 <_ZN7Console4putcEc>
    mem_free(buffer);
    80005a58:	0084b503          	ld	a0,8(s1)
    80005a5c:	ffffc097          	auipc	ra,0xffffc
    80005a60:	970080e7          	jalr	-1680(ra) # 800013cc <_Z8mem_freePv>
    delete itemAvailable;
    80005a64:	0204b503          	ld	a0,32(s1)
    80005a68:	00050863          	beqz	a0,80005a78 <_ZN9BufferCPPD1Ev+0xb0>
    80005a6c:	00053783          	ld	a5,0(a0)
    80005a70:	0087b783          	ld	a5,8(a5)
    80005a74:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005a78:	0184b503          	ld	a0,24(s1)
    80005a7c:	00050863          	beqz	a0,80005a8c <_ZN9BufferCPPD1Ev+0xc4>
    80005a80:	00053783          	ld	a5,0(a0)
    80005a84:	0087b783          	ld	a5,8(a5)
    80005a88:	000780e7          	jalr	a5
    delete mutexTail;
    80005a8c:	0304b503          	ld	a0,48(s1)
    80005a90:	00050863          	beqz	a0,80005aa0 <_ZN9BufferCPPD1Ev+0xd8>
    80005a94:	00053783          	ld	a5,0(a0)
    80005a98:	0087b783          	ld	a5,8(a5)
    80005a9c:	000780e7          	jalr	a5
    delete mutexHead;
    80005aa0:	0284b503          	ld	a0,40(s1)
    80005aa4:	00050863          	beqz	a0,80005ab4 <_ZN9BufferCPPD1Ev+0xec>
    80005aa8:	00053783          	ld	a5,0(a0)
    80005aac:	0087b783          	ld	a5,8(a5)
    80005ab0:	000780e7          	jalr	a5
}
    80005ab4:	01813083          	ld	ra,24(sp)
    80005ab8:	01013403          	ld	s0,16(sp)
    80005abc:	00813483          	ld	s1,8(sp)
    80005ac0:	02010113          	addi	sp,sp,32
    80005ac4:	00008067          	ret

0000000080005ac8 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005ac8:	fe010113          	addi	sp,sp,-32
    80005acc:	00113c23          	sd	ra,24(sp)
    80005ad0:	00813823          	sd	s0,16(sp)
    80005ad4:	00913423          	sd	s1,8(sp)
    80005ad8:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005adc:	00003517          	auipc	a0,0x3
    80005ae0:	79450513          	addi	a0,a0,1940 # 80009270 <CONSOLE_STATUS+0x260>
    80005ae4:	00000097          	auipc	ra,0x0
    80005ae8:	91c080e7          	jalr	-1764(ra) # 80005400 <_Z11printStringPKc>
    int test = getc() - '0';
    80005aec:	ffffc097          	auipc	ra,0xffffc
    80005af0:	b18080e7          	jalr	-1256(ra) # 80001604 <_Z4getcv>
    80005af4:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005af8:	ffffc097          	auipc	ra,0xffffc
    80005afc:	b0c080e7          	jalr	-1268(ra) # 80001604 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    80005b00:	00700793          	li	a5,7
    80005b04:	1097e263          	bltu	a5,s1,80005c08 <_Z8userMainv+0x140>
    80005b08:	00249493          	slli	s1,s1,0x2
    80005b0c:	00004717          	auipc	a4,0x4
    80005b10:	9bc70713          	addi	a4,a4,-1604 # 800094c8 <CONSOLE_STATUS+0x4b8>
    80005b14:	00e484b3          	add	s1,s1,a4
    80005b18:	0004a783          	lw	a5,0(s1)
    80005b1c:	00e787b3          	add	a5,a5,a4
    80005b20:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    80005b24:	fffff097          	auipc	ra,0xfffff
    80005b28:	f54080e7          	jalr	-172(ra) # 80004a78 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    80005b2c:	00003517          	auipc	a0,0x3
    80005b30:	76450513          	addi	a0,a0,1892 # 80009290 <CONSOLE_STATUS+0x280>
    80005b34:	00000097          	auipc	ra,0x0
    80005b38:	8cc080e7          	jalr	-1844(ra) # 80005400 <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    80005b3c:	01813083          	ld	ra,24(sp)
    80005b40:	01013403          	ld	s0,16(sp)
    80005b44:	00813483          	ld	s1,8(sp)
    80005b48:	02010113          	addi	sp,sp,32
    80005b4c:	00008067          	ret
            Threads_CPP_API_test();
    80005b50:	ffffe097          	auipc	ra,0xffffe
    80005b54:	e08080e7          	jalr	-504(ra) # 80003958 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    80005b58:	00003517          	auipc	a0,0x3
    80005b5c:	77850513          	addi	a0,a0,1912 # 800092d0 <CONSOLE_STATUS+0x2c0>
    80005b60:	00000097          	auipc	ra,0x0
    80005b64:	8a0080e7          	jalr	-1888(ra) # 80005400 <_Z11printStringPKc>
            break;
    80005b68:	fd5ff06f          	j	80005b3c <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80005b6c:	ffffd097          	auipc	ra,0xffffd
    80005b70:	640080e7          	jalr	1600(ra) # 800031ac <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80005b74:	00003517          	auipc	a0,0x3
    80005b78:	79c50513          	addi	a0,a0,1948 # 80009310 <CONSOLE_STATUS+0x300>
    80005b7c:	00000097          	auipc	ra,0x0
    80005b80:	884080e7          	jalr	-1916(ra) # 80005400 <_Z11printStringPKc>
            break;
    80005b84:	fb9ff06f          	j	80005b3c <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80005b88:	fffff097          	auipc	ra,0xfffff
    80005b8c:	234080e7          	jalr	564(ra) # 80004dbc <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    80005b90:	00003517          	auipc	a0,0x3
    80005b94:	7d050513          	addi	a0,a0,2000 # 80009360 <CONSOLE_STATUS+0x350>
    80005b98:	00000097          	auipc	ra,0x0
    80005b9c:	868080e7          	jalr	-1944(ra) # 80005400 <_Z11printStringPKc>
            break;
    80005ba0:	f9dff06f          	j	80005b3c <_Z8userMainv+0x74>
            testSleeping();
    80005ba4:	00000097          	auipc	ra,0x0
    80005ba8:	11c080e7          	jalr	284(ra) # 80005cc0 <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80005bac:	00004517          	auipc	a0,0x4
    80005bb0:	80c50513          	addi	a0,a0,-2036 # 800093b8 <CONSOLE_STATUS+0x3a8>
    80005bb4:	00000097          	auipc	ra,0x0
    80005bb8:	84c080e7          	jalr	-1972(ra) # 80005400 <_Z11printStringPKc>
            break;
    80005bbc:	f81ff06f          	j	80005b3c <_Z8userMainv+0x74>
            testConsumerProducer();
    80005bc0:	ffffe097          	auipc	ra,0xffffe
    80005bc4:	258080e7          	jalr	600(ra) # 80003e18 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80005bc8:	00004517          	auipc	a0,0x4
    80005bcc:	82050513          	addi	a0,a0,-2016 # 800093e8 <CONSOLE_STATUS+0x3d8>
    80005bd0:	00000097          	auipc	ra,0x0
    80005bd4:	830080e7          	jalr	-2000(ra) # 80005400 <_Z11printStringPKc>
            break;
    80005bd8:	f65ff06f          	j	80005b3c <_Z8userMainv+0x74>
            System_Mode_test();
    80005bdc:	00000097          	auipc	ra,0x0
    80005be0:	658080e7          	jalr	1624(ra) # 80006234 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80005be4:	00004517          	auipc	a0,0x4
    80005be8:	84450513          	addi	a0,a0,-1980 # 80009428 <CONSOLE_STATUS+0x418>
    80005bec:	00000097          	auipc	ra,0x0
    80005bf0:	814080e7          	jalr	-2028(ra) # 80005400 <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80005bf4:	00004517          	auipc	a0,0x4
    80005bf8:	85450513          	addi	a0,a0,-1964 # 80009448 <CONSOLE_STATUS+0x438>
    80005bfc:	00000097          	auipc	ra,0x0
    80005c00:	804080e7          	jalr	-2044(ra) # 80005400 <_Z11printStringPKc>
            break;
    80005c04:	f39ff06f          	j	80005b3c <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    80005c08:	00004517          	auipc	a0,0x4
    80005c0c:	89850513          	addi	a0,a0,-1896 # 800094a0 <CONSOLE_STATUS+0x490>
    80005c10:	fffff097          	auipc	ra,0xfffff
    80005c14:	7f0080e7          	jalr	2032(ra) # 80005400 <_Z11printStringPKc>
    80005c18:	f25ff06f          	j	80005b3c <_Z8userMainv+0x74>

0000000080005c1c <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    80005c1c:	fe010113          	addi	sp,sp,-32
    80005c20:	00113c23          	sd	ra,24(sp)
    80005c24:	00813823          	sd	s0,16(sp)
    80005c28:	00913423          	sd	s1,8(sp)
    80005c2c:	01213023          	sd	s2,0(sp)
    80005c30:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    80005c34:	00053903          	ld	s2,0(a0)
    int i = 6;
    80005c38:	00600493          	li	s1,6
    while (--i > 0) {
    80005c3c:	fff4849b          	addiw	s1,s1,-1
    80005c40:	04905463          	blez	s1,80005c88 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    80005c44:	00004517          	auipc	a0,0x4
    80005c48:	8a450513          	addi	a0,a0,-1884 # 800094e8 <CONSOLE_STATUS+0x4d8>
    80005c4c:	fffff097          	auipc	ra,0xfffff
    80005c50:	7b4080e7          	jalr	1972(ra) # 80005400 <_Z11printStringPKc>
        printInt(sleep_time);
    80005c54:	00000613          	li	a2,0
    80005c58:	00a00593          	li	a1,10
    80005c5c:	0009051b          	sext.w	a0,s2
    80005c60:	00000097          	auipc	ra,0x0
    80005c64:	950080e7          	jalr	-1712(ra) # 800055b0 <_Z8printIntiii>
        printString(" !\n");
    80005c68:	00004517          	auipc	a0,0x4
    80005c6c:	88850513          	addi	a0,a0,-1912 # 800094f0 <CONSOLE_STATUS+0x4e0>
    80005c70:	fffff097          	auipc	ra,0xfffff
    80005c74:	790080e7          	jalr	1936(ra) # 80005400 <_Z11printStringPKc>
        time_sleep(sleep_time);
    80005c78:	00090513          	mv	a0,s2
    80005c7c:	ffffc097          	auipc	ra,0xffffc
    80005c80:	95c080e7          	jalr	-1700(ra) # 800015d8 <_Z10time_sleepm>
    while (--i > 0) {
    80005c84:	fb9ff06f          	j	80005c3c <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80005c88:	00a00793          	li	a5,10
    80005c8c:	02f95933          	divu	s2,s2,a5
    80005c90:	fff90913          	addi	s2,s2,-1
    80005c94:	00006797          	auipc	a5,0x6
    80005c98:	c0c78793          	addi	a5,a5,-1012 # 8000b8a0 <_ZL8finished>
    80005c9c:	01278933          	add	s2,a5,s2
    80005ca0:	00100793          	li	a5,1
    80005ca4:	00f90023          	sb	a5,0(s2)
}
    80005ca8:	01813083          	ld	ra,24(sp)
    80005cac:	01013403          	ld	s0,16(sp)
    80005cb0:	00813483          	ld	s1,8(sp)
    80005cb4:	00013903          	ld	s2,0(sp)
    80005cb8:	02010113          	addi	sp,sp,32
    80005cbc:	00008067          	ret

0000000080005cc0 <_Z12testSleepingv>:

void testSleeping() {
    80005cc0:	fc010113          	addi	sp,sp,-64
    80005cc4:	02113c23          	sd	ra,56(sp)
    80005cc8:	02813823          	sd	s0,48(sp)
    80005ccc:	02913423          	sd	s1,40(sp)
    80005cd0:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80005cd4:	00a00793          	li	a5,10
    80005cd8:	fcf43823          	sd	a5,-48(s0)
    80005cdc:	01400793          	li	a5,20
    80005ce0:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80005ce4:	00000493          	li	s1,0
    80005ce8:	02c0006f          	j	80005d14 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80005cec:	00349793          	slli	a5,s1,0x3
    80005cf0:	fd040613          	addi	a2,s0,-48
    80005cf4:	00f60633          	add	a2,a2,a5
    80005cf8:	00000597          	auipc	a1,0x0
    80005cfc:	f2458593          	addi	a1,a1,-220 # 80005c1c <_ZL9sleepyRunPv>
    80005d00:	fc040513          	addi	a0,s0,-64
    80005d04:	00f50533          	add	a0,a0,a5
    80005d08:	ffffb097          	auipc	ra,0xffffb
    80005d0c:	6fc080e7          	jalr	1788(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    80005d10:	0014849b          	addiw	s1,s1,1
    80005d14:	00100793          	li	a5,1
    80005d18:	fc97dae3          	bge	a5,s1,80005cec <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    80005d1c:	00006797          	auipc	a5,0x6
    80005d20:	b847c783          	lbu	a5,-1148(a5) # 8000b8a0 <_ZL8finished>
    80005d24:	fe078ce3          	beqz	a5,80005d1c <_Z12testSleepingv+0x5c>
    80005d28:	00006797          	auipc	a5,0x6
    80005d2c:	b797c783          	lbu	a5,-1159(a5) # 8000b8a1 <_ZL8finished+0x1>
    80005d30:	fe0786e3          	beqz	a5,80005d1c <_Z12testSleepingv+0x5c>
}
    80005d34:	03813083          	ld	ra,56(sp)
    80005d38:	03013403          	ld	s0,48(sp)
    80005d3c:	02813483          	ld	s1,40(sp)
    80005d40:	04010113          	addi	sp,sp,64
    80005d44:	00008067          	ret

0000000080005d48 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80005d48:	fe010113          	addi	sp,sp,-32
    80005d4c:	00113c23          	sd	ra,24(sp)
    80005d50:	00813823          	sd	s0,16(sp)
    80005d54:	00913423          	sd	s1,8(sp)
    80005d58:	01213023          	sd	s2,0(sp)
    80005d5c:	02010413          	addi	s0,sp,32
    80005d60:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005d64:	00100793          	li	a5,1
    80005d68:	02a7f863          	bgeu	a5,a0,80005d98 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005d6c:	00a00793          	li	a5,10
    80005d70:	02f577b3          	remu	a5,a0,a5
    80005d74:	02078e63          	beqz	a5,80005db0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005d78:	fff48513          	addi	a0,s1,-1
    80005d7c:	00000097          	auipc	ra,0x0
    80005d80:	fcc080e7          	jalr	-52(ra) # 80005d48 <_ZL9fibonaccim>
    80005d84:	00050913          	mv	s2,a0
    80005d88:	ffe48513          	addi	a0,s1,-2
    80005d8c:	00000097          	auipc	ra,0x0
    80005d90:	fbc080e7          	jalr	-68(ra) # 80005d48 <_ZL9fibonaccim>
    80005d94:	00a90533          	add	a0,s2,a0
}
    80005d98:	01813083          	ld	ra,24(sp)
    80005d9c:	01013403          	ld	s0,16(sp)
    80005da0:	00813483          	ld	s1,8(sp)
    80005da4:	00013903          	ld	s2,0(sp)
    80005da8:	02010113          	addi	sp,sp,32
    80005dac:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80005db0:	ffffb097          	auipc	ra,0xffffb
    80005db4:	6f8080e7          	jalr	1784(ra) # 800014a8 <_Z15thread_dispatchv>
    80005db8:	fc1ff06f          	j	80005d78 <_ZL9fibonaccim+0x30>

0000000080005dbc <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005dbc:	fe010113          	addi	sp,sp,-32
    80005dc0:	00113c23          	sd	ra,24(sp)
    80005dc4:	00813823          	sd	s0,16(sp)
    80005dc8:	00913423          	sd	s1,8(sp)
    80005dcc:	01213023          	sd	s2,0(sp)
    80005dd0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005dd4:	00a00493          	li	s1,10
    80005dd8:	0400006f          	j	80005e18 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005ddc:	00003517          	auipc	a0,0x3
    80005de0:	3e450513          	addi	a0,a0,996 # 800091c0 <CONSOLE_STATUS+0x1b0>
    80005de4:	fffff097          	auipc	ra,0xfffff
    80005de8:	61c080e7          	jalr	1564(ra) # 80005400 <_Z11printStringPKc>
    80005dec:	00000613          	li	a2,0
    80005df0:	00a00593          	li	a1,10
    80005df4:	00048513          	mv	a0,s1
    80005df8:	fffff097          	auipc	ra,0xfffff
    80005dfc:	7b8080e7          	jalr	1976(ra) # 800055b0 <_Z8printIntiii>
    80005e00:	00003517          	auipc	a0,0x3
    80005e04:	5b050513          	addi	a0,a0,1456 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80005e08:	fffff097          	auipc	ra,0xfffff
    80005e0c:	5f8080e7          	jalr	1528(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 13; i++) {
    80005e10:	0014849b          	addiw	s1,s1,1
    80005e14:	0ff4f493          	andi	s1,s1,255
    80005e18:	00c00793          	li	a5,12
    80005e1c:	fc97f0e3          	bgeu	a5,s1,80005ddc <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80005e20:	00003517          	auipc	a0,0x3
    80005e24:	3a850513          	addi	a0,a0,936 # 800091c8 <CONSOLE_STATUS+0x1b8>
    80005e28:	fffff097          	auipc	ra,0xfffff
    80005e2c:	5d8080e7          	jalr	1496(ra) # 80005400 <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80005e30:	00500313          	li	t1,5
    thread_dispatch();
    80005e34:	ffffb097          	auipc	ra,0xffffb
    80005e38:	674080e7          	jalr	1652(ra) # 800014a8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    80005e3c:	01000513          	li	a0,16
    80005e40:	00000097          	auipc	ra,0x0
    80005e44:	f08080e7          	jalr	-248(ra) # 80005d48 <_ZL9fibonaccim>
    80005e48:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    80005e4c:	00003517          	auipc	a0,0x3
    80005e50:	38c50513          	addi	a0,a0,908 # 800091d8 <CONSOLE_STATUS+0x1c8>
    80005e54:	fffff097          	auipc	ra,0xfffff
    80005e58:	5ac080e7          	jalr	1452(ra) # 80005400 <_Z11printStringPKc>
    80005e5c:	00000613          	li	a2,0
    80005e60:	00a00593          	li	a1,10
    80005e64:	0009051b          	sext.w	a0,s2
    80005e68:	fffff097          	auipc	ra,0xfffff
    80005e6c:	748080e7          	jalr	1864(ra) # 800055b0 <_Z8printIntiii>
    80005e70:	00003517          	auipc	a0,0x3
    80005e74:	54050513          	addi	a0,a0,1344 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80005e78:	fffff097          	auipc	ra,0xfffff
    80005e7c:	588080e7          	jalr	1416(ra) # 80005400 <_Z11printStringPKc>
    80005e80:	0400006f          	j	80005ec0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005e84:	00003517          	auipc	a0,0x3
    80005e88:	33c50513          	addi	a0,a0,828 # 800091c0 <CONSOLE_STATUS+0x1b0>
    80005e8c:	fffff097          	auipc	ra,0xfffff
    80005e90:	574080e7          	jalr	1396(ra) # 80005400 <_Z11printStringPKc>
    80005e94:	00000613          	li	a2,0
    80005e98:	00a00593          	li	a1,10
    80005e9c:	00048513          	mv	a0,s1
    80005ea0:	fffff097          	auipc	ra,0xfffff
    80005ea4:	710080e7          	jalr	1808(ra) # 800055b0 <_Z8printIntiii>
    80005ea8:	00003517          	auipc	a0,0x3
    80005eac:	50850513          	addi	a0,a0,1288 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80005eb0:	fffff097          	auipc	ra,0xfffff
    80005eb4:	550080e7          	jalr	1360(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005eb8:	0014849b          	addiw	s1,s1,1
    80005ebc:	0ff4f493          	andi	s1,s1,255
    80005ec0:	00f00793          	li	a5,15
    80005ec4:	fc97f0e3          	bgeu	a5,s1,80005e84 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005ec8:	00003517          	auipc	a0,0x3
    80005ecc:	32050513          	addi	a0,a0,800 # 800091e8 <CONSOLE_STATUS+0x1d8>
    80005ed0:	fffff097          	auipc	ra,0xfffff
    80005ed4:	530080e7          	jalr	1328(ra) # 80005400 <_Z11printStringPKc>
    finishedD = true;
    80005ed8:	00100793          	li	a5,1
    80005edc:	00006717          	auipc	a4,0x6
    80005ee0:	9cf70323          	sb	a5,-1594(a4) # 8000b8a2 <_ZL9finishedD>
    thread_dispatch();
    80005ee4:	ffffb097          	auipc	ra,0xffffb
    80005ee8:	5c4080e7          	jalr	1476(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80005eec:	01813083          	ld	ra,24(sp)
    80005ef0:	01013403          	ld	s0,16(sp)
    80005ef4:	00813483          	ld	s1,8(sp)
    80005ef8:	00013903          	ld	s2,0(sp)
    80005efc:	02010113          	addi	sp,sp,32
    80005f00:	00008067          	ret

0000000080005f04 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005f04:	fe010113          	addi	sp,sp,-32
    80005f08:	00113c23          	sd	ra,24(sp)
    80005f0c:	00813823          	sd	s0,16(sp)
    80005f10:	00913423          	sd	s1,8(sp)
    80005f14:	01213023          	sd	s2,0(sp)
    80005f18:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005f1c:	00000493          	li	s1,0
    80005f20:	0400006f          	j	80005f60 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005f24:	00003517          	auipc	a0,0x3
    80005f28:	26c50513          	addi	a0,a0,620 # 80009190 <CONSOLE_STATUS+0x180>
    80005f2c:	fffff097          	auipc	ra,0xfffff
    80005f30:	4d4080e7          	jalr	1236(ra) # 80005400 <_Z11printStringPKc>
    80005f34:	00000613          	li	a2,0
    80005f38:	00a00593          	li	a1,10
    80005f3c:	00048513          	mv	a0,s1
    80005f40:	fffff097          	auipc	ra,0xfffff
    80005f44:	670080e7          	jalr	1648(ra) # 800055b0 <_Z8printIntiii>
    80005f48:	00003517          	auipc	a0,0x3
    80005f4c:	46850513          	addi	a0,a0,1128 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80005f50:	fffff097          	auipc	ra,0xfffff
    80005f54:	4b0080e7          	jalr	1200(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005f58:	0014849b          	addiw	s1,s1,1
    80005f5c:	0ff4f493          	andi	s1,s1,255
    80005f60:	00200793          	li	a5,2
    80005f64:	fc97f0e3          	bgeu	a5,s1,80005f24 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005f68:	00003517          	auipc	a0,0x3
    80005f6c:	23050513          	addi	a0,a0,560 # 80009198 <CONSOLE_STATUS+0x188>
    80005f70:	fffff097          	auipc	ra,0xfffff
    80005f74:	490080e7          	jalr	1168(ra) # 80005400 <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005f78:	00700313          	li	t1,7
    thread_dispatch();
    80005f7c:	ffffb097          	auipc	ra,0xffffb
    80005f80:	52c080e7          	jalr	1324(ra) # 800014a8 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005f84:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005f88:	00003517          	auipc	a0,0x3
    80005f8c:	22050513          	addi	a0,a0,544 # 800091a8 <CONSOLE_STATUS+0x198>
    80005f90:	fffff097          	auipc	ra,0xfffff
    80005f94:	470080e7          	jalr	1136(ra) # 80005400 <_Z11printStringPKc>
    80005f98:	00000613          	li	a2,0
    80005f9c:	00a00593          	li	a1,10
    80005fa0:	0009051b          	sext.w	a0,s2
    80005fa4:	fffff097          	auipc	ra,0xfffff
    80005fa8:	60c080e7          	jalr	1548(ra) # 800055b0 <_Z8printIntiii>
    80005fac:	00003517          	auipc	a0,0x3
    80005fb0:	40450513          	addi	a0,a0,1028 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80005fb4:	fffff097          	auipc	ra,0xfffff
    80005fb8:	44c080e7          	jalr	1100(ra) # 80005400 <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005fbc:	00c00513          	li	a0,12
    80005fc0:	00000097          	auipc	ra,0x0
    80005fc4:	d88080e7          	jalr	-632(ra) # 80005d48 <_ZL9fibonaccim>
    80005fc8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005fcc:	00003517          	auipc	a0,0x3
    80005fd0:	1e450513          	addi	a0,a0,484 # 800091b0 <CONSOLE_STATUS+0x1a0>
    80005fd4:	fffff097          	auipc	ra,0xfffff
    80005fd8:	42c080e7          	jalr	1068(ra) # 80005400 <_Z11printStringPKc>
    80005fdc:	00000613          	li	a2,0
    80005fe0:	00a00593          	li	a1,10
    80005fe4:	0009051b          	sext.w	a0,s2
    80005fe8:	fffff097          	auipc	ra,0xfffff
    80005fec:	5c8080e7          	jalr	1480(ra) # 800055b0 <_Z8printIntiii>
    80005ff0:	00003517          	auipc	a0,0x3
    80005ff4:	3c050513          	addi	a0,a0,960 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80005ff8:	fffff097          	auipc	ra,0xfffff
    80005ffc:	408080e7          	jalr	1032(ra) # 80005400 <_Z11printStringPKc>
    80006000:	0400006f          	j	80006040 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80006004:	00003517          	auipc	a0,0x3
    80006008:	18c50513          	addi	a0,a0,396 # 80009190 <CONSOLE_STATUS+0x180>
    8000600c:	fffff097          	auipc	ra,0xfffff
    80006010:	3f4080e7          	jalr	1012(ra) # 80005400 <_Z11printStringPKc>
    80006014:	00000613          	li	a2,0
    80006018:	00a00593          	li	a1,10
    8000601c:	00048513          	mv	a0,s1
    80006020:	fffff097          	auipc	ra,0xfffff
    80006024:	590080e7          	jalr	1424(ra) # 800055b0 <_Z8printIntiii>
    80006028:	00003517          	auipc	a0,0x3
    8000602c:	38850513          	addi	a0,a0,904 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80006030:	fffff097          	auipc	ra,0xfffff
    80006034:	3d0080e7          	jalr	976(ra) # 80005400 <_Z11printStringPKc>
    for (; i < 6; i++) {
    80006038:	0014849b          	addiw	s1,s1,1
    8000603c:	0ff4f493          	andi	s1,s1,255
    80006040:	00500793          	li	a5,5
    80006044:	fc97f0e3          	bgeu	a5,s1,80006004 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80006048:	00003517          	auipc	a0,0x3
    8000604c:	12050513          	addi	a0,a0,288 # 80009168 <CONSOLE_STATUS+0x158>
    80006050:	fffff097          	auipc	ra,0xfffff
    80006054:	3b0080e7          	jalr	944(ra) # 80005400 <_Z11printStringPKc>
    finishedC = true;
    80006058:	00100793          	li	a5,1
    8000605c:	00006717          	auipc	a4,0x6
    80006060:	84f703a3          	sb	a5,-1977(a4) # 8000b8a3 <_ZL9finishedC>
    thread_dispatch();
    80006064:	ffffb097          	auipc	ra,0xffffb
    80006068:	444080e7          	jalr	1092(ra) # 800014a8 <_Z15thread_dispatchv>
}
    8000606c:	01813083          	ld	ra,24(sp)
    80006070:	01013403          	ld	s0,16(sp)
    80006074:	00813483          	ld	s1,8(sp)
    80006078:	00013903          	ld	s2,0(sp)
    8000607c:	02010113          	addi	sp,sp,32
    80006080:	00008067          	ret

0000000080006084 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80006084:	fe010113          	addi	sp,sp,-32
    80006088:	00113c23          	sd	ra,24(sp)
    8000608c:	00813823          	sd	s0,16(sp)
    80006090:	00913423          	sd	s1,8(sp)
    80006094:	01213023          	sd	s2,0(sp)
    80006098:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000609c:	00000913          	li	s2,0
    800060a0:	0400006f          	j	800060e0 <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    800060a4:	ffffb097          	auipc	ra,0xffffb
    800060a8:	404080e7          	jalr	1028(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800060ac:	00148493          	addi	s1,s1,1
    800060b0:	000027b7          	lui	a5,0x2
    800060b4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800060b8:	0097ee63          	bltu	a5,s1,800060d4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800060bc:	00000713          	li	a4,0
    800060c0:	000077b7          	lui	a5,0x7
    800060c4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800060c8:	fce7eee3          	bltu	a5,a4,800060a4 <_ZL11workerBodyBPv+0x20>
    800060cc:	00170713          	addi	a4,a4,1
    800060d0:	ff1ff06f          	j	800060c0 <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    800060d4:	00a00793          	li	a5,10
    800060d8:	04f90663          	beq	s2,a5,80006124 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    800060dc:	00190913          	addi	s2,s2,1
    800060e0:	00f00793          	li	a5,15
    800060e4:	0527e463          	bltu	a5,s2,8000612c <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    800060e8:	00003517          	auipc	a0,0x3
    800060ec:	09050513          	addi	a0,a0,144 # 80009178 <CONSOLE_STATUS+0x168>
    800060f0:	fffff097          	auipc	ra,0xfffff
    800060f4:	310080e7          	jalr	784(ra) # 80005400 <_Z11printStringPKc>
    800060f8:	00000613          	li	a2,0
    800060fc:	00a00593          	li	a1,10
    80006100:	0009051b          	sext.w	a0,s2
    80006104:	fffff097          	auipc	ra,0xfffff
    80006108:	4ac080e7          	jalr	1196(ra) # 800055b0 <_Z8printIntiii>
    8000610c:	00003517          	auipc	a0,0x3
    80006110:	2a450513          	addi	a0,a0,676 # 800093b0 <CONSOLE_STATUS+0x3a0>
    80006114:	fffff097          	auipc	ra,0xfffff
    80006118:	2ec080e7          	jalr	748(ra) # 80005400 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000611c:	00000493          	li	s1,0
    80006120:	f91ff06f          	j	800060b0 <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80006124:	14102ff3          	csrr	t6,sepc
    80006128:	fb5ff06f          	j	800060dc <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    8000612c:	00003517          	auipc	a0,0x3
    80006130:	05450513          	addi	a0,a0,84 # 80009180 <CONSOLE_STATUS+0x170>
    80006134:	fffff097          	auipc	ra,0xfffff
    80006138:	2cc080e7          	jalr	716(ra) # 80005400 <_Z11printStringPKc>
    finishedB = true;
    8000613c:	00100793          	li	a5,1
    80006140:	00005717          	auipc	a4,0x5
    80006144:	76f70223          	sb	a5,1892(a4) # 8000b8a4 <_ZL9finishedB>
    thread_dispatch();
    80006148:	ffffb097          	auipc	ra,0xffffb
    8000614c:	360080e7          	jalr	864(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80006150:	01813083          	ld	ra,24(sp)
    80006154:	01013403          	ld	s0,16(sp)
    80006158:	00813483          	ld	s1,8(sp)
    8000615c:	00013903          	ld	s2,0(sp)
    80006160:	02010113          	addi	sp,sp,32
    80006164:	00008067          	ret

0000000080006168 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80006168:	fe010113          	addi	sp,sp,-32
    8000616c:	00113c23          	sd	ra,24(sp)
    80006170:	00813823          	sd	s0,16(sp)
    80006174:	00913423          	sd	s1,8(sp)
    80006178:	01213023          	sd	s2,0(sp)
    8000617c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80006180:	00000913          	li	s2,0
    80006184:	0380006f          	j	800061bc <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80006188:	ffffb097          	auipc	ra,0xffffb
    8000618c:	320080e7          	jalr	800(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80006190:	00148493          	addi	s1,s1,1
    80006194:	000027b7          	lui	a5,0x2
    80006198:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000619c:	0097ee63          	bltu	a5,s1,800061b8 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800061a0:	00000713          	li	a4,0
    800061a4:	000077b7          	lui	a5,0x7
    800061a8:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800061ac:	fce7eee3          	bltu	a5,a4,80006188 <_ZL11workerBodyAPv+0x20>
    800061b0:	00170713          	addi	a4,a4,1
    800061b4:	ff1ff06f          	j	800061a4 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800061b8:	00190913          	addi	s2,s2,1
    800061bc:	00900793          	li	a5,9
    800061c0:	0527e063          	bltu	a5,s2,80006200 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800061c4:	00003517          	auipc	a0,0x3
    800061c8:	f9c50513          	addi	a0,a0,-100 # 80009160 <CONSOLE_STATUS+0x150>
    800061cc:	fffff097          	auipc	ra,0xfffff
    800061d0:	234080e7          	jalr	564(ra) # 80005400 <_Z11printStringPKc>
    800061d4:	00000613          	li	a2,0
    800061d8:	00a00593          	li	a1,10
    800061dc:	0009051b          	sext.w	a0,s2
    800061e0:	fffff097          	auipc	ra,0xfffff
    800061e4:	3d0080e7          	jalr	976(ra) # 800055b0 <_Z8printIntiii>
    800061e8:	00003517          	auipc	a0,0x3
    800061ec:	1c850513          	addi	a0,a0,456 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800061f0:	fffff097          	auipc	ra,0xfffff
    800061f4:	210080e7          	jalr	528(ra) # 80005400 <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800061f8:	00000493          	li	s1,0
    800061fc:	f99ff06f          	j	80006194 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80006200:	00003517          	auipc	a0,0x3
    80006204:	f6850513          	addi	a0,a0,-152 # 80009168 <CONSOLE_STATUS+0x158>
    80006208:	fffff097          	auipc	ra,0xfffff
    8000620c:	1f8080e7          	jalr	504(ra) # 80005400 <_Z11printStringPKc>
    finishedA = true;
    80006210:	00100793          	li	a5,1
    80006214:	00005717          	auipc	a4,0x5
    80006218:	68f708a3          	sb	a5,1681(a4) # 8000b8a5 <_ZL9finishedA>
}
    8000621c:	01813083          	ld	ra,24(sp)
    80006220:	01013403          	ld	s0,16(sp)
    80006224:	00813483          	ld	s1,8(sp)
    80006228:	00013903          	ld	s2,0(sp)
    8000622c:	02010113          	addi	sp,sp,32
    80006230:	00008067          	ret

0000000080006234 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80006234:	fd010113          	addi	sp,sp,-48
    80006238:	02113423          	sd	ra,40(sp)
    8000623c:	02813023          	sd	s0,32(sp)
    80006240:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80006244:	00000613          	li	a2,0
    80006248:	00000597          	auipc	a1,0x0
    8000624c:	f2058593          	addi	a1,a1,-224 # 80006168 <_ZL11workerBodyAPv>
    80006250:	fd040513          	addi	a0,s0,-48
    80006254:	ffffb097          	auipc	ra,0xffffb
    80006258:	1b0080e7          	jalr	432(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000625c:	00003517          	auipc	a0,0x3
    80006260:	f9c50513          	addi	a0,a0,-100 # 800091f8 <CONSOLE_STATUS+0x1e8>
    80006264:	fffff097          	auipc	ra,0xfffff
    80006268:	19c080e7          	jalr	412(ra) # 80005400 <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000626c:	00000613          	li	a2,0
    80006270:	00000597          	auipc	a1,0x0
    80006274:	e1458593          	addi	a1,a1,-492 # 80006084 <_ZL11workerBodyBPv>
    80006278:	fd840513          	addi	a0,s0,-40
    8000627c:	ffffb097          	auipc	ra,0xffffb
    80006280:	188080e7          	jalr	392(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80006284:	00003517          	auipc	a0,0x3
    80006288:	f8c50513          	addi	a0,a0,-116 # 80009210 <CONSOLE_STATUS+0x200>
    8000628c:	fffff097          	auipc	ra,0xfffff
    80006290:	174080e7          	jalr	372(ra) # 80005400 <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80006294:	00000613          	li	a2,0
    80006298:	00000597          	auipc	a1,0x0
    8000629c:	c6c58593          	addi	a1,a1,-916 # 80005f04 <_ZL11workerBodyCPv>
    800062a0:	fe040513          	addi	a0,s0,-32
    800062a4:	ffffb097          	auipc	ra,0xffffb
    800062a8:	160080e7          	jalr	352(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    800062ac:	00003517          	auipc	a0,0x3
    800062b0:	f7c50513          	addi	a0,a0,-132 # 80009228 <CONSOLE_STATUS+0x218>
    800062b4:	fffff097          	auipc	ra,0xfffff
    800062b8:	14c080e7          	jalr	332(ra) # 80005400 <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    800062bc:	00000613          	li	a2,0
    800062c0:	00000597          	auipc	a1,0x0
    800062c4:	afc58593          	addi	a1,a1,-1284 # 80005dbc <_ZL11workerBodyDPv>
    800062c8:	fe840513          	addi	a0,s0,-24
    800062cc:	ffffb097          	auipc	ra,0xffffb
    800062d0:	138080e7          	jalr	312(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800062d4:	00003517          	auipc	a0,0x3
    800062d8:	f6c50513          	addi	a0,a0,-148 # 80009240 <CONSOLE_STATUS+0x230>
    800062dc:	fffff097          	auipc	ra,0xfffff
    800062e0:	124080e7          	jalr	292(ra) # 80005400 <_Z11printStringPKc>
    800062e4:	00c0006f          	j	800062f0 <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800062e8:	ffffb097          	auipc	ra,0xffffb
    800062ec:	1c0080e7          	jalr	448(ra) # 800014a8 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800062f0:	00005797          	auipc	a5,0x5
    800062f4:	5b57c783          	lbu	a5,1461(a5) # 8000b8a5 <_ZL9finishedA>
    800062f8:	fe0788e3          	beqz	a5,800062e8 <_Z16System_Mode_testv+0xb4>
    800062fc:	00005797          	auipc	a5,0x5
    80006300:	5a87c783          	lbu	a5,1448(a5) # 8000b8a4 <_ZL9finishedB>
    80006304:	fe0782e3          	beqz	a5,800062e8 <_Z16System_Mode_testv+0xb4>
    80006308:	00005797          	auipc	a5,0x5
    8000630c:	59b7c783          	lbu	a5,1435(a5) # 8000b8a3 <_ZL9finishedC>
    80006310:	fc078ce3          	beqz	a5,800062e8 <_Z16System_Mode_testv+0xb4>
    80006314:	00005797          	auipc	a5,0x5
    80006318:	58e7c783          	lbu	a5,1422(a5) # 8000b8a2 <_ZL9finishedD>
    8000631c:	fc0786e3          	beqz	a5,800062e8 <_Z16System_Mode_testv+0xb4>
    }

}
    80006320:	02813083          	ld	ra,40(sp)
    80006324:	02013403          	ld	s0,32(sp)
    80006328:	03010113          	addi	sp,sp,48
    8000632c:	00008067          	ret

0000000080006330 <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80006330:	fe010113          	addi	sp,sp,-32
    80006334:	00113c23          	sd	ra,24(sp)
    80006338:	00813823          	sd	s0,16(sp)
    8000633c:	00913423          	sd	s1,8(sp)
    80006340:	01213023          	sd	s2,0(sp)
    80006344:	02010413          	addi	s0,sp,32
    80006348:	00050493          	mv	s1,a0
    8000634c:	00058913          	mv	s2,a1
    80006350:	0015879b          	addiw	a5,a1,1
    80006354:	0007851b          	sext.w	a0,a5
    80006358:	00f4a023          	sw	a5,0(s1)
    8000635c:	0004a823          	sw	zero,16(s1)
    80006360:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80006364:	00251513          	slli	a0,a0,0x2
    80006368:	ffffb097          	auipc	ra,0xffffb
    8000636c:	024080e7          	jalr	36(ra) # 8000138c <_Z9mem_allocm>
    80006370:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80006374:	00000593          	li	a1,0
    80006378:	02048513          	addi	a0,s1,32
    8000637c:	ffffb097          	auipc	ra,0xffffb
    80006380:	178080e7          	jalr	376(ra) # 800014f4 <_Z8sem_openPP3semj>
    sem_open(&spaceAvailable, _cap);
    80006384:	00090593          	mv	a1,s2
    80006388:	01848513          	addi	a0,s1,24
    8000638c:	ffffb097          	auipc	ra,0xffffb
    80006390:	168080e7          	jalr	360(ra) # 800014f4 <_Z8sem_openPP3semj>
    sem_open(&mutexHead, 1);
    80006394:	00100593          	li	a1,1
    80006398:	02848513          	addi	a0,s1,40
    8000639c:	ffffb097          	auipc	ra,0xffffb
    800063a0:	158080e7          	jalr	344(ra) # 800014f4 <_Z8sem_openPP3semj>
    sem_open(&mutexTail, 1);
    800063a4:	00100593          	li	a1,1
    800063a8:	03048513          	addi	a0,s1,48
    800063ac:	ffffb097          	auipc	ra,0xffffb
    800063b0:	148080e7          	jalr	328(ra) # 800014f4 <_Z8sem_openPP3semj>
}
    800063b4:	01813083          	ld	ra,24(sp)
    800063b8:	01013403          	ld	s0,16(sp)
    800063bc:	00813483          	ld	s1,8(sp)
    800063c0:	00013903          	ld	s2,0(sp)
    800063c4:	02010113          	addi	sp,sp,32
    800063c8:	00008067          	ret

00000000800063cc <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    800063cc:	fe010113          	addi	sp,sp,-32
    800063d0:	00113c23          	sd	ra,24(sp)
    800063d4:	00813823          	sd	s0,16(sp)
    800063d8:	00913423          	sd	s1,8(sp)
    800063dc:	01213023          	sd	s2,0(sp)
    800063e0:	02010413          	addi	s0,sp,32
    800063e4:	00050493          	mv	s1,a0
    800063e8:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    800063ec:	01853503          	ld	a0,24(a0)
    800063f0:	ffffb097          	auipc	ra,0xffffb
    800063f4:	178080e7          	jalr	376(ra) # 80001568 <_Z8sem_waitP3sem>

    sem_wait(mutexTail);
    800063f8:	0304b503          	ld	a0,48(s1)
    800063fc:	ffffb097          	auipc	ra,0xffffb
    80006400:	16c080e7          	jalr	364(ra) # 80001568 <_Z8sem_waitP3sem>
    buffer[tail] = val;
    80006404:	0084b783          	ld	a5,8(s1)
    80006408:	0144a703          	lw	a4,20(s1)
    8000640c:	00271713          	slli	a4,a4,0x2
    80006410:	00e787b3          	add	a5,a5,a4
    80006414:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80006418:	0144a783          	lw	a5,20(s1)
    8000641c:	0017879b          	addiw	a5,a5,1
    80006420:	0004a703          	lw	a4,0(s1)
    80006424:	02e7e7bb          	remw	a5,a5,a4
    80006428:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    8000642c:	0304b503          	ld	a0,48(s1)
    80006430:	ffffb097          	auipc	ra,0xffffb
    80006434:	170080e7          	jalr	368(ra) # 800015a0 <_Z10sem_signalP3sem>

    sem_signal(itemAvailable);
    80006438:	0204b503          	ld	a0,32(s1)
    8000643c:	ffffb097          	auipc	ra,0xffffb
    80006440:	164080e7          	jalr	356(ra) # 800015a0 <_Z10sem_signalP3sem>

}
    80006444:	01813083          	ld	ra,24(sp)
    80006448:	01013403          	ld	s0,16(sp)
    8000644c:	00813483          	ld	s1,8(sp)
    80006450:	00013903          	ld	s2,0(sp)
    80006454:	02010113          	addi	sp,sp,32
    80006458:	00008067          	ret

000000008000645c <_ZN6Buffer3getEv>:

int Buffer::get() {
    8000645c:	fe010113          	addi	sp,sp,-32
    80006460:	00113c23          	sd	ra,24(sp)
    80006464:	00813823          	sd	s0,16(sp)
    80006468:	00913423          	sd	s1,8(sp)
    8000646c:	01213023          	sd	s2,0(sp)
    80006470:	02010413          	addi	s0,sp,32
    80006474:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006478:	02053503          	ld	a0,32(a0)
    8000647c:	ffffb097          	auipc	ra,0xffffb
    80006480:	0ec080e7          	jalr	236(ra) # 80001568 <_Z8sem_waitP3sem>

    sem_wait(mutexHead);
    80006484:	0284b503          	ld	a0,40(s1)
    80006488:	ffffb097          	auipc	ra,0xffffb
    8000648c:	0e0080e7          	jalr	224(ra) # 80001568 <_Z8sem_waitP3sem>

    int ret = buffer[head];
    80006490:	0084b703          	ld	a4,8(s1)
    80006494:	0104a783          	lw	a5,16(s1)
    80006498:	00279693          	slli	a3,a5,0x2
    8000649c:	00d70733          	add	a4,a4,a3
    800064a0:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    800064a4:	0017879b          	addiw	a5,a5,1
    800064a8:	0004a703          	lw	a4,0(s1)
    800064ac:	02e7e7bb          	remw	a5,a5,a4
    800064b0:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    800064b4:	0284b503          	ld	a0,40(s1)
    800064b8:	ffffb097          	auipc	ra,0xffffb
    800064bc:	0e8080e7          	jalr	232(ra) # 800015a0 <_Z10sem_signalP3sem>

    sem_signal(spaceAvailable);
    800064c0:	0184b503          	ld	a0,24(s1)
    800064c4:	ffffb097          	auipc	ra,0xffffb
    800064c8:	0dc080e7          	jalr	220(ra) # 800015a0 <_Z10sem_signalP3sem>

    return ret;
}
    800064cc:	00090513          	mv	a0,s2
    800064d0:	01813083          	ld	ra,24(sp)
    800064d4:	01013403          	ld	s0,16(sp)
    800064d8:	00813483          	ld	s1,8(sp)
    800064dc:	00013903          	ld	s2,0(sp)
    800064e0:	02010113          	addi	sp,sp,32
    800064e4:	00008067          	ret

00000000800064e8 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    800064e8:	fe010113          	addi	sp,sp,-32
    800064ec:	00113c23          	sd	ra,24(sp)
    800064f0:	00813823          	sd	s0,16(sp)
    800064f4:	00913423          	sd	s1,8(sp)
    800064f8:	01213023          	sd	s2,0(sp)
    800064fc:	02010413          	addi	s0,sp,32
    80006500:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    80006504:	02853503          	ld	a0,40(a0)
    80006508:	ffffb097          	auipc	ra,0xffffb
    8000650c:	060080e7          	jalr	96(ra) # 80001568 <_Z8sem_waitP3sem>
    sem_wait(mutexTail);
    80006510:	0304b503          	ld	a0,48(s1)
    80006514:	ffffb097          	auipc	ra,0xffffb
    80006518:	054080e7          	jalr	84(ra) # 80001568 <_Z8sem_waitP3sem>

    if (tail >= head) {
    8000651c:	0144a783          	lw	a5,20(s1)
    80006520:	0104a903          	lw	s2,16(s1)
    80006524:	0327ce63          	blt	a5,s2,80006560 <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    80006528:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    8000652c:	0304b503          	ld	a0,48(s1)
    80006530:	ffffb097          	auipc	ra,0xffffb
    80006534:	070080e7          	jalr	112(ra) # 800015a0 <_Z10sem_signalP3sem>
    sem_signal(mutexHead);
    80006538:	0284b503          	ld	a0,40(s1)
    8000653c:	ffffb097          	auipc	ra,0xffffb
    80006540:	064080e7          	jalr	100(ra) # 800015a0 <_Z10sem_signalP3sem>

    return ret;
}
    80006544:	00090513          	mv	a0,s2
    80006548:	01813083          	ld	ra,24(sp)
    8000654c:	01013403          	ld	s0,16(sp)
    80006550:	00813483          	ld	s1,8(sp)
    80006554:	00013903          	ld	s2,0(sp)
    80006558:	02010113          	addi	sp,sp,32
    8000655c:	00008067          	ret
        ret = cap - head + tail;
    80006560:	0004a703          	lw	a4,0(s1)
    80006564:	4127093b          	subw	s2,a4,s2
    80006568:	00f9093b          	addw	s2,s2,a5
    8000656c:	fc1ff06f          	j	8000652c <_ZN6Buffer6getCntEv+0x44>

0000000080006570 <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    80006570:	fe010113          	addi	sp,sp,-32
    80006574:	00113c23          	sd	ra,24(sp)
    80006578:	00813823          	sd	s0,16(sp)
    8000657c:	00913423          	sd	s1,8(sp)
    80006580:	02010413          	addi	s0,sp,32
    80006584:	00050493          	mv	s1,a0
    putc('\n');
    80006588:	00a00513          	li	a0,10
    8000658c:	ffffb097          	auipc	ra,0xffffb
    80006590:	0ac080e7          	jalr	172(ra) # 80001638 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006594:	00003517          	auipc	a0,0x3
    80006598:	cc450513          	addi	a0,a0,-828 # 80009258 <CONSOLE_STATUS+0x248>
    8000659c:	fffff097          	auipc	ra,0xfffff
    800065a0:	e64080e7          	jalr	-412(ra) # 80005400 <_Z11printStringPKc>
    while (getCnt() > 0) {
    800065a4:	00048513          	mv	a0,s1
    800065a8:	00000097          	auipc	ra,0x0
    800065ac:	f40080e7          	jalr	-192(ra) # 800064e8 <_ZN6Buffer6getCntEv>
    800065b0:	02a05c63          	blez	a0,800065e8 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    800065b4:	0084b783          	ld	a5,8(s1)
    800065b8:	0104a703          	lw	a4,16(s1)
    800065bc:	00271713          	slli	a4,a4,0x2
    800065c0:	00e787b3          	add	a5,a5,a4
        putc(ch);
    800065c4:	0007c503          	lbu	a0,0(a5)
    800065c8:	ffffb097          	auipc	ra,0xffffb
    800065cc:	070080e7          	jalr	112(ra) # 80001638 <_Z4putcc>
        head = (head + 1) % cap;
    800065d0:	0104a783          	lw	a5,16(s1)
    800065d4:	0017879b          	addiw	a5,a5,1
    800065d8:	0004a703          	lw	a4,0(s1)
    800065dc:	02e7e7bb          	remw	a5,a5,a4
    800065e0:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    800065e4:	fc1ff06f          	j	800065a4 <_ZN6BufferD1Ev+0x34>
    putc('!');
    800065e8:	02100513          	li	a0,33
    800065ec:	ffffb097          	auipc	ra,0xffffb
    800065f0:	04c080e7          	jalr	76(ra) # 80001638 <_Z4putcc>
    putc('\n');
    800065f4:	00a00513          	li	a0,10
    800065f8:	ffffb097          	auipc	ra,0xffffb
    800065fc:	040080e7          	jalr	64(ra) # 80001638 <_Z4putcc>
    mem_free(buffer);
    80006600:	0084b503          	ld	a0,8(s1)
    80006604:	ffffb097          	auipc	ra,0xffffb
    80006608:	dc8080e7          	jalr	-568(ra) # 800013cc <_Z8mem_freePv>
    sem_close(itemAvailable);
    8000660c:	0204b503          	ld	a0,32(s1)
    80006610:	ffffb097          	auipc	ra,0xffffb
    80006614:	f20080e7          	jalr	-224(ra) # 80001530 <_Z9sem_closeP3sem>
    sem_close(spaceAvailable);
    80006618:	0184b503          	ld	a0,24(s1)
    8000661c:	ffffb097          	auipc	ra,0xffffb
    80006620:	f14080e7          	jalr	-236(ra) # 80001530 <_Z9sem_closeP3sem>
    sem_close(mutexTail);
    80006624:	0304b503          	ld	a0,48(s1)
    80006628:	ffffb097          	auipc	ra,0xffffb
    8000662c:	f08080e7          	jalr	-248(ra) # 80001530 <_Z9sem_closeP3sem>
    sem_close(mutexHead);
    80006630:	0284b503          	ld	a0,40(s1)
    80006634:	ffffb097          	auipc	ra,0xffffb
    80006638:	efc080e7          	jalr	-260(ra) # 80001530 <_Z9sem_closeP3sem>
}
    8000663c:	01813083          	ld	ra,24(sp)
    80006640:	01013403          	ld	s0,16(sp)
    80006644:	00813483          	ld	s1,8(sp)
    80006648:	02010113          	addi	sp,sp,32
    8000664c:	00008067          	ret

0000000080006650 <start>:
    80006650:	ff010113          	addi	sp,sp,-16
    80006654:	00813423          	sd	s0,8(sp)
    80006658:	01010413          	addi	s0,sp,16
    8000665c:	300027f3          	csrr	a5,mstatus
    80006660:	ffffe737          	lui	a4,0xffffe
    80006664:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1cef>
    80006668:	00e7f7b3          	and	a5,a5,a4
    8000666c:	00001737          	lui	a4,0x1
    80006670:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006674:	00e7e7b3          	or	a5,a5,a4
    80006678:	30079073          	csrw	mstatus,a5
    8000667c:	00000797          	auipc	a5,0x0
    80006680:	16078793          	addi	a5,a5,352 # 800067dc <system_main>
    80006684:	34179073          	csrw	mepc,a5
    80006688:	00000793          	li	a5,0
    8000668c:	18079073          	csrw	satp,a5
    80006690:	000107b7          	lui	a5,0x10
    80006694:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006698:	30279073          	csrw	medeleg,a5
    8000669c:	30379073          	csrw	mideleg,a5
    800066a0:	104027f3          	csrr	a5,sie
    800066a4:	2227e793          	ori	a5,a5,546
    800066a8:	10479073          	csrw	sie,a5
    800066ac:	fff00793          	li	a5,-1
    800066b0:	00a7d793          	srli	a5,a5,0xa
    800066b4:	3b079073          	csrw	pmpaddr0,a5
    800066b8:	00f00793          	li	a5,15
    800066bc:	3a079073          	csrw	pmpcfg0,a5
    800066c0:	f14027f3          	csrr	a5,mhartid
    800066c4:	0200c737          	lui	a4,0x200c
    800066c8:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    800066cc:	0007869b          	sext.w	a3,a5
    800066d0:	00269713          	slli	a4,a3,0x2
    800066d4:	000f4637          	lui	a2,0xf4
    800066d8:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    800066dc:	00d70733          	add	a4,a4,a3
    800066e0:	0037979b          	slliw	a5,a5,0x3
    800066e4:	020046b7          	lui	a3,0x2004
    800066e8:	00d787b3          	add	a5,a5,a3
    800066ec:	00c585b3          	add	a1,a1,a2
    800066f0:	00371693          	slli	a3,a4,0x3
    800066f4:	00005717          	auipc	a4,0x5
    800066f8:	1bc70713          	addi	a4,a4,444 # 8000b8b0 <timer_scratch>
    800066fc:	00b7b023          	sd	a1,0(a5)
    80006700:	00d70733          	add	a4,a4,a3
    80006704:	00f73c23          	sd	a5,24(a4)
    80006708:	02c73023          	sd	a2,32(a4)
    8000670c:	34071073          	csrw	mscratch,a4
    80006710:	00000797          	auipc	a5,0x0
    80006714:	6e078793          	addi	a5,a5,1760 # 80006df0 <timervec>
    80006718:	30579073          	csrw	mtvec,a5
    8000671c:	300027f3          	csrr	a5,mstatus
    80006720:	0087e793          	ori	a5,a5,8
    80006724:	30079073          	csrw	mstatus,a5
    80006728:	304027f3          	csrr	a5,mie
    8000672c:	0807e793          	ori	a5,a5,128
    80006730:	30479073          	csrw	mie,a5
    80006734:	f14027f3          	csrr	a5,mhartid
    80006738:	0007879b          	sext.w	a5,a5
    8000673c:	00078213          	mv	tp,a5
    80006740:	30200073          	mret
    80006744:	00813403          	ld	s0,8(sp)
    80006748:	01010113          	addi	sp,sp,16
    8000674c:	00008067          	ret

0000000080006750 <timerinit>:
    80006750:	ff010113          	addi	sp,sp,-16
    80006754:	00813423          	sd	s0,8(sp)
    80006758:	01010413          	addi	s0,sp,16
    8000675c:	f14027f3          	csrr	a5,mhartid
    80006760:	0200c737          	lui	a4,0x200c
    80006764:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006768:	0007869b          	sext.w	a3,a5
    8000676c:	00269713          	slli	a4,a3,0x2
    80006770:	000f4637          	lui	a2,0xf4
    80006774:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006778:	00d70733          	add	a4,a4,a3
    8000677c:	0037979b          	slliw	a5,a5,0x3
    80006780:	020046b7          	lui	a3,0x2004
    80006784:	00d787b3          	add	a5,a5,a3
    80006788:	00c585b3          	add	a1,a1,a2
    8000678c:	00371693          	slli	a3,a4,0x3
    80006790:	00005717          	auipc	a4,0x5
    80006794:	12070713          	addi	a4,a4,288 # 8000b8b0 <timer_scratch>
    80006798:	00b7b023          	sd	a1,0(a5)
    8000679c:	00d70733          	add	a4,a4,a3
    800067a0:	00f73c23          	sd	a5,24(a4)
    800067a4:	02c73023          	sd	a2,32(a4)
    800067a8:	34071073          	csrw	mscratch,a4
    800067ac:	00000797          	auipc	a5,0x0
    800067b0:	64478793          	addi	a5,a5,1604 # 80006df0 <timervec>
    800067b4:	30579073          	csrw	mtvec,a5
    800067b8:	300027f3          	csrr	a5,mstatus
    800067bc:	0087e793          	ori	a5,a5,8
    800067c0:	30079073          	csrw	mstatus,a5
    800067c4:	304027f3          	csrr	a5,mie
    800067c8:	0807e793          	ori	a5,a5,128
    800067cc:	30479073          	csrw	mie,a5
    800067d0:	00813403          	ld	s0,8(sp)
    800067d4:	01010113          	addi	sp,sp,16
    800067d8:	00008067          	ret

00000000800067dc <system_main>:
    800067dc:	fe010113          	addi	sp,sp,-32
    800067e0:	00813823          	sd	s0,16(sp)
    800067e4:	00913423          	sd	s1,8(sp)
    800067e8:	00113c23          	sd	ra,24(sp)
    800067ec:	02010413          	addi	s0,sp,32
    800067f0:	00000097          	auipc	ra,0x0
    800067f4:	0c4080e7          	jalr	196(ra) # 800068b4 <cpuid>
    800067f8:	00005497          	auipc	s1,0x5
    800067fc:	fd848493          	addi	s1,s1,-40 # 8000b7d0 <started>
    80006800:	02050263          	beqz	a0,80006824 <system_main+0x48>
    80006804:	0004a783          	lw	a5,0(s1)
    80006808:	0007879b          	sext.w	a5,a5
    8000680c:	fe078ce3          	beqz	a5,80006804 <system_main+0x28>
    80006810:	0ff0000f          	fence
    80006814:	00003517          	auipc	a0,0x3
    80006818:	d1450513          	addi	a0,a0,-748 # 80009528 <CONSOLE_STATUS+0x518>
    8000681c:	00001097          	auipc	ra,0x1
    80006820:	a70080e7          	jalr	-1424(ra) # 8000728c <panic>
    80006824:	00001097          	auipc	ra,0x1
    80006828:	9c4080e7          	jalr	-1596(ra) # 800071e8 <consoleinit>
    8000682c:	00001097          	auipc	ra,0x1
    80006830:	150080e7          	jalr	336(ra) # 8000797c <printfinit>
    80006834:	00003517          	auipc	a0,0x3
    80006838:	b7c50513          	addi	a0,a0,-1156 # 800093b0 <CONSOLE_STATUS+0x3a0>
    8000683c:	00001097          	auipc	ra,0x1
    80006840:	aac080e7          	jalr	-1364(ra) # 800072e8 <__printf>
    80006844:	00003517          	auipc	a0,0x3
    80006848:	cb450513          	addi	a0,a0,-844 # 800094f8 <CONSOLE_STATUS+0x4e8>
    8000684c:	00001097          	auipc	ra,0x1
    80006850:	a9c080e7          	jalr	-1380(ra) # 800072e8 <__printf>
    80006854:	00003517          	auipc	a0,0x3
    80006858:	b5c50513          	addi	a0,a0,-1188 # 800093b0 <CONSOLE_STATUS+0x3a0>
    8000685c:	00001097          	auipc	ra,0x1
    80006860:	a8c080e7          	jalr	-1396(ra) # 800072e8 <__printf>
    80006864:	00001097          	auipc	ra,0x1
    80006868:	4a4080e7          	jalr	1188(ra) # 80007d08 <kinit>
    8000686c:	00000097          	auipc	ra,0x0
    80006870:	148080e7          	jalr	328(ra) # 800069b4 <trapinit>
    80006874:	00000097          	auipc	ra,0x0
    80006878:	16c080e7          	jalr	364(ra) # 800069e0 <trapinithart>
    8000687c:	00000097          	auipc	ra,0x0
    80006880:	5b4080e7          	jalr	1460(ra) # 80006e30 <plicinit>
    80006884:	00000097          	auipc	ra,0x0
    80006888:	5d4080e7          	jalr	1492(ra) # 80006e58 <plicinithart>
    8000688c:	00000097          	auipc	ra,0x0
    80006890:	078080e7          	jalr	120(ra) # 80006904 <userinit>
    80006894:	0ff0000f          	fence
    80006898:	00100793          	li	a5,1
    8000689c:	00003517          	auipc	a0,0x3
    800068a0:	c7450513          	addi	a0,a0,-908 # 80009510 <CONSOLE_STATUS+0x500>
    800068a4:	00f4a023          	sw	a5,0(s1)
    800068a8:	00001097          	auipc	ra,0x1
    800068ac:	a40080e7          	jalr	-1472(ra) # 800072e8 <__printf>
    800068b0:	0000006f          	j	800068b0 <system_main+0xd4>

00000000800068b4 <cpuid>:
    800068b4:	ff010113          	addi	sp,sp,-16
    800068b8:	00813423          	sd	s0,8(sp)
    800068bc:	01010413          	addi	s0,sp,16
    800068c0:	00020513          	mv	a0,tp
    800068c4:	00813403          	ld	s0,8(sp)
    800068c8:	0005051b          	sext.w	a0,a0
    800068cc:	01010113          	addi	sp,sp,16
    800068d0:	00008067          	ret

00000000800068d4 <mycpu>:
    800068d4:	ff010113          	addi	sp,sp,-16
    800068d8:	00813423          	sd	s0,8(sp)
    800068dc:	01010413          	addi	s0,sp,16
    800068e0:	00020793          	mv	a5,tp
    800068e4:	00813403          	ld	s0,8(sp)
    800068e8:	0007879b          	sext.w	a5,a5
    800068ec:	00779793          	slli	a5,a5,0x7
    800068f0:	00006517          	auipc	a0,0x6
    800068f4:	ff050513          	addi	a0,a0,-16 # 8000c8e0 <cpus>
    800068f8:	00f50533          	add	a0,a0,a5
    800068fc:	01010113          	addi	sp,sp,16
    80006900:	00008067          	ret

0000000080006904 <userinit>:
    80006904:	ff010113          	addi	sp,sp,-16
    80006908:	00813423          	sd	s0,8(sp)
    8000690c:	01010413          	addi	s0,sp,16
    80006910:	00813403          	ld	s0,8(sp)
    80006914:	01010113          	addi	sp,sp,16
    80006918:	ffffb317          	auipc	t1,0xffffb
    8000691c:	de830067          	jr	-536(t1) # 80001700 <main>

0000000080006920 <either_copyout>:
    80006920:	ff010113          	addi	sp,sp,-16
    80006924:	00813023          	sd	s0,0(sp)
    80006928:	00113423          	sd	ra,8(sp)
    8000692c:	01010413          	addi	s0,sp,16
    80006930:	02051663          	bnez	a0,8000695c <either_copyout+0x3c>
    80006934:	00058513          	mv	a0,a1
    80006938:	00060593          	mv	a1,a2
    8000693c:	0006861b          	sext.w	a2,a3
    80006940:	00002097          	auipc	ra,0x2
    80006944:	c54080e7          	jalr	-940(ra) # 80008594 <__memmove>
    80006948:	00813083          	ld	ra,8(sp)
    8000694c:	00013403          	ld	s0,0(sp)
    80006950:	00000513          	li	a0,0
    80006954:	01010113          	addi	sp,sp,16
    80006958:	00008067          	ret
    8000695c:	00003517          	auipc	a0,0x3
    80006960:	bf450513          	addi	a0,a0,-1036 # 80009550 <CONSOLE_STATUS+0x540>
    80006964:	00001097          	auipc	ra,0x1
    80006968:	928080e7          	jalr	-1752(ra) # 8000728c <panic>

000000008000696c <either_copyin>:
    8000696c:	ff010113          	addi	sp,sp,-16
    80006970:	00813023          	sd	s0,0(sp)
    80006974:	00113423          	sd	ra,8(sp)
    80006978:	01010413          	addi	s0,sp,16
    8000697c:	02059463          	bnez	a1,800069a4 <either_copyin+0x38>
    80006980:	00060593          	mv	a1,a2
    80006984:	0006861b          	sext.w	a2,a3
    80006988:	00002097          	auipc	ra,0x2
    8000698c:	c0c080e7          	jalr	-1012(ra) # 80008594 <__memmove>
    80006990:	00813083          	ld	ra,8(sp)
    80006994:	00013403          	ld	s0,0(sp)
    80006998:	00000513          	li	a0,0
    8000699c:	01010113          	addi	sp,sp,16
    800069a0:	00008067          	ret
    800069a4:	00003517          	auipc	a0,0x3
    800069a8:	bd450513          	addi	a0,a0,-1068 # 80009578 <CONSOLE_STATUS+0x568>
    800069ac:	00001097          	auipc	ra,0x1
    800069b0:	8e0080e7          	jalr	-1824(ra) # 8000728c <panic>

00000000800069b4 <trapinit>:
    800069b4:	ff010113          	addi	sp,sp,-16
    800069b8:	00813423          	sd	s0,8(sp)
    800069bc:	01010413          	addi	s0,sp,16
    800069c0:	00813403          	ld	s0,8(sp)
    800069c4:	00003597          	auipc	a1,0x3
    800069c8:	bdc58593          	addi	a1,a1,-1060 # 800095a0 <CONSOLE_STATUS+0x590>
    800069cc:	00006517          	auipc	a0,0x6
    800069d0:	f9450513          	addi	a0,a0,-108 # 8000c960 <tickslock>
    800069d4:	01010113          	addi	sp,sp,16
    800069d8:	00001317          	auipc	t1,0x1
    800069dc:	5c030067          	jr	1472(t1) # 80007f98 <initlock>

00000000800069e0 <trapinithart>:
    800069e0:	ff010113          	addi	sp,sp,-16
    800069e4:	00813423          	sd	s0,8(sp)
    800069e8:	01010413          	addi	s0,sp,16
    800069ec:	00000797          	auipc	a5,0x0
    800069f0:	2f478793          	addi	a5,a5,756 # 80006ce0 <kernelvec>
    800069f4:	10579073          	csrw	stvec,a5
    800069f8:	00813403          	ld	s0,8(sp)
    800069fc:	01010113          	addi	sp,sp,16
    80006a00:	00008067          	ret

0000000080006a04 <usertrap>:
    80006a04:	ff010113          	addi	sp,sp,-16
    80006a08:	00813423          	sd	s0,8(sp)
    80006a0c:	01010413          	addi	s0,sp,16
    80006a10:	00813403          	ld	s0,8(sp)
    80006a14:	01010113          	addi	sp,sp,16
    80006a18:	00008067          	ret

0000000080006a1c <usertrapret>:
    80006a1c:	ff010113          	addi	sp,sp,-16
    80006a20:	00813423          	sd	s0,8(sp)
    80006a24:	01010413          	addi	s0,sp,16
    80006a28:	00813403          	ld	s0,8(sp)
    80006a2c:	01010113          	addi	sp,sp,16
    80006a30:	00008067          	ret

0000000080006a34 <kerneltrap>:
    80006a34:	fe010113          	addi	sp,sp,-32
    80006a38:	00813823          	sd	s0,16(sp)
    80006a3c:	00113c23          	sd	ra,24(sp)
    80006a40:	00913423          	sd	s1,8(sp)
    80006a44:	02010413          	addi	s0,sp,32
    80006a48:	142025f3          	csrr	a1,scause
    80006a4c:	100027f3          	csrr	a5,sstatus
    80006a50:	0027f793          	andi	a5,a5,2
    80006a54:	10079c63          	bnez	a5,80006b6c <kerneltrap+0x138>
    80006a58:	142027f3          	csrr	a5,scause
    80006a5c:	0207ce63          	bltz	a5,80006a98 <kerneltrap+0x64>
    80006a60:	00003517          	auipc	a0,0x3
    80006a64:	b8850513          	addi	a0,a0,-1144 # 800095e8 <CONSOLE_STATUS+0x5d8>
    80006a68:	00001097          	auipc	ra,0x1
    80006a6c:	880080e7          	jalr	-1920(ra) # 800072e8 <__printf>
    80006a70:	141025f3          	csrr	a1,sepc
    80006a74:	14302673          	csrr	a2,stval
    80006a78:	00003517          	auipc	a0,0x3
    80006a7c:	b8050513          	addi	a0,a0,-1152 # 800095f8 <CONSOLE_STATUS+0x5e8>
    80006a80:	00001097          	auipc	ra,0x1
    80006a84:	868080e7          	jalr	-1944(ra) # 800072e8 <__printf>
    80006a88:	00003517          	auipc	a0,0x3
    80006a8c:	b8850513          	addi	a0,a0,-1144 # 80009610 <CONSOLE_STATUS+0x600>
    80006a90:	00000097          	auipc	ra,0x0
    80006a94:	7fc080e7          	jalr	2044(ra) # 8000728c <panic>
    80006a98:	0ff7f713          	andi	a4,a5,255
    80006a9c:	00900693          	li	a3,9
    80006aa0:	04d70063          	beq	a4,a3,80006ae0 <kerneltrap+0xac>
    80006aa4:	fff00713          	li	a4,-1
    80006aa8:	03f71713          	slli	a4,a4,0x3f
    80006aac:	00170713          	addi	a4,a4,1
    80006ab0:	fae798e3          	bne	a5,a4,80006a60 <kerneltrap+0x2c>
    80006ab4:	00000097          	auipc	ra,0x0
    80006ab8:	e00080e7          	jalr	-512(ra) # 800068b4 <cpuid>
    80006abc:	06050663          	beqz	a0,80006b28 <kerneltrap+0xf4>
    80006ac0:	144027f3          	csrr	a5,sip
    80006ac4:	ffd7f793          	andi	a5,a5,-3
    80006ac8:	14479073          	csrw	sip,a5
    80006acc:	01813083          	ld	ra,24(sp)
    80006ad0:	01013403          	ld	s0,16(sp)
    80006ad4:	00813483          	ld	s1,8(sp)
    80006ad8:	02010113          	addi	sp,sp,32
    80006adc:	00008067          	ret
    80006ae0:	00000097          	auipc	ra,0x0
    80006ae4:	3c4080e7          	jalr	964(ra) # 80006ea4 <plic_claim>
    80006ae8:	00a00793          	li	a5,10
    80006aec:	00050493          	mv	s1,a0
    80006af0:	06f50863          	beq	a0,a5,80006b60 <kerneltrap+0x12c>
    80006af4:	fc050ce3          	beqz	a0,80006acc <kerneltrap+0x98>
    80006af8:	00050593          	mv	a1,a0
    80006afc:	00003517          	auipc	a0,0x3
    80006b00:	acc50513          	addi	a0,a0,-1332 # 800095c8 <CONSOLE_STATUS+0x5b8>
    80006b04:	00000097          	auipc	ra,0x0
    80006b08:	7e4080e7          	jalr	2020(ra) # 800072e8 <__printf>
    80006b0c:	01013403          	ld	s0,16(sp)
    80006b10:	01813083          	ld	ra,24(sp)
    80006b14:	00048513          	mv	a0,s1
    80006b18:	00813483          	ld	s1,8(sp)
    80006b1c:	02010113          	addi	sp,sp,32
    80006b20:	00000317          	auipc	t1,0x0
    80006b24:	3bc30067          	jr	956(t1) # 80006edc <plic_complete>
    80006b28:	00006517          	auipc	a0,0x6
    80006b2c:	e3850513          	addi	a0,a0,-456 # 8000c960 <tickslock>
    80006b30:	00001097          	auipc	ra,0x1
    80006b34:	48c080e7          	jalr	1164(ra) # 80007fbc <acquire>
    80006b38:	00005717          	auipc	a4,0x5
    80006b3c:	c9c70713          	addi	a4,a4,-868 # 8000b7d4 <ticks>
    80006b40:	00072783          	lw	a5,0(a4)
    80006b44:	00006517          	auipc	a0,0x6
    80006b48:	e1c50513          	addi	a0,a0,-484 # 8000c960 <tickslock>
    80006b4c:	0017879b          	addiw	a5,a5,1
    80006b50:	00f72023          	sw	a5,0(a4)
    80006b54:	00001097          	auipc	ra,0x1
    80006b58:	534080e7          	jalr	1332(ra) # 80008088 <release>
    80006b5c:	f65ff06f          	j	80006ac0 <kerneltrap+0x8c>
    80006b60:	00001097          	auipc	ra,0x1
    80006b64:	090080e7          	jalr	144(ra) # 80007bf0 <uartintr>
    80006b68:	fa5ff06f          	j	80006b0c <kerneltrap+0xd8>
    80006b6c:	00003517          	auipc	a0,0x3
    80006b70:	a3c50513          	addi	a0,a0,-1476 # 800095a8 <CONSOLE_STATUS+0x598>
    80006b74:	00000097          	auipc	ra,0x0
    80006b78:	718080e7          	jalr	1816(ra) # 8000728c <panic>

0000000080006b7c <clockintr>:
    80006b7c:	fe010113          	addi	sp,sp,-32
    80006b80:	00813823          	sd	s0,16(sp)
    80006b84:	00913423          	sd	s1,8(sp)
    80006b88:	00113c23          	sd	ra,24(sp)
    80006b8c:	02010413          	addi	s0,sp,32
    80006b90:	00006497          	auipc	s1,0x6
    80006b94:	dd048493          	addi	s1,s1,-560 # 8000c960 <tickslock>
    80006b98:	00048513          	mv	a0,s1
    80006b9c:	00001097          	auipc	ra,0x1
    80006ba0:	420080e7          	jalr	1056(ra) # 80007fbc <acquire>
    80006ba4:	00005717          	auipc	a4,0x5
    80006ba8:	c3070713          	addi	a4,a4,-976 # 8000b7d4 <ticks>
    80006bac:	00072783          	lw	a5,0(a4)
    80006bb0:	01013403          	ld	s0,16(sp)
    80006bb4:	01813083          	ld	ra,24(sp)
    80006bb8:	00048513          	mv	a0,s1
    80006bbc:	0017879b          	addiw	a5,a5,1
    80006bc0:	00813483          	ld	s1,8(sp)
    80006bc4:	00f72023          	sw	a5,0(a4)
    80006bc8:	02010113          	addi	sp,sp,32
    80006bcc:	00001317          	auipc	t1,0x1
    80006bd0:	4bc30067          	jr	1212(t1) # 80008088 <release>

0000000080006bd4 <devintr>:
    80006bd4:	142027f3          	csrr	a5,scause
    80006bd8:	00000513          	li	a0,0
    80006bdc:	0007c463          	bltz	a5,80006be4 <devintr+0x10>
    80006be0:	00008067          	ret
    80006be4:	fe010113          	addi	sp,sp,-32
    80006be8:	00813823          	sd	s0,16(sp)
    80006bec:	00113c23          	sd	ra,24(sp)
    80006bf0:	00913423          	sd	s1,8(sp)
    80006bf4:	02010413          	addi	s0,sp,32
    80006bf8:	0ff7f713          	andi	a4,a5,255
    80006bfc:	00900693          	li	a3,9
    80006c00:	04d70c63          	beq	a4,a3,80006c58 <devintr+0x84>
    80006c04:	fff00713          	li	a4,-1
    80006c08:	03f71713          	slli	a4,a4,0x3f
    80006c0c:	00170713          	addi	a4,a4,1
    80006c10:	00e78c63          	beq	a5,a4,80006c28 <devintr+0x54>
    80006c14:	01813083          	ld	ra,24(sp)
    80006c18:	01013403          	ld	s0,16(sp)
    80006c1c:	00813483          	ld	s1,8(sp)
    80006c20:	02010113          	addi	sp,sp,32
    80006c24:	00008067          	ret
    80006c28:	00000097          	auipc	ra,0x0
    80006c2c:	c8c080e7          	jalr	-884(ra) # 800068b4 <cpuid>
    80006c30:	06050663          	beqz	a0,80006c9c <devintr+0xc8>
    80006c34:	144027f3          	csrr	a5,sip
    80006c38:	ffd7f793          	andi	a5,a5,-3
    80006c3c:	14479073          	csrw	sip,a5
    80006c40:	01813083          	ld	ra,24(sp)
    80006c44:	01013403          	ld	s0,16(sp)
    80006c48:	00813483          	ld	s1,8(sp)
    80006c4c:	00200513          	li	a0,2
    80006c50:	02010113          	addi	sp,sp,32
    80006c54:	00008067          	ret
    80006c58:	00000097          	auipc	ra,0x0
    80006c5c:	24c080e7          	jalr	588(ra) # 80006ea4 <plic_claim>
    80006c60:	00a00793          	li	a5,10
    80006c64:	00050493          	mv	s1,a0
    80006c68:	06f50663          	beq	a0,a5,80006cd4 <devintr+0x100>
    80006c6c:	00100513          	li	a0,1
    80006c70:	fa0482e3          	beqz	s1,80006c14 <devintr+0x40>
    80006c74:	00048593          	mv	a1,s1
    80006c78:	00003517          	auipc	a0,0x3
    80006c7c:	95050513          	addi	a0,a0,-1712 # 800095c8 <CONSOLE_STATUS+0x5b8>
    80006c80:	00000097          	auipc	ra,0x0
    80006c84:	668080e7          	jalr	1640(ra) # 800072e8 <__printf>
    80006c88:	00048513          	mv	a0,s1
    80006c8c:	00000097          	auipc	ra,0x0
    80006c90:	250080e7          	jalr	592(ra) # 80006edc <plic_complete>
    80006c94:	00100513          	li	a0,1
    80006c98:	f7dff06f          	j	80006c14 <devintr+0x40>
    80006c9c:	00006517          	auipc	a0,0x6
    80006ca0:	cc450513          	addi	a0,a0,-828 # 8000c960 <tickslock>
    80006ca4:	00001097          	auipc	ra,0x1
    80006ca8:	318080e7          	jalr	792(ra) # 80007fbc <acquire>
    80006cac:	00005717          	auipc	a4,0x5
    80006cb0:	b2870713          	addi	a4,a4,-1240 # 8000b7d4 <ticks>
    80006cb4:	00072783          	lw	a5,0(a4)
    80006cb8:	00006517          	auipc	a0,0x6
    80006cbc:	ca850513          	addi	a0,a0,-856 # 8000c960 <tickslock>
    80006cc0:	0017879b          	addiw	a5,a5,1
    80006cc4:	00f72023          	sw	a5,0(a4)
    80006cc8:	00001097          	auipc	ra,0x1
    80006ccc:	3c0080e7          	jalr	960(ra) # 80008088 <release>
    80006cd0:	f65ff06f          	j	80006c34 <devintr+0x60>
    80006cd4:	00001097          	auipc	ra,0x1
    80006cd8:	f1c080e7          	jalr	-228(ra) # 80007bf0 <uartintr>
    80006cdc:	fadff06f          	j	80006c88 <devintr+0xb4>

0000000080006ce0 <kernelvec>:
    80006ce0:	f0010113          	addi	sp,sp,-256
    80006ce4:	00113023          	sd	ra,0(sp)
    80006ce8:	00213423          	sd	sp,8(sp)
    80006cec:	00313823          	sd	gp,16(sp)
    80006cf0:	00413c23          	sd	tp,24(sp)
    80006cf4:	02513023          	sd	t0,32(sp)
    80006cf8:	02613423          	sd	t1,40(sp)
    80006cfc:	02713823          	sd	t2,48(sp)
    80006d00:	02813c23          	sd	s0,56(sp)
    80006d04:	04913023          	sd	s1,64(sp)
    80006d08:	04a13423          	sd	a0,72(sp)
    80006d0c:	04b13823          	sd	a1,80(sp)
    80006d10:	04c13c23          	sd	a2,88(sp)
    80006d14:	06d13023          	sd	a3,96(sp)
    80006d18:	06e13423          	sd	a4,104(sp)
    80006d1c:	06f13823          	sd	a5,112(sp)
    80006d20:	07013c23          	sd	a6,120(sp)
    80006d24:	09113023          	sd	a7,128(sp)
    80006d28:	09213423          	sd	s2,136(sp)
    80006d2c:	09313823          	sd	s3,144(sp)
    80006d30:	09413c23          	sd	s4,152(sp)
    80006d34:	0b513023          	sd	s5,160(sp)
    80006d38:	0b613423          	sd	s6,168(sp)
    80006d3c:	0b713823          	sd	s7,176(sp)
    80006d40:	0b813c23          	sd	s8,184(sp)
    80006d44:	0d913023          	sd	s9,192(sp)
    80006d48:	0da13423          	sd	s10,200(sp)
    80006d4c:	0db13823          	sd	s11,208(sp)
    80006d50:	0dc13c23          	sd	t3,216(sp)
    80006d54:	0fd13023          	sd	t4,224(sp)
    80006d58:	0fe13423          	sd	t5,232(sp)
    80006d5c:	0ff13823          	sd	t6,240(sp)
    80006d60:	cd5ff0ef          	jal	ra,80006a34 <kerneltrap>
    80006d64:	00013083          	ld	ra,0(sp)
    80006d68:	00813103          	ld	sp,8(sp)
    80006d6c:	01013183          	ld	gp,16(sp)
    80006d70:	02013283          	ld	t0,32(sp)
    80006d74:	02813303          	ld	t1,40(sp)
    80006d78:	03013383          	ld	t2,48(sp)
    80006d7c:	03813403          	ld	s0,56(sp)
    80006d80:	04013483          	ld	s1,64(sp)
    80006d84:	04813503          	ld	a0,72(sp)
    80006d88:	05013583          	ld	a1,80(sp)
    80006d8c:	05813603          	ld	a2,88(sp)
    80006d90:	06013683          	ld	a3,96(sp)
    80006d94:	06813703          	ld	a4,104(sp)
    80006d98:	07013783          	ld	a5,112(sp)
    80006d9c:	07813803          	ld	a6,120(sp)
    80006da0:	08013883          	ld	a7,128(sp)
    80006da4:	08813903          	ld	s2,136(sp)
    80006da8:	09013983          	ld	s3,144(sp)
    80006dac:	09813a03          	ld	s4,152(sp)
    80006db0:	0a013a83          	ld	s5,160(sp)
    80006db4:	0a813b03          	ld	s6,168(sp)
    80006db8:	0b013b83          	ld	s7,176(sp)
    80006dbc:	0b813c03          	ld	s8,184(sp)
    80006dc0:	0c013c83          	ld	s9,192(sp)
    80006dc4:	0c813d03          	ld	s10,200(sp)
    80006dc8:	0d013d83          	ld	s11,208(sp)
    80006dcc:	0d813e03          	ld	t3,216(sp)
    80006dd0:	0e013e83          	ld	t4,224(sp)
    80006dd4:	0e813f03          	ld	t5,232(sp)
    80006dd8:	0f013f83          	ld	t6,240(sp)
    80006ddc:	10010113          	addi	sp,sp,256
    80006de0:	10200073          	sret
    80006de4:	00000013          	nop
    80006de8:	00000013          	nop
    80006dec:	00000013          	nop

0000000080006df0 <timervec>:
    80006df0:	34051573          	csrrw	a0,mscratch,a0
    80006df4:	00b53023          	sd	a1,0(a0)
    80006df8:	00c53423          	sd	a2,8(a0)
    80006dfc:	00d53823          	sd	a3,16(a0)
    80006e00:	01853583          	ld	a1,24(a0)
    80006e04:	02053603          	ld	a2,32(a0)
    80006e08:	0005b683          	ld	a3,0(a1)
    80006e0c:	00c686b3          	add	a3,a3,a2
    80006e10:	00d5b023          	sd	a3,0(a1)
    80006e14:	00200593          	li	a1,2
    80006e18:	14459073          	csrw	sip,a1
    80006e1c:	01053683          	ld	a3,16(a0)
    80006e20:	00853603          	ld	a2,8(a0)
    80006e24:	00053583          	ld	a1,0(a0)
    80006e28:	34051573          	csrrw	a0,mscratch,a0
    80006e2c:	30200073          	mret

0000000080006e30 <plicinit>:
    80006e30:	ff010113          	addi	sp,sp,-16
    80006e34:	00813423          	sd	s0,8(sp)
    80006e38:	01010413          	addi	s0,sp,16
    80006e3c:	00813403          	ld	s0,8(sp)
    80006e40:	0c0007b7          	lui	a5,0xc000
    80006e44:	00100713          	li	a4,1
    80006e48:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    80006e4c:	00e7a223          	sw	a4,4(a5)
    80006e50:	01010113          	addi	sp,sp,16
    80006e54:	00008067          	ret

0000000080006e58 <plicinithart>:
    80006e58:	ff010113          	addi	sp,sp,-16
    80006e5c:	00813023          	sd	s0,0(sp)
    80006e60:	00113423          	sd	ra,8(sp)
    80006e64:	01010413          	addi	s0,sp,16
    80006e68:	00000097          	auipc	ra,0x0
    80006e6c:	a4c080e7          	jalr	-1460(ra) # 800068b4 <cpuid>
    80006e70:	0085171b          	slliw	a4,a0,0x8
    80006e74:	0c0027b7          	lui	a5,0xc002
    80006e78:	00e787b3          	add	a5,a5,a4
    80006e7c:	40200713          	li	a4,1026
    80006e80:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006e84:	00813083          	ld	ra,8(sp)
    80006e88:	00013403          	ld	s0,0(sp)
    80006e8c:	00d5151b          	slliw	a0,a0,0xd
    80006e90:	0c2017b7          	lui	a5,0xc201
    80006e94:	00a78533          	add	a0,a5,a0
    80006e98:	00052023          	sw	zero,0(a0)
    80006e9c:	01010113          	addi	sp,sp,16
    80006ea0:	00008067          	ret

0000000080006ea4 <plic_claim>:
    80006ea4:	ff010113          	addi	sp,sp,-16
    80006ea8:	00813023          	sd	s0,0(sp)
    80006eac:	00113423          	sd	ra,8(sp)
    80006eb0:	01010413          	addi	s0,sp,16
    80006eb4:	00000097          	auipc	ra,0x0
    80006eb8:	a00080e7          	jalr	-1536(ra) # 800068b4 <cpuid>
    80006ebc:	00813083          	ld	ra,8(sp)
    80006ec0:	00013403          	ld	s0,0(sp)
    80006ec4:	00d5151b          	slliw	a0,a0,0xd
    80006ec8:	0c2017b7          	lui	a5,0xc201
    80006ecc:	00a78533          	add	a0,a5,a0
    80006ed0:	00452503          	lw	a0,4(a0)
    80006ed4:	01010113          	addi	sp,sp,16
    80006ed8:	00008067          	ret

0000000080006edc <plic_complete>:
    80006edc:	fe010113          	addi	sp,sp,-32
    80006ee0:	00813823          	sd	s0,16(sp)
    80006ee4:	00913423          	sd	s1,8(sp)
    80006ee8:	00113c23          	sd	ra,24(sp)
    80006eec:	02010413          	addi	s0,sp,32
    80006ef0:	00050493          	mv	s1,a0
    80006ef4:	00000097          	auipc	ra,0x0
    80006ef8:	9c0080e7          	jalr	-1600(ra) # 800068b4 <cpuid>
    80006efc:	01813083          	ld	ra,24(sp)
    80006f00:	01013403          	ld	s0,16(sp)
    80006f04:	00d5179b          	slliw	a5,a0,0xd
    80006f08:	0c201737          	lui	a4,0xc201
    80006f0c:	00f707b3          	add	a5,a4,a5
    80006f10:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80006f14:	00813483          	ld	s1,8(sp)
    80006f18:	02010113          	addi	sp,sp,32
    80006f1c:	00008067          	ret

0000000080006f20 <consolewrite>:
    80006f20:	fb010113          	addi	sp,sp,-80
    80006f24:	04813023          	sd	s0,64(sp)
    80006f28:	04113423          	sd	ra,72(sp)
    80006f2c:	02913c23          	sd	s1,56(sp)
    80006f30:	03213823          	sd	s2,48(sp)
    80006f34:	03313423          	sd	s3,40(sp)
    80006f38:	03413023          	sd	s4,32(sp)
    80006f3c:	01513c23          	sd	s5,24(sp)
    80006f40:	05010413          	addi	s0,sp,80
    80006f44:	06c05c63          	blez	a2,80006fbc <consolewrite+0x9c>
    80006f48:	00060993          	mv	s3,a2
    80006f4c:	00050a13          	mv	s4,a0
    80006f50:	00058493          	mv	s1,a1
    80006f54:	00000913          	li	s2,0
    80006f58:	fff00a93          	li	s5,-1
    80006f5c:	01c0006f          	j	80006f78 <consolewrite+0x58>
    80006f60:	fbf44503          	lbu	a0,-65(s0)
    80006f64:	0019091b          	addiw	s2,s2,1
    80006f68:	00148493          	addi	s1,s1,1
    80006f6c:	00001097          	auipc	ra,0x1
    80006f70:	a9c080e7          	jalr	-1380(ra) # 80007a08 <uartputc>
    80006f74:	03298063          	beq	s3,s2,80006f94 <consolewrite+0x74>
    80006f78:	00048613          	mv	a2,s1
    80006f7c:	00100693          	li	a3,1
    80006f80:	000a0593          	mv	a1,s4
    80006f84:	fbf40513          	addi	a0,s0,-65
    80006f88:	00000097          	auipc	ra,0x0
    80006f8c:	9e4080e7          	jalr	-1564(ra) # 8000696c <either_copyin>
    80006f90:	fd5518e3          	bne	a0,s5,80006f60 <consolewrite+0x40>
    80006f94:	04813083          	ld	ra,72(sp)
    80006f98:	04013403          	ld	s0,64(sp)
    80006f9c:	03813483          	ld	s1,56(sp)
    80006fa0:	02813983          	ld	s3,40(sp)
    80006fa4:	02013a03          	ld	s4,32(sp)
    80006fa8:	01813a83          	ld	s5,24(sp)
    80006fac:	00090513          	mv	a0,s2
    80006fb0:	03013903          	ld	s2,48(sp)
    80006fb4:	05010113          	addi	sp,sp,80
    80006fb8:	00008067          	ret
    80006fbc:	00000913          	li	s2,0
    80006fc0:	fd5ff06f          	j	80006f94 <consolewrite+0x74>

0000000080006fc4 <consoleread>:
    80006fc4:	f9010113          	addi	sp,sp,-112
    80006fc8:	06813023          	sd	s0,96(sp)
    80006fcc:	04913c23          	sd	s1,88(sp)
    80006fd0:	05213823          	sd	s2,80(sp)
    80006fd4:	05313423          	sd	s3,72(sp)
    80006fd8:	05413023          	sd	s4,64(sp)
    80006fdc:	03513c23          	sd	s5,56(sp)
    80006fe0:	03613823          	sd	s6,48(sp)
    80006fe4:	03713423          	sd	s7,40(sp)
    80006fe8:	03813023          	sd	s8,32(sp)
    80006fec:	06113423          	sd	ra,104(sp)
    80006ff0:	01913c23          	sd	s9,24(sp)
    80006ff4:	07010413          	addi	s0,sp,112
    80006ff8:	00060b93          	mv	s7,a2
    80006ffc:	00050913          	mv	s2,a0
    80007000:	00058c13          	mv	s8,a1
    80007004:	00060b1b          	sext.w	s6,a2
    80007008:	00006497          	auipc	s1,0x6
    8000700c:	98048493          	addi	s1,s1,-1664 # 8000c988 <cons>
    80007010:	00400993          	li	s3,4
    80007014:	fff00a13          	li	s4,-1
    80007018:	00a00a93          	li	s5,10
    8000701c:	05705e63          	blez	s7,80007078 <consoleread+0xb4>
    80007020:	09c4a703          	lw	a4,156(s1)
    80007024:	0984a783          	lw	a5,152(s1)
    80007028:	0007071b          	sext.w	a4,a4
    8000702c:	08e78463          	beq	a5,a4,800070b4 <consoleread+0xf0>
    80007030:	07f7f713          	andi	a4,a5,127
    80007034:	00e48733          	add	a4,s1,a4
    80007038:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    8000703c:	0017869b          	addiw	a3,a5,1
    80007040:	08d4ac23          	sw	a3,152(s1)
    80007044:	00070c9b          	sext.w	s9,a4
    80007048:	0b370663          	beq	a4,s3,800070f4 <consoleread+0x130>
    8000704c:	00100693          	li	a3,1
    80007050:	f9f40613          	addi	a2,s0,-97
    80007054:	000c0593          	mv	a1,s8
    80007058:	00090513          	mv	a0,s2
    8000705c:	f8e40fa3          	sb	a4,-97(s0)
    80007060:	00000097          	auipc	ra,0x0
    80007064:	8c0080e7          	jalr	-1856(ra) # 80006920 <either_copyout>
    80007068:	01450863          	beq	a0,s4,80007078 <consoleread+0xb4>
    8000706c:	001c0c13          	addi	s8,s8,1
    80007070:	fffb8b9b          	addiw	s7,s7,-1
    80007074:	fb5c94e3          	bne	s9,s5,8000701c <consoleread+0x58>
    80007078:	000b851b          	sext.w	a0,s7
    8000707c:	06813083          	ld	ra,104(sp)
    80007080:	06013403          	ld	s0,96(sp)
    80007084:	05813483          	ld	s1,88(sp)
    80007088:	05013903          	ld	s2,80(sp)
    8000708c:	04813983          	ld	s3,72(sp)
    80007090:	04013a03          	ld	s4,64(sp)
    80007094:	03813a83          	ld	s5,56(sp)
    80007098:	02813b83          	ld	s7,40(sp)
    8000709c:	02013c03          	ld	s8,32(sp)
    800070a0:	01813c83          	ld	s9,24(sp)
    800070a4:	40ab053b          	subw	a0,s6,a0
    800070a8:	03013b03          	ld	s6,48(sp)
    800070ac:	07010113          	addi	sp,sp,112
    800070b0:	00008067          	ret
    800070b4:	00001097          	auipc	ra,0x1
    800070b8:	1d8080e7          	jalr	472(ra) # 8000828c <push_on>
    800070bc:	0984a703          	lw	a4,152(s1)
    800070c0:	09c4a783          	lw	a5,156(s1)
    800070c4:	0007879b          	sext.w	a5,a5
    800070c8:	fef70ce3          	beq	a4,a5,800070c0 <consoleread+0xfc>
    800070cc:	00001097          	auipc	ra,0x1
    800070d0:	234080e7          	jalr	564(ra) # 80008300 <pop_on>
    800070d4:	0984a783          	lw	a5,152(s1)
    800070d8:	07f7f713          	andi	a4,a5,127
    800070dc:	00e48733          	add	a4,s1,a4
    800070e0:	01874703          	lbu	a4,24(a4)
    800070e4:	0017869b          	addiw	a3,a5,1
    800070e8:	08d4ac23          	sw	a3,152(s1)
    800070ec:	00070c9b          	sext.w	s9,a4
    800070f0:	f5371ee3          	bne	a4,s3,8000704c <consoleread+0x88>
    800070f4:	000b851b          	sext.w	a0,s7
    800070f8:	f96bf2e3          	bgeu	s7,s6,8000707c <consoleread+0xb8>
    800070fc:	08f4ac23          	sw	a5,152(s1)
    80007100:	f7dff06f          	j	8000707c <consoleread+0xb8>

0000000080007104 <consputc>:
    80007104:	10000793          	li	a5,256
    80007108:	00f50663          	beq	a0,a5,80007114 <consputc+0x10>
    8000710c:	00001317          	auipc	t1,0x1
    80007110:	9f430067          	jr	-1548(t1) # 80007b00 <uartputc_sync>
    80007114:	ff010113          	addi	sp,sp,-16
    80007118:	00113423          	sd	ra,8(sp)
    8000711c:	00813023          	sd	s0,0(sp)
    80007120:	01010413          	addi	s0,sp,16
    80007124:	00800513          	li	a0,8
    80007128:	00001097          	auipc	ra,0x1
    8000712c:	9d8080e7          	jalr	-1576(ra) # 80007b00 <uartputc_sync>
    80007130:	02000513          	li	a0,32
    80007134:	00001097          	auipc	ra,0x1
    80007138:	9cc080e7          	jalr	-1588(ra) # 80007b00 <uartputc_sync>
    8000713c:	00013403          	ld	s0,0(sp)
    80007140:	00813083          	ld	ra,8(sp)
    80007144:	00800513          	li	a0,8
    80007148:	01010113          	addi	sp,sp,16
    8000714c:	00001317          	auipc	t1,0x1
    80007150:	9b430067          	jr	-1612(t1) # 80007b00 <uartputc_sync>

0000000080007154 <consoleintr>:
    80007154:	fe010113          	addi	sp,sp,-32
    80007158:	00813823          	sd	s0,16(sp)
    8000715c:	00913423          	sd	s1,8(sp)
    80007160:	01213023          	sd	s2,0(sp)
    80007164:	00113c23          	sd	ra,24(sp)
    80007168:	02010413          	addi	s0,sp,32
    8000716c:	00006917          	auipc	s2,0x6
    80007170:	81c90913          	addi	s2,s2,-2020 # 8000c988 <cons>
    80007174:	00050493          	mv	s1,a0
    80007178:	00090513          	mv	a0,s2
    8000717c:	00001097          	auipc	ra,0x1
    80007180:	e40080e7          	jalr	-448(ra) # 80007fbc <acquire>
    80007184:	02048c63          	beqz	s1,800071bc <consoleintr+0x68>
    80007188:	0a092783          	lw	a5,160(s2)
    8000718c:	09892703          	lw	a4,152(s2)
    80007190:	07f00693          	li	a3,127
    80007194:	40e7873b          	subw	a4,a5,a4
    80007198:	02e6e263          	bltu	a3,a4,800071bc <consoleintr+0x68>
    8000719c:	00d00713          	li	a4,13
    800071a0:	04e48063          	beq	s1,a4,800071e0 <consoleintr+0x8c>
    800071a4:	07f7f713          	andi	a4,a5,127
    800071a8:	00e90733          	add	a4,s2,a4
    800071ac:	0017879b          	addiw	a5,a5,1
    800071b0:	0af92023          	sw	a5,160(s2)
    800071b4:	00970c23          	sb	s1,24(a4)
    800071b8:	08f92e23          	sw	a5,156(s2)
    800071bc:	01013403          	ld	s0,16(sp)
    800071c0:	01813083          	ld	ra,24(sp)
    800071c4:	00813483          	ld	s1,8(sp)
    800071c8:	00013903          	ld	s2,0(sp)
    800071cc:	00005517          	auipc	a0,0x5
    800071d0:	7bc50513          	addi	a0,a0,1980 # 8000c988 <cons>
    800071d4:	02010113          	addi	sp,sp,32
    800071d8:	00001317          	auipc	t1,0x1
    800071dc:	eb030067          	jr	-336(t1) # 80008088 <release>
    800071e0:	00a00493          	li	s1,10
    800071e4:	fc1ff06f          	j	800071a4 <consoleintr+0x50>

00000000800071e8 <consoleinit>:
    800071e8:	fe010113          	addi	sp,sp,-32
    800071ec:	00113c23          	sd	ra,24(sp)
    800071f0:	00813823          	sd	s0,16(sp)
    800071f4:	00913423          	sd	s1,8(sp)
    800071f8:	02010413          	addi	s0,sp,32
    800071fc:	00005497          	auipc	s1,0x5
    80007200:	78c48493          	addi	s1,s1,1932 # 8000c988 <cons>
    80007204:	00048513          	mv	a0,s1
    80007208:	00002597          	auipc	a1,0x2
    8000720c:	41858593          	addi	a1,a1,1048 # 80009620 <CONSOLE_STATUS+0x610>
    80007210:	00001097          	auipc	ra,0x1
    80007214:	d88080e7          	jalr	-632(ra) # 80007f98 <initlock>
    80007218:	00000097          	auipc	ra,0x0
    8000721c:	7ac080e7          	jalr	1964(ra) # 800079c4 <uartinit>
    80007220:	01813083          	ld	ra,24(sp)
    80007224:	01013403          	ld	s0,16(sp)
    80007228:	00000797          	auipc	a5,0x0
    8000722c:	d9c78793          	addi	a5,a5,-612 # 80006fc4 <consoleread>
    80007230:	0af4bc23          	sd	a5,184(s1)
    80007234:	00000797          	auipc	a5,0x0
    80007238:	cec78793          	addi	a5,a5,-788 # 80006f20 <consolewrite>
    8000723c:	0cf4b023          	sd	a5,192(s1)
    80007240:	00813483          	ld	s1,8(sp)
    80007244:	02010113          	addi	sp,sp,32
    80007248:	00008067          	ret

000000008000724c <console_read>:
    8000724c:	ff010113          	addi	sp,sp,-16
    80007250:	00813423          	sd	s0,8(sp)
    80007254:	01010413          	addi	s0,sp,16
    80007258:	00813403          	ld	s0,8(sp)
    8000725c:	00005317          	auipc	t1,0x5
    80007260:	7e433303          	ld	t1,2020(t1) # 8000ca40 <devsw+0x10>
    80007264:	01010113          	addi	sp,sp,16
    80007268:	00030067          	jr	t1

000000008000726c <console_write>:
    8000726c:	ff010113          	addi	sp,sp,-16
    80007270:	00813423          	sd	s0,8(sp)
    80007274:	01010413          	addi	s0,sp,16
    80007278:	00813403          	ld	s0,8(sp)
    8000727c:	00005317          	auipc	t1,0x5
    80007280:	7cc33303          	ld	t1,1996(t1) # 8000ca48 <devsw+0x18>
    80007284:	01010113          	addi	sp,sp,16
    80007288:	00030067          	jr	t1

000000008000728c <panic>:
    8000728c:	fe010113          	addi	sp,sp,-32
    80007290:	00113c23          	sd	ra,24(sp)
    80007294:	00813823          	sd	s0,16(sp)
    80007298:	00913423          	sd	s1,8(sp)
    8000729c:	02010413          	addi	s0,sp,32
    800072a0:	00050493          	mv	s1,a0
    800072a4:	00002517          	auipc	a0,0x2
    800072a8:	38450513          	addi	a0,a0,900 # 80009628 <CONSOLE_STATUS+0x618>
    800072ac:	00006797          	auipc	a5,0x6
    800072b0:	8207ae23          	sw	zero,-1988(a5) # 8000cae8 <pr+0x18>
    800072b4:	00000097          	auipc	ra,0x0
    800072b8:	034080e7          	jalr	52(ra) # 800072e8 <__printf>
    800072bc:	00048513          	mv	a0,s1
    800072c0:	00000097          	auipc	ra,0x0
    800072c4:	028080e7          	jalr	40(ra) # 800072e8 <__printf>
    800072c8:	00002517          	auipc	a0,0x2
    800072cc:	0e850513          	addi	a0,a0,232 # 800093b0 <CONSOLE_STATUS+0x3a0>
    800072d0:	00000097          	auipc	ra,0x0
    800072d4:	018080e7          	jalr	24(ra) # 800072e8 <__printf>
    800072d8:	00100793          	li	a5,1
    800072dc:	00004717          	auipc	a4,0x4
    800072e0:	4ef72e23          	sw	a5,1276(a4) # 8000b7d8 <panicked>
    800072e4:	0000006f          	j	800072e4 <panic+0x58>

00000000800072e8 <__printf>:
    800072e8:	f3010113          	addi	sp,sp,-208
    800072ec:	08813023          	sd	s0,128(sp)
    800072f0:	07313423          	sd	s3,104(sp)
    800072f4:	09010413          	addi	s0,sp,144
    800072f8:	05813023          	sd	s8,64(sp)
    800072fc:	08113423          	sd	ra,136(sp)
    80007300:	06913c23          	sd	s1,120(sp)
    80007304:	07213823          	sd	s2,112(sp)
    80007308:	07413023          	sd	s4,96(sp)
    8000730c:	05513c23          	sd	s5,88(sp)
    80007310:	05613823          	sd	s6,80(sp)
    80007314:	05713423          	sd	s7,72(sp)
    80007318:	03913c23          	sd	s9,56(sp)
    8000731c:	03a13823          	sd	s10,48(sp)
    80007320:	03b13423          	sd	s11,40(sp)
    80007324:	00005317          	auipc	t1,0x5
    80007328:	7ac30313          	addi	t1,t1,1964 # 8000cad0 <pr>
    8000732c:	01832c03          	lw	s8,24(t1)
    80007330:	00b43423          	sd	a1,8(s0)
    80007334:	00c43823          	sd	a2,16(s0)
    80007338:	00d43c23          	sd	a3,24(s0)
    8000733c:	02e43023          	sd	a4,32(s0)
    80007340:	02f43423          	sd	a5,40(s0)
    80007344:	03043823          	sd	a6,48(s0)
    80007348:	03143c23          	sd	a7,56(s0)
    8000734c:	00050993          	mv	s3,a0
    80007350:	4a0c1663          	bnez	s8,800077fc <__printf+0x514>
    80007354:	60098c63          	beqz	s3,8000796c <__printf+0x684>
    80007358:	0009c503          	lbu	a0,0(s3)
    8000735c:	00840793          	addi	a5,s0,8
    80007360:	f6f43c23          	sd	a5,-136(s0)
    80007364:	00000493          	li	s1,0
    80007368:	22050063          	beqz	a0,80007588 <__printf+0x2a0>
    8000736c:	00002a37          	lui	s4,0x2
    80007370:	00018ab7          	lui	s5,0x18
    80007374:	000f4b37          	lui	s6,0xf4
    80007378:	00989bb7          	lui	s7,0x989
    8000737c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80007380:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80007384:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80007388:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    8000738c:	00148c9b          	addiw	s9,s1,1
    80007390:	02500793          	li	a5,37
    80007394:	01998933          	add	s2,s3,s9
    80007398:	38f51263          	bne	a0,a5,8000771c <__printf+0x434>
    8000739c:	00094783          	lbu	a5,0(s2)
    800073a0:	00078c9b          	sext.w	s9,a5
    800073a4:	1e078263          	beqz	a5,80007588 <__printf+0x2a0>
    800073a8:	0024849b          	addiw	s1,s1,2
    800073ac:	07000713          	li	a4,112
    800073b0:	00998933          	add	s2,s3,s1
    800073b4:	38e78a63          	beq	a5,a4,80007748 <__printf+0x460>
    800073b8:	20f76863          	bltu	a4,a5,800075c8 <__printf+0x2e0>
    800073bc:	42a78863          	beq	a5,a0,800077ec <__printf+0x504>
    800073c0:	06400713          	li	a4,100
    800073c4:	40e79663          	bne	a5,a4,800077d0 <__printf+0x4e8>
    800073c8:	f7843783          	ld	a5,-136(s0)
    800073cc:	0007a603          	lw	a2,0(a5)
    800073d0:	00878793          	addi	a5,a5,8
    800073d4:	f6f43c23          	sd	a5,-136(s0)
    800073d8:	42064a63          	bltz	a2,8000780c <__printf+0x524>
    800073dc:	00a00713          	li	a4,10
    800073e0:	02e677bb          	remuw	a5,a2,a4
    800073e4:	00002d97          	auipc	s11,0x2
    800073e8:	26cd8d93          	addi	s11,s11,620 # 80009650 <digits>
    800073ec:	00900593          	li	a1,9
    800073f0:	0006051b          	sext.w	a0,a2
    800073f4:	00000c93          	li	s9,0
    800073f8:	02079793          	slli	a5,a5,0x20
    800073fc:	0207d793          	srli	a5,a5,0x20
    80007400:	00fd87b3          	add	a5,s11,a5
    80007404:	0007c783          	lbu	a5,0(a5)
    80007408:	02e656bb          	divuw	a3,a2,a4
    8000740c:	f8f40023          	sb	a5,-128(s0)
    80007410:	14c5d863          	bge	a1,a2,80007560 <__printf+0x278>
    80007414:	06300593          	li	a1,99
    80007418:	00100c93          	li	s9,1
    8000741c:	02e6f7bb          	remuw	a5,a3,a4
    80007420:	02079793          	slli	a5,a5,0x20
    80007424:	0207d793          	srli	a5,a5,0x20
    80007428:	00fd87b3          	add	a5,s11,a5
    8000742c:	0007c783          	lbu	a5,0(a5)
    80007430:	02e6d73b          	divuw	a4,a3,a4
    80007434:	f8f400a3          	sb	a5,-127(s0)
    80007438:	12a5f463          	bgeu	a1,a0,80007560 <__printf+0x278>
    8000743c:	00a00693          	li	a3,10
    80007440:	00900593          	li	a1,9
    80007444:	02d777bb          	remuw	a5,a4,a3
    80007448:	02079793          	slli	a5,a5,0x20
    8000744c:	0207d793          	srli	a5,a5,0x20
    80007450:	00fd87b3          	add	a5,s11,a5
    80007454:	0007c503          	lbu	a0,0(a5)
    80007458:	02d757bb          	divuw	a5,a4,a3
    8000745c:	f8a40123          	sb	a0,-126(s0)
    80007460:	48e5f263          	bgeu	a1,a4,800078e4 <__printf+0x5fc>
    80007464:	06300513          	li	a0,99
    80007468:	02d7f5bb          	remuw	a1,a5,a3
    8000746c:	02059593          	slli	a1,a1,0x20
    80007470:	0205d593          	srli	a1,a1,0x20
    80007474:	00bd85b3          	add	a1,s11,a1
    80007478:	0005c583          	lbu	a1,0(a1)
    8000747c:	02d7d7bb          	divuw	a5,a5,a3
    80007480:	f8b401a3          	sb	a1,-125(s0)
    80007484:	48e57263          	bgeu	a0,a4,80007908 <__printf+0x620>
    80007488:	3e700513          	li	a0,999
    8000748c:	02d7f5bb          	remuw	a1,a5,a3
    80007490:	02059593          	slli	a1,a1,0x20
    80007494:	0205d593          	srli	a1,a1,0x20
    80007498:	00bd85b3          	add	a1,s11,a1
    8000749c:	0005c583          	lbu	a1,0(a1)
    800074a0:	02d7d7bb          	divuw	a5,a5,a3
    800074a4:	f8b40223          	sb	a1,-124(s0)
    800074a8:	46e57663          	bgeu	a0,a4,80007914 <__printf+0x62c>
    800074ac:	02d7f5bb          	remuw	a1,a5,a3
    800074b0:	02059593          	slli	a1,a1,0x20
    800074b4:	0205d593          	srli	a1,a1,0x20
    800074b8:	00bd85b3          	add	a1,s11,a1
    800074bc:	0005c583          	lbu	a1,0(a1)
    800074c0:	02d7d7bb          	divuw	a5,a5,a3
    800074c4:	f8b402a3          	sb	a1,-123(s0)
    800074c8:	46ea7863          	bgeu	s4,a4,80007938 <__printf+0x650>
    800074cc:	02d7f5bb          	remuw	a1,a5,a3
    800074d0:	02059593          	slli	a1,a1,0x20
    800074d4:	0205d593          	srli	a1,a1,0x20
    800074d8:	00bd85b3          	add	a1,s11,a1
    800074dc:	0005c583          	lbu	a1,0(a1)
    800074e0:	02d7d7bb          	divuw	a5,a5,a3
    800074e4:	f8b40323          	sb	a1,-122(s0)
    800074e8:	3eeaf863          	bgeu	s5,a4,800078d8 <__printf+0x5f0>
    800074ec:	02d7f5bb          	remuw	a1,a5,a3
    800074f0:	02059593          	slli	a1,a1,0x20
    800074f4:	0205d593          	srli	a1,a1,0x20
    800074f8:	00bd85b3          	add	a1,s11,a1
    800074fc:	0005c583          	lbu	a1,0(a1)
    80007500:	02d7d7bb          	divuw	a5,a5,a3
    80007504:	f8b403a3          	sb	a1,-121(s0)
    80007508:	42eb7e63          	bgeu	s6,a4,80007944 <__printf+0x65c>
    8000750c:	02d7f5bb          	remuw	a1,a5,a3
    80007510:	02059593          	slli	a1,a1,0x20
    80007514:	0205d593          	srli	a1,a1,0x20
    80007518:	00bd85b3          	add	a1,s11,a1
    8000751c:	0005c583          	lbu	a1,0(a1)
    80007520:	02d7d7bb          	divuw	a5,a5,a3
    80007524:	f8b40423          	sb	a1,-120(s0)
    80007528:	42ebfc63          	bgeu	s7,a4,80007960 <__printf+0x678>
    8000752c:	02079793          	slli	a5,a5,0x20
    80007530:	0207d793          	srli	a5,a5,0x20
    80007534:	00fd8db3          	add	s11,s11,a5
    80007538:	000dc703          	lbu	a4,0(s11)
    8000753c:	00a00793          	li	a5,10
    80007540:	00900c93          	li	s9,9
    80007544:	f8e404a3          	sb	a4,-119(s0)
    80007548:	00065c63          	bgez	a2,80007560 <__printf+0x278>
    8000754c:	f9040713          	addi	a4,s0,-112
    80007550:	00f70733          	add	a4,a4,a5
    80007554:	02d00693          	li	a3,45
    80007558:	fed70823          	sb	a3,-16(a4)
    8000755c:	00078c93          	mv	s9,a5
    80007560:	f8040793          	addi	a5,s0,-128
    80007564:	01978cb3          	add	s9,a5,s9
    80007568:	f7f40d13          	addi	s10,s0,-129
    8000756c:	000cc503          	lbu	a0,0(s9)
    80007570:	fffc8c93          	addi	s9,s9,-1
    80007574:	00000097          	auipc	ra,0x0
    80007578:	b90080e7          	jalr	-1136(ra) # 80007104 <consputc>
    8000757c:	ffac98e3          	bne	s9,s10,8000756c <__printf+0x284>
    80007580:	00094503          	lbu	a0,0(s2)
    80007584:	e00514e3          	bnez	a0,8000738c <__printf+0xa4>
    80007588:	1a0c1663          	bnez	s8,80007734 <__printf+0x44c>
    8000758c:	08813083          	ld	ra,136(sp)
    80007590:	08013403          	ld	s0,128(sp)
    80007594:	07813483          	ld	s1,120(sp)
    80007598:	07013903          	ld	s2,112(sp)
    8000759c:	06813983          	ld	s3,104(sp)
    800075a0:	06013a03          	ld	s4,96(sp)
    800075a4:	05813a83          	ld	s5,88(sp)
    800075a8:	05013b03          	ld	s6,80(sp)
    800075ac:	04813b83          	ld	s7,72(sp)
    800075b0:	04013c03          	ld	s8,64(sp)
    800075b4:	03813c83          	ld	s9,56(sp)
    800075b8:	03013d03          	ld	s10,48(sp)
    800075bc:	02813d83          	ld	s11,40(sp)
    800075c0:	0d010113          	addi	sp,sp,208
    800075c4:	00008067          	ret
    800075c8:	07300713          	li	a4,115
    800075cc:	1ce78a63          	beq	a5,a4,800077a0 <__printf+0x4b8>
    800075d0:	07800713          	li	a4,120
    800075d4:	1ee79e63          	bne	a5,a4,800077d0 <__printf+0x4e8>
    800075d8:	f7843783          	ld	a5,-136(s0)
    800075dc:	0007a703          	lw	a4,0(a5)
    800075e0:	00878793          	addi	a5,a5,8
    800075e4:	f6f43c23          	sd	a5,-136(s0)
    800075e8:	28074263          	bltz	a4,8000786c <__printf+0x584>
    800075ec:	00002d97          	auipc	s11,0x2
    800075f0:	064d8d93          	addi	s11,s11,100 # 80009650 <digits>
    800075f4:	00f77793          	andi	a5,a4,15
    800075f8:	00fd87b3          	add	a5,s11,a5
    800075fc:	0007c683          	lbu	a3,0(a5)
    80007600:	00f00613          	li	a2,15
    80007604:	0007079b          	sext.w	a5,a4
    80007608:	f8d40023          	sb	a3,-128(s0)
    8000760c:	0047559b          	srliw	a1,a4,0x4
    80007610:	0047569b          	srliw	a3,a4,0x4
    80007614:	00000c93          	li	s9,0
    80007618:	0ee65063          	bge	a2,a4,800076f8 <__printf+0x410>
    8000761c:	00f6f693          	andi	a3,a3,15
    80007620:	00dd86b3          	add	a3,s11,a3
    80007624:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    80007628:	0087d79b          	srliw	a5,a5,0x8
    8000762c:	00100c93          	li	s9,1
    80007630:	f8d400a3          	sb	a3,-127(s0)
    80007634:	0cb67263          	bgeu	a2,a1,800076f8 <__printf+0x410>
    80007638:	00f7f693          	andi	a3,a5,15
    8000763c:	00dd86b3          	add	a3,s11,a3
    80007640:	0006c583          	lbu	a1,0(a3)
    80007644:	00f00613          	li	a2,15
    80007648:	0047d69b          	srliw	a3,a5,0x4
    8000764c:	f8b40123          	sb	a1,-126(s0)
    80007650:	0047d593          	srli	a1,a5,0x4
    80007654:	28f67e63          	bgeu	a2,a5,800078f0 <__printf+0x608>
    80007658:	00f6f693          	andi	a3,a3,15
    8000765c:	00dd86b3          	add	a3,s11,a3
    80007660:	0006c503          	lbu	a0,0(a3)
    80007664:	0087d813          	srli	a6,a5,0x8
    80007668:	0087d69b          	srliw	a3,a5,0x8
    8000766c:	f8a401a3          	sb	a0,-125(s0)
    80007670:	28b67663          	bgeu	a2,a1,800078fc <__printf+0x614>
    80007674:	00f6f693          	andi	a3,a3,15
    80007678:	00dd86b3          	add	a3,s11,a3
    8000767c:	0006c583          	lbu	a1,0(a3)
    80007680:	00c7d513          	srli	a0,a5,0xc
    80007684:	00c7d69b          	srliw	a3,a5,0xc
    80007688:	f8b40223          	sb	a1,-124(s0)
    8000768c:	29067a63          	bgeu	a2,a6,80007920 <__printf+0x638>
    80007690:	00f6f693          	andi	a3,a3,15
    80007694:	00dd86b3          	add	a3,s11,a3
    80007698:	0006c583          	lbu	a1,0(a3)
    8000769c:	0107d813          	srli	a6,a5,0x10
    800076a0:	0107d69b          	srliw	a3,a5,0x10
    800076a4:	f8b402a3          	sb	a1,-123(s0)
    800076a8:	28a67263          	bgeu	a2,a0,8000792c <__printf+0x644>
    800076ac:	00f6f693          	andi	a3,a3,15
    800076b0:	00dd86b3          	add	a3,s11,a3
    800076b4:	0006c683          	lbu	a3,0(a3)
    800076b8:	0147d79b          	srliw	a5,a5,0x14
    800076bc:	f8d40323          	sb	a3,-122(s0)
    800076c0:	21067663          	bgeu	a2,a6,800078cc <__printf+0x5e4>
    800076c4:	02079793          	slli	a5,a5,0x20
    800076c8:	0207d793          	srli	a5,a5,0x20
    800076cc:	00fd8db3          	add	s11,s11,a5
    800076d0:	000dc683          	lbu	a3,0(s11)
    800076d4:	00800793          	li	a5,8
    800076d8:	00700c93          	li	s9,7
    800076dc:	f8d403a3          	sb	a3,-121(s0)
    800076e0:	00075c63          	bgez	a4,800076f8 <__printf+0x410>
    800076e4:	f9040713          	addi	a4,s0,-112
    800076e8:	00f70733          	add	a4,a4,a5
    800076ec:	02d00693          	li	a3,45
    800076f0:	fed70823          	sb	a3,-16(a4)
    800076f4:	00078c93          	mv	s9,a5
    800076f8:	f8040793          	addi	a5,s0,-128
    800076fc:	01978cb3          	add	s9,a5,s9
    80007700:	f7f40d13          	addi	s10,s0,-129
    80007704:	000cc503          	lbu	a0,0(s9)
    80007708:	fffc8c93          	addi	s9,s9,-1
    8000770c:	00000097          	auipc	ra,0x0
    80007710:	9f8080e7          	jalr	-1544(ra) # 80007104 <consputc>
    80007714:	ff9d18e3          	bne	s10,s9,80007704 <__printf+0x41c>
    80007718:	0100006f          	j	80007728 <__printf+0x440>
    8000771c:	00000097          	auipc	ra,0x0
    80007720:	9e8080e7          	jalr	-1560(ra) # 80007104 <consputc>
    80007724:	000c8493          	mv	s1,s9
    80007728:	00094503          	lbu	a0,0(s2)
    8000772c:	c60510e3          	bnez	a0,8000738c <__printf+0xa4>
    80007730:	e40c0ee3          	beqz	s8,8000758c <__printf+0x2a4>
    80007734:	00005517          	auipc	a0,0x5
    80007738:	39c50513          	addi	a0,a0,924 # 8000cad0 <pr>
    8000773c:	00001097          	auipc	ra,0x1
    80007740:	94c080e7          	jalr	-1716(ra) # 80008088 <release>
    80007744:	e49ff06f          	j	8000758c <__printf+0x2a4>
    80007748:	f7843783          	ld	a5,-136(s0)
    8000774c:	03000513          	li	a0,48
    80007750:	01000d13          	li	s10,16
    80007754:	00878713          	addi	a4,a5,8
    80007758:	0007bc83          	ld	s9,0(a5)
    8000775c:	f6e43c23          	sd	a4,-136(s0)
    80007760:	00000097          	auipc	ra,0x0
    80007764:	9a4080e7          	jalr	-1628(ra) # 80007104 <consputc>
    80007768:	07800513          	li	a0,120
    8000776c:	00000097          	auipc	ra,0x0
    80007770:	998080e7          	jalr	-1640(ra) # 80007104 <consputc>
    80007774:	00002d97          	auipc	s11,0x2
    80007778:	edcd8d93          	addi	s11,s11,-292 # 80009650 <digits>
    8000777c:	03ccd793          	srli	a5,s9,0x3c
    80007780:	00fd87b3          	add	a5,s11,a5
    80007784:	0007c503          	lbu	a0,0(a5)
    80007788:	fffd0d1b          	addiw	s10,s10,-1
    8000778c:	004c9c93          	slli	s9,s9,0x4
    80007790:	00000097          	auipc	ra,0x0
    80007794:	974080e7          	jalr	-1676(ra) # 80007104 <consputc>
    80007798:	fe0d12e3          	bnez	s10,8000777c <__printf+0x494>
    8000779c:	f8dff06f          	j	80007728 <__printf+0x440>
    800077a0:	f7843783          	ld	a5,-136(s0)
    800077a4:	0007bc83          	ld	s9,0(a5)
    800077a8:	00878793          	addi	a5,a5,8
    800077ac:	f6f43c23          	sd	a5,-136(s0)
    800077b0:	000c9a63          	bnez	s9,800077c4 <__printf+0x4dc>
    800077b4:	1080006f          	j	800078bc <__printf+0x5d4>
    800077b8:	001c8c93          	addi	s9,s9,1
    800077bc:	00000097          	auipc	ra,0x0
    800077c0:	948080e7          	jalr	-1720(ra) # 80007104 <consputc>
    800077c4:	000cc503          	lbu	a0,0(s9)
    800077c8:	fe0518e3          	bnez	a0,800077b8 <__printf+0x4d0>
    800077cc:	f5dff06f          	j	80007728 <__printf+0x440>
    800077d0:	02500513          	li	a0,37
    800077d4:	00000097          	auipc	ra,0x0
    800077d8:	930080e7          	jalr	-1744(ra) # 80007104 <consputc>
    800077dc:	000c8513          	mv	a0,s9
    800077e0:	00000097          	auipc	ra,0x0
    800077e4:	924080e7          	jalr	-1756(ra) # 80007104 <consputc>
    800077e8:	f41ff06f          	j	80007728 <__printf+0x440>
    800077ec:	02500513          	li	a0,37
    800077f0:	00000097          	auipc	ra,0x0
    800077f4:	914080e7          	jalr	-1772(ra) # 80007104 <consputc>
    800077f8:	f31ff06f          	j	80007728 <__printf+0x440>
    800077fc:	00030513          	mv	a0,t1
    80007800:	00000097          	auipc	ra,0x0
    80007804:	7bc080e7          	jalr	1980(ra) # 80007fbc <acquire>
    80007808:	b4dff06f          	j	80007354 <__printf+0x6c>
    8000780c:	40c0053b          	negw	a0,a2
    80007810:	00a00713          	li	a4,10
    80007814:	02e576bb          	remuw	a3,a0,a4
    80007818:	00002d97          	auipc	s11,0x2
    8000781c:	e38d8d93          	addi	s11,s11,-456 # 80009650 <digits>
    80007820:	ff700593          	li	a1,-9
    80007824:	02069693          	slli	a3,a3,0x20
    80007828:	0206d693          	srli	a3,a3,0x20
    8000782c:	00dd86b3          	add	a3,s11,a3
    80007830:	0006c683          	lbu	a3,0(a3)
    80007834:	02e557bb          	divuw	a5,a0,a4
    80007838:	f8d40023          	sb	a3,-128(s0)
    8000783c:	10b65e63          	bge	a2,a1,80007958 <__printf+0x670>
    80007840:	06300593          	li	a1,99
    80007844:	02e7f6bb          	remuw	a3,a5,a4
    80007848:	02069693          	slli	a3,a3,0x20
    8000784c:	0206d693          	srli	a3,a3,0x20
    80007850:	00dd86b3          	add	a3,s11,a3
    80007854:	0006c683          	lbu	a3,0(a3)
    80007858:	02e7d73b          	divuw	a4,a5,a4
    8000785c:	00200793          	li	a5,2
    80007860:	f8d400a3          	sb	a3,-127(s0)
    80007864:	bca5ece3          	bltu	a1,a0,8000743c <__printf+0x154>
    80007868:	ce5ff06f          	j	8000754c <__printf+0x264>
    8000786c:	40e007bb          	negw	a5,a4
    80007870:	00002d97          	auipc	s11,0x2
    80007874:	de0d8d93          	addi	s11,s11,-544 # 80009650 <digits>
    80007878:	00f7f693          	andi	a3,a5,15
    8000787c:	00dd86b3          	add	a3,s11,a3
    80007880:	0006c583          	lbu	a1,0(a3)
    80007884:	ff100613          	li	a2,-15
    80007888:	0047d69b          	srliw	a3,a5,0x4
    8000788c:	f8b40023          	sb	a1,-128(s0)
    80007890:	0047d59b          	srliw	a1,a5,0x4
    80007894:	0ac75e63          	bge	a4,a2,80007950 <__printf+0x668>
    80007898:	00f6f693          	andi	a3,a3,15
    8000789c:	00dd86b3          	add	a3,s11,a3
    800078a0:	0006c603          	lbu	a2,0(a3)
    800078a4:	00f00693          	li	a3,15
    800078a8:	0087d79b          	srliw	a5,a5,0x8
    800078ac:	f8c400a3          	sb	a2,-127(s0)
    800078b0:	d8b6e4e3          	bltu	a3,a1,80007638 <__printf+0x350>
    800078b4:	00200793          	li	a5,2
    800078b8:	e2dff06f          	j	800076e4 <__printf+0x3fc>
    800078bc:	00002c97          	auipc	s9,0x2
    800078c0:	d74c8c93          	addi	s9,s9,-652 # 80009630 <CONSOLE_STATUS+0x620>
    800078c4:	02800513          	li	a0,40
    800078c8:	ef1ff06f          	j	800077b8 <__printf+0x4d0>
    800078cc:	00700793          	li	a5,7
    800078d0:	00600c93          	li	s9,6
    800078d4:	e0dff06f          	j	800076e0 <__printf+0x3f8>
    800078d8:	00700793          	li	a5,7
    800078dc:	00600c93          	li	s9,6
    800078e0:	c69ff06f          	j	80007548 <__printf+0x260>
    800078e4:	00300793          	li	a5,3
    800078e8:	00200c93          	li	s9,2
    800078ec:	c5dff06f          	j	80007548 <__printf+0x260>
    800078f0:	00300793          	li	a5,3
    800078f4:	00200c93          	li	s9,2
    800078f8:	de9ff06f          	j	800076e0 <__printf+0x3f8>
    800078fc:	00400793          	li	a5,4
    80007900:	00300c93          	li	s9,3
    80007904:	dddff06f          	j	800076e0 <__printf+0x3f8>
    80007908:	00400793          	li	a5,4
    8000790c:	00300c93          	li	s9,3
    80007910:	c39ff06f          	j	80007548 <__printf+0x260>
    80007914:	00500793          	li	a5,5
    80007918:	00400c93          	li	s9,4
    8000791c:	c2dff06f          	j	80007548 <__printf+0x260>
    80007920:	00500793          	li	a5,5
    80007924:	00400c93          	li	s9,4
    80007928:	db9ff06f          	j	800076e0 <__printf+0x3f8>
    8000792c:	00600793          	li	a5,6
    80007930:	00500c93          	li	s9,5
    80007934:	dadff06f          	j	800076e0 <__printf+0x3f8>
    80007938:	00600793          	li	a5,6
    8000793c:	00500c93          	li	s9,5
    80007940:	c09ff06f          	j	80007548 <__printf+0x260>
    80007944:	00800793          	li	a5,8
    80007948:	00700c93          	li	s9,7
    8000794c:	bfdff06f          	j	80007548 <__printf+0x260>
    80007950:	00100793          	li	a5,1
    80007954:	d91ff06f          	j	800076e4 <__printf+0x3fc>
    80007958:	00100793          	li	a5,1
    8000795c:	bf1ff06f          	j	8000754c <__printf+0x264>
    80007960:	00900793          	li	a5,9
    80007964:	00800c93          	li	s9,8
    80007968:	be1ff06f          	j	80007548 <__printf+0x260>
    8000796c:	00002517          	auipc	a0,0x2
    80007970:	ccc50513          	addi	a0,a0,-820 # 80009638 <CONSOLE_STATUS+0x628>
    80007974:	00000097          	auipc	ra,0x0
    80007978:	918080e7          	jalr	-1768(ra) # 8000728c <panic>

000000008000797c <printfinit>:
    8000797c:	fe010113          	addi	sp,sp,-32
    80007980:	00813823          	sd	s0,16(sp)
    80007984:	00913423          	sd	s1,8(sp)
    80007988:	00113c23          	sd	ra,24(sp)
    8000798c:	02010413          	addi	s0,sp,32
    80007990:	00005497          	auipc	s1,0x5
    80007994:	14048493          	addi	s1,s1,320 # 8000cad0 <pr>
    80007998:	00048513          	mv	a0,s1
    8000799c:	00002597          	auipc	a1,0x2
    800079a0:	cac58593          	addi	a1,a1,-852 # 80009648 <CONSOLE_STATUS+0x638>
    800079a4:	00000097          	auipc	ra,0x0
    800079a8:	5f4080e7          	jalr	1524(ra) # 80007f98 <initlock>
    800079ac:	01813083          	ld	ra,24(sp)
    800079b0:	01013403          	ld	s0,16(sp)
    800079b4:	0004ac23          	sw	zero,24(s1)
    800079b8:	00813483          	ld	s1,8(sp)
    800079bc:	02010113          	addi	sp,sp,32
    800079c0:	00008067          	ret

00000000800079c4 <uartinit>:
    800079c4:	ff010113          	addi	sp,sp,-16
    800079c8:	00813423          	sd	s0,8(sp)
    800079cc:	01010413          	addi	s0,sp,16
    800079d0:	100007b7          	lui	a5,0x10000
    800079d4:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    800079d8:	f8000713          	li	a4,-128
    800079dc:	00e781a3          	sb	a4,3(a5)
    800079e0:	00300713          	li	a4,3
    800079e4:	00e78023          	sb	a4,0(a5)
    800079e8:	000780a3          	sb	zero,1(a5)
    800079ec:	00e781a3          	sb	a4,3(a5)
    800079f0:	00700693          	li	a3,7
    800079f4:	00d78123          	sb	a3,2(a5)
    800079f8:	00e780a3          	sb	a4,1(a5)
    800079fc:	00813403          	ld	s0,8(sp)
    80007a00:	01010113          	addi	sp,sp,16
    80007a04:	00008067          	ret

0000000080007a08 <uartputc>:
    80007a08:	00004797          	auipc	a5,0x4
    80007a0c:	dd07a783          	lw	a5,-560(a5) # 8000b7d8 <panicked>
    80007a10:	00078463          	beqz	a5,80007a18 <uartputc+0x10>
    80007a14:	0000006f          	j	80007a14 <uartputc+0xc>
    80007a18:	fd010113          	addi	sp,sp,-48
    80007a1c:	02813023          	sd	s0,32(sp)
    80007a20:	00913c23          	sd	s1,24(sp)
    80007a24:	01213823          	sd	s2,16(sp)
    80007a28:	01313423          	sd	s3,8(sp)
    80007a2c:	02113423          	sd	ra,40(sp)
    80007a30:	03010413          	addi	s0,sp,48
    80007a34:	00004917          	auipc	s2,0x4
    80007a38:	dac90913          	addi	s2,s2,-596 # 8000b7e0 <uart_tx_r>
    80007a3c:	00093783          	ld	a5,0(s2)
    80007a40:	00004497          	auipc	s1,0x4
    80007a44:	da848493          	addi	s1,s1,-600 # 8000b7e8 <uart_tx_w>
    80007a48:	0004b703          	ld	a4,0(s1)
    80007a4c:	02078693          	addi	a3,a5,32
    80007a50:	00050993          	mv	s3,a0
    80007a54:	02e69c63          	bne	a3,a4,80007a8c <uartputc+0x84>
    80007a58:	00001097          	auipc	ra,0x1
    80007a5c:	834080e7          	jalr	-1996(ra) # 8000828c <push_on>
    80007a60:	00093783          	ld	a5,0(s2)
    80007a64:	0004b703          	ld	a4,0(s1)
    80007a68:	02078793          	addi	a5,a5,32
    80007a6c:	00e79463          	bne	a5,a4,80007a74 <uartputc+0x6c>
    80007a70:	0000006f          	j	80007a70 <uartputc+0x68>
    80007a74:	00001097          	auipc	ra,0x1
    80007a78:	88c080e7          	jalr	-1908(ra) # 80008300 <pop_on>
    80007a7c:	00093783          	ld	a5,0(s2)
    80007a80:	0004b703          	ld	a4,0(s1)
    80007a84:	02078693          	addi	a3,a5,32
    80007a88:	fce688e3          	beq	a3,a4,80007a58 <uartputc+0x50>
    80007a8c:	01f77693          	andi	a3,a4,31
    80007a90:	00005597          	auipc	a1,0x5
    80007a94:	06058593          	addi	a1,a1,96 # 8000caf0 <uart_tx_buf>
    80007a98:	00d586b3          	add	a3,a1,a3
    80007a9c:	00170713          	addi	a4,a4,1
    80007aa0:	01368023          	sb	s3,0(a3)
    80007aa4:	00e4b023          	sd	a4,0(s1)
    80007aa8:	10000637          	lui	a2,0x10000
    80007aac:	02f71063          	bne	a4,a5,80007acc <uartputc+0xc4>
    80007ab0:	0340006f          	j	80007ae4 <uartputc+0xdc>
    80007ab4:	00074703          	lbu	a4,0(a4)
    80007ab8:	00f93023          	sd	a5,0(s2)
    80007abc:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007ac0:	00093783          	ld	a5,0(s2)
    80007ac4:	0004b703          	ld	a4,0(s1)
    80007ac8:	00f70e63          	beq	a4,a5,80007ae4 <uartputc+0xdc>
    80007acc:	00564683          	lbu	a3,5(a2)
    80007ad0:	01f7f713          	andi	a4,a5,31
    80007ad4:	00e58733          	add	a4,a1,a4
    80007ad8:	0206f693          	andi	a3,a3,32
    80007adc:	00178793          	addi	a5,a5,1
    80007ae0:	fc069ae3          	bnez	a3,80007ab4 <uartputc+0xac>
    80007ae4:	02813083          	ld	ra,40(sp)
    80007ae8:	02013403          	ld	s0,32(sp)
    80007aec:	01813483          	ld	s1,24(sp)
    80007af0:	01013903          	ld	s2,16(sp)
    80007af4:	00813983          	ld	s3,8(sp)
    80007af8:	03010113          	addi	sp,sp,48
    80007afc:	00008067          	ret

0000000080007b00 <uartputc_sync>:
    80007b00:	ff010113          	addi	sp,sp,-16
    80007b04:	00813423          	sd	s0,8(sp)
    80007b08:	01010413          	addi	s0,sp,16
    80007b0c:	00004717          	auipc	a4,0x4
    80007b10:	ccc72703          	lw	a4,-820(a4) # 8000b7d8 <panicked>
    80007b14:	02071663          	bnez	a4,80007b40 <uartputc_sync+0x40>
    80007b18:	00050793          	mv	a5,a0
    80007b1c:	100006b7          	lui	a3,0x10000
    80007b20:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    80007b24:	02077713          	andi	a4,a4,32
    80007b28:	fe070ce3          	beqz	a4,80007b20 <uartputc_sync+0x20>
    80007b2c:	0ff7f793          	andi	a5,a5,255
    80007b30:	00f68023          	sb	a5,0(a3)
    80007b34:	00813403          	ld	s0,8(sp)
    80007b38:	01010113          	addi	sp,sp,16
    80007b3c:	00008067          	ret
    80007b40:	0000006f          	j	80007b40 <uartputc_sync+0x40>

0000000080007b44 <uartstart>:
    80007b44:	ff010113          	addi	sp,sp,-16
    80007b48:	00813423          	sd	s0,8(sp)
    80007b4c:	01010413          	addi	s0,sp,16
    80007b50:	00004617          	auipc	a2,0x4
    80007b54:	c9060613          	addi	a2,a2,-880 # 8000b7e0 <uart_tx_r>
    80007b58:	00004517          	auipc	a0,0x4
    80007b5c:	c9050513          	addi	a0,a0,-880 # 8000b7e8 <uart_tx_w>
    80007b60:	00063783          	ld	a5,0(a2)
    80007b64:	00053703          	ld	a4,0(a0)
    80007b68:	04f70263          	beq	a4,a5,80007bac <uartstart+0x68>
    80007b6c:	100005b7          	lui	a1,0x10000
    80007b70:	00005817          	auipc	a6,0x5
    80007b74:	f8080813          	addi	a6,a6,-128 # 8000caf0 <uart_tx_buf>
    80007b78:	01c0006f          	j	80007b94 <uartstart+0x50>
    80007b7c:	0006c703          	lbu	a4,0(a3)
    80007b80:	00f63023          	sd	a5,0(a2)
    80007b84:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007b88:	00063783          	ld	a5,0(a2)
    80007b8c:	00053703          	ld	a4,0(a0)
    80007b90:	00f70e63          	beq	a4,a5,80007bac <uartstart+0x68>
    80007b94:	01f7f713          	andi	a4,a5,31
    80007b98:	00e806b3          	add	a3,a6,a4
    80007b9c:	0055c703          	lbu	a4,5(a1)
    80007ba0:	00178793          	addi	a5,a5,1
    80007ba4:	02077713          	andi	a4,a4,32
    80007ba8:	fc071ae3          	bnez	a4,80007b7c <uartstart+0x38>
    80007bac:	00813403          	ld	s0,8(sp)
    80007bb0:	01010113          	addi	sp,sp,16
    80007bb4:	00008067          	ret

0000000080007bb8 <uartgetc>:
    80007bb8:	ff010113          	addi	sp,sp,-16
    80007bbc:	00813423          	sd	s0,8(sp)
    80007bc0:	01010413          	addi	s0,sp,16
    80007bc4:	10000737          	lui	a4,0x10000
    80007bc8:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    80007bcc:	0017f793          	andi	a5,a5,1
    80007bd0:	00078c63          	beqz	a5,80007be8 <uartgetc+0x30>
    80007bd4:	00074503          	lbu	a0,0(a4)
    80007bd8:	0ff57513          	andi	a0,a0,255
    80007bdc:	00813403          	ld	s0,8(sp)
    80007be0:	01010113          	addi	sp,sp,16
    80007be4:	00008067          	ret
    80007be8:	fff00513          	li	a0,-1
    80007bec:	ff1ff06f          	j	80007bdc <uartgetc+0x24>

0000000080007bf0 <uartintr>:
    80007bf0:	100007b7          	lui	a5,0x10000
    80007bf4:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007bf8:	0017f793          	andi	a5,a5,1
    80007bfc:	0a078463          	beqz	a5,80007ca4 <uartintr+0xb4>
    80007c00:	fe010113          	addi	sp,sp,-32
    80007c04:	00813823          	sd	s0,16(sp)
    80007c08:	00913423          	sd	s1,8(sp)
    80007c0c:	00113c23          	sd	ra,24(sp)
    80007c10:	02010413          	addi	s0,sp,32
    80007c14:	100004b7          	lui	s1,0x10000
    80007c18:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    80007c1c:	0ff57513          	andi	a0,a0,255
    80007c20:	fffff097          	auipc	ra,0xfffff
    80007c24:	534080e7          	jalr	1332(ra) # 80007154 <consoleintr>
    80007c28:	0054c783          	lbu	a5,5(s1)
    80007c2c:	0017f793          	andi	a5,a5,1
    80007c30:	fe0794e3          	bnez	a5,80007c18 <uartintr+0x28>
    80007c34:	00004617          	auipc	a2,0x4
    80007c38:	bac60613          	addi	a2,a2,-1108 # 8000b7e0 <uart_tx_r>
    80007c3c:	00004517          	auipc	a0,0x4
    80007c40:	bac50513          	addi	a0,a0,-1108 # 8000b7e8 <uart_tx_w>
    80007c44:	00063783          	ld	a5,0(a2)
    80007c48:	00053703          	ld	a4,0(a0)
    80007c4c:	04f70263          	beq	a4,a5,80007c90 <uartintr+0xa0>
    80007c50:	100005b7          	lui	a1,0x10000
    80007c54:	00005817          	auipc	a6,0x5
    80007c58:	e9c80813          	addi	a6,a6,-356 # 8000caf0 <uart_tx_buf>
    80007c5c:	01c0006f          	j	80007c78 <uartintr+0x88>
    80007c60:	0006c703          	lbu	a4,0(a3)
    80007c64:	00f63023          	sd	a5,0(a2)
    80007c68:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007c6c:	00063783          	ld	a5,0(a2)
    80007c70:	00053703          	ld	a4,0(a0)
    80007c74:	00f70e63          	beq	a4,a5,80007c90 <uartintr+0xa0>
    80007c78:	01f7f713          	andi	a4,a5,31
    80007c7c:	00e806b3          	add	a3,a6,a4
    80007c80:	0055c703          	lbu	a4,5(a1)
    80007c84:	00178793          	addi	a5,a5,1
    80007c88:	02077713          	andi	a4,a4,32
    80007c8c:	fc071ae3          	bnez	a4,80007c60 <uartintr+0x70>
    80007c90:	01813083          	ld	ra,24(sp)
    80007c94:	01013403          	ld	s0,16(sp)
    80007c98:	00813483          	ld	s1,8(sp)
    80007c9c:	02010113          	addi	sp,sp,32
    80007ca0:	00008067          	ret
    80007ca4:	00004617          	auipc	a2,0x4
    80007ca8:	b3c60613          	addi	a2,a2,-1220 # 8000b7e0 <uart_tx_r>
    80007cac:	00004517          	auipc	a0,0x4
    80007cb0:	b3c50513          	addi	a0,a0,-1220 # 8000b7e8 <uart_tx_w>
    80007cb4:	00063783          	ld	a5,0(a2)
    80007cb8:	00053703          	ld	a4,0(a0)
    80007cbc:	04f70263          	beq	a4,a5,80007d00 <uartintr+0x110>
    80007cc0:	100005b7          	lui	a1,0x10000
    80007cc4:	00005817          	auipc	a6,0x5
    80007cc8:	e2c80813          	addi	a6,a6,-468 # 8000caf0 <uart_tx_buf>
    80007ccc:	01c0006f          	j	80007ce8 <uartintr+0xf8>
    80007cd0:	0006c703          	lbu	a4,0(a3)
    80007cd4:	00f63023          	sd	a5,0(a2)
    80007cd8:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007cdc:	00063783          	ld	a5,0(a2)
    80007ce0:	00053703          	ld	a4,0(a0)
    80007ce4:	02f70063          	beq	a4,a5,80007d04 <uartintr+0x114>
    80007ce8:	01f7f713          	andi	a4,a5,31
    80007cec:	00e806b3          	add	a3,a6,a4
    80007cf0:	0055c703          	lbu	a4,5(a1)
    80007cf4:	00178793          	addi	a5,a5,1
    80007cf8:	02077713          	andi	a4,a4,32
    80007cfc:	fc071ae3          	bnez	a4,80007cd0 <uartintr+0xe0>
    80007d00:	00008067          	ret
    80007d04:	00008067          	ret

0000000080007d08 <kinit>:
    80007d08:	fc010113          	addi	sp,sp,-64
    80007d0c:	02913423          	sd	s1,40(sp)
    80007d10:	fffff7b7          	lui	a5,0xfffff
    80007d14:	00006497          	auipc	s1,0x6
    80007d18:	dfb48493          	addi	s1,s1,-517 # 8000db0f <end+0xfff>
    80007d1c:	02813823          	sd	s0,48(sp)
    80007d20:	01313c23          	sd	s3,24(sp)
    80007d24:	00f4f4b3          	and	s1,s1,a5
    80007d28:	02113c23          	sd	ra,56(sp)
    80007d2c:	03213023          	sd	s2,32(sp)
    80007d30:	01413823          	sd	s4,16(sp)
    80007d34:	01513423          	sd	s5,8(sp)
    80007d38:	04010413          	addi	s0,sp,64
    80007d3c:	000017b7          	lui	a5,0x1
    80007d40:	01100993          	li	s3,17
    80007d44:	00f487b3          	add	a5,s1,a5
    80007d48:	01b99993          	slli	s3,s3,0x1b
    80007d4c:	06f9e063          	bltu	s3,a5,80007dac <kinit+0xa4>
    80007d50:	00005a97          	auipc	s5,0x5
    80007d54:	dc0a8a93          	addi	s5,s5,-576 # 8000cb10 <end>
    80007d58:	0754ec63          	bltu	s1,s5,80007dd0 <kinit+0xc8>
    80007d5c:	0734fa63          	bgeu	s1,s3,80007dd0 <kinit+0xc8>
    80007d60:	00088a37          	lui	s4,0x88
    80007d64:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007d68:	00004917          	auipc	s2,0x4
    80007d6c:	a8890913          	addi	s2,s2,-1400 # 8000b7f0 <kmem>
    80007d70:	00ca1a13          	slli	s4,s4,0xc
    80007d74:	0140006f          	j	80007d88 <kinit+0x80>
    80007d78:	000017b7          	lui	a5,0x1
    80007d7c:	00f484b3          	add	s1,s1,a5
    80007d80:	0554e863          	bltu	s1,s5,80007dd0 <kinit+0xc8>
    80007d84:	0534f663          	bgeu	s1,s3,80007dd0 <kinit+0xc8>
    80007d88:	00001637          	lui	a2,0x1
    80007d8c:	00100593          	li	a1,1
    80007d90:	00048513          	mv	a0,s1
    80007d94:	00000097          	auipc	ra,0x0
    80007d98:	5e4080e7          	jalr	1508(ra) # 80008378 <__memset>
    80007d9c:	00093783          	ld	a5,0(s2)
    80007da0:	00f4b023          	sd	a5,0(s1)
    80007da4:	00993023          	sd	s1,0(s2)
    80007da8:	fd4498e3          	bne	s1,s4,80007d78 <kinit+0x70>
    80007dac:	03813083          	ld	ra,56(sp)
    80007db0:	03013403          	ld	s0,48(sp)
    80007db4:	02813483          	ld	s1,40(sp)
    80007db8:	02013903          	ld	s2,32(sp)
    80007dbc:	01813983          	ld	s3,24(sp)
    80007dc0:	01013a03          	ld	s4,16(sp)
    80007dc4:	00813a83          	ld	s5,8(sp)
    80007dc8:	04010113          	addi	sp,sp,64
    80007dcc:	00008067          	ret
    80007dd0:	00002517          	auipc	a0,0x2
    80007dd4:	89850513          	addi	a0,a0,-1896 # 80009668 <digits+0x18>
    80007dd8:	fffff097          	auipc	ra,0xfffff
    80007ddc:	4b4080e7          	jalr	1204(ra) # 8000728c <panic>

0000000080007de0 <freerange>:
    80007de0:	fc010113          	addi	sp,sp,-64
    80007de4:	000017b7          	lui	a5,0x1
    80007de8:	02913423          	sd	s1,40(sp)
    80007dec:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007df0:	009504b3          	add	s1,a0,s1
    80007df4:	fffff537          	lui	a0,0xfffff
    80007df8:	02813823          	sd	s0,48(sp)
    80007dfc:	02113c23          	sd	ra,56(sp)
    80007e00:	03213023          	sd	s2,32(sp)
    80007e04:	01313c23          	sd	s3,24(sp)
    80007e08:	01413823          	sd	s4,16(sp)
    80007e0c:	01513423          	sd	s5,8(sp)
    80007e10:	01613023          	sd	s6,0(sp)
    80007e14:	04010413          	addi	s0,sp,64
    80007e18:	00a4f4b3          	and	s1,s1,a0
    80007e1c:	00f487b3          	add	a5,s1,a5
    80007e20:	06f5e463          	bltu	a1,a5,80007e88 <freerange+0xa8>
    80007e24:	00005a97          	auipc	s5,0x5
    80007e28:	ceca8a93          	addi	s5,s5,-788 # 8000cb10 <end>
    80007e2c:	0954e263          	bltu	s1,s5,80007eb0 <freerange+0xd0>
    80007e30:	01100993          	li	s3,17
    80007e34:	01b99993          	slli	s3,s3,0x1b
    80007e38:	0734fc63          	bgeu	s1,s3,80007eb0 <freerange+0xd0>
    80007e3c:	00058a13          	mv	s4,a1
    80007e40:	00004917          	auipc	s2,0x4
    80007e44:	9b090913          	addi	s2,s2,-1616 # 8000b7f0 <kmem>
    80007e48:	00002b37          	lui	s6,0x2
    80007e4c:	0140006f          	j	80007e60 <freerange+0x80>
    80007e50:	000017b7          	lui	a5,0x1
    80007e54:	00f484b3          	add	s1,s1,a5
    80007e58:	0554ec63          	bltu	s1,s5,80007eb0 <freerange+0xd0>
    80007e5c:	0534fa63          	bgeu	s1,s3,80007eb0 <freerange+0xd0>
    80007e60:	00001637          	lui	a2,0x1
    80007e64:	00100593          	li	a1,1
    80007e68:	00048513          	mv	a0,s1
    80007e6c:	00000097          	auipc	ra,0x0
    80007e70:	50c080e7          	jalr	1292(ra) # 80008378 <__memset>
    80007e74:	00093703          	ld	a4,0(s2)
    80007e78:	016487b3          	add	a5,s1,s6
    80007e7c:	00e4b023          	sd	a4,0(s1)
    80007e80:	00993023          	sd	s1,0(s2)
    80007e84:	fcfa76e3          	bgeu	s4,a5,80007e50 <freerange+0x70>
    80007e88:	03813083          	ld	ra,56(sp)
    80007e8c:	03013403          	ld	s0,48(sp)
    80007e90:	02813483          	ld	s1,40(sp)
    80007e94:	02013903          	ld	s2,32(sp)
    80007e98:	01813983          	ld	s3,24(sp)
    80007e9c:	01013a03          	ld	s4,16(sp)
    80007ea0:	00813a83          	ld	s5,8(sp)
    80007ea4:	00013b03          	ld	s6,0(sp)
    80007ea8:	04010113          	addi	sp,sp,64
    80007eac:	00008067          	ret
    80007eb0:	00001517          	auipc	a0,0x1
    80007eb4:	7b850513          	addi	a0,a0,1976 # 80009668 <digits+0x18>
    80007eb8:	fffff097          	auipc	ra,0xfffff
    80007ebc:	3d4080e7          	jalr	980(ra) # 8000728c <panic>

0000000080007ec0 <kfree>:
    80007ec0:	fe010113          	addi	sp,sp,-32
    80007ec4:	00813823          	sd	s0,16(sp)
    80007ec8:	00113c23          	sd	ra,24(sp)
    80007ecc:	00913423          	sd	s1,8(sp)
    80007ed0:	02010413          	addi	s0,sp,32
    80007ed4:	03451793          	slli	a5,a0,0x34
    80007ed8:	04079c63          	bnez	a5,80007f30 <kfree+0x70>
    80007edc:	00005797          	auipc	a5,0x5
    80007ee0:	c3478793          	addi	a5,a5,-972 # 8000cb10 <end>
    80007ee4:	00050493          	mv	s1,a0
    80007ee8:	04f56463          	bltu	a0,a5,80007f30 <kfree+0x70>
    80007eec:	01100793          	li	a5,17
    80007ef0:	01b79793          	slli	a5,a5,0x1b
    80007ef4:	02f57e63          	bgeu	a0,a5,80007f30 <kfree+0x70>
    80007ef8:	00001637          	lui	a2,0x1
    80007efc:	00100593          	li	a1,1
    80007f00:	00000097          	auipc	ra,0x0
    80007f04:	478080e7          	jalr	1144(ra) # 80008378 <__memset>
    80007f08:	00004797          	auipc	a5,0x4
    80007f0c:	8e878793          	addi	a5,a5,-1816 # 8000b7f0 <kmem>
    80007f10:	0007b703          	ld	a4,0(a5)
    80007f14:	01813083          	ld	ra,24(sp)
    80007f18:	01013403          	ld	s0,16(sp)
    80007f1c:	00e4b023          	sd	a4,0(s1)
    80007f20:	0097b023          	sd	s1,0(a5)
    80007f24:	00813483          	ld	s1,8(sp)
    80007f28:	02010113          	addi	sp,sp,32
    80007f2c:	00008067          	ret
    80007f30:	00001517          	auipc	a0,0x1
    80007f34:	73850513          	addi	a0,a0,1848 # 80009668 <digits+0x18>
    80007f38:	fffff097          	auipc	ra,0xfffff
    80007f3c:	354080e7          	jalr	852(ra) # 8000728c <panic>

0000000080007f40 <kalloc>:
    80007f40:	fe010113          	addi	sp,sp,-32
    80007f44:	00813823          	sd	s0,16(sp)
    80007f48:	00913423          	sd	s1,8(sp)
    80007f4c:	00113c23          	sd	ra,24(sp)
    80007f50:	02010413          	addi	s0,sp,32
    80007f54:	00004797          	auipc	a5,0x4
    80007f58:	89c78793          	addi	a5,a5,-1892 # 8000b7f0 <kmem>
    80007f5c:	0007b483          	ld	s1,0(a5)
    80007f60:	02048063          	beqz	s1,80007f80 <kalloc+0x40>
    80007f64:	0004b703          	ld	a4,0(s1)
    80007f68:	00001637          	lui	a2,0x1
    80007f6c:	00500593          	li	a1,5
    80007f70:	00048513          	mv	a0,s1
    80007f74:	00e7b023          	sd	a4,0(a5)
    80007f78:	00000097          	auipc	ra,0x0
    80007f7c:	400080e7          	jalr	1024(ra) # 80008378 <__memset>
    80007f80:	01813083          	ld	ra,24(sp)
    80007f84:	01013403          	ld	s0,16(sp)
    80007f88:	00048513          	mv	a0,s1
    80007f8c:	00813483          	ld	s1,8(sp)
    80007f90:	02010113          	addi	sp,sp,32
    80007f94:	00008067          	ret

0000000080007f98 <initlock>:
    80007f98:	ff010113          	addi	sp,sp,-16
    80007f9c:	00813423          	sd	s0,8(sp)
    80007fa0:	01010413          	addi	s0,sp,16
    80007fa4:	00813403          	ld	s0,8(sp)
    80007fa8:	00b53423          	sd	a1,8(a0)
    80007fac:	00052023          	sw	zero,0(a0)
    80007fb0:	00053823          	sd	zero,16(a0)
    80007fb4:	01010113          	addi	sp,sp,16
    80007fb8:	00008067          	ret

0000000080007fbc <acquire>:
    80007fbc:	fe010113          	addi	sp,sp,-32
    80007fc0:	00813823          	sd	s0,16(sp)
    80007fc4:	00913423          	sd	s1,8(sp)
    80007fc8:	00113c23          	sd	ra,24(sp)
    80007fcc:	01213023          	sd	s2,0(sp)
    80007fd0:	02010413          	addi	s0,sp,32
    80007fd4:	00050493          	mv	s1,a0
    80007fd8:	10002973          	csrr	s2,sstatus
    80007fdc:	100027f3          	csrr	a5,sstatus
    80007fe0:	ffd7f793          	andi	a5,a5,-3
    80007fe4:	10079073          	csrw	sstatus,a5
    80007fe8:	fffff097          	auipc	ra,0xfffff
    80007fec:	8ec080e7          	jalr	-1812(ra) # 800068d4 <mycpu>
    80007ff0:	07852783          	lw	a5,120(a0)
    80007ff4:	06078e63          	beqz	a5,80008070 <acquire+0xb4>
    80007ff8:	fffff097          	auipc	ra,0xfffff
    80007ffc:	8dc080e7          	jalr	-1828(ra) # 800068d4 <mycpu>
    80008000:	07852783          	lw	a5,120(a0)
    80008004:	0004a703          	lw	a4,0(s1)
    80008008:	0017879b          	addiw	a5,a5,1
    8000800c:	06f52c23          	sw	a5,120(a0)
    80008010:	04071063          	bnez	a4,80008050 <acquire+0x94>
    80008014:	00100713          	li	a4,1
    80008018:	00070793          	mv	a5,a4
    8000801c:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80008020:	0007879b          	sext.w	a5,a5
    80008024:	fe079ae3          	bnez	a5,80008018 <acquire+0x5c>
    80008028:	0ff0000f          	fence
    8000802c:	fffff097          	auipc	ra,0xfffff
    80008030:	8a8080e7          	jalr	-1880(ra) # 800068d4 <mycpu>
    80008034:	01813083          	ld	ra,24(sp)
    80008038:	01013403          	ld	s0,16(sp)
    8000803c:	00a4b823          	sd	a0,16(s1)
    80008040:	00013903          	ld	s2,0(sp)
    80008044:	00813483          	ld	s1,8(sp)
    80008048:	02010113          	addi	sp,sp,32
    8000804c:	00008067          	ret
    80008050:	0104b903          	ld	s2,16(s1)
    80008054:	fffff097          	auipc	ra,0xfffff
    80008058:	880080e7          	jalr	-1920(ra) # 800068d4 <mycpu>
    8000805c:	faa91ce3          	bne	s2,a0,80008014 <acquire+0x58>
    80008060:	00001517          	auipc	a0,0x1
    80008064:	61050513          	addi	a0,a0,1552 # 80009670 <digits+0x20>
    80008068:	fffff097          	auipc	ra,0xfffff
    8000806c:	224080e7          	jalr	548(ra) # 8000728c <panic>
    80008070:	00195913          	srli	s2,s2,0x1
    80008074:	fffff097          	auipc	ra,0xfffff
    80008078:	860080e7          	jalr	-1952(ra) # 800068d4 <mycpu>
    8000807c:	00197913          	andi	s2,s2,1
    80008080:	07252e23          	sw	s2,124(a0)
    80008084:	f75ff06f          	j	80007ff8 <acquire+0x3c>

0000000080008088 <release>:
    80008088:	fe010113          	addi	sp,sp,-32
    8000808c:	00813823          	sd	s0,16(sp)
    80008090:	00113c23          	sd	ra,24(sp)
    80008094:	00913423          	sd	s1,8(sp)
    80008098:	01213023          	sd	s2,0(sp)
    8000809c:	02010413          	addi	s0,sp,32
    800080a0:	00052783          	lw	a5,0(a0)
    800080a4:	00079a63          	bnez	a5,800080b8 <release+0x30>
    800080a8:	00001517          	auipc	a0,0x1
    800080ac:	5d050513          	addi	a0,a0,1488 # 80009678 <digits+0x28>
    800080b0:	fffff097          	auipc	ra,0xfffff
    800080b4:	1dc080e7          	jalr	476(ra) # 8000728c <panic>
    800080b8:	01053903          	ld	s2,16(a0)
    800080bc:	00050493          	mv	s1,a0
    800080c0:	fffff097          	auipc	ra,0xfffff
    800080c4:	814080e7          	jalr	-2028(ra) # 800068d4 <mycpu>
    800080c8:	fea910e3          	bne	s2,a0,800080a8 <release+0x20>
    800080cc:	0004b823          	sd	zero,16(s1)
    800080d0:	0ff0000f          	fence
    800080d4:	0f50000f          	fence	iorw,ow
    800080d8:	0804a02f          	amoswap.w	zero,zero,(s1)
    800080dc:	ffffe097          	auipc	ra,0xffffe
    800080e0:	7f8080e7          	jalr	2040(ra) # 800068d4 <mycpu>
    800080e4:	100027f3          	csrr	a5,sstatus
    800080e8:	0027f793          	andi	a5,a5,2
    800080ec:	04079a63          	bnez	a5,80008140 <release+0xb8>
    800080f0:	07852783          	lw	a5,120(a0)
    800080f4:	02f05e63          	blez	a5,80008130 <release+0xa8>
    800080f8:	fff7871b          	addiw	a4,a5,-1
    800080fc:	06e52c23          	sw	a4,120(a0)
    80008100:	00071c63          	bnez	a4,80008118 <release+0x90>
    80008104:	07c52783          	lw	a5,124(a0)
    80008108:	00078863          	beqz	a5,80008118 <release+0x90>
    8000810c:	100027f3          	csrr	a5,sstatus
    80008110:	0027e793          	ori	a5,a5,2
    80008114:	10079073          	csrw	sstatus,a5
    80008118:	01813083          	ld	ra,24(sp)
    8000811c:	01013403          	ld	s0,16(sp)
    80008120:	00813483          	ld	s1,8(sp)
    80008124:	00013903          	ld	s2,0(sp)
    80008128:	02010113          	addi	sp,sp,32
    8000812c:	00008067          	ret
    80008130:	00001517          	auipc	a0,0x1
    80008134:	56850513          	addi	a0,a0,1384 # 80009698 <digits+0x48>
    80008138:	fffff097          	auipc	ra,0xfffff
    8000813c:	154080e7          	jalr	340(ra) # 8000728c <panic>
    80008140:	00001517          	auipc	a0,0x1
    80008144:	54050513          	addi	a0,a0,1344 # 80009680 <digits+0x30>
    80008148:	fffff097          	auipc	ra,0xfffff
    8000814c:	144080e7          	jalr	324(ra) # 8000728c <panic>

0000000080008150 <holding>:
    80008150:	00052783          	lw	a5,0(a0)
    80008154:	00079663          	bnez	a5,80008160 <holding+0x10>
    80008158:	00000513          	li	a0,0
    8000815c:	00008067          	ret
    80008160:	fe010113          	addi	sp,sp,-32
    80008164:	00813823          	sd	s0,16(sp)
    80008168:	00913423          	sd	s1,8(sp)
    8000816c:	00113c23          	sd	ra,24(sp)
    80008170:	02010413          	addi	s0,sp,32
    80008174:	01053483          	ld	s1,16(a0)
    80008178:	ffffe097          	auipc	ra,0xffffe
    8000817c:	75c080e7          	jalr	1884(ra) # 800068d4 <mycpu>
    80008180:	01813083          	ld	ra,24(sp)
    80008184:	01013403          	ld	s0,16(sp)
    80008188:	40a48533          	sub	a0,s1,a0
    8000818c:	00153513          	seqz	a0,a0
    80008190:	00813483          	ld	s1,8(sp)
    80008194:	02010113          	addi	sp,sp,32
    80008198:	00008067          	ret

000000008000819c <push_off>:
    8000819c:	fe010113          	addi	sp,sp,-32
    800081a0:	00813823          	sd	s0,16(sp)
    800081a4:	00113c23          	sd	ra,24(sp)
    800081a8:	00913423          	sd	s1,8(sp)
    800081ac:	02010413          	addi	s0,sp,32
    800081b0:	100024f3          	csrr	s1,sstatus
    800081b4:	100027f3          	csrr	a5,sstatus
    800081b8:	ffd7f793          	andi	a5,a5,-3
    800081bc:	10079073          	csrw	sstatus,a5
    800081c0:	ffffe097          	auipc	ra,0xffffe
    800081c4:	714080e7          	jalr	1812(ra) # 800068d4 <mycpu>
    800081c8:	07852783          	lw	a5,120(a0)
    800081cc:	02078663          	beqz	a5,800081f8 <push_off+0x5c>
    800081d0:	ffffe097          	auipc	ra,0xffffe
    800081d4:	704080e7          	jalr	1796(ra) # 800068d4 <mycpu>
    800081d8:	07852783          	lw	a5,120(a0)
    800081dc:	01813083          	ld	ra,24(sp)
    800081e0:	01013403          	ld	s0,16(sp)
    800081e4:	0017879b          	addiw	a5,a5,1
    800081e8:	06f52c23          	sw	a5,120(a0)
    800081ec:	00813483          	ld	s1,8(sp)
    800081f0:	02010113          	addi	sp,sp,32
    800081f4:	00008067          	ret
    800081f8:	0014d493          	srli	s1,s1,0x1
    800081fc:	ffffe097          	auipc	ra,0xffffe
    80008200:	6d8080e7          	jalr	1752(ra) # 800068d4 <mycpu>
    80008204:	0014f493          	andi	s1,s1,1
    80008208:	06952e23          	sw	s1,124(a0)
    8000820c:	fc5ff06f          	j	800081d0 <push_off+0x34>

0000000080008210 <pop_off>:
    80008210:	ff010113          	addi	sp,sp,-16
    80008214:	00813023          	sd	s0,0(sp)
    80008218:	00113423          	sd	ra,8(sp)
    8000821c:	01010413          	addi	s0,sp,16
    80008220:	ffffe097          	auipc	ra,0xffffe
    80008224:	6b4080e7          	jalr	1716(ra) # 800068d4 <mycpu>
    80008228:	100027f3          	csrr	a5,sstatus
    8000822c:	0027f793          	andi	a5,a5,2
    80008230:	04079663          	bnez	a5,8000827c <pop_off+0x6c>
    80008234:	07852783          	lw	a5,120(a0)
    80008238:	02f05a63          	blez	a5,8000826c <pop_off+0x5c>
    8000823c:	fff7871b          	addiw	a4,a5,-1
    80008240:	06e52c23          	sw	a4,120(a0)
    80008244:	00071c63          	bnez	a4,8000825c <pop_off+0x4c>
    80008248:	07c52783          	lw	a5,124(a0)
    8000824c:	00078863          	beqz	a5,8000825c <pop_off+0x4c>
    80008250:	100027f3          	csrr	a5,sstatus
    80008254:	0027e793          	ori	a5,a5,2
    80008258:	10079073          	csrw	sstatus,a5
    8000825c:	00813083          	ld	ra,8(sp)
    80008260:	00013403          	ld	s0,0(sp)
    80008264:	01010113          	addi	sp,sp,16
    80008268:	00008067          	ret
    8000826c:	00001517          	auipc	a0,0x1
    80008270:	42c50513          	addi	a0,a0,1068 # 80009698 <digits+0x48>
    80008274:	fffff097          	auipc	ra,0xfffff
    80008278:	018080e7          	jalr	24(ra) # 8000728c <panic>
    8000827c:	00001517          	auipc	a0,0x1
    80008280:	40450513          	addi	a0,a0,1028 # 80009680 <digits+0x30>
    80008284:	fffff097          	auipc	ra,0xfffff
    80008288:	008080e7          	jalr	8(ra) # 8000728c <panic>

000000008000828c <push_on>:
    8000828c:	fe010113          	addi	sp,sp,-32
    80008290:	00813823          	sd	s0,16(sp)
    80008294:	00113c23          	sd	ra,24(sp)
    80008298:	00913423          	sd	s1,8(sp)
    8000829c:	02010413          	addi	s0,sp,32
    800082a0:	100024f3          	csrr	s1,sstatus
    800082a4:	100027f3          	csrr	a5,sstatus
    800082a8:	0027e793          	ori	a5,a5,2
    800082ac:	10079073          	csrw	sstatus,a5
    800082b0:	ffffe097          	auipc	ra,0xffffe
    800082b4:	624080e7          	jalr	1572(ra) # 800068d4 <mycpu>
    800082b8:	07852783          	lw	a5,120(a0)
    800082bc:	02078663          	beqz	a5,800082e8 <push_on+0x5c>
    800082c0:	ffffe097          	auipc	ra,0xffffe
    800082c4:	614080e7          	jalr	1556(ra) # 800068d4 <mycpu>
    800082c8:	07852783          	lw	a5,120(a0)
    800082cc:	01813083          	ld	ra,24(sp)
    800082d0:	01013403          	ld	s0,16(sp)
    800082d4:	0017879b          	addiw	a5,a5,1
    800082d8:	06f52c23          	sw	a5,120(a0)
    800082dc:	00813483          	ld	s1,8(sp)
    800082e0:	02010113          	addi	sp,sp,32
    800082e4:	00008067          	ret
    800082e8:	0014d493          	srli	s1,s1,0x1
    800082ec:	ffffe097          	auipc	ra,0xffffe
    800082f0:	5e8080e7          	jalr	1512(ra) # 800068d4 <mycpu>
    800082f4:	0014f493          	andi	s1,s1,1
    800082f8:	06952e23          	sw	s1,124(a0)
    800082fc:	fc5ff06f          	j	800082c0 <push_on+0x34>

0000000080008300 <pop_on>:
    80008300:	ff010113          	addi	sp,sp,-16
    80008304:	00813023          	sd	s0,0(sp)
    80008308:	00113423          	sd	ra,8(sp)
    8000830c:	01010413          	addi	s0,sp,16
    80008310:	ffffe097          	auipc	ra,0xffffe
    80008314:	5c4080e7          	jalr	1476(ra) # 800068d4 <mycpu>
    80008318:	100027f3          	csrr	a5,sstatus
    8000831c:	0027f793          	andi	a5,a5,2
    80008320:	04078463          	beqz	a5,80008368 <pop_on+0x68>
    80008324:	07852783          	lw	a5,120(a0)
    80008328:	02f05863          	blez	a5,80008358 <pop_on+0x58>
    8000832c:	fff7879b          	addiw	a5,a5,-1
    80008330:	06f52c23          	sw	a5,120(a0)
    80008334:	07853783          	ld	a5,120(a0)
    80008338:	00079863          	bnez	a5,80008348 <pop_on+0x48>
    8000833c:	100027f3          	csrr	a5,sstatus
    80008340:	ffd7f793          	andi	a5,a5,-3
    80008344:	10079073          	csrw	sstatus,a5
    80008348:	00813083          	ld	ra,8(sp)
    8000834c:	00013403          	ld	s0,0(sp)
    80008350:	01010113          	addi	sp,sp,16
    80008354:	00008067          	ret
    80008358:	00001517          	auipc	a0,0x1
    8000835c:	36850513          	addi	a0,a0,872 # 800096c0 <digits+0x70>
    80008360:	fffff097          	auipc	ra,0xfffff
    80008364:	f2c080e7          	jalr	-212(ra) # 8000728c <panic>
    80008368:	00001517          	auipc	a0,0x1
    8000836c:	33850513          	addi	a0,a0,824 # 800096a0 <digits+0x50>
    80008370:	fffff097          	auipc	ra,0xfffff
    80008374:	f1c080e7          	jalr	-228(ra) # 8000728c <panic>

0000000080008378 <__memset>:
    80008378:	ff010113          	addi	sp,sp,-16
    8000837c:	00813423          	sd	s0,8(sp)
    80008380:	01010413          	addi	s0,sp,16
    80008384:	1a060e63          	beqz	a2,80008540 <__memset+0x1c8>
    80008388:	40a007b3          	neg	a5,a0
    8000838c:	0077f793          	andi	a5,a5,7
    80008390:	00778693          	addi	a3,a5,7
    80008394:	00b00813          	li	a6,11
    80008398:	0ff5f593          	andi	a1,a1,255
    8000839c:	fff6071b          	addiw	a4,a2,-1
    800083a0:	1b06e663          	bltu	a3,a6,8000854c <__memset+0x1d4>
    800083a4:	1cd76463          	bltu	a4,a3,8000856c <__memset+0x1f4>
    800083a8:	1a078e63          	beqz	a5,80008564 <__memset+0x1ec>
    800083ac:	00b50023          	sb	a1,0(a0)
    800083b0:	00100713          	li	a4,1
    800083b4:	1ae78463          	beq	a5,a4,8000855c <__memset+0x1e4>
    800083b8:	00b500a3          	sb	a1,1(a0)
    800083bc:	00200713          	li	a4,2
    800083c0:	1ae78a63          	beq	a5,a4,80008574 <__memset+0x1fc>
    800083c4:	00b50123          	sb	a1,2(a0)
    800083c8:	00300713          	li	a4,3
    800083cc:	18e78463          	beq	a5,a4,80008554 <__memset+0x1dc>
    800083d0:	00b501a3          	sb	a1,3(a0)
    800083d4:	00400713          	li	a4,4
    800083d8:	1ae78263          	beq	a5,a4,8000857c <__memset+0x204>
    800083dc:	00b50223          	sb	a1,4(a0)
    800083e0:	00500713          	li	a4,5
    800083e4:	1ae78063          	beq	a5,a4,80008584 <__memset+0x20c>
    800083e8:	00b502a3          	sb	a1,5(a0)
    800083ec:	00700713          	li	a4,7
    800083f0:	18e79e63          	bne	a5,a4,8000858c <__memset+0x214>
    800083f4:	00b50323          	sb	a1,6(a0)
    800083f8:	00700e93          	li	t4,7
    800083fc:	00859713          	slli	a4,a1,0x8
    80008400:	00e5e733          	or	a4,a1,a4
    80008404:	01059e13          	slli	t3,a1,0x10
    80008408:	01c76e33          	or	t3,a4,t3
    8000840c:	01859313          	slli	t1,a1,0x18
    80008410:	006e6333          	or	t1,t3,t1
    80008414:	02059893          	slli	a7,a1,0x20
    80008418:	40f60e3b          	subw	t3,a2,a5
    8000841c:	011368b3          	or	a7,t1,a7
    80008420:	02859813          	slli	a6,a1,0x28
    80008424:	0108e833          	or	a6,a7,a6
    80008428:	03059693          	slli	a3,a1,0x30
    8000842c:	003e589b          	srliw	a7,t3,0x3
    80008430:	00d866b3          	or	a3,a6,a3
    80008434:	03859713          	slli	a4,a1,0x38
    80008438:	00389813          	slli	a6,a7,0x3
    8000843c:	00f507b3          	add	a5,a0,a5
    80008440:	00e6e733          	or	a4,a3,a4
    80008444:	000e089b          	sext.w	a7,t3
    80008448:	00f806b3          	add	a3,a6,a5
    8000844c:	00e7b023          	sd	a4,0(a5)
    80008450:	00878793          	addi	a5,a5,8
    80008454:	fed79ce3          	bne	a5,a3,8000844c <__memset+0xd4>
    80008458:	ff8e7793          	andi	a5,t3,-8
    8000845c:	0007871b          	sext.w	a4,a5
    80008460:	01d787bb          	addw	a5,a5,t4
    80008464:	0ce88e63          	beq	a7,a4,80008540 <__memset+0x1c8>
    80008468:	00f50733          	add	a4,a0,a5
    8000846c:	00b70023          	sb	a1,0(a4)
    80008470:	0017871b          	addiw	a4,a5,1
    80008474:	0cc77663          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    80008478:	00e50733          	add	a4,a0,a4
    8000847c:	00b70023          	sb	a1,0(a4)
    80008480:	0027871b          	addiw	a4,a5,2
    80008484:	0ac77e63          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    80008488:	00e50733          	add	a4,a0,a4
    8000848c:	00b70023          	sb	a1,0(a4)
    80008490:	0037871b          	addiw	a4,a5,3
    80008494:	0ac77663          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    80008498:	00e50733          	add	a4,a0,a4
    8000849c:	00b70023          	sb	a1,0(a4)
    800084a0:	0047871b          	addiw	a4,a5,4
    800084a4:	08c77e63          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    800084a8:	00e50733          	add	a4,a0,a4
    800084ac:	00b70023          	sb	a1,0(a4)
    800084b0:	0057871b          	addiw	a4,a5,5
    800084b4:	08c77663          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    800084b8:	00e50733          	add	a4,a0,a4
    800084bc:	00b70023          	sb	a1,0(a4)
    800084c0:	0067871b          	addiw	a4,a5,6
    800084c4:	06c77e63          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    800084c8:	00e50733          	add	a4,a0,a4
    800084cc:	00b70023          	sb	a1,0(a4)
    800084d0:	0077871b          	addiw	a4,a5,7
    800084d4:	06c77663          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    800084d8:	00e50733          	add	a4,a0,a4
    800084dc:	00b70023          	sb	a1,0(a4)
    800084e0:	0087871b          	addiw	a4,a5,8
    800084e4:	04c77e63          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    800084e8:	00e50733          	add	a4,a0,a4
    800084ec:	00b70023          	sb	a1,0(a4)
    800084f0:	0097871b          	addiw	a4,a5,9
    800084f4:	04c77663          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    800084f8:	00e50733          	add	a4,a0,a4
    800084fc:	00b70023          	sb	a1,0(a4)
    80008500:	00a7871b          	addiw	a4,a5,10
    80008504:	02c77e63          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    80008508:	00e50733          	add	a4,a0,a4
    8000850c:	00b70023          	sb	a1,0(a4)
    80008510:	00b7871b          	addiw	a4,a5,11
    80008514:	02c77663          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    80008518:	00e50733          	add	a4,a0,a4
    8000851c:	00b70023          	sb	a1,0(a4)
    80008520:	00c7871b          	addiw	a4,a5,12
    80008524:	00c77e63          	bgeu	a4,a2,80008540 <__memset+0x1c8>
    80008528:	00e50733          	add	a4,a0,a4
    8000852c:	00b70023          	sb	a1,0(a4)
    80008530:	00d7879b          	addiw	a5,a5,13
    80008534:	00c7f663          	bgeu	a5,a2,80008540 <__memset+0x1c8>
    80008538:	00f507b3          	add	a5,a0,a5
    8000853c:	00b78023          	sb	a1,0(a5)
    80008540:	00813403          	ld	s0,8(sp)
    80008544:	01010113          	addi	sp,sp,16
    80008548:	00008067          	ret
    8000854c:	00b00693          	li	a3,11
    80008550:	e55ff06f          	j	800083a4 <__memset+0x2c>
    80008554:	00300e93          	li	t4,3
    80008558:	ea5ff06f          	j	800083fc <__memset+0x84>
    8000855c:	00100e93          	li	t4,1
    80008560:	e9dff06f          	j	800083fc <__memset+0x84>
    80008564:	00000e93          	li	t4,0
    80008568:	e95ff06f          	j	800083fc <__memset+0x84>
    8000856c:	00000793          	li	a5,0
    80008570:	ef9ff06f          	j	80008468 <__memset+0xf0>
    80008574:	00200e93          	li	t4,2
    80008578:	e85ff06f          	j	800083fc <__memset+0x84>
    8000857c:	00400e93          	li	t4,4
    80008580:	e7dff06f          	j	800083fc <__memset+0x84>
    80008584:	00500e93          	li	t4,5
    80008588:	e75ff06f          	j	800083fc <__memset+0x84>
    8000858c:	00600e93          	li	t4,6
    80008590:	e6dff06f          	j	800083fc <__memset+0x84>

0000000080008594 <__memmove>:
    80008594:	ff010113          	addi	sp,sp,-16
    80008598:	00813423          	sd	s0,8(sp)
    8000859c:	01010413          	addi	s0,sp,16
    800085a0:	0e060863          	beqz	a2,80008690 <__memmove+0xfc>
    800085a4:	fff6069b          	addiw	a3,a2,-1
    800085a8:	0006881b          	sext.w	a6,a3
    800085ac:	0ea5e863          	bltu	a1,a0,8000869c <__memmove+0x108>
    800085b0:	00758713          	addi	a4,a1,7
    800085b4:	00a5e7b3          	or	a5,a1,a0
    800085b8:	40a70733          	sub	a4,a4,a0
    800085bc:	0077f793          	andi	a5,a5,7
    800085c0:	00f73713          	sltiu	a4,a4,15
    800085c4:	00174713          	xori	a4,a4,1
    800085c8:	0017b793          	seqz	a5,a5
    800085cc:	00e7f7b3          	and	a5,a5,a4
    800085d0:	10078863          	beqz	a5,800086e0 <__memmove+0x14c>
    800085d4:	00900793          	li	a5,9
    800085d8:	1107f463          	bgeu	a5,a6,800086e0 <__memmove+0x14c>
    800085dc:	0036581b          	srliw	a6,a2,0x3
    800085e0:	fff8081b          	addiw	a6,a6,-1
    800085e4:	02081813          	slli	a6,a6,0x20
    800085e8:	01d85893          	srli	a7,a6,0x1d
    800085ec:	00858813          	addi	a6,a1,8
    800085f0:	00058793          	mv	a5,a1
    800085f4:	00050713          	mv	a4,a0
    800085f8:	01088833          	add	a6,a7,a6
    800085fc:	0007b883          	ld	a7,0(a5)
    80008600:	00878793          	addi	a5,a5,8
    80008604:	00870713          	addi	a4,a4,8
    80008608:	ff173c23          	sd	a7,-8(a4)
    8000860c:	ff0798e3          	bne	a5,a6,800085fc <__memmove+0x68>
    80008610:	ff867713          	andi	a4,a2,-8
    80008614:	02071793          	slli	a5,a4,0x20
    80008618:	0207d793          	srli	a5,a5,0x20
    8000861c:	00f585b3          	add	a1,a1,a5
    80008620:	40e686bb          	subw	a3,a3,a4
    80008624:	00f507b3          	add	a5,a0,a5
    80008628:	06e60463          	beq	a2,a4,80008690 <__memmove+0xfc>
    8000862c:	0005c703          	lbu	a4,0(a1)
    80008630:	00e78023          	sb	a4,0(a5)
    80008634:	04068e63          	beqz	a3,80008690 <__memmove+0xfc>
    80008638:	0015c603          	lbu	a2,1(a1)
    8000863c:	00100713          	li	a4,1
    80008640:	00c780a3          	sb	a2,1(a5)
    80008644:	04e68663          	beq	a3,a4,80008690 <__memmove+0xfc>
    80008648:	0025c603          	lbu	a2,2(a1)
    8000864c:	00200713          	li	a4,2
    80008650:	00c78123          	sb	a2,2(a5)
    80008654:	02e68e63          	beq	a3,a4,80008690 <__memmove+0xfc>
    80008658:	0035c603          	lbu	a2,3(a1)
    8000865c:	00300713          	li	a4,3
    80008660:	00c781a3          	sb	a2,3(a5)
    80008664:	02e68663          	beq	a3,a4,80008690 <__memmove+0xfc>
    80008668:	0045c603          	lbu	a2,4(a1)
    8000866c:	00400713          	li	a4,4
    80008670:	00c78223          	sb	a2,4(a5)
    80008674:	00e68e63          	beq	a3,a4,80008690 <__memmove+0xfc>
    80008678:	0055c603          	lbu	a2,5(a1)
    8000867c:	00500713          	li	a4,5
    80008680:	00c782a3          	sb	a2,5(a5)
    80008684:	00e68663          	beq	a3,a4,80008690 <__memmove+0xfc>
    80008688:	0065c703          	lbu	a4,6(a1)
    8000868c:	00e78323          	sb	a4,6(a5)
    80008690:	00813403          	ld	s0,8(sp)
    80008694:	01010113          	addi	sp,sp,16
    80008698:	00008067          	ret
    8000869c:	02061713          	slli	a4,a2,0x20
    800086a0:	02075713          	srli	a4,a4,0x20
    800086a4:	00e587b3          	add	a5,a1,a4
    800086a8:	f0f574e3          	bgeu	a0,a5,800085b0 <__memmove+0x1c>
    800086ac:	02069613          	slli	a2,a3,0x20
    800086b0:	02065613          	srli	a2,a2,0x20
    800086b4:	fff64613          	not	a2,a2
    800086b8:	00e50733          	add	a4,a0,a4
    800086bc:	00c78633          	add	a2,a5,a2
    800086c0:	fff7c683          	lbu	a3,-1(a5)
    800086c4:	fff78793          	addi	a5,a5,-1
    800086c8:	fff70713          	addi	a4,a4,-1
    800086cc:	00d70023          	sb	a3,0(a4)
    800086d0:	fec798e3          	bne	a5,a2,800086c0 <__memmove+0x12c>
    800086d4:	00813403          	ld	s0,8(sp)
    800086d8:	01010113          	addi	sp,sp,16
    800086dc:	00008067          	ret
    800086e0:	02069713          	slli	a4,a3,0x20
    800086e4:	02075713          	srli	a4,a4,0x20
    800086e8:	00170713          	addi	a4,a4,1
    800086ec:	00e50733          	add	a4,a0,a4
    800086f0:	00050793          	mv	a5,a0
    800086f4:	0005c683          	lbu	a3,0(a1)
    800086f8:	00178793          	addi	a5,a5,1
    800086fc:	00158593          	addi	a1,a1,1
    80008700:	fed78fa3          	sb	a3,-1(a5)
    80008704:	fee798e3          	bne	a5,a4,800086f4 <__memmove+0x160>
    80008708:	f89ff06f          	j	80008690 <__memmove+0xfc>

000000008000870c <__putc>:
    8000870c:	fe010113          	addi	sp,sp,-32
    80008710:	00813823          	sd	s0,16(sp)
    80008714:	00113c23          	sd	ra,24(sp)
    80008718:	02010413          	addi	s0,sp,32
    8000871c:	00050793          	mv	a5,a0
    80008720:	fef40593          	addi	a1,s0,-17
    80008724:	00100613          	li	a2,1
    80008728:	00000513          	li	a0,0
    8000872c:	fef407a3          	sb	a5,-17(s0)
    80008730:	fffff097          	auipc	ra,0xfffff
    80008734:	b3c080e7          	jalr	-1220(ra) # 8000726c <console_write>
    80008738:	01813083          	ld	ra,24(sp)
    8000873c:	01013403          	ld	s0,16(sp)
    80008740:	02010113          	addi	sp,sp,32
    80008744:	00008067          	ret

0000000080008748 <__getc>:
    80008748:	fe010113          	addi	sp,sp,-32
    8000874c:	00813823          	sd	s0,16(sp)
    80008750:	00113c23          	sd	ra,24(sp)
    80008754:	02010413          	addi	s0,sp,32
    80008758:	fe840593          	addi	a1,s0,-24
    8000875c:	00100613          	li	a2,1
    80008760:	00000513          	li	a0,0
    80008764:	fffff097          	auipc	ra,0xfffff
    80008768:	ae8080e7          	jalr	-1304(ra) # 8000724c <console_read>
    8000876c:	fe844503          	lbu	a0,-24(s0)
    80008770:	01813083          	ld	ra,24(sp)
    80008774:	01013403          	ld	s0,16(sp)
    80008778:	02010113          	addi	sp,sp,32
    8000877c:	00008067          	ret

0000000080008780 <console_handler>:
    80008780:	fe010113          	addi	sp,sp,-32
    80008784:	00813823          	sd	s0,16(sp)
    80008788:	00113c23          	sd	ra,24(sp)
    8000878c:	00913423          	sd	s1,8(sp)
    80008790:	02010413          	addi	s0,sp,32
    80008794:	14202773          	csrr	a4,scause
    80008798:	100027f3          	csrr	a5,sstatus
    8000879c:	0027f793          	andi	a5,a5,2
    800087a0:	06079e63          	bnez	a5,8000881c <console_handler+0x9c>
    800087a4:	00074c63          	bltz	a4,800087bc <console_handler+0x3c>
    800087a8:	01813083          	ld	ra,24(sp)
    800087ac:	01013403          	ld	s0,16(sp)
    800087b0:	00813483          	ld	s1,8(sp)
    800087b4:	02010113          	addi	sp,sp,32
    800087b8:	00008067          	ret
    800087bc:	0ff77713          	andi	a4,a4,255
    800087c0:	00900793          	li	a5,9
    800087c4:	fef712e3          	bne	a4,a5,800087a8 <console_handler+0x28>
    800087c8:	ffffe097          	auipc	ra,0xffffe
    800087cc:	6dc080e7          	jalr	1756(ra) # 80006ea4 <plic_claim>
    800087d0:	00a00793          	li	a5,10
    800087d4:	00050493          	mv	s1,a0
    800087d8:	02f50c63          	beq	a0,a5,80008810 <console_handler+0x90>
    800087dc:	fc0506e3          	beqz	a0,800087a8 <console_handler+0x28>
    800087e0:	00050593          	mv	a1,a0
    800087e4:	00001517          	auipc	a0,0x1
    800087e8:	de450513          	addi	a0,a0,-540 # 800095c8 <CONSOLE_STATUS+0x5b8>
    800087ec:	fffff097          	auipc	ra,0xfffff
    800087f0:	afc080e7          	jalr	-1284(ra) # 800072e8 <__printf>
    800087f4:	01013403          	ld	s0,16(sp)
    800087f8:	01813083          	ld	ra,24(sp)
    800087fc:	00048513          	mv	a0,s1
    80008800:	00813483          	ld	s1,8(sp)
    80008804:	02010113          	addi	sp,sp,32
    80008808:	ffffe317          	auipc	t1,0xffffe
    8000880c:	6d430067          	jr	1748(t1) # 80006edc <plic_complete>
    80008810:	fffff097          	auipc	ra,0xfffff
    80008814:	3e0080e7          	jalr	992(ra) # 80007bf0 <uartintr>
    80008818:	fddff06f          	j	800087f4 <console_handler+0x74>
    8000881c:	00001517          	auipc	a0,0x1
    80008820:	eac50513          	addi	a0,a0,-340 # 800096c8 <digits+0x78>
    80008824:	fffff097          	auipc	ra,0xfffff
    80008828:	a68080e7          	jalr	-1432(ra) # 8000728c <panic>
	...
