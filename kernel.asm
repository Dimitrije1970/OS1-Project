
kernel:     file format elf64-littleriscv


Disassembly of section .text:

0000000080000000 <_entry>:
    80000000:	0000b117          	auipc	sp,0xb
    80000004:	5d013103          	ld	sp,1488(sp) # 8000b5d0 <_GLOBAL_OFFSET_TABLE_+0x8>
    80000008:	00001537          	lui	a0,0x1
    8000000c:	f14025f3          	csrr	a1,mhartid
    80000010:	00158593          	addi	a1,a1,1
    80000014:	02b50533          	mul	a0,a0,a1
    80000018:	00a10133          	add	sp,sp,a0
    8000001c:	1d0060ef          	jal	ra,800061ec <start>

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
    800010ac:	2b8010ef          	jal	ra,80002364 <_ZN5RiscV20handleEcallInterruptEv>

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
    800011bc:	490010ef          	jal	ra,8000264c <_ZN5RiscV20handleTimerInterruptEv>

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
    800012cc:	474010ef          	jal	ra,80002740 <_ZN5RiscV23handleExternalInterruptEv>

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
    80001438:	9c4080e7          	jalr	-1596(ra) # 80001df8 <_Znam>
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
//}

bool finished_main = false;
extern void userMain();

void userMain_wrapper(void*){
    80001660:	ff010113          	addi	sp,sp,-16
    80001664:	00113423          	sd	ra,8(sp)
    80001668:	00813023          	sd	s0,0(sp)
    8000166c:	01010413          	addi	s0,sp,16
    printString("userMain() started.\n");
    80001670:	00008517          	auipc	a0,0x8
    80001674:	99050513          	addi	a0,a0,-1648 # 80009000 <kvmincrease+0xa10>
    80001678:	00004097          	auipc	ra,0x4
    8000167c:	924080e7          	jalr	-1756(ra) # 80004f9c <_Z11printStringPKc>
    userMain();
    80001680:	00004097          	auipc	ra,0x4
    80001684:	fe4080e7          	jalr	-28(ra) # 80005664 <_Z8userMainv>
    printString("userMain() ended.\n");
    80001688:	00008517          	auipc	a0,0x8
    8000168c:	99050513          	addi	a0,a0,-1648 # 80009018 <kvmincrease+0xa28>
    80001690:	00004097          	auipc	ra,0x4
    80001694:	90c080e7          	jalr	-1780(ra) # 80004f9c <_Z11printStringPKc>
    finished_main = true;
    80001698:	00100793          	li	a5,1
    8000169c:	0000a717          	auipc	a4,0xa
    800016a0:	faf70223          	sb	a5,-92(a4) # 8000b640 <finished_main>
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
    800016b8:	f3c7b783          	ld	a5,-196(a5) # 8000b5f0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    800016e0:	f147b783          	ld	a5,-236(a5) # 8000b5f0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    80001718:	ecc7b783          	ld	a5,-308(a5) # 8000b5e0 <_GLOBAL_OFFSET_TABLE_+0x18>
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
    80001748:	ea47b783          	ld	a5,-348(a5) # 8000b5e8 <_GLOBAL_OFFSET_TABLE_+0x20>
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
    80001760:	8d450513          	addi	a0,a0,-1836 # 80009030 <kvmincrease+0xa40>
    80001764:	00004097          	auipc	ra,0x4
    80001768:	838080e7          	jalr	-1992(ra) # 80004f9c <_Z11printStringPKc>
    static void set_user_mode(bool value) { user_mode = value; }
    8000176c:	0000a797          	auipc	a5,0xa
    80001770:	e847b783          	ld	a5,-380(a5) # 8000b5f0 <_GLOBAL_OFFSET_TABLE_+0x28>
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
    800017b0:	e947c783          	lbu	a5,-364(a5) # 8000b640 <finished_main>
    800017b4:	00079863          	bnez	a5,800017c4 <main+0xc4>
        thread_dispatch();
    800017b8:	00000097          	auipc	ra,0x0
    800017bc:	cf0080e7          	jalr	-784(ra) # 800014a8 <_Z15thread_dispatchv>
    800017c0:	fedff06f          	j	800017ac <main+0xac>
    800017c4:	0000a797          	auipc	a5,0xa
    800017c8:	e2c7b783          	ld	a5,-468(a5) # 8000b5f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    800017cc:	00078023          	sb	zero,0(a5)
    }

    RiscV::set_user_mode(false);
    printString("USER MODE ENDED.\n");
    800017d0:	00008517          	auipc	a0,0x8
    800017d4:	87850513          	addi	a0,a0,-1928 # 80009048 <kvmincrease+0xa58>
    800017d8:	00003097          	auipc	ra,0x3
    800017dc:	7c4080e7          	jalr	1988(ra) # 80004f9c <_Z11printStringPKc>
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
    80001808:	684080e7          	jalr	1668(ra) # 80001e88 <_ZdaPv>
    8000180c:	00048513          	mv	a0,s1
    80001810:	00000097          	auipc	ra,0x0
    80001814:	610080e7          	jalr	1552(ra) # 80001e20 <_ZdlPv>
    delete idle_t;
    80001818:	fd043483          	ld	s1,-48(s0)
    8000181c:	02048063          	beqz	s1,8000183c <main+0x13c>
    80001820:	0104b503          	ld	a0,16(s1)
    80001824:	00050663          	beqz	a0,80001830 <main+0x130>
    80001828:	00000097          	auipc	ra,0x0
    8000182c:	660080e7          	jalr	1632(ra) # 80001e88 <_ZdaPv>
    80001830:	00048513          	mv	a0,s1
    80001834:	00000097          	auipc	ra,0x0
    80001838:	5ec080e7          	jalr	1516(ra) # 80001e20 <_ZdlPv>
    delete t1;
    8000183c:	fc843483          	ld	s1,-56(s0)
    80001840:	02048063          	beqz	s1,80001860 <main+0x160>
    80001844:	0104b503          	ld	a0,16(s1)
    80001848:	00050663          	beqz	a0,80001854 <main+0x154>
    8000184c:	00000097          	auipc	ra,0x0
    80001850:	63c080e7          	jalr	1596(ra) # 80001e88 <_ZdaPv>
    80001854:	00048513          	mv	a0,s1
    80001858:	00000097          	auipc	ra,0x0
    8000185c:	5c8080e7          	jalr	1480(ra) # 80001e20 <_ZdlPv>

    return 0;
    80001860:	00000513          	li	a0,0
    80001864:	03813083          	ld	ra,56(sp)
    80001868:	03013403          	ld	s0,48(sp)
    8000186c:	02813483          	ld	s1,40(sp)
    80001870:	04010113          	addi	sp,sp,64
    80001874:	00008067          	ret

0000000080001878 <_ZN19SleepingThreadsList14dec_time_firstEv>:
#include "../h/SleepingThreadsList.hpp"

void SleepingThreadsList::dec_time_first() {
    80001878:	ff010113          	addi	sp,sp,-16
    8000187c:	00813423          	sd	s0,8(sp)
    80001880:	01010413          	addi	s0,sp,16
    if(head != nullptr){
    80001884:	00053783          	ld	a5,0(a0)
    80001888:	00078863          	beqz	a5,80001898 <_ZN19SleepingThreadsList14dec_time_firstEv+0x20>
        head->slice-=1;
    8000188c:	0087b703          	ld	a4,8(a5)
    80001890:	fff70713          	addi	a4,a4,-1
    80001894:	00e7b423          	sd	a4,8(a5)
    }
}
    80001898:	00813403          	ld	s0,8(sp)
    8000189c:	01010113          	addi	sp,sp,16
    800018a0:	00008067          	ret

00000000800018a4 <_ZN19SleepingThreadsList15peek_time_firstEv>:

time_t SleepingThreadsList::peek_time_first() {
    800018a4:	ff010113          	addi	sp,sp,-16
    800018a8:	00813423          	sd	s0,8(sp)
    800018ac:	01010413          	addi	s0,sp,16
    if(!head) {
    800018b0:	00053783          	ld	a5,0(a0)
    800018b4:	00078a63          	beqz	a5,800018c8 <_ZN19SleepingThreadsList15peek_time_firstEv+0x24>
        return -1;
    }
    return head->slice;
    800018b8:	0087b503          	ld	a0,8(a5)
}
    800018bc:	00813403          	ld	s0,8(sp)
    800018c0:	01010113          	addi	sp,sp,16
    800018c4:	00008067          	ret
        return -1;
    800018c8:	fff00513          	li	a0,-1
    800018cc:	ff1ff06f          	j	800018bc <_ZN19SleepingThreadsList15peek_time_firstEv+0x18>

00000000800018d0 <_ZN19SleepingThreadsList15remove_finishedEv>:

void SleepingThreadsList::remove_finished() {
    800018d0:	fe010113          	addi	sp,sp,-32
    800018d4:	00113c23          	sd	ra,24(sp)
    800018d8:	00813823          	sd	s0,16(sp)
    800018dc:	00913423          	sd	s1,8(sp)
    800018e0:	01213023          	sd	s2,0(sp)
    800018e4:	02010413          	addi	s0,sp,32
    800018e8:	00050913          	mv	s2,a0
    800018ec:	0280006f          	j	80001914 <_ZN19SleepingThreadsList15remove_finishedEv+0x44>
    while(head != nullptr && head->slice <= 0){
        Node* elem = head;
        head = head->next;
        if(!head) {tail = nullptr;}
    800018f0:	00093423          	sd	zero,8(s2)
        elem->thread->set_sleeping(false);
    800018f4:	0004b783          	ld	a5,0(s1)

    bool is_finished() const { return finished; }
    void set_finished(bool f) { this->finished = f; }

    bool is_sleeping() const { return sleeping; }
    void set_sleeping(bool s) { this->sleeping = s; }
    800018f8:	02078b23          	sb	zero,54(a5)
        Scheduler::put(elem->thread);
    800018fc:	0004b503          	ld	a0,0(s1)
    80001900:	00001097          	auipc	ra,0x1
    80001904:	1b4080e7          	jalr	436(ra) # 80002ab4 <_ZN9Scheduler3putEP3TCB>
        __mem_free(elem);
    80001908:	00048513          	mv	a0,s1
    8000190c:	00007097          	auipc	ra,0x7
    80001910:	9a0080e7          	jalr	-1632(ra) # 800082ac <__mem_free>
    while(head != nullptr && head->slice <= 0){
    80001914:	00093483          	ld	s1,0(s2)
    80001918:	00048e63          	beqz	s1,80001934 <_ZN19SleepingThreadsList15remove_finishedEv+0x64>
    8000191c:	0084b783          	ld	a5,8(s1)
    80001920:	00079a63          	bnez	a5,80001934 <_ZN19SleepingThreadsList15remove_finishedEv+0x64>
        head = head->next;
    80001924:	0104b783          	ld	a5,16(s1)
    80001928:	00f93023          	sd	a5,0(s2)
        if(!head) {tail = nullptr;}
    8000192c:	fc0794e3          	bnez	a5,800018f4 <_ZN19SleepingThreadsList15remove_finishedEv+0x24>
    80001930:	fc1ff06f          	j	800018f0 <_ZN19SleepingThreadsList15remove_finishedEv+0x20>
    }
}
    80001934:	01813083          	ld	ra,24(sp)
    80001938:	01013403          	ld	s0,16(sp)
    8000193c:	00813483          	ld	s1,8(sp)
    80001940:	00013903          	ld	s2,0(sp)
    80001944:	02010113          	addi	sp,sp,32
    80001948:	00008067          	ret

000000008000194c <_ZN19SleepingThreadsList3putEP3TCBm>:

void SleepingThreadsList::put(TCB *thread, time_t slice) {
    8000194c:	fc010113          	addi	sp,sp,-64
    80001950:	02113c23          	sd	ra,56(sp)
    80001954:	02813823          	sd	s0,48(sp)
    80001958:	02913423          	sd	s1,40(sp)
    8000195c:	03213023          	sd	s2,32(sp)
    80001960:	01313c23          	sd	s3,24(sp)
    80001964:	01413823          	sd	s4,16(sp)
    80001968:	01513423          	sd	s5,8(sp)
    8000196c:	04010413          	addi	s0,sp,64
    80001970:	00050a13          	mv	s4,a0
    80001974:	00058a93          	mv	s5,a1
    80001978:	00060913          	mv	s2,a2
    if(head == nullptr){
    8000197c:	00053483          	ld	s1,0(a0)
    80001980:	02048463          	beqz	s1,800019a8 <_ZN19SleepingThreadsList3putEP3TCBm+0x5c>
        head->next = nullptr;
        head->slice = slice;
        tail = head;
    } else {
        Node* temp = head;
        Node* prev = nullptr;
    80001984:	00000993          	li	s3,0
        while(temp != tail && slice >= temp->slice){
    80001988:	008a3703          	ld	a4,8(s4)
    8000198c:	04970663          	beq	a4,s1,800019d8 <_ZN19SleepingThreadsList3putEP3TCBm+0x8c>
    80001990:	0084b783          	ld	a5,8(s1)
    80001994:	04f96263          	bltu	s2,a5,800019d8 <_ZN19SleepingThreadsList3putEP3TCBm+0x8c>
            slice -= temp->slice;
    80001998:	40f90933          	sub	s2,s2,a5
            prev = temp;
    8000199c:	00048993          	mv	s3,s1
            temp = temp->next;
    800019a0:	0104b483          	ld	s1,16(s1)
        while(temp != tail && slice >= temp->slice){
    800019a4:	fe5ff06f          	j	80001988 <_ZN19SleepingThreadsList3putEP3TCBm+0x3c>
        head = (Node*) __mem_alloc(sizeof(Node));
    800019a8:	01800513          	li	a0,24
    800019ac:	00007097          	auipc	ra,0x7
    800019b0:	9cc080e7          	jalr	-1588(ra) # 80008378 <__mem_alloc>
    800019b4:	00aa3023          	sd	a0,0(s4)
        head->thread = thread;
    800019b8:	01553023          	sd	s5,0(a0)
        head->next = nullptr;
    800019bc:	000a3783          	ld	a5,0(s4)
    800019c0:	0007b823          	sd	zero,16(a5)
        head->slice = slice;
    800019c4:	000a3783          	ld	a5,0(s4)
    800019c8:	0127b423          	sd	s2,8(a5)
        tail = head;
    800019cc:	000a3783          	ld	a5,0(s4)
    800019d0:	00fa3423          	sd	a5,8(s4)
    800019d4:	0340006f          	j	80001a08 <_ZN19SleepingThreadsList3putEP3TCBm+0xbc>
        }
        if(temp == tail) {
    800019d8:	04970a63          	beq	a4,s1,80001a2c <_ZN19SleepingThreadsList3putEP3TCBm+0xe0>
                }
                tail->slice -= slice;
            }
        }
        else {
            Node* novi = (Node*) __mem_alloc(sizeof(Node));
    800019dc:	01800513          	li	a0,24
    800019e0:	00007097          	auipc	ra,0x7
    800019e4:	998080e7          	jalr	-1640(ra) # 80008378 <__mem_alloc>
            novi->thread = thread;
    800019e8:	01553023          	sd	s5,0(a0)
            novi->next  = temp;
    800019ec:	00953823          	sd	s1,16(a0)
            novi->slice = slice;
    800019f0:	01253423          	sd	s2,8(a0)
            if(prev) {
    800019f4:	0a098a63          	beqz	s3,80001aa8 <_ZN19SleepingThreadsList3putEP3TCBm+0x15c>
                prev->next = novi;
    800019f8:	00a9b823          	sd	a0,16(s3)
            } else {
                head = novi;
            }
            temp->slice -= slice;
    800019fc:	0084b783          	ld	a5,8(s1)
    80001a00:	41278933          	sub	s2,a5,s2
    80001a04:	0124b423          	sd	s2,8(s1)
        }
    }
    80001a08:	03813083          	ld	ra,56(sp)
    80001a0c:	03013403          	ld	s0,48(sp)
    80001a10:	02813483          	ld	s1,40(sp)
    80001a14:	02013903          	ld	s2,32(sp)
    80001a18:	01813983          	ld	s3,24(sp)
    80001a1c:	01013a03          	ld	s4,16(sp)
    80001a20:	00813a83          	ld	s5,8(sp)
    80001a24:	04010113          	addi	sp,sp,64
    80001a28:	00008067          	ret
            if(slice >= tail->slice){
    80001a2c:	00873783          	ld	a5,8(a4)
    80001a30:	02f96c63          	bltu	s2,a5,80001a68 <_ZN19SleepingThreadsList3putEP3TCBm+0x11c>
                Node* novi = (Node*) __mem_alloc(sizeof(Node));
    80001a34:	01800513          	li	a0,24
    80001a38:	00007097          	auipc	ra,0x7
    80001a3c:	940080e7          	jalr	-1728(ra) # 80008378 <__mem_alloc>
                novi->thread = thread;
    80001a40:	01553023          	sd	s5,0(a0)
                novi->next = nullptr;
    80001a44:	00053823          	sd	zero,16(a0)
                novi->slice = slice - tail->slice;
    80001a48:	008a3783          	ld	a5,8(s4)
    80001a4c:	0087b783          	ld	a5,8(a5)
    80001a50:	40f90933          	sub	s2,s2,a5
    80001a54:	01253423          	sd	s2,8(a0)
                tail->next = novi;
    80001a58:	008a3783          	ld	a5,8(s4)
    80001a5c:	00a7b823          	sd	a0,16(a5)
                tail = novi;
    80001a60:	00aa3423          	sd	a0,8(s4)
    80001a64:	fa5ff06f          	j	80001a08 <_ZN19SleepingThreadsList3putEP3TCBm+0xbc>
                Node* novi = (Node*) __mem_alloc(sizeof(Node));
    80001a68:	01800513          	li	a0,24
    80001a6c:	00007097          	auipc	ra,0x7
    80001a70:	90c080e7          	jalr	-1780(ra) # 80008378 <__mem_alloc>
                novi->thread = thread;
    80001a74:	01553023          	sd	s5,0(a0)
                novi->next = tail;
    80001a78:	008a3783          	ld	a5,8(s4)
    80001a7c:	00f53823          	sd	a5,16(a0)
                novi->slice= slice;
    80001a80:	01253423          	sd	s2,8(a0)
                if(prev != nullptr){
    80001a84:	00098e63          	beqz	s3,80001aa0 <_ZN19SleepingThreadsList3putEP3TCBm+0x154>
                    prev->next = novi;
    80001a88:	00a9b823          	sd	a0,16(s3)
                tail->slice -= slice;
    80001a8c:	008a3703          	ld	a4,8(s4)
    80001a90:	00873783          	ld	a5,8(a4)
    80001a94:	41278933          	sub	s2,a5,s2
    80001a98:	01273423          	sd	s2,8(a4)
    80001a9c:	f6dff06f          	j	80001a08 <_ZN19SleepingThreadsList3putEP3TCBm+0xbc>
                    head = novi;
    80001aa0:	00aa3023          	sd	a0,0(s4)
    80001aa4:	fe9ff06f          	j	80001a8c <_ZN19SleepingThreadsList3putEP3TCBm+0x140>
                head = novi;
    80001aa8:	00aa3023          	sd	a0,0(s4)
    80001aac:	f51ff06f          	j	800019fc <_ZN19SleepingThreadsList3putEP3TCBm+0xb0>

0000000080001ab0 <_ZN3TCB14thread_wrapperEv>:
    ID++;

    return tcb;
}

void TCB::thread_wrapper() {
    80001ab0:	fe010113          	addi	sp,sp,-32
    80001ab4:	00113c23          	sd	ra,24(sp)
    80001ab8:	00813823          	sd	s0,16(sp)
    80001abc:	00913423          	sd	s1,8(sp)
    80001ac0:	02010413          	addi	s0,sp,32
    RiscV::popSppSpie();
    80001ac4:	00001097          	auipc	ra,0x1
    80001ac8:	858080e7          	jalr	-1960(ra) # 8000231c <_ZN5RiscV10popSppSpieEv>
    running->body(running->args);
    80001acc:	0000a497          	auipc	s1,0xa
    80001ad0:	b7c48493          	addi	s1,s1,-1156 # 8000b648 <_ZN3TCB7runningE>
    80001ad4:	0004b783          	ld	a5,0(s1)
    80001ad8:	0007b703          	ld	a4,0(a5)
    80001adc:	0087b503          	ld	a0,8(a5)
    80001ae0:	000700e7          	jalr	a4
    running->set_finished(true);
    80001ae4:	0004b783          	ld	a5,0(s1)
//    void start(){
//        Scheduler::put(this);
//    }

    bool is_finished() const { return finished; }
    void set_finished(bool f) { this->finished = f; }
    80001ae8:	00100713          	li	a4,1
    80001aec:	02e78a23          	sb	a4,52(a5)
    thread_dispatch();
    80001af0:	00000097          	auipc	ra,0x0
    80001af4:	9b8080e7          	jalr	-1608(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80001af8:	01813083          	ld	ra,24(sp)
    80001afc:	01013403          	ld	s0,16(sp)
    80001b00:	00813483          	ld	s1,8(sp)
    80001b04:	02010113          	addi	sp,sp,32
    80001b08:	00008067          	ret

0000000080001b0c <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm>:
TCB *TCB::create_thread(TCB **handle, TCB::Body body, void *args, uint64 *stack) {
    80001b0c:	fc010113          	addi	sp,sp,-64
    80001b10:	02113c23          	sd	ra,56(sp)
    80001b14:	02813823          	sd	s0,48(sp)
    80001b18:	02913423          	sd	s1,40(sp)
    80001b1c:	03213023          	sd	s2,32(sp)
    80001b20:	01313c23          	sd	s3,24(sp)
    80001b24:	01413823          	sd	s4,16(sp)
    80001b28:	01513423          	sd	s5,8(sp)
    80001b2c:	04010413          	addi	s0,sp,64
    80001b30:	00050a13          	mv	s4,a0
    80001b34:	00058993          	mv	s3,a1
    80001b38:	00060a93          	mv	s5,a2
    80001b3c:	00068913          	mv	s2,a3
    TCB* tcb = new TCB(body, args, DEFAULT_TIME_SLICE, stack);
    80001b40:	04000513          	li	a0,64
    80001b44:	00000097          	auipc	ra,0x0
    80001b48:	28c080e7          	jalr	652(ra) # 80001dd0 <_Znwm>
    80001b4c:	00050493          	mv	s1,a0
        main(body == nullptr){
    80001b50:	01353023          	sd	s3,0(a0)
    80001b54:	01553423          	sd	s5,8(a0)
        stack(body != nullptr ? stack : nullptr),
    80001b58:	06098263          	beqz	s3,80001bbc <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0xb0>
    80001b5c:	00090793          	mv	a5,s2
        main(body == nullptr){
    80001b60:	00f4b823          	sd	a5,16(s1)
    80001b64:	00000797          	auipc	a5,0x0
    80001b68:	f4c78793          	addi	a5,a5,-180 # 80001ab0 <_ZN3TCB14thread_wrapperEv>
    80001b6c:	00f4bc23          	sd	a5,24(s1)
        context({(uint64) &thread_wrapper, stack != nullptr ? reinterpret_cast<uint64>(&stack[DEFAULT_STACK_SIZE]) : 0UL}),
    80001b70:	04090a63          	beqz	s2,80001bc4 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0xb8>
    80001b74:	000086b7          	lui	a3,0x8
    80001b78:	00d90933          	add	s2,s2,a3
        main(body == nullptr){
    80001b7c:	0324b023          	sd	s2,32(s1)
    80001b80:	00200793          	li	a5,2
    80001b84:	02f4b423          	sd	a5,40(s1)
    80001b88:	0000a797          	auipc	a5,0xa
    80001b8c:	ac87a783          	lw	a5,-1336(a5) # 8000b650 <_ZN3TCB2IDE>
    80001b90:	02f4a823          	sw	a5,48(s1)
    80001b94:	02048a23          	sb	zero,52(s1)
    80001b98:	02048aa3          	sb	zero,53(s1)
    80001b9c:	02048b23          	sb	zero,54(s1)
    80001ba0:	0019b793          	seqz	a5,s3
    80001ba4:	02f48ba3          	sb	a5,55(s1)
        if(body != nullptr){
    80001ba8:	04098063          	beqz	s3,80001be8 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0xdc>
            Scheduler::put(this);
    80001bac:	00048513          	mv	a0,s1
    80001bb0:	00001097          	auipc	ra,0x1
    80001bb4:	f04080e7          	jalr	-252(ra) # 80002ab4 <_ZN9Scheduler3putEP3TCB>
    80001bb8:	0300006f          	j	80001be8 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0xdc>
        stack(body != nullptr ? stack : nullptr),
    80001bbc:	00000793          	li	a5,0
    80001bc0:	fa1ff06f          	j	80001b60 <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0x54>
        context({(uint64) &thread_wrapper, stack != nullptr ? reinterpret_cast<uint64>(&stack[DEFAULT_STACK_SIZE]) : 0UL}),
    80001bc4:	00000913          	li	s2,0
    80001bc8:	fb5ff06f          	j	80001b7c <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm+0x70>
    80001bcc:	00050913          	mv	s2,a0
    80001bd0:	00048513          	mv	a0,s1
    80001bd4:	00000097          	auipc	ra,0x0
    80001bd8:	24c080e7          	jalr	588(ra) # 80001e20 <_ZdlPv>
    80001bdc:	00090513          	mv	a0,s2
    80001be0:	0000b097          	auipc	ra,0xb
    80001be4:	bc8080e7          	jalr	-1080(ra) # 8000c7a8 <_Unwind_Resume>

    static uint64 r_scause();

    static void mc_sip(uint64 mask);

    static bool get_user_mode() { return user_mode; }
    80001be8:	0000a797          	auipc	a5,0xa
    80001bec:	a087b783          	ld	a5,-1528(a5) # 8000b5f0 <_GLOBAL_OFFSET_TABLE_+0x28>
    80001bf0:	0007c783          	lbu	a5,0(a5)
    bool is_main() const { return main; }
    int get_id() const { return id; }
    uint64 get_time_slice() const { return time_slice; }

    bool get_user_mode () const { return user_mode; }
    void set_user_mode (bool value) { user_mode = value; }
    80001bf4:	02f48c23          	sb	a5,56(s1)
    *handle = tcb;
    80001bf8:	009a3023          	sd	s1,0(s4)
    ID++;
    80001bfc:	0000a717          	auipc	a4,0xa
    80001c00:	a4c70713          	addi	a4,a4,-1460 # 8000b648 <_ZN3TCB7runningE>
    80001c04:	00872783          	lw	a5,8(a4)
    80001c08:	0017879b          	addiw	a5,a5,1
    80001c0c:	00f72423          	sw	a5,8(a4)
}
    80001c10:	00048513          	mv	a0,s1
    80001c14:	03813083          	ld	ra,56(sp)
    80001c18:	03013403          	ld	s0,48(sp)
    80001c1c:	02813483          	ld	s1,40(sp)
    80001c20:	02013903          	ld	s2,32(sp)
    80001c24:	01813983          	ld	s3,24(sp)
    80001c28:	01013a03          	ld	s4,16(sp)
    80001c2c:	00813a83          	ld	s5,8(sp)
    80001c30:	04010113          	addi	sp,sp,64
    80001c34:	00008067          	ret

0000000080001c38 <_ZN3TCB5yieldEv>:

void TCB::yield(){
    80001c38:	ff010113          	addi	sp,sp,-16
    80001c3c:	00813423          	sd	s0,8(sp)
    80001c40:	01010413          	addi	s0,sp,16
    __asm__ volatile ("mv a0, %0" : : "r"(THREAD_DISPATCH));
    80001c44:	01300793          	li	a5,19
    80001c48:	00078513          	mv	a0,a5
    __asm__ volatile ("ecall");
    80001c4c:	00000073          	ecall
}
    80001c50:	00813403          	ld	s0,8(sp)
    80001c54:	01010113          	addi	sp,sp,16
    80001c58:	00008067          	ret

0000000080001c5c <_ZN3TCB8dispatchEv>:

void TCB::dispatch() {
    80001c5c:	fe010113          	addi	sp,sp,-32
    80001c60:	00113c23          	sd	ra,24(sp)
    80001c64:	00813823          	sd	s0,16(sp)
    80001c68:	00913423          	sd	s1,8(sp)
    80001c6c:	02010413          	addi	s0,sp,32
    TCB* old = running;
    80001c70:	0000a497          	auipc	s1,0xa
    80001c74:	9d84b483          	ld	s1,-1576(s1) # 8000b648 <_ZN3TCB7runningE>
    bool is_finished() const { return finished; }
    80001c78:	0344c783          	lbu	a5,52(s1)
    if(!old->is_finished() && !old->is_sleeping() && !old->is_blocked()) Scheduler::put(old);
    80001c7c:	00079a63          	bnez	a5,80001c90 <_ZN3TCB8dispatchEv+0x34>
    bool is_sleeping() const { return sleeping; }
    80001c80:	0364c783          	lbu	a5,54(s1)
    80001c84:	00079663          	bnez	a5,80001c90 <_ZN3TCB8dispatchEv+0x34>
    bool is_blocked() const { return blocked; }
    80001c88:	0354c783          	lbu	a5,53(s1)
    80001c8c:	04078063          	beqz	a5,80001ccc <_ZN3TCB8dispatchEv+0x70>
    running = Scheduler::get();
    80001c90:	00001097          	auipc	ra,0x1
    80001c94:	dbc080e7          	jalr	-580(ra) # 80002a4c <_ZN9Scheduler3getEv>
    80001c98:	0000a797          	auipc	a5,0xa
    80001c9c:	9aa7b823          	sd	a0,-1616(a5) # 8000b648 <_ZN3TCB7runningE>

    if(old != running && running != nullptr){
    80001ca0:	00a48c63          	beq	s1,a0,80001cb8 <_ZN3TCB8dispatchEv+0x5c>
    80001ca4:	00050a63          	beqz	a0,80001cb8 <_ZN3TCB8dispatchEv+0x5c>
        contextSwitch(&(old->context), &(running->context));
    80001ca8:	01850593          	addi	a1,a0,24
    80001cac:	01848513          	addi	a0,s1,24
    80001cb0:	fffff097          	auipc	ra,0xfffff
    80001cb4:	6a8080e7          	jalr	1704(ra) # 80001358 <_ZN3TCB13contextSwitchEPNS_7ContextES1_>
    }
}
    80001cb8:	01813083          	ld	ra,24(sp)
    80001cbc:	01013403          	ld	s0,16(sp)
    80001cc0:	00813483          	ld	s1,8(sp)
    80001cc4:	02010113          	addi	sp,sp,32
    80001cc8:	00008067          	ret
    if(!old->is_finished() && !old->is_sleeping() && !old->is_blocked()) Scheduler::put(old);
    80001ccc:	00048513          	mv	a0,s1
    80001cd0:	00001097          	auipc	ra,0x1
    80001cd4:	de4080e7          	jalr	-540(ra) # 80002ab4 <_ZN9Scheduler3putEP3TCB>
    80001cd8:	fb9ff06f          	j	80001c90 <_ZN3TCB8dispatchEv+0x34>

0000000080001cdc <_ZN3TCB4joinEPS_>:

void TCB::join(TCB* handle) {
    80001cdc:	fe010113          	addi	sp,sp,-32
    80001ce0:	00113c23          	sd	ra,24(sp)
    80001ce4:	00813823          	sd	s0,16(sp)
    80001ce8:	00913423          	sd	s1,8(sp)
    80001cec:	02010413          	addi	s0,sp,32
    80001cf0:	00050493          	mv	s1,a0
    bool is_finished() const { return finished; }
    80001cf4:	0344c783          	lbu	a5,52(s1)
    while(!handle->is_finished()){
    80001cf8:	00079863          	bnez	a5,80001d08 <_ZN3TCB4joinEPS_+0x2c>
        TCB::dispatch();
    80001cfc:	00000097          	auipc	ra,0x0
    80001d00:	f60080e7          	jalr	-160(ra) # 80001c5c <_ZN3TCB8dispatchEv>
    while(!handle->is_finished()){
    80001d04:	ff1ff06f          	j	80001cf4 <_ZN3TCB4joinEPS_+0x18>
    }
}
    80001d08:	01813083          	ld	ra,24(sp)
    80001d0c:	01013403          	ld	s0,16(sp)
    80001d10:	00813483          	ld	s1,8(sp)
    80001d14:	02010113          	addi	sp,sp,32
    80001d18:	00008067          	ret

0000000080001d1c <_ZN3TCB16outputThreadBodyEPv>:

void TCB::outputThreadBody(void *) {
    80001d1c:	ff010113          	addi	sp,sp,-16
    80001d20:	00813423          	sd	s0,8(sp)
    80001d24:	01010413          	addi	s0,sp,16

}
    80001d28:	00813403          	ld	s0,8(sp)
    80001d2c:	01010113          	addi	sp,sp,16
    80001d30:	00008067          	ret

0000000080001d34 <_ZN6Thread13threadWrapperEPv>:
Thread::Thread() {
    myHandle = nullptr;
    thread_create(&myHandle, Thread::threadWrapper, (void*)this);
}

void Thread::threadWrapper(void *thread) {
    80001d34:	ff010113          	addi	sp,sp,-16
    80001d38:	00113423          	sd	ra,8(sp)
    80001d3c:	00813023          	sd	s0,0(sp)
    80001d40:	01010413          	addi	s0,sp,16
    ((Thread*)thread)->run();
    80001d44:	00053783          	ld	a5,0(a0)
    80001d48:	0107b783          	ld	a5,16(a5)
    80001d4c:	000780e7          	jalr	a5
}
    80001d50:	00813083          	ld	ra,8(sp)
    80001d54:	00013403          	ld	s0,0(sp)
    80001d58:	01010113          	addi	sp,sp,16
    80001d5c:	00008067          	ret

0000000080001d60 <_ZN14PeriodicThread7wrapperEPv>:

Semaphore::~Semaphore() {
    sem_close(myHandle);
}

void PeriodicThread::wrapper(void* arg) {
    80001d60:	fe010113          	addi	sp,sp,-32
    80001d64:	00113c23          	sd	ra,24(sp)
    80001d68:	00813823          	sd	s0,16(sp)
    80001d6c:	00913423          	sd	s1,8(sp)
    80001d70:	02010413          	addi	s0,sp,32
    80001d74:	00050493          	mv	s1,a0
    periodic_s* ps = (periodic_s*) arg;

    while(true){
        time_sleep(ps->period);
    80001d78:	0084b503          	ld	a0,8(s1)
    80001d7c:	00000097          	auipc	ra,0x0
    80001d80:	85c080e7          	jalr	-1956(ra) # 800015d8 <_Z10time_sleepm>
        ps->periodic_thread->periodicActivation();
    80001d84:	0004b503          	ld	a0,0(s1)
    80001d88:	00053783          	ld	a5,0(a0)
    80001d8c:	0187b783          	ld	a5,24(a5)
    80001d90:	000780e7          	jalr	a5
    while(true){
    80001d94:	fe5ff06f          	j	80001d78 <_ZN14PeriodicThread7wrapperEPv+0x18>

0000000080001d98 <_ZN9SemaphoreD1Ev>:
Semaphore::~Semaphore() {
    80001d98:	ff010113          	addi	sp,sp,-16
    80001d9c:	00113423          	sd	ra,8(sp)
    80001da0:	00813023          	sd	s0,0(sp)
    80001da4:	01010413          	addi	s0,sp,16
    80001da8:	00009797          	auipc	a5,0x9
    80001dac:	66878793          	addi	a5,a5,1640 # 8000b410 <_ZTV9Semaphore+0x10>
    80001db0:	00f53023          	sd	a5,0(a0)
    sem_close(myHandle);
    80001db4:	00853503          	ld	a0,8(a0)
    80001db8:	fffff097          	auipc	ra,0xfffff
    80001dbc:	778080e7          	jalr	1912(ra) # 80001530 <_Z9sem_closeP3sem>
}
    80001dc0:	00813083          	ld	ra,8(sp)
    80001dc4:	00013403          	ld	s0,0(sp)
    80001dc8:	01010113          	addi	sp,sp,16
    80001dcc:	00008067          	ret

0000000080001dd0 <_Znwm>:
void* operator new(size_t size){
    80001dd0:	ff010113          	addi	sp,sp,-16
    80001dd4:	00113423          	sd	ra,8(sp)
    80001dd8:	00813023          	sd	s0,0(sp)
    80001ddc:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001de0:	fffff097          	auipc	ra,0xfffff
    80001de4:	5ac080e7          	jalr	1452(ra) # 8000138c <_Z9mem_allocm>
}
    80001de8:	00813083          	ld	ra,8(sp)
    80001dec:	00013403          	ld	s0,0(sp)
    80001df0:	01010113          	addi	sp,sp,16
    80001df4:	00008067          	ret

0000000080001df8 <_Znam>:
void* operator new[](size_t size){
    80001df8:	ff010113          	addi	sp,sp,-16
    80001dfc:	00113423          	sd	ra,8(sp)
    80001e00:	00813023          	sd	s0,0(sp)
    80001e04:	01010413          	addi	s0,sp,16
    return mem_alloc(size);
    80001e08:	fffff097          	auipc	ra,0xfffff
    80001e0c:	584080e7          	jalr	1412(ra) # 8000138c <_Z9mem_allocm>
}
    80001e10:	00813083          	ld	ra,8(sp)
    80001e14:	00013403          	ld	s0,0(sp)
    80001e18:	01010113          	addi	sp,sp,16
    80001e1c:	00008067          	ret

0000000080001e20 <_ZdlPv>:
void operator delete(void* ptr){
    80001e20:	ff010113          	addi	sp,sp,-16
    80001e24:	00113423          	sd	ra,8(sp)
    80001e28:	00813023          	sd	s0,0(sp)
    80001e2c:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80001e30:	fffff097          	auipc	ra,0xfffff
    80001e34:	59c080e7          	jalr	1436(ra) # 800013cc <_Z8mem_freePv>
}
    80001e38:	00813083          	ld	ra,8(sp)
    80001e3c:	00013403          	ld	s0,0(sp)
    80001e40:	01010113          	addi	sp,sp,16
    80001e44:	00008067          	ret

0000000080001e48 <_ZN9SemaphoreD0Ev>:
Semaphore::~Semaphore() {
    80001e48:	fe010113          	addi	sp,sp,-32
    80001e4c:	00113c23          	sd	ra,24(sp)
    80001e50:	00813823          	sd	s0,16(sp)
    80001e54:	00913423          	sd	s1,8(sp)
    80001e58:	02010413          	addi	s0,sp,32
    80001e5c:	00050493          	mv	s1,a0
}
    80001e60:	00000097          	auipc	ra,0x0
    80001e64:	f38080e7          	jalr	-200(ra) # 80001d98 <_ZN9SemaphoreD1Ev>
    80001e68:	00048513          	mv	a0,s1
    80001e6c:	00000097          	auipc	ra,0x0
    80001e70:	fb4080e7          	jalr	-76(ra) # 80001e20 <_ZdlPv>
    80001e74:	01813083          	ld	ra,24(sp)
    80001e78:	01013403          	ld	s0,16(sp)
    80001e7c:	00813483          	ld	s1,8(sp)
    80001e80:	02010113          	addi	sp,sp,32
    80001e84:	00008067          	ret

0000000080001e88 <_ZdaPv>:
void operator delete[](void* ptr){
    80001e88:	ff010113          	addi	sp,sp,-16
    80001e8c:	00113423          	sd	ra,8(sp)
    80001e90:	00813023          	sd	s0,0(sp)
    80001e94:	01010413          	addi	s0,sp,16
    mem_free(ptr);
    80001e98:	fffff097          	auipc	ra,0xfffff
    80001e9c:	534080e7          	jalr	1332(ra) # 800013cc <_Z8mem_freePv>
}
    80001ea0:	00813083          	ld	ra,8(sp)
    80001ea4:	00013403          	ld	s0,0(sp)
    80001ea8:	01010113          	addi	sp,sp,16
    80001eac:	00008067          	ret

0000000080001eb0 <_ZN6ThreadD1Ev>:
Thread::~Thread() {
    80001eb0:	fe010113          	addi	sp,sp,-32
    80001eb4:	00113c23          	sd	ra,24(sp)
    80001eb8:	00813823          	sd	s0,16(sp)
    80001ebc:	00913423          	sd	s1,8(sp)
    80001ec0:	02010413          	addi	s0,sp,32
    80001ec4:	00009797          	auipc	a5,0x9
    80001ec8:	52478793          	addi	a5,a5,1316 # 8000b3e8 <_ZTV6Thread+0x10>
    80001ecc:	00f53023          	sd	a5,0(a0)
    myHandle->set_finished(true);
    80001ed0:	00853783          	ld	a5,8(a0)
    void set_finished(bool f) { this->finished = f; }
    80001ed4:	00100713          	li	a4,1
    80001ed8:	02e78a23          	sb	a4,52(a5)
    delete myHandle;
    80001edc:	00853483          	ld	s1,8(a0)
    80001ee0:	02048063          	beqz	s1,80001f00 <_ZN6ThreadD1Ev+0x50>

    bool get_user_mode () const { return user_mode; }
    void set_user_mode (bool value) { user_mode = value; }

    ~TCB(){
        delete[] stack;
    80001ee4:	0104b503          	ld	a0,16(s1)
    80001ee8:	00050663          	beqz	a0,80001ef4 <_ZN6ThreadD1Ev+0x44>
    80001eec:	00000097          	auipc	ra,0x0
    80001ef0:	f9c080e7          	jalr	-100(ra) # 80001e88 <_ZdaPv>
    80001ef4:	00048513          	mv	a0,s1
    80001ef8:	00000097          	auipc	ra,0x0
    80001efc:	f28080e7          	jalr	-216(ra) # 80001e20 <_ZdlPv>
}
    80001f00:	01813083          	ld	ra,24(sp)
    80001f04:	01013403          	ld	s0,16(sp)
    80001f08:	00813483          	ld	s1,8(sp)
    80001f0c:	02010113          	addi	sp,sp,32
    80001f10:	00008067          	ret

0000000080001f14 <_ZN6ThreadD0Ev>:
Thread::~Thread() {
    80001f14:	fe010113          	addi	sp,sp,-32
    80001f18:	00113c23          	sd	ra,24(sp)
    80001f1c:	00813823          	sd	s0,16(sp)
    80001f20:	00913423          	sd	s1,8(sp)
    80001f24:	02010413          	addi	s0,sp,32
    80001f28:	00050493          	mv	s1,a0
}
    80001f2c:	00000097          	auipc	ra,0x0
    80001f30:	f84080e7          	jalr	-124(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80001f34:	00048513          	mv	a0,s1
    80001f38:	00000097          	auipc	ra,0x0
    80001f3c:	ee8080e7          	jalr	-280(ra) # 80001e20 <_ZdlPv>
    80001f40:	01813083          	ld	ra,24(sp)
    80001f44:	01013403          	ld	s0,16(sp)
    80001f48:	00813483          	ld	s1,8(sp)
    80001f4c:	02010113          	addi	sp,sp,32
    80001f50:	00008067          	ret

0000000080001f54 <_ZN6ThreadC1EPFvPvES0_>:
Thread::Thread(void (*body)(void *), void *arg) {
    80001f54:	ff010113          	addi	sp,sp,-16
    80001f58:	00113423          	sd	ra,8(sp)
    80001f5c:	00813023          	sd	s0,0(sp)
    80001f60:	01010413          	addi	s0,sp,16
    80001f64:	00009797          	auipc	a5,0x9
    80001f68:	48478793          	addi	a5,a5,1156 # 8000b3e8 <_ZTV6Thread+0x10>
    80001f6c:	00f53023          	sd	a5,0(a0)
    myHandle = nullptr;
    80001f70:	00053423          	sd	zero,8(a0)
    thread_create(&myHandle, body, arg);
    80001f74:	00850513          	addi	a0,a0,8
    80001f78:	fffff097          	auipc	ra,0xfffff
    80001f7c:	48c080e7          	jalr	1164(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
}
    80001f80:	00813083          	ld	ra,8(sp)
    80001f84:	00013403          	ld	s0,0(sp)
    80001f88:	01010113          	addi	sp,sp,16
    80001f8c:	00008067          	ret

0000000080001f90 <_ZN6Thread5startEv>:
int Thread::start() {
    80001f90:	ff010113          	addi	sp,sp,-16
    80001f94:	00813423          	sd	s0,8(sp)
    80001f98:	01010413          	addi	s0,sp,16
}
    80001f9c:	00000513          	li	a0,0
    80001fa0:	00813403          	ld	s0,8(sp)
    80001fa4:	01010113          	addi	sp,sp,16
    80001fa8:	00008067          	ret

0000000080001fac <_ZN6Thread4joinEv>:
    if(myHandle) thread_join(myHandle);
    80001fac:	00853503          	ld	a0,8(a0)
    80001fb0:	02050663          	beqz	a0,80001fdc <_ZN6Thread4joinEv+0x30>
void Thread::join() {
    80001fb4:	ff010113          	addi	sp,sp,-16
    80001fb8:	00113423          	sd	ra,8(sp)
    80001fbc:	00813023          	sd	s0,0(sp)
    80001fc0:	01010413          	addi	s0,sp,16
    if(myHandle) thread_join(myHandle);
    80001fc4:	fffff097          	auipc	ra,0xfffff
    80001fc8:	508080e7          	jalr	1288(ra) # 800014cc <_Z11thread_joinP3TCB>
}
    80001fcc:	00813083          	ld	ra,8(sp)
    80001fd0:	00013403          	ld	s0,0(sp)
    80001fd4:	01010113          	addi	sp,sp,16
    80001fd8:	00008067          	ret
    80001fdc:	00008067          	ret

0000000080001fe0 <_ZN6Thread8dispatchEv>:
void Thread::dispatch() {
    80001fe0:	ff010113          	addi	sp,sp,-16
    80001fe4:	00113423          	sd	ra,8(sp)
    80001fe8:	00813023          	sd	s0,0(sp)
    80001fec:	01010413          	addi	s0,sp,16
    thread_dispatch();
    80001ff0:	fffff097          	auipc	ra,0xfffff
    80001ff4:	4b8080e7          	jalr	1208(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80001ff8:	00813083          	ld	ra,8(sp)
    80001ffc:	00013403          	ld	s0,0(sp)
    80002000:	01010113          	addi	sp,sp,16
    80002004:	00008067          	ret

0000000080002008 <_ZN6Thread5sleepEm>:
int Thread::sleep(time_t time) {
    80002008:	ff010113          	addi	sp,sp,-16
    8000200c:	00113423          	sd	ra,8(sp)
    80002010:	00813023          	sd	s0,0(sp)
    80002014:	01010413          	addi	s0,sp,16
    time_sleep(time);
    80002018:	fffff097          	auipc	ra,0xfffff
    8000201c:	5c0080e7          	jalr	1472(ra) # 800015d8 <_Z10time_sleepm>
}
    80002020:	00000513          	li	a0,0
    80002024:	00813083          	ld	ra,8(sp)
    80002028:	00013403          	ld	s0,0(sp)
    8000202c:	01010113          	addi	sp,sp,16
    80002030:	00008067          	ret

0000000080002034 <_ZN6ThreadC1Ev>:
Thread::Thread() {
    80002034:	ff010113          	addi	sp,sp,-16
    80002038:	00113423          	sd	ra,8(sp)
    8000203c:	00813023          	sd	s0,0(sp)
    80002040:	01010413          	addi	s0,sp,16
    80002044:	00009797          	auipc	a5,0x9
    80002048:	3a478793          	addi	a5,a5,932 # 8000b3e8 <_ZTV6Thread+0x10>
    8000204c:	00f53023          	sd	a5,0(a0)
    myHandle = nullptr;
    80002050:	00053423          	sd	zero,8(a0)
    thread_create(&myHandle, Thread::threadWrapper, (void*)this);
    80002054:	00050613          	mv	a2,a0
    80002058:	00000597          	auipc	a1,0x0
    8000205c:	cdc58593          	addi	a1,a1,-804 # 80001d34 <_ZN6Thread13threadWrapperEPv>
    80002060:	00850513          	addi	a0,a0,8
    80002064:	fffff097          	auipc	ra,0xfffff
    80002068:	3a0080e7          	jalr	928(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
}
    8000206c:	00813083          	ld	ra,8(sp)
    80002070:	00013403          	ld	s0,0(sp)
    80002074:	01010113          	addi	sp,sp,16
    80002078:	00008067          	ret

000000008000207c <_ZN9SemaphoreC1Ej>:
Semaphore::Semaphore(unsigned int init) {
    8000207c:	ff010113          	addi	sp,sp,-16
    80002080:	00113423          	sd	ra,8(sp)
    80002084:	00813023          	sd	s0,0(sp)
    80002088:	01010413          	addi	s0,sp,16
    8000208c:	00009797          	auipc	a5,0x9
    80002090:	38478793          	addi	a5,a5,900 # 8000b410 <_ZTV9Semaphore+0x10>
    80002094:	00f53023          	sd	a5,0(a0)
    myHandle = nullptr;
    80002098:	00053423          	sd	zero,8(a0)
    sem_open(&myHandle, init);
    8000209c:	00850513          	addi	a0,a0,8
    800020a0:	fffff097          	auipc	ra,0xfffff
    800020a4:	454080e7          	jalr	1108(ra) # 800014f4 <_Z8sem_openPP3semj>
}
    800020a8:	00813083          	ld	ra,8(sp)
    800020ac:	00013403          	ld	s0,0(sp)
    800020b0:	01010113          	addi	sp,sp,16
    800020b4:	00008067          	ret

00000000800020b8 <_ZN9Semaphore4waitEv>:
int Semaphore::wait() {
    800020b8:	ff010113          	addi	sp,sp,-16
    800020bc:	00113423          	sd	ra,8(sp)
    800020c0:	00813023          	sd	s0,0(sp)
    800020c4:	01010413          	addi	s0,sp,16
    return sem_wait(myHandle);
    800020c8:	00853503          	ld	a0,8(a0)
    800020cc:	fffff097          	auipc	ra,0xfffff
    800020d0:	49c080e7          	jalr	1180(ra) # 80001568 <_Z8sem_waitP3sem>
}
    800020d4:	00813083          	ld	ra,8(sp)
    800020d8:	00013403          	ld	s0,0(sp)
    800020dc:	01010113          	addi	sp,sp,16
    800020e0:	00008067          	ret

00000000800020e4 <_ZN9Semaphore6signalEv>:
int Semaphore::signal() {
    800020e4:	ff010113          	addi	sp,sp,-16
    800020e8:	00113423          	sd	ra,8(sp)
    800020ec:	00813023          	sd	s0,0(sp)
    800020f0:	01010413          	addi	s0,sp,16
    return sem_signal(myHandle);
    800020f4:	00853503          	ld	a0,8(a0)
    800020f8:	fffff097          	auipc	ra,0xfffff
    800020fc:	4a8080e7          	jalr	1192(ra) # 800015a0 <_Z10sem_signalP3sem>
}
    80002100:	00813083          	ld	ra,8(sp)
    80002104:	00013403          	ld	s0,0(sp)
    80002108:	01010113          	addi	sp,sp,16
    8000210c:	00008067          	ret

0000000080002110 <_ZN14PeriodicThread9terminateEv>:
    }

    __mem_free(ps);
}

void PeriodicThread::terminate() {
    80002110:	ff010113          	addi	sp,sp,-16
    80002114:	00113423          	sd	ra,8(sp)
    80002118:	00813023          	sd	s0,0(sp)
    8000211c:	01010413          	addi	s0,sp,16
    thread_exit();
    80002120:	fffff097          	auipc	ra,0xfffff
    80002124:	360080e7          	jalr	864(ra) # 80001480 <_Z11thread_exitv>
}
    80002128:	00813083          	ld	ra,8(sp)
    8000212c:	00013403          	ld	s0,0(sp)
    80002130:	01010113          	addi	sp,sp,16
    80002134:	00008067          	ret

0000000080002138 <_ZN14PeriodicThreadC1Em>:

PeriodicThread::PeriodicThread(time_t period) {
    80002138:	fd010113          	addi	sp,sp,-48
    8000213c:	02113423          	sd	ra,40(sp)
    80002140:	02813023          	sd	s0,32(sp)
    80002144:	00913c23          	sd	s1,24(sp)
    80002148:	01213823          	sd	s2,16(sp)
    8000214c:	03010413          	addi	s0,sp,48
    80002150:	00050493          	mv	s1,a0
    80002154:	00058913          	mv	s2,a1
    80002158:	00000097          	auipc	ra,0x0
    8000215c:	edc080e7          	jalr	-292(ra) # 80002034 <_ZN6ThreadC1Ev>
    80002160:	00009797          	auipc	a5,0x9
    80002164:	25878793          	addi	a5,a5,600 # 8000b3b8 <_ZTV14PeriodicThread+0x10>
    80002168:	00f4b023          	sd	a5,0(s1)
    this->period = period;
    8000216c:	0124b823          	sd	s2,16(s1)

    periodic_s* ps = (periodic_s*) __mem_alloc(sizeof(periodic_s));
    80002170:	01000513          	li	a0,16
    80002174:	00006097          	auipc	ra,0x6
    80002178:	204080e7          	jalr	516(ra) # 80008378 <__mem_alloc>
    8000217c:	00050613          	mv	a2,a0
    ps->periodic_thread = this;
    80002180:	00953023          	sd	s1,0(a0)
    ps->period = period;
    80002184:	01253423          	sd	s2,8(a0)

    Thread(PeriodicThread::wrapper, ps);
    80002188:	00000597          	auipc	a1,0x0
    8000218c:	bd858593          	addi	a1,a1,-1064 # 80001d60 <_ZN14PeriodicThread7wrapperEPv>
    80002190:	fd040513          	addi	a0,s0,-48
    80002194:	00000097          	auipc	ra,0x0
    80002198:	dc0080e7          	jalr	-576(ra) # 80001f54 <_ZN6ThreadC1EPFvPvES0_>
    8000219c:	fd040513          	addi	a0,s0,-48
    800021a0:	00000097          	auipc	ra,0x0
    800021a4:	d10080e7          	jalr	-752(ra) # 80001eb0 <_ZN6ThreadD1Ev>
}
    800021a8:	02813083          	ld	ra,40(sp)
    800021ac:	02013403          	ld	s0,32(sp)
    800021b0:	01813483          	ld	s1,24(sp)
    800021b4:	01013903          	ld	s2,16(sp)
    800021b8:	03010113          	addi	sp,sp,48
    800021bc:	00008067          	ret
    800021c0:	00050913          	mv	s2,a0
PeriodicThread::PeriodicThread(time_t period) {
    800021c4:	00048513          	mv	a0,s1
    800021c8:	00000097          	auipc	ra,0x0
    800021cc:	ce8080e7          	jalr	-792(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    800021d0:	00090513          	mv	a0,s2
    800021d4:	0000a097          	auipc	ra,0xa
    800021d8:	5d4080e7          	jalr	1492(ra) # 8000c7a8 <_Unwind_Resume>

00000000800021dc <_ZN7Console4getcEv>:

char Console::getc() {
    800021dc:	ff010113          	addi	sp,sp,-16
    800021e0:	00113423          	sd	ra,8(sp)
    800021e4:	00813023          	sd	s0,0(sp)
    800021e8:	01010413          	addi	s0,sp,16
    return __getc();
    800021ec:	00006097          	auipc	ra,0x6
    800021f0:	320080e7          	jalr	800(ra) # 8000850c <__getc>
}
    800021f4:	00813083          	ld	ra,8(sp)
    800021f8:	00013403          	ld	s0,0(sp)
    800021fc:	01010113          	addi	sp,sp,16
    80002200:	00008067          	ret

0000000080002204 <_ZN7Console4putcEc>:

void Console::putc(char c) {
    80002204:	ff010113          	addi	sp,sp,-16
    80002208:	00113423          	sd	ra,8(sp)
    8000220c:	00813023          	sd	s0,0(sp)
    80002210:	01010413          	addi	s0,sp,16
    __putc(c);
    80002214:	00006097          	auipc	ra,0x6
    80002218:	2bc080e7          	jalr	700(ra) # 800084d0 <__putc>
}
    8000221c:	00813083          	ld	ra,8(sp)
    80002220:	00013403          	ld	s0,0(sp)
    80002224:	01010113          	addi	sp,sp,16
    80002228:	00008067          	ret

000000008000222c <_ZN6Thread3runEv>:
    static void dispatch ();
    static int sleep (time_t);
    static void threadWrapper(void *);
protected:
    Thread ();
    virtual void run () {}
    8000222c:	ff010113          	addi	sp,sp,-16
    80002230:	00813423          	sd	s0,8(sp)
    80002234:	01010413          	addi	s0,sp,16
    80002238:	00813403          	ld	s0,8(sp)
    8000223c:	01010113          	addi	sp,sp,16
    80002240:	00008067          	ret

0000000080002244 <_ZN14PeriodicThread18periodicActivationEv>:
    static void wrapper(void*);
    void terminate ();

protected:
    PeriodicThread (time_t period);
    virtual void periodicActivation() {}
    80002244:	ff010113          	addi	sp,sp,-16
    80002248:	00813423          	sd	s0,8(sp)
    8000224c:	01010413          	addi	s0,sp,16
    80002250:	00813403          	ld	s0,8(sp)
    80002254:	01010113          	addi	sp,sp,16
    80002258:	00008067          	ret

000000008000225c <_ZN14PeriodicThreadD1Ev>:
class PeriodicThread : public Thread {
    8000225c:	ff010113          	addi	sp,sp,-16
    80002260:	00113423          	sd	ra,8(sp)
    80002264:	00813023          	sd	s0,0(sp)
    80002268:	01010413          	addi	s0,sp,16
    8000226c:	00009797          	auipc	a5,0x9
    80002270:	14c78793          	addi	a5,a5,332 # 8000b3b8 <_ZTV14PeriodicThread+0x10>
    80002274:	00f53023          	sd	a5,0(a0)
    80002278:	00000097          	auipc	ra,0x0
    8000227c:	c38080e7          	jalr	-968(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80002280:	00813083          	ld	ra,8(sp)
    80002284:	00013403          	ld	s0,0(sp)
    80002288:	01010113          	addi	sp,sp,16
    8000228c:	00008067          	ret

0000000080002290 <_ZN14PeriodicThreadD0Ev>:
    80002290:	fe010113          	addi	sp,sp,-32
    80002294:	00113c23          	sd	ra,24(sp)
    80002298:	00813823          	sd	s0,16(sp)
    8000229c:	00913423          	sd	s1,8(sp)
    800022a0:	02010413          	addi	s0,sp,32
    800022a4:	00050493          	mv	s1,a0
    800022a8:	00009797          	auipc	a5,0x9
    800022ac:	11078793          	addi	a5,a5,272 # 8000b3b8 <_ZTV14PeriodicThread+0x10>
    800022b0:	00f53023          	sd	a5,0(a0)
    800022b4:	00000097          	auipc	ra,0x0
    800022b8:	bfc080e7          	jalr	-1028(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    800022bc:	00048513          	mv	a0,s1
    800022c0:	00000097          	auipc	ra,0x0
    800022c4:	b60080e7          	jalr	-1184(ra) # 80001e20 <_ZdlPv>
    800022c8:	01813083          	ld	ra,24(sp)
    800022cc:	01013403          	ld	s0,16(sp)
    800022d0:	00813483          	ld	s1,8(sp)
    800022d4:	02010113          	addi	sp,sp,32
    800022d8:	00008067          	ret

00000000800022dc <_Z41__static_initialization_and_destruction_0ii>:
    }
}

void RiscV::handleExternalInterrupt() {
    console_handler();
}
    800022dc:	ff010113          	addi	sp,sp,-16
    800022e0:	00813423          	sd	s0,8(sp)
    800022e4:	01010413          	addi	s0,sp,16
    800022e8:	00100793          	li	a5,1
    800022ec:	00f50863          	beq	a0,a5,800022fc <_Z41__static_initialization_and_destruction_0ii+0x20>
    800022f0:	00813403          	ld	s0,8(sp)
    800022f4:	01010113          	addi	sp,sp,16
    800022f8:	00008067          	ret
    800022fc:	000107b7          	lui	a5,0x10
    80002300:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80002304:	fef596e3          	bne	a1,a5,800022f0 <_Z41__static_initialization_and_destruction_0ii+0x14>
        Node* next;
    };

    Node *head, *tail;
public:
    SleepingThreadsList() : head(nullptr), tail(nullptr) {}
    80002308:	00009797          	auipc	a5,0x9
    8000230c:	35878793          	addi	a5,a5,856 # 8000b660 <_ZN5RiscV24list_of_sleeping_threadsE>
    80002310:	0007b023          	sd	zero,0(a5)
    80002314:	0007b423          	sd	zero,8(a5)
    80002318:	fd9ff06f          	j	800022f0 <_Z41__static_initialization_and_destruction_0ii+0x14>

000000008000231c <_ZN5RiscV10popSppSpieEv>:
void RiscV::popSppSpie() {
    8000231c:	ff010113          	addi	sp,sp,-16
    80002320:	00813423          	sd	s0,8(sp)
    80002324:	01010413          	addi	s0,sp,16
    if(TCB::running->get_user_mode()){
    80002328:	00009797          	auipc	a5,0x9
    8000232c:	2c07b783          	ld	a5,704(a5) # 8000b5e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002330:	0007b783          	ld	a5,0(a5)
    bool get_user_mode () const { return user_mode; }
    80002334:	0387c783          	lbu	a5,56(a5)
    80002338:	02078063          	beqz	a5,80002358 <_ZN5RiscV10popSppSpieEv+0x3c>
    8000233c:	10000793          	li	a5,256
    80002340:	1007b073          	csrc	sstatus,a5
    __asm__ volatile ("csrw sepc, ra");
    80002344:	14109073          	csrw	sepc,ra
    __asm__ volatile ("sret");
    80002348:	10200073          	sret
}
    8000234c:	00813403          	ld	s0,8(sp)
    80002350:	01010113          	addi	sp,sp,16
    80002354:	00008067          	ret
    __asm__ volatile("csrs sstatus, %[mask]" : : [mask] "r"(mask));
    80002358:	10000793          	li	a5,256
    8000235c:	1007a073          	csrs	sstatus,a5
}
    80002360:	fe5ff06f          	j	80002344 <_ZN5RiscV10popSppSpieEv+0x28>

0000000080002364 <_ZN5RiscV20handleEcallInterruptEv>:
void RiscV::handleEcallInterrupt() {
    80002364:	fa010113          	addi	sp,sp,-96
    80002368:	04113c23          	sd	ra,88(sp)
    8000236c:	04813823          	sd	s0,80(sp)
    80002370:	04913423          	sd	s1,72(sp)
    80002374:	06010413          	addi	s0,sp,96
    return a0;
}

inline uint64 RiscV::r_scause() {
    uint64 volatile scause;
    __asm__ volatile ("csrr %[scause], scause" : [scause] "=r"(scause));
    80002378:	142027f3          	csrr	a5,scause
    8000237c:	faf43c23          	sd	a5,-72(s0)

    return scause;
    80002380:	fb843783          	ld	a5,-72(s0)
    uint64 volatile scause = r_scause();
    80002384:	fcf43c23          	sd	a5,-40(s0)
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    80002388:	141027f3          	csrr	a5,sepc
    8000238c:	faf43823          	sd	a5,-80(s0)
    return sepc;
    80002390:	fb043783          	ld	a5,-80(s0)
    uint64 volatile sepc = RiscV::r_sepc() + 4;
    80002394:	00478793          	addi	a5,a5,4
    80002398:	fcf43823          	sd	a5,-48(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    8000239c:	100027f3          	csrr	a5,sstatus
    800023a0:	faf43423          	sd	a5,-88(s0)
    return sstatus;
    800023a4:	fa843783          	ld	a5,-88(s0)
    uint64 volatile sstatus = RiscV::r_sstatus();
    800023a8:	fcf43423          	sd	a5,-56(s0)
    if(scause == 0x0000000000000008UL || scause == 0x0000000000000009UL){
    800023ac:	fd843703          	ld	a4,-40(s0)
    800023b0:	00800793          	li	a5,8
    800023b4:	00f70863          	beq	a4,a5,800023c4 <_ZN5RiscV20handleEcallInterruptEv+0x60>
    800023b8:	fd843703          	ld	a4,-40(s0)
    800023bc:	00900793          	li	a5,9
    800023c0:	0cf71263          	bne	a4,a5,80002484 <_ZN5RiscV20handleEcallInterruptEv+0x120>
    __asm__ volatile ("ld %0, 10*8(fp)" : "=r"(a0));
    800023c4:	05043783          	ld	a5,80(s0)
    800023c8:	fcf43023          	sd	a5,-64(s0)
    return a0;
    800023cc:	fc043783          	ld	a5,-64(s0)
        uint64 volatile a0 = RiscV::r_a0();
    800023d0:	faf43023          	sd	a5,-96(s0)
        if(a0 == MEM_ALLOC){
    800023d4:	fa043703          	ld	a4,-96(s0)
    800023d8:	00100793          	li	a5,1
    800023dc:	0cf70663          	beq	a4,a5,800024a8 <_ZN5RiscV20handleEcallInterruptEv+0x144>
        }else if(a0 == MEM_FREE){
    800023e0:	fa043703          	ld	a4,-96(s0)
    800023e4:	00200793          	li	a5,2
    800023e8:	0ef70e63          	beq	a4,a5,800024e4 <_ZN5RiscV20handleEcallInterruptEv+0x180>
        }else if(a0 == THREAD_CREATE){
    800023ec:	fa043703          	ld	a4,-96(s0)
    800023f0:	01100793          	li	a5,17
    800023f4:	10f70463          	beq	a4,a5,800024fc <_ZN5RiscV20handleEcallInterruptEv+0x198>
        }else if(a0 == THREAD_EXIT){
    800023f8:	fa043703          	ld	a4,-96(s0)
    800023fc:	01200793          	li	a5,18
    80002400:	12f70863          	beq	a4,a5,80002530 <_ZN5RiscV20handleEcallInterruptEv+0x1cc>
        }else if(a0 == THREAD_DISPATCH){
    80002404:	fa043703          	ld	a4,-96(s0)
    80002408:	01300793          	li	a5,19
    8000240c:	14f70863          	beq	a4,a5,8000255c <_ZN5RiscV20handleEcallInterruptEv+0x1f8>
        }else if(a0 == THREAD_JOIN){
    80002410:	fa043703          	ld	a4,-96(s0)
    80002414:	01400793          	li	a5,20
    80002418:	14f70e63          	beq	a4,a5,80002574 <_ZN5RiscV20handleEcallInterruptEv+0x210>
        }else if(a0 == SEM_OPEN){
    8000241c:	fa043703          	ld	a4,-96(s0)
    80002420:	02100793          	li	a5,33
    80002424:	16f70063          	beq	a4,a5,80002584 <_ZN5RiscV20handleEcallInterruptEv+0x220>
        }else if(a0 == SEM_CLOSE){
    80002428:	fa043703          	ld	a4,-96(s0)
    8000242c:	02200793          	li	a5,34
    80002430:	18f70263          	beq	a4,a5,800025b4 <_ZN5RiscV20handleEcallInterruptEv+0x250>
        }else if(a0 == SEM_WAIT){
    80002434:	fa043703          	ld	a4,-96(s0)
    80002438:	02300793          	li	a5,35
    8000243c:	18f70863          	beq	a4,a5,800025cc <_ZN5RiscV20handleEcallInterruptEv+0x268>
        }else if(a0 == SEM_SIGNAL){
    80002440:	fa043703          	ld	a4,-96(s0)
    80002444:	02400793          	li	a5,36
    80002448:	18f70e63          	beq	a4,a5,800025e4 <_ZN5RiscV20handleEcallInterruptEv+0x280>
        }else if(a0 == TIME_SLEEP){
    8000244c:	fa043703          	ld	a4,-96(s0)
    80002450:	03100793          	li	a5,49
    80002454:	1af70463          	beq	a4,a5,800025fc <_ZN5RiscV20handleEcallInterruptEv+0x298>
        }else if(a0 == GETC){
    80002458:	fa043703          	ld	a4,-96(s0)
    8000245c:	04100793          	li	a5,65
    80002460:	1cf70c63          	beq	a4,a5,80002638 <_ZN5RiscV20handleEcallInterruptEv+0x2d4>
        }else if(a0 == PUTC){
    80002464:	fa043703          	ld	a4,-96(s0)
    80002468:	04200793          	li	a5,66
    8000246c:	04f71a63          	bne	a4,a5,800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(c));
    80002470:	05843503          	ld	a0,88(s0)
            __putc(c);
    80002474:	0ff57513          	andi	a0,a0,255
    80002478:	00006097          	auipc	ra,0x6
    8000247c:	058080e7          	jalr	88(ra) # 800084d0 <__putc>
    80002480:	0400006f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
        __putc(scause + '0');
    80002484:	fd843503          	ld	a0,-40(s0)
    80002488:	0305051b          	addiw	a0,a0,48
    8000248c:	0ff57513          	andi	a0,a0,255
    80002490:	00006097          	auipc	ra,0x6
    80002494:	040080e7          	jalr	64(ra) # 800084d0 <__putc>
        __putc('\n');
    80002498:	00a00513          	li	a0,10
    8000249c:	00006097          	auipc	ra,0x6
    800024a0:	034080e7          	jalr	52(ra) # 800084d0 <__putc>
        while(true);
    800024a4:	0000006f          	j	800024a4 <_ZN5RiscV20handleEcallInterruptEv+0x140>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(num_of_blocks));
    800024a8:	05843503          	ld	a0,88(s0)
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(ret));
    800024ac:	06043483          	ld	s1,96(s0)
            *ret = (uint64) __mem_alloc(num_of_blocks * MEM_BLOCK_SIZE);
    800024b0:	00651513          	slli	a0,a0,0x6
    800024b4:	00006097          	auipc	ra,0x6
    800024b8:	ec4080e7          	jalr	-316(ra) # 80008378 <__mem_alloc>
    800024bc:	00a4b023          	sd	a0,0(s1)
        w_sepc(sepc);
    800024c0:	fd043783          	ld	a5,-48(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    800024c4:	14179073          	csrw	sepc,a5
        w_sstatus(sstatus);
    800024c8:	fc843783          	ld	a5,-56(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    800024cc:	10079073          	csrw	sstatus,a5
}
    800024d0:	05813083          	ld	ra,88(sp)
    800024d4:	05013403          	ld	s0,80(sp)
    800024d8:	04813483          	ld	s1,72(sp)
    800024dc:	06010113          	addi	sp,sp,96
    800024e0:	00008067          	ret
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(ptr));
    800024e4:	05843503          	ld	a0,88(s0)
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(ret));
    800024e8:	06043483          	ld	s1,96(s0)
            *ret = __mem_free(ptr);
    800024ec:	00006097          	auipc	ra,0x6
    800024f0:	dc0080e7          	jalr	-576(ra) # 800082ac <__mem_free>
    800024f4:	00a4b023          	sd	a0,0(s1)
    800024f8:	fc9ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(handle));
    800024fc:	05843503          	ld	a0,88(s0)
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(start_routine));
    80002500:	06043583          	ld	a1,96(s0)
            __asm__ volatile ("ld %0, 13*8(fp)" : "=r"(args));
    80002504:	06843603          	ld	a2,104(s0)
            __asm__ volatile ("ld %0, 14*8(fp)" : "=r"(stack));
    80002508:	07043683          	ld	a3,112(s0)
            __asm__ volatile ("ld %0, 15*8(fp)" : "=r"(ret));
    8000250c:	07843483          	ld	s1,120(s0)
            *ret = TCB::create_thread(handle, start_routine, args, stack) != nullptr ? 0 : -1;
    80002510:	fffff097          	auipc	ra,0xfffff
    80002514:	5fc080e7          	jalr	1532(ra) # 80001b0c <_ZN3TCB13create_threadEPPS_PFvPvES2_Pm>
    80002518:	00050863          	beqz	a0,80002528 <_ZN5RiscV20handleEcallInterruptEv+0x1c4>
    8000251c:	00000793          	li	a5,0
    80002520:	00f4a023          	sw	a5,0(s1)
    80002524:	f9dff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
    80002528:	fff00793          	li	a5,-1
    8000252c:	ff5ff06f          	j	80002520 <_ZN5RiscV20handleEcallInterruptEv+0x1bc>
            TCB::running->set_finished(true);
    80002530:	00009797          	auipc	a5,0x9
    80002534:	0b87b783          	ld	a5,184(a5) # 8000b5e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002538:	0007b483          	ld	s1,0(a5)
    void set_finished(bool f) { this->finished = f; }
    8000253c:	00100793          	li	a5,1
    80002540:	02f48a23          	sb	a5,52(s1)
            TCB::dispatch();
    80002544:	fffff097          	auipc	ra,0xfffff
    80002548:	718080e7          	jalr	1816(ra) # 80001c5c <_ZN3TCB8dispatchEv>
            __mem_free(temp);
    8000254c:	00048513          	mv	a0,s1
    80002550:	00006097          	auipc	ra,0x6
    80002554:	d5c080e7          	jalr	-676(ra) # 800082ac <__mem_free>
    80002558:	f69ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
            TCB::time_slice_counter = 0;
    8000255c:	00009797          	auipc	a5,0x9
    80002560:	07c7b783          	ld	a5,124(a5) # 8000b5d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002564:	0007b023          	sd	zero,0(a5)
            TCB::dispatch();
    80002568:	fffff097          	auipc	ra,0xfffff
    8000256c:	6f4080e7          	jalr	1780(ra) # 80001c5c <_ZN3TCB8dispatchEv>
    80002570:	f51ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(handle));
    80002574:	05843503          	ld	a0,88(s0)
            TCB::join(handle);
    80002578:	fffff097          	auipc	ra,0xfffff
    8000257c:	764080e7          	jalr	1892(ra) # 80001cdc <_ZN3TCB4joinEPS_>
    80002580:	f41ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(handle));
    80002584:	05843503          	ld	a0,88(s0)
            __asm__ volatile ("ld %0, 12*8(fp)" : "=r"(val));
    80002588:	06043583          	ld	a1,96(s0)
    8000258c:	0005859b          	sext.w	a1,a1
            __asm__ volatile ("ld %0, 13*8(fp)" : "=r"(ret));
    80002590:	06843483          	ld	s1,104(s0)
            if(sem::create_semaphore(handle, val)){
    80002594:	00000097          	auipc	ra,0x0
    80002598:	208080e7          	jalr	520(ra) # 8000279c <_ZN3sem16create_semaphoreEPPS_i>
    8000259c:	00050663          	beqz	a0,800025a8 <_ZN5RiscV20handleEcallInterruptEv+0x244>
                *ret = 0;
    800025a0:	0004a023          	sw	zero,0(s1)
    800025a4:	f1dff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
                *ret = -1;
    800025a8:	fff00793          	li	a5,-1
    800025ac:	00f4a023          	sw	a5,0(s1)
    800025b0:	f11ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(handle));
    800025b4:	05843503          	ld	a0,88(s0)
            __asm__ volatile("ld %0, 12*8(fp)" : "=r"(ret));
    800025b8:	06043483          	ld	s1,96(s0)
            *ret = handle->close();
    800025bc:	00000097          	auipc	ra,0x0
    800025c0:	42c080e7          	jalr	1068(ra) # 800029e8 <_ZN3sem5closeEv>
    800025c4:	00a4a023          	sw	a0,0(s1)
    800025c8:	ef9ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(handle));
    800025cc:	05843503          	ld	a0,88(s0)
            __asm__ volatile("ld %0, 12*8(fp)" : "=r"(ret));
    800025d0:	06043483          	ld	s1,96(s0)
            *ret = handle->wait();
    800025d4:	00000097          	auipc	ra,0x0
    800025d8:	2b4080e7          	jalr	692(ra) # 80002888 <_ZN3sem4waitEv>
    800025dc:	00a4a023          	sw	a0,0(s1)
    800025e0:	ee1ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(handle));
    800025e4:	05843503          	ld	a0,88(s0)
            __asm__ volatile("ld %0, 12*8(fp)" : "=r"(ret));
    800025e8:	06043483          	ld	s1,96(s0)
            *ret = handle->signal();
    800025ec:	00000097          	auipc	ra,0x0
    800025f0:	38c080e7          	jalr	908(ra) # 80002978 <_ZN3sem6signalEv>
    800025f4:	00a4a023          	sw	a0,0(s1)
    800025f8:	ec9ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
            __asm__ volatile("ld %0, 11*8(fp)" : "=r"(slice));
    800025fc:	05843603          	ld	a2,88(s0)
            if(slice > 0){
    80002600:	00061863          	bnez	a2,80002610 <_ZN5RiscV20handleEcallInterruptEv+0x2ac>
            TCB::dispatch();
    80002604:	fffff097          	auipc	ra,0xfffff
    80002608:	658080e7          	jalr	1624(ra) # 80001c5c <_ZN3TCB8dispatchEv>
    8000260c:	eb5ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>
                TCB::running->set_sleeping(true);
    80002610:	00009797          	auipc	a5,0x9
    80002614:	fd87b783          	ld	a5,-40(a5) # 8000b5e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    80002618:	0007b583          	ld	a1,0(a5)
    void set_sleeping(bool s) { this->sleeping = s; }
    8000261c:	00100793          	li	a5,1
    80002620:	02f58b23          	sb	a5,54(a1)
                RiscV::list_of_sleeping_threads.put(TCB::running, slice);
    80002624:	00009517          	auipc	a0,0x9
    80002628:	03c50513          	addi	a0,a0,60 # 8000b660 <_ZN5RiscV24list_of_sleeping_threadsE>
    8000262c:	fffff097          	auipc	ra,0xfffff
    80002630:	320080e7          	jalr	800(ra) # 8000194c <_ZN19SleepingThreadsList3putEP3TCBm>
    80002634:	fd1ff06f          	j	80002604 <_ZN5RiscV20handleEcallInterruptEv+0x2a0>
            __asm__ volatile ("ld %0, 11*8(fp)" : "=r"(ret));
    80002638:	05843483          	ld	s1,88(s0)
            *ret = __getc();
    8000263c:	00006097          	auipc	ra,0x6
    80002640:	ed0080e7          	jalr	-304(ra) # 8000850c <__getc>
    80002644:	00a48023          	sb	a0,0(s1)
    80002648:	e79ff06f          	j	800024c0 <_ZN5RiscV20handleEcallInterruptEv+0x15c>

000000008000264c <_ZN5RiscV20handleTimerInterruptEv>:
void RiscV::handleTimerInterrupt() {
    8000264c:	fb010113          	addi	sp,sp,-80
    80002650:	04113423          	sd	ra,72(sp)
    80002654:	04813023          	sd	s0,64(sp)
    80002658:	02913c23          	sd	s1,56(sp)
    8000265c:	05010413          	addi	s0,sp,80
    time_t volatile curr = RiscV::list_of_sleeping_threads.peek_time_first();
    80002660:	00009517          	auipc	a0,0x9
    80002664:	00050513          	mv	a0,a0
    80002668:	fffff097          	auipc	ra,0xfffff
    8000266c:	23c080e7          	jalr	572(ra) # 800018a4 <_ZN19SleepingThreadsList15peek_time_firstEv>
    80002670:	fca43c23          	sd	a0,-40(s0)
    if(curr != -1UL){
    80002674:	fd843703          	ld	a4,-40(s0)
    80002678:	fff00793          	li	a5,-1
    8000267c:	04f71463          	bne	a4,a5,800026c4 <_ZN5RiscV20handleTimerInterruptEv+0x78>
}

inline void RiscV::mc_sip(uint64 mask) {
    __asm__ volatile ("csrc sip, %[mask]" : : [mask] "r"(mask));
    80002680:	00200793          	li	a5,2
    80002684:	1447b073          	csrc	sip,a5
    TCB::time_slice_counter++;
    80002688:	00009717          	auipc	a4,0x9
    8000268c:	f5073703          	ld	a4,-176(a4) # 8000b5d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002690:	00073783          	ld	a5,0(a4)
    80002694:	00178793          	addi	a5,a5,1
    80002698:	00f73023          	sd	a5,0(a4)
    if(TCB::time_slice_counter >= TCB::running->get_time_slice()){
    8000269c:	00009717          	auipc	a4,0x9
    800026a0:	f4c73703          	ld	a4,-180(a4) # 8000b5e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800026a4:	00073703          	ld	a4,0(a4)
    uint64 get_time_slice() const { return time_slice; }
    800026a8:	02873703          	ld	a4,40(a4)
    800026ac:	04e7f663          	bgeu	a5,a4,800026f8 <_ZN5RiscV20handleTimerInterruptEv+0xac>
}
    800026b0:	04813083          	ld	ra,72(sp)
    800026b4:	04013403          	ld	s0,64(sp)
    800026b8:	03813483          	ld	s1,56(sp)
    800026bc:	05010113          	addi	sp,sp,80
    800026c0:	00008067          	ret
        RiscV::list_of_sleeping_threads.dec_time_first();
    800026c4:	00009497          	auipc	s1,0x9
    800026c8:	f9c48493          	addi	s1,s1,-100 # 8000b660 <_ZN5RiscV24list_of_sleeping_threadsE>
    800026cc:	00048513          	mv	a0,s1
    800026d0:	fffff097          	auipc	ra,0xfffff
    800026d4:	1a8080e7          	jalr	424(ra) # 80001878 <_ZN19SleepingThreadsList14dec_time_firstEv>
        if(RiscV::list_of_sleeping_threads.peek_time_first() <= 0){
    800026d8:	00048513          	mv	a0,s1
    800026dc:	fffff097          	auipc	ra,0xfffff
    800026e0:	1c8080e7          	jalr	456(ra) # 800018a4 <_ZN19SleepingThreadsList15peek_time_firstEv>
    800026e4:	f8051ee3          	bnez	a0,80002680 <_ZN5RiscV20handleTimerInterruptEv+0x34>
            RiscV::list_of_sleeping_threads.remove_finished();
    800026e8:	00048513          	mv	a0,s1
    800026ec:	fffff097          	auipc	ra,0xfffff
    800026f0:	1e4080e7          	jalr	484(ra) # 800018d0 <_ZN19SleepingThreadsList15remove_finishedEv>
    800026f4:	f8dff06f          	j	80002680 <_ZN5RiscV20handleTimerInterruptEv+0x34>
    __asm__ volatile ("csrr %[sepc], sepc" : [sepc] "=r"(sepc));
    800026f8:	141027f3          	csrr	a5,sepc
    800026fc:	fcf43823          	sd	a5,-48(s0)
    return sepc;
    80002700:	fd043783          	ld	a5,-48(s0)
        uint64 volatile sepc = RiscV::r_sepc();
    80002704:	faf43c23          	sd	a5,-72(s0)
    __asm__ volatile ("csrr %[sstatus], sstatus" : [sstatus] "=r"(sstatus));
    80002708:	100027f3          	csrr	a5,sstatus
    8000270c:	fcf43423          	sd	a5,-56(s0)
    return sstatus;
    80002710:	fc843783          	ld	a5,-56(s0)
        uint64 volatile sstatus = RiscV::r_sstatus();
    80002714:	fcf43023          	sd	a5,-64(s0)
        TCB::time_slice_counter = 0;
    80002718:	00009797          	auipc	a5,0x9
    8000271c:	ec07b783          	ld	a5,-320(a5) # 8000b5d8 <_GLOBAL_OFFSET_TABLE_+0x10>
    80002720:	0007b023          	sd	zero,0(a5)
        TCB::dispatch();
    80002724:	fffff097          	auipc	ra,0xfffff
    80002728:	538080e7          	jalr	1336(ra) # 80001c5c <_ZN3TCB8dispatchEv>
        w_sepc(sepc);
    8000272c:	fb843783          	ld	a5,-72(s0)
    __asm__ volatile ("csrw sepc, %[sepc]" : : [sepc] "r"(sepc));
    80002730:	14179073          	csrw	sepc,a5
        w_sstatus(sstatus);
    80002734:	fc043783          	ld	a5,-64(s0)
    __asm__ volatile ("csrw sstatus, %[sstatus]" : : [sstatus] "r"(sstatus));
    80002738:	10079073          	csrw	sstatus,a5
}
    8000273c:	f75ff06f          	j	800026b0 <_ZN5RiscV20handleTimerInterruptEv+0x64>

0000000080002740 <_ZN5RiscV23handleExternalInterruptEv>:
void RiscV::handleExternalInterrupt() {
    80002740:	ff010113          	addi	sp,sp,-16
    80002744:	00113423          	sd	ra,8(sp)
    80002748:	00813023          	sd	s0,0(sp)
    8000274c:	01010413          	addi	s0,sp,16
    console_handler();
    80002750:	00006097          	auipc	ra,0x6
    80002754:	df4080e7          	jalr	-524(ra) # 80008544 <console_handler>
}
    80002758:	00813083          	ld	ra,8(sp)
    8000275c:	00013403          	ld	s0,0(sp)
    80002760:	01010113          	addi	sp,sp,16
    80002764:	00008067          	ret

0000000080002768 <_GLOBAL__sub_I__ZN5RiscV9user_modeE>:
    80002768:	ff010113          	addi	sp,sp,-16
    8000276c:	00113423          	sd	ra,8(sp)
    80002770:	00813023          	sd	s0,0(sp)
    80002774:	01010413          	addi	s0,sp,16
    80002778:	000105b7          	lui	a1,0x10
    8000277c:	fff58593          	addi	a1,a1,-1 # ffff <_entry-0x7fff0001>
    80002780:	00100513          	li	a0,1
    80002784:	00000097          	auipc	ra,0x0
    80002788:	b58080e7          	jalr	-1192(ra) # 800022dc <_Z41__static_initialization_and_destruction_0ii>
    8000278c:	00813083          	ld	ra,8(sp)
    80002790:	00013403          	ld	s0,0(sp)
    80002794:	01010113          	addi	sp,sp,16
    80002798:	00008067          	ret

000000008000279c <_ZN3sem16create_semaphoreEPPS_i>:
#include "../h/sem.hpp"

sem* sem::create_semaphore(sem** handle, int val) {
    8000279c:	fe010113          	addi	sp,sp,-32
    800027a0:	00113c23          	sd	ra,24(sp)
    800027a4:	00813823          	sd	s0,16(sp)
    800027a8:	00913423          	sd	s1,8(sp)
    800027ac:	01213023          	sd	s2,0(sp)
    800027b0:	02010413          	addi	s0,sp,32
    800027b4:	00050913          	mv	s2,a0
    800027b8:	00058493          	mv	s1,a1
    sem* temp = new sem(val+1);
    800027bc:	01800513          	li	a0,24
    800027c0:	fffff097          	auipc	ra,0xfffff
    800027c4:	610080e7          	jalr	1552(ra) # 80001dd0 <_Znwm>
    800027c8:	0014849b          	addiw	s1,s1,1

    TCB* peek_first();
    void add_last(TCB* tcb);
    TCB* remove_first();
public:
    explicit sem(int val) : closed(false), val(val), num_of_blocked_threads(0), head(nullptr) {}
    800027cc:	00050023          	sb	zero,0(a0) # 8000b660 <_ZN5RiscV24list_of_sleeping_threadsE>
    800027d0:	00952223          	sw	s1,4(a0)
    800027d4:	00052423          	sw	zero,8(a0)
    800027d8:	00053823          	sd	zero,16(a0)
    *handle = temp;
    800027dc:	00a93023          	sd	a0,0(s2)

    return temp;
}
    800027e0:	01813083          	ld	ra,24(sp)
    800027e4:	01013403          	ld	s0,16(sp)
    800027e8:	00813483          	ld	s1,8(sp)
    800027ec:	00013903          	ld	s2,0(sp)
    800027f0:	02010113          	addi	sp,sp,32
    800027f4:	00008067          	ret

00000000800027f8 <_ZN3sem10peek_firstEv>:
    }

    return 0;
}

TCB* sem::peek_first() {
    800027f8:	ff010113          	addi	sp,sp,-16
    800027fc:	00813423          	sd	s0,8(sp)
    80002800:	01010413          	addi	s0,sp,16
    return head ? head->tcb : nullptr;
    80002804:	01053503          	ld	a0,16(a0)
    80002808:	00050463          	beqz	a0,80002810 <_ZN3sem10peek_firstEv+0x18>
    8000280c:	00053503          	ld	a0,0(a0)
}
    80002810:	00813403          	ld	s0,8(sp)
    80002814:	01010113          	addi	sp,sp,16
    80002818:	00008067          	ret

000000008000281c <_ZN3sem8add_lastEP3TCB>:

void sem::add_last(TCB* tcb) {
    8000281c:	fe010113          	addi	sp,sp,-32
    80002820:	00113c23          	sd	ra,24(sp)
    80002824:	00813823          	sd	s0,16(sp)
    80002828:	00913423          	sd	s1,8(sp)
    8000282c:	01213023          	sd	s2,0(sp)
    80002830:	02010413          	addi	s0,sp,32
    80002834:	00050493          	mv	s1,a0
    80002838:	00058913          	mv	s2,a1
    Node* new_node = new Node;
    8000283c:	01000513          	li	a0,16
    80002840:	fffff097          	auipc	ra,0xfffff
    80002844:	590080e7          	jalr	1424(ra) # 80001dd0 <_Znwm>
    new_node->tcb = tcb;
    80002848:	01253023          	sd	s2,0(a0)
    new_node->next = nullptr;
    8000284c:	00053423          	sd	zero,8(a0)

    if(!head){
    80002850:	0104b783          	ld	a5,16(s1)
    80002854:	02078663          	beqz	a5,80002880 <_ZN3sem8add_lastEP3TCB+0x64>
        head = new_node;
        return;
    }

    Node* current = head;
    while(current->next != nullptr) current = current->next;
    80002858:	00078713          	mv	a4,a5
    8000285c:	0087b783          	ld	a5,8(a5)
    80002860:	fe079ce3          	bnez	a5,80002858 <_ZN3sem8add_lastEP3TCB+0x3c>

    current->next = new_node;
    80002864:	00a73423          	sd	a0,8(a4)
}
    80002868:	01813083          	ld	ra,24(sp)
    8000286c:	01013403          	ld	s0,16(sp)
    80002870:	00813483          	ld	s1,8(sp)
    80002874:	00013903          	ld	s2,0(sp)
    80002878:	02010113          	addi	sp,sp,32
    8000287c:	00008067          	ret
        head = new_node;
    80002880:	00a4b823          	sd	a0,16(s1)
        return;
    80002884:	fe5ff06f          	j	80002868 <_ZN3sem8add_lastEP3TCB+0x4c>

0000000080002888 <_ZN3sem4waitEv>:
int sem::wait() {
    80002888:	fe010113          	addi	sp,sp,-32
    8000288c:	00113c23          	sd	ra,24(sp)
    80002890:	00813823          	sd	s0,16(sp)
    80002894:	00913423          	sd	s1,8(sp)
    80002898:	02010413          	addi	s0,sp,32
    8000289c:	00050493          	mv	s1,a0
    val--;
    800028a0:	00452783          	lw	a5,4(a0)
    800028a4:	fff7879b          	addiw	a5,a5,-1
    800028a8:	00f52223          	sw	a5,4(a0)
    if(val < 0){
    800028ac:	02079713          	slli	a4,a5,0x20
    800028b0:	02074463          	bltz	a4,800028d8 <_ZN3sem4waitEv+0x50>
    if(!closed){
    800028b4:	0004c783          	lbu	a5,0(s1)
    800028b8:	06078263          	beqz	a5,8000291c <_ZN3sem4waitEv+0x94>
        if(num_of_blocked_threads == 0){
    800028bc:	0084a503          	lw	a0,8(s1)
    800028c0:	04051663          	bnez	a0,8000290c <_ZN3sem4waitEv+0x84>
}
    800028c4:	01813083          	ld	ra,24(sp)
    800028c8:	01013403          	ld	s0,16(sp)
    800028cc:	00813483          	ld	s1,8(sp)
    800028d0:	02010113          	addi	sp,sp,32
    800028d4:	00008067          	ret
        num_of_blocked_threads++;
    800028d8:	00852783          	lw	a5,8(a0)
    800028dc:	0017879b          	addiw	a5,a5,1
    800028e0:	00f52423          	sw	a5,8(a0)
        TCB::running->set_blocked(true);
    800028e4:	00009797          	auipc	a5,0x9
    800028e8:	d047b783          	ld	a5,-764(a5) # 8000b5e8 <_GLOBAL_OFFSET_TABLE_+0x20>
    800028ec:	0007b583          	ld	a1,0(a5)
    void set_blocked(bool b) { this->blocked = b; }
    800028f0:	00100793          	li	a5,1
    800028f4:	02f58aa3          	sb	a5,53(a1)
        add_last(TCB::running);
    800028f8:	00000097          	auipc	ra,0x0
    800028fc:	f24080e7          	jalr	-220(ra) # 8000281c <_ZN3sem8add_lastEP3TCB>
        thread_dispatch();
    80002900:	fffff097          	auipc	ra,0xfffff
    80002904:	ba8080e7          	jalr	-1112(ra) # 800014a8 <_Z15thread_dispatchv>
    80002908:	fadff06f          	j	800028b4 <_ZN3sem4waitEv+0x2c>
            num_of_blocked_threads--;
    8000290c:	fff5051b          	addiw	a0,a0,-1
    80002910:	00a4a423          	sw	a0,8(s1)
            return -1;
    80002914:	fff00513          	li	a0,-1
    80002918:	fadff06f          	j	800028c4 <_ZN3sem4waitEv+0x3c>
        return 0;
    8000291c:	00000513          	li	a0,0
    80002920:	fa5ff06f          	j	800028c4 <_ZN3sem4waitEv+0x3c>

0000000080002924 <_ZN3sem12remove_firstEv>:

TCB* sem::remove_first() {
    80002924:	fe010113          	addi	sp,sp,-32
    80002928:	00113c23          	sd	ra,24(sp)
    8000292c:	00813823          	sd	s0,16(sp)
    80002930:	00913423          	sd	s1,8(sp)
    80002934:	02010413          	addi	s0,sp,32
    80002938:	00050793          	mv	a5,a0
    if(!head) return nullptr;
    8000293c:	01053503          	ld	a0,16(a0)
    80002940:	02050863          	beqz	a0,80002970 <_ZN3sem12remove_firstEv+0x4c>

    Node* temp = head;
    TCB* tcb = temp->tcb;
    80002944:	00053483          	ld	s1,0(a0)
    head = head->next;
    80002948:	00853703          	ld	a4,8(a0)
    8000294c:	00e7b823          	sd	a4,16(a5)
    delete temp;
    80002950:	fffff097          	auipc	ra,0xfffff
    80002954:	4d0080e7          	jalr	1232(ra) # 80001e20 <_ZdlPv>

    return tcb;
}
    80002958:	00048513          	mv	a0,s1
    8000295c:	01813083          	ld	ra,24(sp)
    80002960:	01013403          	ld	s0,16(sp)
    80002964:	00813483          	ld	s1,8(sp)
    80002968:	02010113          	addi	sp,sp,32
    8000296c:	00008067          	ret
    if(!head) return nullptr;
    80002970:	00050493          	mv	s1,a0
    80002974:	fe5ff06f          	j	80002958 <_ZN3sem12remove_firstEv+0x34>

0000000080002978 <_ZN3sem6signalEv>:
    if(closed) return -1;
    80002978:	00054783          	lbu	a5,0(a0)
    8000297c:	06079263          	bnez	a5,800029e0 <_ZN3sem6signalEv+0x68>
    val++;
    80002980:	00452783          	lw	a5,4(a0)
    80002984:	0017879b          	addiw	a5,a5,1
    80002988:	0007871b          	sext.w	a4,a5
    8000298c:	00f52223          	sw	a5,4(a0)
    if(val <= 0){
    80002990:	00e05663          	blez	a4,8000299c <_ZN3sem6signalEv+0x24>
    return 0;
    80002994:	00000513          	li	a0,0
}
    80002998:	00008067          	ret
int sem::signal() {
    8000299c:	ff010113          	addi	sp,sp,-16
    800029a0:	00113423          	sd	ra,8(sp)
    800029a4:	00813023          	sd	s0,0(sp)
    800029a8:	01010413          	addi	s0,sp,16
        num_of_blocked_threads--;
    800029ac:	00852783          	lw	a5,8(a0)
    800029b0:	fff7879b          	addiw	a5,a5,-1
    800029b4:	00f52423          	sw	a5,8(a0)
        TCB* tcb = remove_first();
    800029b8:	00000097          	auipc	ra,0x0
    800029bc:	f6c080e7          	jalr	-148(ra) # 80002924 <_ZN3sem12remove_firstEv>
    800029c0:	02050aa3          	sb	zero,53(a0)
        Scheduler::put(tcb);
    800029c4:	00000097          	auipc	ra,0x0
    800029c8:	0f0080e7          	jalr	240(ra) # 80002ab4 <_ZN9Scheduler3putEP3TCB>
    return 0;
    800029cc:	00000513          	li	a0,0
}
    800029d0:	00813083          	ld	ra,8(sp)
    800029d4:	00013403          	ld	s0,0(sp)
    800029d8:	01010113          	addi	sp,sp,16
    800029dc:	00008067          	ret
    if(closed) return -1;
    800029e0:	fff00513          	li	a0,-1
    800029e4:	00008067          	ret

00000000800029e8 <_ZN3sem5closeEv>:
int sem::close(){
    800029e8:	fe010113          	addi	sp,sp,-32
    800029ec:	00113c23          	sd	ra,24(sp)
    800029f0:	00813823          	sd	s0,16(sp)
    800029f4:	00913423          	sd	s1,8(sp)
    800029f8:	02010413          	addi	s0,sp,32
    800029fc:	00050493          	mv	s1,a0
    closed = true;
    80002a00:	00100793          	li	a5,1
    80002a04:	00f50023          	sb	a5,0(a0)
    while(peek_first()){
    80002a08:	00048513          	mv	a0,s1
    80002a0c:	00000097          	auipc	ra,0x0
    80002a10:	dec080e7          	jalr	-532(ra) # 800027f8 <_ZN3sem10peek_firstEv>
    80002a14:	02050063          	beqz	a0,80002a34 <_ZN3sem5closeEv+0x4c>
        TCB* tcb = remove_first();
    80002a18:	00048513          	mv	a0,s1
    80002a1c:	00000097          	auipc	ra,0x0
    80002a20:	f08080e7          	jalr	-248(ra) # 80002924 <_ZN3sem12remove_firstEv>
    80002a24:	02050aa3          	sb	zero,53(a0)
        Scheduler::put(tcb);
    80002a28:	00000097          	auipc	ra,0x0
    80002a2c:	08c080e7          	jalr	140(ra) # 80002ab4 <_ZN9Scheduler3putEP3TCB>
    while(peek_first()){
    80002a30:	fd9ff06f          	j	80002a08 <_ZN3sem5closeEv+0x20>
}
    80002a34:	00000513          	li	a0,0
    80002a38:	01813083          	ld	ra,24(sp)
    80002a3c:	01013403          	ld	s0,16(sp)
    80002a40:	00813483          	ld	s1,8(sp)
    80002a44:	02010113          	addi	sp,sp,32
    80002a48:	00008067          	ret

0000000080002a4c <_ZN9Scheduler3getEv>:
#include "../lib/mem.h"

Scheduler::Node* Scheduler::head = nullptr;
Scheduler::Node* Scheduler::tail = nullptr;

TCB* Scheduler::get() {
    80002a4c:	fe010113          	addi	sp,sp,-32
    80002a50:	00113c23          	sd	ra,24(sp)
    80002a54:	00813823          	sd	s0,16(sp)
    80002a58:	00913423          	sd	s1,8(sp)
    80002a5c:	02010413          	addi	s0,sp,32
    if(!head) return nullptr;
    80002a60:	00009517          	auipc	a0,0x9
    80002a64:	c1853503          	ld	a0,-1000(a0) # 8000b678 <_ZN9Scheduler4headE>
    80002a68:	04050263          	beqz	a0,80002aac <_ZN9Scheduler3getEv+0x60>

    Node* res = head;
    head = head->next;
    80002a6c:	00853783          	ld	a5,8(a0)
    80002a70:	00009717          	auipc	a4,0x9
    80002a74:	c0f73423          	sd	a5,-1016(a4) # 8000b678 <_ZN9Scheduler4headE>
    if(!head) tail = nullptr;
    80002a78:	02078463          	beqz	a5,80002aa0 <_ZN9Scheduler3getEv+0x54>
    TCB* tcb = res->tcb;
    80002a7c:	00053483          	ld	s1,0(a0)
    __mem_free(res);
    80002a80:	00006097          	auipc	ra,0x6
    80002a84:	82c080e7          	jalr	-2004(ra) # 800082ac <__mem_free>

    return tcb;
}
    80002a88:	00048513          	mv	a0,s1
    80002a8c:	01813083          	ld	ra,24(sp)
    80002a90:	01013403          	ld	s0,16(sp)
    80002a94:	00813483          	ld	s1,8(sp)
    80002a98:	02010113          	addi	sp,sp,32
    80002a9c:	00008067          	ret
    if(!head) tail = nullptr;
    80002aa0:	00009797          	auipc	a5,0x9
    80002aa4:	be07b023          	sd	zero,-1056(a5) # 8000b680 <_ZN9Scheduler4tailE>
    80002aa8:	fd5ff06f          	j	80002a7c <_ZN9Scheduler3getEv+0x30>
    if(!head) return nullptr;
    80002aac:	00050493          	mv	s1,a0
    80002ab0:	fd9ff06f          	j	80002a88 <_ZN9Scheduler3getEv+0x3c>

0000000080002ab4 <_ZN9Scheduler3putEP3TCB>:

void Scheduler::put(TCB *tcb) {
    80002ab4:	fe010113          	addi	sp,sp,-32
    80002ab8:	00113c23          	sd	ra,24(sp)
    80002abc:	00813823          	sd	s0,16(sp)
    80002ac0:	00913423          	sd	s1,8(sp)
    80002ac4:	02010413          	addi	s0,sp,32
    80002ac8:	00050493          	mv	s1,a0
    Node* new_node = (Node*) __mem_alloc(sizeof(Node));
    80002acc:	01000513          	li	a0,16
    80002ad0:	00006097          	auipc	ra,0x6
    80002ad4:	8a8080e7          	jalr	-1880(ra) # 80008378 <__mem_alloc>
    new_node->tcb = tcb;
    80002ad8:	00953023          	sd	s1,0(a0)
    new_node->next = nullptr;
    80002adc:	00053423          	sd	zero,8(a0)

    if(!head) head =  new_node;
    80002ae0:	00009797          	auipc	a5,0x9
    80002ae4:	b987b783          	ld	a5,-1128(a5) # 8000b678 <_ZN9Scheduler4headE>
    80002ae8:	02078863          	beqz	a5,80002b18 <_ZN9Scheduler3putEP3TCB+0x64>
    if(tail) tail->next = new_node;
    80002aec:	00009797          	auipc	a5,0x9
    80002af0:	b947b783          	ld	a5,-1132(a5) # 8000b680 <_ZN9Scheduler4tailE>
    80002af4:	00078463          	beqz	a5,80002afc <_ZN9Scheduler3putEP3TCB+0x48>
    80002af8:	00a7b423          	sd	a0,8(a5)
    tail = new_node;
    80002afc:	00009797          	auipc	a5,0x9
    80002b00:	b8a7b223          	sd	a0,-1148(a5) # 8000b680 <_ZN9Scheduler4tailE>
    80002b04:	01813083          	ld	ra,24(sp)
    80002b08:	01013403          	ld	s0,16(sp)
    80002b0c:	00813483          	ld	s1,8(sp)
    80002b10:	02010113          	addi	sp,sp,32
    80002b14:	00008067          	ret
    if(!head) head =  new_node;
    80002b18:	00009797          	auipc	a5,0x9
    80002b1c:	b6a7b023          	sd	a0,-1184(a5) # 8000b678 <_ZN9Scheduler4headE>
    80002b20:	fcdff06f          	j	80002aec <_ZN9Scheduler3putEP3TCB+0x38>

0000000080002b24 <_ZL16producerKeyboardPv>:
    sem_t wait;
};

static volatile int threadEnd = 0;

static void producerKeyboard(void *arg) {
    80002b24:	fe010113          	addi	sp,sp,-32
    80002b28:	00113c23          	sd	ra,24(sp)
    80002b2c:	00813823          	sd	s0,16(sp)
    80002b30:	00913423          	sd	s1,8(sp)
    80002b34:	01213023          	sd	s2,0(sp)
    80002b38:	02010413          	addi	s0,sp,32
    80002b3c:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80002b40:	00000913          	li	s2,0
    80002b44:	00c0006f          	j	80002b50 <_ZL16producerKeyboardPv+0x2c>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002b48:	fffff097          	auipc	ra,0xfffff
    80002b4c:	960080e7          	jalr	-1696(ra) # 800014a8 <_Z15thread_dispatchv>
    while ((key = getc()) != 0x1b) {
    80002b50:	fffff097          	auipc	ra,0xfffff
    80002b54:	ab4080e7          	jalr	-1356(ra) # 80001604 <_Z4getcv>
    80002b58:	0005059b          	sext.w	a1,a0
    80002b5c:	01b00793          	li	a5,27
    80002b60:	02f58a63          	beq	a1,a5,80002b94 <_ZL16producerKeyboardPv+0x70>
        data->buffer->put(key);
    80002b64:	0084b503          	ld	a0,8(s1)
    80002b68:	00003097          	auipc	ra,0x3
    80002b6c:	400080e7          	jalr	1024(ra) # 80005f68 <_ZN6Buffer3putEi>
        i++;
    80002b70:	0019071b          	addiw	a4,s2,1
    80002b74:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002b78:	0004a683          	lw	a3,0(s1)
    80002b7c:	0026979b          	slliw	a5,a3,0x2
    80002b80:	00d787bb          	addw	a5,a5,a3
    80002b84:	0017979b          	slliw	a5,a5,0x1
    80002b88:	02f767bb          	remw	a5,a4,a5
    80002b8c:	fc0792e3          	bnez	a5,80002b50 <_ZL16producerKeyboardPv+0x2c>
    80002b90:	fb9ff06f          	j	80002b48 <_ZL16producerKeyboardPv+0x24>
        }
    }

    threadEnd = 1;
    80002b94:	00100793          	li	a5,1
    80002b98:	00009717          	auipc	a4,0x9
    80002b9c:	aef72823          	sw	a5,-1296(a4) # 8000b688 <_ZL9threadEnd>
    data->buffer->put('!');
    80002ba0:	02100593          	li	a1,33
    80002ba4:	0084b503          	ld	a0,8(s1)
    80002ba8:	00003097          	auipc	ra,0x3
    80002bac:	3c0080e7          	jalr	960(ra) # 80005f68 <_ZN6Buffer3putEi>

    sem_signal(data->wait);
    80002bb0:	0104b503          	ld	a0,16(s1)
    80002bb4:	fffff097          	auipc	ra,0xfffff
    80002bb8:	9ec080e7          	jalr	-1556(ra) # 800015a0 <_Z10sem_signalP3sem>
}
    80002bbc:	01813083          	ld	ra,24(sp)
    80002bc0:	01013403          	ld	s0,16(sp)
    80002bc4:	00813483          	ld	s1,8(sp)
    80002bc8:	00013903          	ld	s2,0(sp)
    80002bcc:	02010113          	addi	sp,sp,32
    80002bd0:	00008067          	ret

0000000080002bd4 <_ZL8producerPv>:

static void producer(void *arg) {
    80002bd4:	fe010113          	addi	sp,sp,-32
    80002bd8:	00113c23          	sd	ra,24(sp)
    80002bdc:	00813823          	sd	s0,16(sp)
    80002be0:	00913423          	sd	s1,8(sp)
    80002be4:	01213023          	sd	s2,0(sp)
    80002be8:	02010413          	addi	s0,sp,32
    80002bec:	00050493          	mv	s1,a0
    struct thread_data *data = (struct thread_data *) arg;
    int i = 0;
    80002bf0:	00000913          	li	s2,0
    80002bf4:	00c0006f          	j	80002c00 <_ZL8producerPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            thread_dispatch();
    80002bf8:	fffff097          	auipc	ra,0xfffff
    80002bfc:	8b0080e7          	jalr	-1872(ra) # 800014a8 <_Z15thread_dispatchv>
    while (!threadEnd) {
    80002c00:	00009797          	auipc	a5,0x9
    80002c04:	a887a783          	lw	a5,-1400(a5) # 8000b688 <_ZL9threadEnd>
    80002c08:	02079e63          	bnez	a5,80002c44 <_ZL8producerPv+0x70>
        data->buffer->put(data->id + '0');
    80002c0c:	0004a583          	lw	a1,0(s1)
    80002c10:	0305859b          	addiw	a1,a1,48
    80002c14:	0084b503          	ld	a0,8(s1)
    80002c18:	00003097          	auipc	ra,0x3
    80002c1c:	350080e7          	jalr	848(ra) # 80005f68 <_ZN6Buffer3putEi>
        i++;
    80002c20:	0019071b          	addiw	a4,s2,1
    80002c24:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80002c28:	0004a683          	lw	a3,0(s1)
    80002c2c:	0026979b          	slliw	a5,a3,0x2
    80002c30:	00d787bb          	addw	a5,a5,a3
    80002c34:	0017979b          	slliw	a5,a5,0x1
    80002c38:	02f767bb          	remw	a5,a4,a5
    80002c3c:	fc0792e3          	bnez	a5,80002c00 <_ZL8producerPv+0x2c>
    80002c40:	fb9ff06f          	j	80002bf8 <_ZL8producerPv+0x24>
        }
    }

    sem_signal(data->wait);
    80002c44:	0104b503          	ld	a0,16(s1)
    80002c48:	fffff097          	auipc	ra,0xfffff
    80002c4c:	958080e7          	jalr	-1704(ra) # 800015a0 <_Z10sem_signalP3sem>
}
    80002c50:	01813083          	ld	ra,24(sp)
    80002c54:	01013403          	ld	s0,16(sp)
    80002c58:	00813483          	ld	s1,8(sp)
    80002c5c:	00013903          	ld	s2,0(sp)
    80002c60:	02010113          	addi	sp,sp,32
    80002c64:	00008067          	ret

0000000080002c68 <_ZL8consumerPv>:

static void consumer(void *arg) {
    80002c68:	fd010113          	addi	sp,sp,-48
    80002c6c:	02113423          	sd	ra,40(sp)
    80002c70:	02813023          	sd	s0,32(sp)
    80002c74:	00913c23          	sd	s1,24(sp)
    80002c78:	01213823          	sd	s2,16(sp)
    80002c7c:	01313423          	sd	s3,8(sp)
    80002c80:	03010413          	addi	s0,sp,48
    80002c84:	00050913          	mv	s2,a0
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    80002c88:	00000993          	li	s3,0
    80002c8c:	01c0006f          	j	80002ca8 <_ZL8consumerPv+0x40>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            thread_dispatch();
    80002c90:	fffff097          	auipc	ra,0xfffff
    80002c94:	818080e7          	jalr	-2024(ra) # 800014a8 <_Z15thread_dispatchv>
    80002c98:	0500006f          	j	80002ce8 <_ZL8consumerPv+0x80>
        }

        if (i % 80 == 0) {
            putc('\n');
    80002c9c:	00a00513          	li	a0,10
    80002ca0:	fffff097          	auipc	ra,0xfffff
    80002ca4:	998080e7          	jalr	-1640(ra) # 80001638 <_Z4putcc>
    while (!threadEnd) {
    80002ca8:	00009797          	auipc	a5,0x9
    80002cac:	9e07a783          	lw	a5,-1568(a5) # 8000b688 <_ZL9threadEnd>
    80002cb0:	06079063          	bnez	a5,80002d10 <_ZL8consumerPv+0xa8>
        int key = data->buffer->get();
    80002cb4:	00893503          	ld	a0,8(s2)
    80002cb8:	00003097          	auipc	ra,0x3
    80002cbc:	340080e7          	jalr	832(ra) # 80005ff8 <_ZN6Buffer3getEv>
        i++;
    80002cc0:	0019849b          	addiw	s1,s3,1
    80002cc4:	0004899b          	sext.w	s3,s1
        putc(key);
    80002cc8:	0ff57513          	andi	a0,a0,255
    80002ccc:	fffff097          	auipc	ra,0xfffff
    80002cd0:	96c080e7          	jalr	-1684(ra) # 80001638 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    80002cd4:	00092703          	lw	a4,0(s2)
    80002cd8:	0027179b          	slliw	a5,a4,0x2
    80002cdc:	00e787bb          	addw	a5,a5,a4
    80002ce0:	02f4e7bb          	remw	a5,s1,a5
    80002ce4:	fa0786e3          	beqz	a5,80002c90 <_ZL8consumerPv+0x28>
        if (i % 80 == 0) {
    80002ce8:	05000793          	li	a5,80
    80002cec:	02f4e4bb          	remw	s1,s1,a5
    80002cf0:	fa049ce3          	bnez	s1,80002ca8 <_ZL8consumerPv+0x40>
    80002cf4:	fa9ff06f          	j	80002c9c <_ZL8consumerPv+0x34>
        }
    }

    while (data->buffer->getCnt() > 0) {
        int key = data->buffer->get();
    80002cf8:	00893503          	ld	a0,8(s2)
    80002cfc:	00003097          	auipc	ra,0x3
    80002d00:	2fc080e7          	jalr	764(ra) # 80005ff8 <_ZN6Buffer3getEv>
        putc(key);
    80002d04:	0ff57513          	andi	a0,a0,255
    80002d08:	fffff097          	auipc	ra,0xfffff
    80002d0c:	930080e7          	jalr	-1744(ra) # 80001638 <_Z4putcc>
    while (data->buffer->getCnt() > 0) {
    80002d10:	00893503          	ld	a0,8(s2)
    80002d14:	00003097          	auipc	ra,0x3
    80002d18:	370080e7          	jalr	880(ra) # 80006084 <_ZN6Buffer6getCntEv>
    80002d1c:	fca04ee3          	bgtz	a0,80002cf8 <_ZL8consumerPv+0x90>
    }

    sem_signal(data->wait);
    80002d20:	01093503          	ld	a0,16(s2)
    80002d24:	fffff097          	auipc	ra,0xfffff
    80002d28:	87c080e7          	jalr	-1924(ra) # 800015a0 <_Z10sem_signalP3sem>
}
    80002d2c:	02813083          	ld	ra,40(sp)
    80002d30:	02013403          	ld	s0,32(sp)
    80002d34:	01813483          	ld	s1,24(sp)
    80002d38:	01013903          	ld	s2,16(sp)
    80002d3c:	00813983          	ld	s3,8(sp)
    80002d40:	03010113          	addi	sp,sp,48
    80002d44:	00008067          	ret

0000000080002d48 <_Z22producerConsumer_C_APIv>:

void producerConsumer_C_API() {
    80002d48:	f9010113          	addi	sp,sp,-112
    80002d4c:	06113423          	sd	ra,104(sp)
    80002d50:	06813023          	sd	s0,96(sp)
    80002d54:	04913c23          	sd	s1,88(sp)
    80002d58:	05213823          	sd	s2,80(sp)
    80002d5c:	05313423          	sd	s3,72(sp)
    80002d60:	05413023          	sd	s4,64(sp)
    80002d64:	03513c23          	sd	s5,56(sp)
    80002d68:	03613823          	sd	s6,48(sp)
    80002d6c:	07010413          	addi	s0,sp,112
        sem_wait(waitForAll);
    }

    sem_close(waitForAll);

    delete buffer;
    80002d70:	00010b13          	mv	s6,sp
    printString("Unesite broj proizvodjaca?\n");
    80002d74:	00006517          	auipc	a0,0x6
    80002d78:	2ec50513          	addi	a0,a0,748 # 80009060 <kvmincrease+0xa70>
    80002d7c:	00002097          	auipc	ra,0x2
    80002d80:	220080e7          	jalr	544(ra) # 80004f9c <_Z11printStringPKc>
    getString(input, 30);
    80002d84:	01e00593          	li	a1,30
    80002d88:	fa040493          	addi	s1,s0,-96
    80002d8c:	00048513          	mv	a0,s1
    80002d90:	00002097          	auipc	ra,0x2
    80002d94:	294080e7          	jalr	660(ra) # 80005024 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80002d98:	00048513          	mv	a0,s1
    80002d9c:	00002097          	auipc	ra,0x2
    80002da0:	360080e7          	jalr	864(ra) # 800050fc <_Z11stringToIntPKc>
    80002da4:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    80002da8:	00006517          	auipc	a0,0x6
    80002dac:	2d850513          	addi	a0,a0,728 # 80009080 <kvmincrease+0xa90>
    80002db0:	00002097          	auipc	ra,0x2
    80002db4:	1ec080e7          	jalr	492(ra) # 80004f9c <_Z11printStringPKc>
    getString(input, 30);
    80002db8:	01e00593          	li	a1,30
    80002dbc:	00048513          	mv	a0,s1
    80002dc0:	00002097          	auipc	ra,0x2
    80002dc4:	264080e7          	jalr	612(ra) # 80005024 <_Z9getStringPci>
    n = stringToInt(input);
    80002dc8:	00048513          	mv	a0,s1
    80002dcc:	00002097          	auipc	ra,0x2
    80002dd0:	330080e7          	jalr	816(ra) # 800050fc <_Z11stringToIntPKc>
    80002dd4:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    80002dd8:	00006517          	auipc	a0,0x6
    80002ddc:	2c850513          	addi	a0,a0,712 # 800090a0 <kvmincrease+0xab0>
    80002de0:	00002097          	auipc	ra,0x2
    80002de4:	1bc080e7          	jalr	444(ra) # 80004f9c <_Z11printStringPKc>
    80002de8:	00000613          	li	a2,0
    80002dec:	00a00593          	li	a1,10
    80002df0:	00090513          	mv	a0,s2
    80002df4:	00002097          	auipc	ra,0x2
    80002df8:	358080e7          	jalr	856(ra) # 8000514c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80002dfc:	00006517          	auipc	a0,0x6
    80002e00:	2bc50513          	addi	a0,a0,700 # 800090b8 <kvmincrease+0xac8>
    80002e04:	00002097          	auipc	ra,0x2
    80002e08:	198080e7          	jalr	408(ra) # 80004f9c <_Z11printStringPKc>
    80002e0c:	00000613          	li	a2,0
    80002e10:	00a00593          	li	a1,10
    80002e14:	00048513          	mv	a0,s1
    80002e18:	00002097          	auipc	ra,0x2
    80002e1c:	334080e7          	jalr	820(ra) # 8000514c <_Z8printIntiii>
    printString(".\n");
    80002e20:	00006517          	auipc	a0,0x6
    80002e24:	20850513          	addi	a0,a0,520 # 80009028 <kvmincrease+0xa38>
    80002e28:	00002097          	auipc	ra,0x2
    80002e2c:	174080e7          	jalr	372(ra) # 80004f9c <_Z11printStringPKc>
    if(threadNum > n) {
    80002e30:	0324c463          	blt	s1,s2,80002e58 <_Z22producerConsumer_C_APIv+0x110>
    } else if (threadNum < 1) {
    80002e34:	03205c63          	blez	s2,80002e6c <_Z22producerConsumer_C_APIv+0x124>
    Buffer *buffer = new Buffer(n);
    80002e38:	03800513          	li	a0,56
    80002e3c:	fffff097          	auipc	ra,0xfffff
    80002e40:	f94080e7          	jalr	-108(ra) # 80001dd0 <_Znwm>
    80002e44:	00050a13          	mv	s4,a0
    80002e48:	00048593          	mv	a1,s1
    80002e4c:	00003097          	auipc	ra,0x3
    80002e50:	080080e7          	jalr	128(ra) # 80005ecc <_ZN6BufferC1Ei>
    80002e54:	0300006f          	j	80002e84 <_Z22producerConsumer_C_APIv+0x13c>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80002e58:	00006517          	auipc	a0,0x6
    80002e5c:	27850513          	addi	a0,a0,632 # 800090d0 <kvmincrease+0xae0>
    80002e60:	00002097          	auipc	ra,0x2
    80002e64:	13c080e7          	jalr	316(ra) # 80004f9c <_Z11printStringPKc>
        return;
    80002e68:	0140006f          	j	80002e7c <_Z22producerConsumer_C_APIv+0x134>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80002e6c:	00006517          	auipc	a0,0x6
    80002e70:	2a450513          	addi	a0,a0,676 # 80009110 <kvmincrease+0xb20>
    80002e74:	00002097          	auipc	ra,0x2
    80002e78:	128080e7          	jalr	296(ra) # 80004f9c <_Z11printStringPKc>
        return;
    80002e7c:	000b0113          	mv	sp,s6
    80002e80:	1500006f          	j	80002fd0 <_Z22producerConsumer_C_APIv+0x288>
    sem_open(&waitForAll, 0);
    80002e84:	00000593          	li	a1,0
    80002e88:	00009517          	auipc	a0,0x9
    80002e8c:	80850513          	addi	a0,a0,-2040 # 8000b690 <_ZL10waitForAll>
    80002e90:	ffffe097          	auipc	ra,0xffffe
    80002e94:	664080e7          	jalr	1636(ra) # 800014f4 <_Z8sem_openPP3semj>
    thread_t threads[threadNum];
    80002e98:	00391793          	slli	a5,s2,0x3
    80002e9c:	00f78793          	addi	a5,a5,15
    80002ea0:	ff07f793          	andi	a5,a5,-16
    80002ea4:	40f10133          	sub	sp,sp,a5
    80002ea8:	00010a93          	mv	s5,sp
    struct thread_data data[threadNum + 1];
    80002eac:	0019071b          	addiw	a4,s2,1
    80002eb0:	00171793          	slli	a5,a4,0x1
    80002eb4:	00e787b3          	add	a5,a5,a4
    80002eb8:	00379793          	slli	a5,a5,0x3
    80002ebc:	00f78793          	addi	a5,a5,15
    80002ec0:	ff07f793          	andi	a5,a5,-16
    80002ec4:	40f10133          	sub	sp,sp,a5
    80002ec8:	00010993          	mv	s3,sp
    data[threadNum].id = threadNum;
    80002ecc:	00191613          	slli	a2,s2,0x1
    80002ed0:	012607b3          	add	a5,a2,s2
    80002ed4:	00379793          	slli	a5,a5,0x3
    80002ed8:	00f987b3          	add	a5,s3,a5
    80002edc:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80002ee0:	0147b423          	sd	s4,8(a5)
    data[threadNum].wait = waitForAll;
    80002ee4:	00008717          	auipc	a4,0x8
    80002ee8:	7ac73703          	ld	a4,1964(a4) # 8000b690 <_ZL10waitForAll>
    80002eec:	00e7b823          	sd	a4,16(a5)
    thread_create(&consumerThread, consumer, data + threadNum);
    80002ef0:	00078613          	mv	a2,a5
    80002ef4:	00000597          	auipc	a1,0x0
    80002ef8:	d7458593          	addi	a1,a1,-652 # 80002c68 <_ZL8consumerPv>
    80002efc:	f9840513          	addi	a0,s0,-104
    80002f00:	ffffe097          	auipc	ra,0xffffe
    80002f04:	504080e7          	jalr	1284(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002f08:	00000493          	li	s1,0
    80002f0c:	0280006f          	j	80002f34 <_Z22producerConsumer_C_APIv+0x1ec>
        thread_create(threads + i,
    80002f10:	00000597          	auipc	a1,0x0
    80002f14:	c1458593          	addi	a1,a1,-1004 # 80002b24 <_ZL16producerKeyboardPv>
                      data + i);
    80002f18:	00179613          	slli	a2,a5,0x1
    80002f1c:	00f60633          	add	a2,a2,a5
    80002f20:	00361613          	slli	a2,a2,0x3
        thread_create(threads + i,
    80002f24:	00c98633          	add	a2,s3,a2
    80002f28:	ffffe097          	auipc	ra,0xffffe
    80002f2c:	4dc080e7          	jalr	1244(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < threadNum; i++) {
    80002f30:	0014849b          	addiw	s1,s1,1
    80002f34:	0524d263          	bge	s1,s2,80002f78 <_Z22producerConsumer_C_APIv+0x230>
        data[i].id = i;
    80002f38:	00149793          	slli	a5,s1,0x1
    80002f3c:	009787b3          	add	a5,a5,s1
    80002f40:	00379793          	slli	a5,a5,0x3
    80002f44:	00f987b3          	add	a5,s3,a5
    80002f48:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80002f4c:	0147b423          	sd	s4,8(a5)
        data[i].wait = waitForAll;
    80002f50:	00008717          	auipc	a4,0x8
    80002f54:	74073703          	ld	a4,1856(a4) # 8000b690 <_ZL10waitForAll>
    80002f58:	00e7b823          	sd	a4,16(a5)
        thread_create(threads + i,
    80002f5c:	00048793          	mv	a5,s1
    80002f60:	00349513          	slli	a0,s1,0x3
    80002f64:	00aa8533          	add	a0,s5,a0
    80002f68:	fa9054e3          	blez	s1,80002f10 <_Z22producerConsumer_C_APIv+0x1c8>
    80002f6c:	00000597          	auipc	a1,0x0
    80002f70:	c6858593          	addi	a1,a1,-920 # 80002bd4 <_ZL8producerPv>
    80002f74:	fa5ff06f          	j	80002f18 <_Z22producerConsumer_C_APIv+0x1d0>
    thread_dispatch();
    80002f78:	ffffe097          	auipc	ra,0xffffe
    80002f7c:	530080e7          	jalr	1328(ra) # 800014a8 <_Z15thread_dispatchv>
    for (int i = 0; i <= threadNum; i++) {
    80002f80:	00000493          	li	s1,0
    80002f84:	00994e63          	blt	s2,s1,80002fa0 <_Z22producerConsumer_C_APIv+0x258>
        sem_wait(waitForAll);
    80002f88:	00008517          	auipc	a0,0x8
    80002f8c:	70853503          	ld	a0,1800(a0) # 8000b690 <_ZL10waitForAll>
    80002f90:	ffffe097          	auipc	ra,0xffffe
    80002f94:	5d8080e7          	jalr	1496(ra) # 80001568 <_Z8sem_waitP3sem>
    for (int i = 0; i <= threadNum; i++) {
    80002f98:	0014849b          	addiw	s1,s1,1
    80002f9c:	fe9ff06f          	j	80002f84 <_Z22producerConsumer_C_APIv+0x23c>
    sem_close(waitForAll);
    80002fa0:	00008517          	auipc	a0,0x8
    80002fa4:	6f053503          	ld	a0,1776(a0) # 8000b690 <_ZL10waitForAll>
    80002fa8:	ffffe097          	auipc	ra,0xffffe
    80002fac:	588080e7          	jalr	1416(ra) # 80001530 <_Z9sem_closeP3sem>
    delete buffer;
    80002fb0:	000a0e63          	beqz	s4,80002fcc <_Z22producerConsumer_C_APIv+0x284>
    80002fb4:	000a0513          	mv	a0,s4
    80002fb8:	00003097          	auipc	ra,0x3
    80002fbc:	154080e7          	jalr	340(ra) # 8000610c <_ZN6BufferD1Ev>
    80002fc0:	000a0513          	mv	a0,s4
    80002fc4:	fffff097          	auipc	ra,0xfffff
    80002fc8:	e5c080e7          	jalr	-420(ra) # 80001e20 <_ZdlPv>
    80002fcc:	000b0113          	mv	sp,s6

}
    80002fd0:	f9040113          	addi	sp,s0,-112
    80002fd4:	06813083          	ld	ra,104(sp)
    80002fd8:	06013403          	ld	s0,96(sp)
    80002fdc:	05813483          	ld	s1,88(sp)
    80002fe0:	05013903          	ld	s2,80(sp)
    80002fe4:	04813983          	ld	s3,72(sp)
    80002fe8:	04013a03          	ld	s4,64(sp)
    80002fec:	03813a83          	ld	s5,56(sp)
    80002ff0:	03013b03          	ld	s6,48(sp)
    80002ff4:	07010113          	addi	sp,sp,112
    80002ff8:	00008067          	ret
    80002ffc:	00050493          	mv	s1,a0
    Buffer *buffer = new Buffer(n);
    80003000:	000a0513          	mv	a0,s4
    80003004:	fffff097          	auipc	ra,0xfffff
    80003008:	e1c080e7          	jalr	-484(ra) # 80001e20 <_ZdlPv>
    8000300c:	00048513          	mv	a0,s1
    80003010:	00009097          	auipc	ra,0x9
    80003014:	798080e7          	jalr	1944(ra) # 8000c7a8 <_Unwind_Resume>

0000000080003018 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80003018:	fe010113          	addi	sp,sp,-32
    8000301c:	00113c23          	sd	ra,24(sp)
    80003020:	00813823          	sd	s0,16(sp)
    80003024:	00913423          	sd	s1,8(sp)
    80003028:	01213023          	sd	s2,0(sp)
    8000302c:	02010413          	addi	s0,sp,32
    80003030:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80003034:	00100793          	li	a5,1
    80003038:	02a7f863          	bgeu	a5,a0,80003068 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000303c:	00a00793          	li	a5,10
    80003040:	02f577b3          	remu	a5,a0,a5
    80003044:	02078e63          	beqz	a5,80003080 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80003048:	fff48513          	addi	a0,s1,-1
    8000304c:	00000097          	auipc	ra,0x0
    80003050:	fcc080e7          	jalr	-52(ra) # 80003018 <_ZL9fibonaccim>
    80003054:	00050913          	mv	s2,a0
    80003058:	ffe48513          	addi	a0,s1,-2
    8000305c:	00000097          	auipc	ra,0x0
    80003060:	fbc080e7          	jalr	-68(ra) # 80003018 <_ZL9fibonaccim>
    80003064:	00a90533          	add	a0,s2,a0
}
    80003068:	01813083          	ld	ra,24(sp)
    8000306c:	01013403          	ld	s0,16(sp)
    80003070:	00813483          	ld	s1,8(sp)
    80003074:	00013903          	ld	s2,0(sp)
    80003078:	02010113          	addi	sp,sp,32
    8000307c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    80003080:	ffffe097          	auipc	ra,0xffffe
    80003084:	428080e7          	jalr	1064(ra) # 800014a8 <_Z15thread_dispatchv>
    80003088:	fc1ff06f          	j	80003048 <_ZL9fibonaccim+0x30>

000000008000308c <_ZN7WorkerA11workerBodyAEPv>:
    void run() override {
        workerBodyD(nullptr);
    }
};

void WorkerA::workerBodyA(void *arg) {
    8000308c:	fe010113          	addi	sp,sp,-32
    80003090:	00113c23          	sd	ra,24(sp)
    80003094:	00813823          	sd	s0,16(sp)
    80003098:	00913423          	sd	s1,8(sp)
    8000309c:	01213023          	sd	s2,0(sp)
    800030a0:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    800030a4:	00000913          	li	s2,0
    800030a8:	0380006f          	j	800030e0 <_ZN7WorkerA11workerBodyAEPv+0x54>
        printString("A: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    800030ac:	ffffe097          	auipc	ra,0xffffe
    800030b0:	3fc080e7          	jalr	1020(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    800030b4:	00148493          	addi	s1,s1,1
    800030b8:	000027b7          	lui	a5,0x2
    800030bc:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800030c0:	0097ee63          	bltu	a5,s1,800030dc <_ZN7WorkerA11workerBodyAEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800030c4:	00000713          	li	a4,0
    800030c8:	000077b7          	lui	a5,0x7
    800030cc:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800030d0:	fce7eee3          	bltu	a5,a4,800030ac <_ZN7WorkerA11workerBodyAEPv+0x20>
    800030d4:	00170713          	addi	a4,a4,1
    800030d8:	ff1ff06f          	j	800030c8 <_ZN7WorkerA11workerBodyAEPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    800030dc:	00190913          	addi	s2,s2,1
    800030e0:	00900793          	li	a5,9
    800030e4:	0527e063          	bltu	a5,s2,80003124 <_ZN7WorkerA11workerBodyAEPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800030e8:	00006517          	auipc	a0,0x6
    800030ec:	05850513          	addi	a0,a0,88 # 80009140 <kvmincrease+0xb50>
    800030f0:	00002097          	auipc	ra,0x2
    800030f4:	eac080e7          	jalr	-340(ra) # 80004f9c <_Z11printStringPKc>
    800030f8:	00000613          	li	a2,0
    800030fc:	00a00593          	li	a1,10
    80003100:	0009051b          	sext.w	a0,s2
    80003104:	00002097          	auipc	ra,0x2
    80003108:	048080e7          	jalr	72(ra) # 8000514c <_Z8printIntiii>
    8000310c:	00006517          	auipc	a0,0x6
    80003110:	28450513          	addi	a0,a0,644 # 80009390 <kvmincrease+0xda0>
    80003114:	00002097          	auipc	ra,0x2
    80003118:	e88080e7          	jalr	-376(ra) # 80004f9c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    8000311c:	00000493          	li	s1,0
    80003120:	f99ff06f          	j	800030b8 <_ZN7WorkerA11workerBodyAEPv+0x2c>
        }
    }
    printString("A finished!\n");
    80003124:	00006517          	auipc	a0,0x6
    80003128:	02450513          	addi	a0,a0,36 # 80009148 <kvmincrease+0xb58>
    8000312c:	00002097          	auipc	ra,0x2
    80003130:	e70080e7          	jalr	-400(ra) # 80004f9c <_Z11printStringPKc>
    finishedA = true;
    80003134:	00100793          	li	a5,1
    80003138:	00008717          	auipc	a4,0x8
    8000313c:	56f70023          	sb	a5,1376(a4) # 8000b698 <_ZL9finishedA>
}
    80003140:	01813083          	ld	ra,24(sp)
    80003144:	01013403          	ld	s0,16(sp)
    80003148:	00813483          	ld	s1,8(sp)
    8000314c:	00013903          	ld	s2,0(sp)
    80003150:	02010113          	addi	sp,sp,32
    80003154:	00008067          	ret

0000000080003158 <_ZN7WorkerB11workerBodyBEPv>:

void WorkerB::workerBodyB(void *arg) {
    80003158:	fe010113          	addi	sp,sp,-32
    8000315c:	00113c23          	sd	ra,24(sp)
    80003160:	00813823          	sd	s0,16(sp)
    80003164:	00913423          	sd	s1,8(sp)
    80003168:	01213023          	sd	s2,0(sp)
    8000316c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80003170:	00000913          	li	s2,0
    80003174:	0380006f          	j	800031ac <_ZN7WorkerB11workerBodyBEPv+0x54>
        printString("B: i="); printInt(i); printString("\n");
        for (uint64 j = 0; j < 10000; j++) {
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
            thread_dispatch();
    80003178:	ffffe097          	auipc	ra,0xffffe
    8000317c:	330080e7          	jalr	816(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80003180:	00148493          	addi	s1,s1,1
    80003184:	000027b7          	lui	a5,0x2
    80003188:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000318c:	0097ee63          	bltu	a5,s1,800031a8 <_ZN7WorkerB11workerBodyBEPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80003190:	00000713          	li	a4,0
    80003194:	000077b7          	lui	a5,0x7
    80003198:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000319c:	fce7eee3          	bltu	a5,a4,80003178 <_ZN7WorkerB11workerBodyBEPv+0x20>
    800031a0:	00170713          	addi	a4,a4,1
    800031a4:	ff1ff06f          	j	80003194 <_ZN7WorkerB11workerBodyBEPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800031a8:	00190913          	addi	s2,s2,1
    800031ac:	00f00793          	li	a5,15
    800031b0:	0527e063          	bltu	a5,s2,800031f0 <_ZN7WorkerB11workerBodyBEPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800031b4:	00006517          	auipc	a0,0x6
    800031b8:	fa450513          	addi	a0,a0,-92 # 80009158 <kvmincrease+0xb68>
    800031bc:	00002097          	auipc	ra,0x2
    800031c0:	de0080e7          	jalr	-544(ra) # 80004f9c <_Z11printStringPKc>
    800031c4:	00000613          	li	a2,0
    800031c8:	00a00593          	li	a1,10
    800031cc:	0009051b          	sext.w	a0,s2
    800031d0:	00002097          	auipc	ra,0x2
    800031d4:	f7c080e7          	jalr	-132(ra) # 8000514c <_Z8printIntiii>
    800031d8:	00006517          	auipc	a0,0x6
    800031dc:	1b850513          	addi	a0,a0,440 # 80009390 <kvmincrease+0xda0>
    800031e0:	00002097          	auipc	ra,0x2
    800031e4:	dbc080e7          	jalr	-580(ra) # 80004f9c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800031e8:	00000493          	li	s1,0
    800031ec:	f99ff06f          	j	80003184 <_ZN7WorkerB11workerBodyBEPv+0x2c>
        }
    }
    printString("B finished!\n");
    800031f0:	00006517          	auipc	a0,0x6
    800031f4:	f7050513          	addi	a0,a0,-144 # 80009160 <kvmincrease+0xb70>
    800031f8:	00002097          	auipc	ra,0x2
    800031fc:	da4080e7          	jalr	-604(ra) # 80004f9c <_Z11printStringPKc>
    finishedB = true;
    80003200:	00100793          	li	a5,1
    80003204:	00008717          	auipc	a4,0x8
    80003208:	48f70aa3          	sb	a5,1173(a4) # 8000b699 <_ZL9finishedB>
    thread_dispatch();
    8000320c:	ffffe097          	auipc	ra,0xffffe
    80003210:	29c080e7          	jalr	668(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80003214:	01813083          	ld	ra,24(sp)
    80003218:	01013403          	ld	s0,16(sp)
    8000321c:	00813483          	ld	s1,8(sp)
    80003220:	00013903          	ld	s2,0(sp)
    80003224:	02010113          	addi	sp,sp,32
    80003228:	00008067          	ret

000000008000322c <_ZN7WorkerC11workerBodyCEPv>:

void WorkerC::workerBodyC(void *arg) {
    8000322c:	fe010113          	addi	sp,sp,-32
    80003230:	00113c23          	sd	ra,24(sp)
    80003234:	00813823          	sd	s0,16(sp)
    80003238:	00913423          	sd	s1,8(sp)
    8000323c:	01213023          	sd	s2,0(sp)
    80003240:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80003244:	00000493          	li	s1,0
    80003248:	0400006f          	j	80003288 <_ZN7WorkerC11workerBodyCEPv+0x5c>
    for (; i < 3; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000324c:	00006517          	auipc	a0,0x6
    80003250:	f2450513          	addi	a0,a0,-220 # 80009170 <kvmincrease+0xb80>
    80003254:	00002097          	auipc	ra,0x2
    80003258:	d48080e7          	jalr	-696(ra) # 80004f9c <_Z11printStringPKc>
    8000325c:	00000613          	li	a2,0
    80003260:	00a00593          	li	a1,10
    80003264:	00048513          	mv	a0,s1
    80003268:	00002097          	auipc	ra,0x2
    8000326c:	ee4080e7          	jalr	-284(ra) # 8000514c <_Z8printIntiii>
    80003270:	00006517          	auipc	a0,0x6
    80003274:	12050513          	addi	a0,a0,288 # 80009390 <kvmincrease+0xda0>
    80003278:	00002097          	auipc	ra,0x2
    8000327c:	d24080e7          	jalr	-732(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80003280:	0014849b          	addiw	s1,s1,1
    80003284:	0ff4f493          	andi	s1,s1,255
    80003288:	00200793          	li	a5,2
    8000328c:	fc97f0e3          	bgeu	a5,s1,8000324c <_ZN7WorkerC11workerBodyCEPv+0x20>
    }

    printString("C: dispatch\n");
    80003290:	00006517          	auipc	a0,0x6
    80003294:	ee850513          	addi	a0,a0,-280 # 80009178 <kvmincrease+0xb88>
    80003298:	00002097          	auipc	ra,0x2
    8000329c:	d04080e7          	jalr	-764(ra) # 80004f9c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    800032a0:	00700313          	li	t1,7
    thread_dispatch();
    800032a4:	ffffe097          	auipc	ra,0xffffe
    800032a8:	204080e7          	jalr	516(ra) # 800014a8 <_Z15thread_dispatchv>

    uint64 t1 = 0;
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    800032ac:	00030913          	mv	s2,t1

    printString("C: t1="); printInt(t1); printString("\n");
    800032b0:	00006517          	auipc	a0,0x6
    800032b4:	ed850513          	addi	a0,a0,-296 # 80009188 <kvmincrease+0xb98>
    800032b8:	00002097          	auipc	ra,0x2
    800032bc:	ce4080e7          	jalr	-796(ra) # 80004f9c <_Z11printStringPKc>
    800032c0:	00000613          	li	a2,0
    800032c4:	00a00593          	li	a1,10
    800032c8:	0009051b          	sext.w	a0,s2
    800032cc:	00002097          	auipc	ra,0x2
    800032d0:	e80080e7          	jalr	-384(ra) # 8000514c <_Z8printIntiii>
    800032d4:	00006517          	auipc	a0,0x6
    800032d8:	0bc50513          	addi	a0,a0,188 # 80009390 <kvmincrease+0xda0>
    800032dc:	00002097          	auipc	ra,0x2
    800032e0:	cc0080e7          	jalr	-832(ra) # 80004f9c <_Z11printStringPKc>

    uint64 result = fibonacci(12);
    800032e4:	00c00513          	li	a0,12
    800032e8:	00000097          	auipc	ra,0x0
    800032ec:	d30080e7          	jalr	-720(ra) # 80003018 <_ZL9fibonaccim>
    800032f0:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800032f4:	00006517          	auipc	a0,0x6
    800032f8:	e9c50513          	addi	a0,a0,-356 # 80009190 <kvmincrease+0xba0>
    800032fc:	00002097          	auipc	ra,0x2
    80003300:	ca0080e7          	jalr	-864(ra) # 80004f9c <_Z11printStringPKc>
    80003304:	00000613          	li	a2,0
    80003308:	00a00593          	li	a1,10
    8000330c:	0009051b          	sext.w	a0,s2
    80003310:	00002097          	auipc	ra,0x2
    80003314:	e3c080e7          	jalr	-452(ra) # 8000514c <_Z8printIntiii>
    80003318:	00006517          	auipc	a0,0x6
    8000331c:	07850513          	addi	a0,a0,120 # 80009390 <kvmincrease+0xda0>
    80003320:	00002097          	auipc	ra,0x2
    80003324:	c7c080e7          	jalr	-900(ra) # 80004f9c <_Z11printStringPKc>
    80003328:	0400006f          	j	80003368 <_ZN7WorkerC11workerBodyCEPv+0x13c>

    for (; i < 6; i++) {
        printString("C: i="); printInt(i); printString("\n");
    8000332c:	00006517          	auipc	a0,0x6
    80003330:	e4450513          	addi	a0,a0,-444 # 80009170 <kvmincrease+0xb80>
    80003334:	00002097          	auipc	ra,0x2
    80003338:	c68080e7          	jalr	-920(ra) # 80004f9c <_Z11printStringPKc>
    8000333c:	00000613          	li	a2,0
    80003340:	00a00593          	li	a1,10
    80003344:	00048513          	mv	a0,s1
    80003348:	00002097          	auipc	ra,0x2
    8000334c:	e04080e7          	jalr	-508(ra) # 8000514c <_Z8printIntiii>
    80003350:	00006517          	auipc	a0,0x6
    80003354:	04050513          	addi	a0,a0,64 # 80009390 <kvmincrease+0xda0>
    80003358:	00002097          	auipc	ra,0x2
    8000335c:	c44080e7          	jalr	-956(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80003360:	0014849b          	addiw	s1,s1,1
    80003364:	0ff4f493          	andi	s1,s1,255
    80003368:	00500793          	li	a5,5
    8000336c:	fc97f0e3          	bgeu	a5,s1,8000332c <_ZN7WorkerC11workerBodyCEPv+0x100>
    }

    printString("A finished!\n");
    80003370:	00006517          	auipc	a0,0x6
    80003374:	dd850513          	addi	a0,a0,-552 # 80009148 <kvmincrease+0xb58>
    80003378:	00002097          	auipc	ra,0x2
    8000337c:	c24080e7          	jalr	-988(ra) # 80004f9c <_Z11printStringPKc>
    finishedC = true;
    80003380:	00100793          	li	a5,1
    80003384:	00008717          	auipc	a4,0x8
    80003388:	30f70b23          	sb	a5,790(a4) # 8000b69a <_ZL9finishedC>
    thread_dispatch();
    8000338c:	ffffe097          	auipc	ra,0xffffe
    80003390:	11c080e7          	jalr	284(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80003394:	01813083          	ld	ra,24(sp)
    80003398:	01013403          	ld	s0,16(sp)
    8000339c:	00813483          	ld	s1,8(sp)
    800033a0:	00013903          	ld	s2,0(sp)
    800033a4:	02010113          	addi	sp,sp,32
    800033a8:	00008067          	ret

00000000800033ac <_ZN7WorkerD11workerBodyDEPv>:

void WorkerD::workerBodyD(void* arg) {
    800033ac:	fe010113          	addi	sp,sp,-32
    800033b0:	00113c23          	sd	ra,24(sp)
    800033b4:	00813823          	sd	s0,16(sp)
    800033b8:	00913423          	sd	s1,8(sp)
    800033bc:	01213023          	sd	s2,0(sp)
    800033c0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800033c4:	00a00493          	li	s1,10
    800033c8:	0400006f          	j	80003408 <_ZN7WorkerD11workerBodyDEPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800033cc:	00006517          	auipc	a0,0x6
    800033d0:	dd450513          	addi	a0,a0,-556 # 800091a0 <kvmincrease+0xbb0>
    800033d4:	00002097          	auipc	ra,0x2
    800033d8:	bc8080e7          	jalr	-1080(ra) # 80004f9c <_Z11printStringPKc>
    800033dc:	00000613          	li	a2,0
    800033e0:	00a00593          	li	a1,10
    800033e4:	00048513          	mv	a0,s1
    800033e8:	00002097          	auipc	ra,0x2
    800033ec:	d64080e7          	jalr	-668(ra) # 8000514c <_Z8printIntiii>
    800033f0:	00006517          	auipc	a0,0x6
    800033f4:	fa050513          	addi	a0,a0,-96 # 80009390 <kvmincrease+0xda0>
    800033f8:	00002097          	auipc	ra,0x2
    800033fc:	ba4080e7          	jalr	-1116(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80003400:	0014849b          	addiw	s1,s1,1
    80003404:	0ff4f493          	andi	s1,s1,255
    80003408:	00c00793          	li	a5,12
    8000340c:	fc97f0e3          	bgeu	a5,s1,800033cc <_ZN7WorkerD11workerBodyDEPv+0x20>
    }

    printString("D: dispatch\n");
    80003410:	00006517          	auipc	a0,0x6
    80003414:	d9850513          	addi	a0,a0,-616 # 800091a8 <kvmincrease+0xbb8>
    80003418:	00002097          	auipc	ra,0x2
    8000341c:	b84080e7          	jalr	-1148(ra) # 80004f9c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80003420:	00500313          	li	t1,5
    thread_dispatch();
    80003424:	ffffe097          	auipc	ra,0xffffe
    80003428:	084080e7          	jalr	132(ra) # 800014a8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000342c:	01000513          	li	a0,16
    80003430:	00000097          	auipc	ra,0x0
    80003434:	be8080e7          	jalr	-1048(ra) # 80003018 <_ZL9fibonaccim>
    80003438:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000343c:	00006517          	auipc	a0,0x6
    80003440:	d7c50513          	addi	a0,a0,-644 # 800091b8 <kvmincrease+0xbc8>
    80003444:	00002097          	auipc	ra,0x2
    80003448:	b58080e7          	jalr	-1192(ra) # 80004f9c <_Z11printStringPKc>
    8000344c:	00000613          	li	a2,0
    80003450:	00a00593          	li	a1,10
    80003454:	0009051b          	sext.w	a0,s2
    80003458:	00002097          	auipc	ra,0x2
    8000345c:	cf4080e7          	jalr	-780(ra) # 8000514c <_Z8printIntiii>
    80003460:	00006517          	auipc	a0,0x6
    80003464:	f3050513          	addi	a0,a0,-208 # 80009390 <kvmincrease+0xda0>
    80003468:	00002097          	auipc	ra,0x2
    8000346c:	b34080e7          	jalr	-1228(ra) # 80004f9c <_Z11printStringPKc>
    80003470:	0400006f          	j	800034b0 <_ZN7WorkerD11workerBodyDEPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80003474:	00006517          	auipc	a0,0x6
    80003478:	d2c50513          	addi	a0,a0,-724 # 800091a0 <kvmincrease+0xbb0>
    8000347c:	00002097          	auipc	ra,0x2
    80003480:	b20080e7          	jalr	-1248(ra) # 80004f9c <_Z11printStringPKc>
    80003484:	00000613          	li	a2,0
    80003488:	00a00593          	li	a1,10
    8000348c:	00048513          	mv	a0,s1
    80003490:	00002097          	auipc	ra,0x2
    80003494:	cbc080e7          	jalr	-836(ra) # 8000514c <_Z8printIntiii>
    80003498:	00006517          	auipc	a0,0x6
    8000349c:	ef850513          	addi	a0,a0,-264 # 80009390 <kvmincrease+0xda0>
    800034a0:	00002097          	auipc	ra,0x2
    800034a4:	afc080e7          	jalr	-1284(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 16; i++) {
    800034a8:	0014849b          	addiw	s1,s1,1
    800034ac:	0ff4f493          	andi	s1,s1,255
    800034b0:	00f00793          	li	a5,15
    800034b4:	fc97f0e3          	bgeu	a5,s1,80003474 <_ZN7WorkerD11workerBodyDEPv+0xc8>
    }

    printString("D finished!\n");
    800034b8:	00006517          	auipc	a0,0x6
    800034bc:	d1050513          	addi	a0,a0,-752 # 800091c8 <kvmincrease+0xbd8>
    800034c0:	00002097          	auipc	ra,0x2
    800034c4:	adc080e7          	jalr	-1316(ra) # 80004f9c <_Z11printStringPKc>
    finishedD = true;
    800034c8:	00100793          	li	a5,1
    800034cc:	00008717          	auipc	a4,0x8
    800034d0:	1cf707a3          	sb	a5,463(a4) # 8000b69b <_ZL9finishedD>
    thread_dispatch();
    800034d4:	ffffe097          	auipc	ra,0xffffe
    800034d8:	fd4080e7          	jalr	-44(ra) # 800014a8 <_Z15thread_dispatchv>
}
    800034dc:	01813083          	ld	ra,24(sp)
    800034e0:	01013403          	ld	s0,16(sp)
    800034e4:	00813483          	ld	s1,8(sp)
    800034e8:	00013903          	ld	s2,0(sp)
    800034ec:	02010113          	addi	sp,sp,32
    800034f0:	00008067          	ret

00000000800034f4 <_Z20Threads_CPP_API_testv>:


void Threads_CPP_API_test() {
    800034f4:	fc010113          	addi	sp,sp,-64
    800034f8:	02113c23          	sd	ra,56(sp)
    800034fc:	02813823          	sd	s0,48(sp)
    80003500:	02913423          	sd	s1,40(sp)
    80003504:	03213023          	sd	s2,32(sp)
    80003508:	04010413          	addi	s0,sp,64
    Thread* threads[4];

    threads[0] = new WorkerA();
    8000350c:	01000513          	li	a0,16
    80003510:	fffff097          	auipc	ra,0xfffff
    80003514:	8c0080e7          	jalr	-1856(ra) # 80001dd0 <_Znwm>
    80003518:	00050493          	mv	s1,a0
    WorkerA():Thread() {}
    8000351c:	fffff097          	auipc	ra,0xfffff
    80003520:	b18080e7          	jalr	-1256(ra) # 80002034 <_ZN6ThreadC1Ev>
    80003524:	00008797          	auipc	a5,0x8
    80003528:	f0c78793          	addi	a5,a5,-244 # 8000b430 <_ZTV7WorkerA+0x10>
    8000352c:	00f4b023          	sd	a5,0(s1)
    threads[0] = new WorkerA();
    80003530:	fc943023          	sd	s1,-64(s0)
    printString("ThreadA created\n");
    80003534:	00006517          	auipc	a0,0x6
    80003538:	ca450513          	addi	a0,a0,-860 # 800091d8 <kvmincrease+0xbe8>
    8000353c:	00002097          	auipc	ra,0x2
    80003540:	a60080e7          	jalr	-1440(ra) # 80004f9c <_Z11printStringPKc>

    threads[1] = new WorkerB();
    80003544:	01000513          	li	a0,16
    80003548:	fffff097          	auipc	ra,0xfffff
    8000354c:	888080e7          	jalr	-1912(ra) # 80001dd0 <_Znwm>
    80003550:	00050493          	mv	s1,a0
    WorkerB():Thread() {}
    80003554:	fffff097          	auipc	ra,0xfffff
    80003558:	ae0080e7          	jalr	-1312(ra) # 80002034 <_ZN6ThreadC1Ev>
    8000355c:	00008797          	auipc	a5,0x8
    80003560:	efc78793          	addi	a5,a5,-260 # 8000b458 <_ZTV7WorkerB+0x10>
    80003564:	00f4b023          	sd	a5,0(s1)
    threads[1] = new WorkerB();
    80003568:	fc943423          	sd	s1,-56(s0)
    printString("ThreadB created\n");
    8000356c:	00006517          	auipc	a0,0x6
    80003570:	c8450513          	addi	a0,a0,-892 # 800091f0 <kvmincrease+0xc00>
    80003574:	00002097          	auipc	ra,0x2
    80003578:	a28080e7          	jalr	-1496(ra) # 80004f9c <_Z11printStringPKc>

    threads[2] = new WorkerC();
    8000357c:	01000513          	li	a0,16
    80003580:	fffff097          	auipc	ra,0xfffff
    80003584:	850080e7          	jalr	-1968(ra) # 80001dd0 <_Znwm>
    80003588:	00050493          	mv	s1,a0
    WorkerC():Thread() {}
    8000358c:	fffff097          	auipc	ra,0xfffff
    80003590:	aa8080e7          	jalr	-1368(ra) # 80002034 <_ZN6ThreadC1Ev>
    80003594:	00008797          	auipc	a5,0x8
    80003598:	eec78793          	addi	a5,a5,-276 # 8000b480 <_ZTV7WorkerC+0x10>
    8000359c:	00f4b023          	sd	a5,0(s1)
    threads[2] = new WorkerC();
    800035a0:	fc943823          	sd	s1,-48(s0)
    printString("ThreadC created\n");
    800035a4:	00006517          	auipc	a0,0x6
    800035a8:	c6450513          	addi	a0,a0,-924 # 80009208 <kvmincrease+0xc18>
    800035ac:	00002097          	auipc	ra,0x2
    800035b0:	9f0080e7          	jalr	-1552(ra) # 80004f9c <_Z11printStringPKc>

    threads[3] = new WorkerD();
    800035b4:	01000513          	li	a0,16
    800035b8:	fffff097          	auipc	ra,0xfffff
    800035bc:	818080e7          	jalr	-2024(ra) # 80001dd0 <_Znwm>
    800035c0:	00050493          	mv	s1,a0
    WorkerD():Thread() {}
    800035c4:	fffff097          	auipc	ra,0xfffff
    800035c8:	a70080e7          	jalr	-1424(ra) # 80002034 <_ZN6ThreadC1Ev>
    800035cc:	00008797          	auipc	a5,0x8
    800035d0:	edc78793          	addi	a5,a5,-292 # 8000b4a8 <_ZTV7WorkerD+0x10>
    800035d4:	00f4b023          	sd	a5,0(s1)
    threads[3] = new WorkerD();
    800035d8:	fc943c23          	sd	s1,-40(s0)
    printString("ThreadD created\n");
    800035dc:	00006517          	auipc	a0,0x6
    800035e0:	c4450513          	addi	a0,a0,-956 # 80009220 <kvmincrease+0xc30>
    800035e4:	00002097          	auipc	ra,0x2
    800035e8:	9b8080e7          	jalr	-1608(ra) # 80004f9c <_Z11printStringPKc>

    for(int i=0; i<4; i++) {
    800035ec:	00000493          	li	s1,0
    800035f0:	00300793          	li	a5,3
    800035f4:	0297c663          	blt	a5,s1,80003620 <_Z20Threads_CPP_API_testv+0x12c>
        threads[i]->start();
    800035f8:	00349793          	slli	a5,s1,0x3
    800035fc:	fe040713          	addi	a4,s0,-32
    80003600:	00f707b3          	add	a5,a4,a5
    80003604:	fe07b503          	ld	a0,-32(a5)
    80003608:	fffff097          	auipc	ra,0xfffff
    8000360c:	988080e7          	jalr	-1656(ra) # 80001f90 <_ZN6Thread5startEv>
    for(int i=0; i<4; i++) {
    80003610:	0014849b          	addiw	s1,s1,1
    80003614:	fddff06f          	j	800035f0 <_Z20Threads_CPP_API_testv+0xfc>
    }

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        Thread::dispatch();
    80003618:	fffff097          	auipc	ra,0xfffff
    8000361c:	9c8080e7          	jalr	-1592(ra) # 80001fe0 <_ZN6Thread8dispatchEv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80003620:	00008797          	auipc	a5,0x8
    80003624:	0787c783          	lbu	a5,120(a5) # 8000b698 <_ZL9finishedA>
    80003628:	fe0788e3          	beqz	a5,80003618 <_Z20Threads_CPP_API_testv+0x124>
    8000362c:	00008797          	auipc	a5,0x8
    80003630:	06d7c783          	lbu	a5,109(a5) # 8000b699 <_ZL9finishedB>
    80003634:	fe0782e3          	beqz	a5,80003618 <_Z20Threads_CPP_API_testv+0x124>
    80003638:	00008797          	auipc	a5,0x8
    8000363c:	0627c783          	lbu	a5,98(a5) # 8000b69a <_ZL9finishedC>
    80003640:	fc078ce3          	beqz	a5,80003618 <_Z20Threads_CPP_API_testv+0x124>
    80003644:	00008797          	auipc	a5,0x8
    80003648:	0577c783          	lbu	a5,87(a5) # 8000b69b <_ZL9finishedD>
    8000364c:	fc0786e3          	beqz	a5,80003618 <_Z20Threads_CPP_API_testv+0x124>
    80003650:	fc040493          	addi	s1,s0,-64
    80003654:	0080006f          	j	8000365c <_Z20Threads_CPP_API_testv+0x168>
    }

    for (auto thread: threads) { delete thread; }
    80003658:	00848493          	addi	s1,s1,8
    8000365c:	fe040793          	addi	a5,s0,-32
    80003660:	08f48663          	beq	s1,a5,800036ec <_Z20Threads_CPP_API_testv+0x1f8>
    80003664:	0004b503          	ld	a0,0(s1)
    80003668:	fe0508e3          	beqz	a0,80003658 <_Z20Threads_CPP_API_testv+0x164>
    8000366c:	00053783          	ld	a5,0(a0)
    80003670:	0087b783          	ld	a5,8(a5)
    80003674:	000780e7          	jalr	a5
    80003678:	fe1ff06f          	j	80003658 <_Z20Threads_CPP_API_testv+0x164>
    8000367c:	00050913          	mv	s2,a0
    threads[0] = new WorkerA();
    80003680:	00048513          	mv	a0,s1
    80003684:	ffffe097          	auipc	ra,0xffffe
    80003688:	79c080e7          	jalr	1948(ra) # 80001e20 <_ZdlPv>
    8000368c:	00090513          	mv	a0,s2
    80003690:	00009097          	auipc	ra,0x9
    80003694:	118080e7          	jalr	280(ra) # 8000c7a8 <_Unwind_Resume>
    80003698:	00050913          	mv	s2,a0
    threads[1] = new WorkerB();
    8000369c:	00048513          	mv	a0,s1
    800036a0:	ffffe097          	auipc	ra,0xffffe
    800036a4:	780080e7          	jalr	1920(ra) # 80001e20 <_ZdlPv>
    800036a8:	00090513          	mv	a0,s2
    800036ac:	00009097          	auipc	ra,0x9
    800036b0:	0fc080e7          	jalr	252(ra) # 8000c7a8 <_Unwind_Resume>
    800036b4:	00050913          	mv	s2,a0
    threads[2] = new WorkerC();
    800036b8:	00048513          	mv	a0,s1
    800036bc:	ffffe097          	auipc	ra,0xffffe
    800036c0:	764080e7          	jalr	1892(ra) # 80001e20 <_ZdlPv>
    800036c4:	00090513          	mv	a0,s2
    800036c8:	00009097          	auipc	ra,0x9
    800036cc:	0e0080e7          	jalr	224(ra) # 8000c7a8 <_Unwind_Resume>
    800036d0:	00050913          	mv	s2,a0
    threads[3] = new WorkerD();
    800036d4:	00048513          	mv	a0,s1
    800036d8:	ffffe097          	auipc	ra,0xffffe
    800036dc:	748080e7          	jalr	1864(ra) # 80001e20 <_ZdlPv>
    800036e0:	00090513          	mv	a0,s2
    800036e4:	00009097          	auipc	ra,0x9
    800036e8:	0c4080e7          	jalr	196(ra) # 8000c7a8 <_Unwind_Resume>
}
    800036ec:	03813083          	ld	ra,56(sp)
    800036f0:	03013403          	ld	s0,48(sp)
    800036f4:	02813483          	ld	s1,40(sp)
    800036f8:	02013903          	ld	s2,32(sp)
    800036fc:	04010113          	addi	sp,sp,64
    80003700:	00008067          	ret

0000000080003704 <_ZN7WorkerAD1Ev>:
class WorkerA: public Thread {
    80003704:	ff010113          	addi	sp,sp,-16
    80003708:	00113423          	sd	ra,8(sp)
    8000370c:	00813023          	sd	s0,0(sp)
    80003710:	01010413          	addi	s0,sp,16
    80003714:	00008797          	auipc	a5,0x8
    80003718:	d1c78793          	addi	a5,a5,-740 # 8000b430 <_ZTV7WorkerA+0x10>
    8000371c:	00f53023          	sd	a5,0(a0)
    80003720:	ffffe097          	auipc	ra,0xffffe
    80003724:	790080e7          	jalr	1936(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80003728:	00813083          	ld	ra,8(sp)
    8000372c:	00013403          	ld	s0,0(sp)
    80003730:	01010113          	addi	sp,sp,16
    80003734:	00008067          	ret

0000000080003738 <_ZN7WorkerAD0Ev>:
    80003738:	fe010113          	addi	sp,sp,-32
    8000373c:	00113c23          	sd	ra,24(sp)
    80003740:	00813823          	sd	s0,16(sp)
    80003744:	00913423          	sd	s1,8(sp)
    80003748:	02010413          	addi	s0,sp,32
    8000374c:	00050493          	mv	s1,a0
    80003750:	00008797          	auipc	a5,0x8
    80003754:	ce078793          	addi	a5,a5,-800 # 8000b430 <_ZTV7WorkerA+0x10>
    80003758:	00f53023          	sd	a5,0(a0)
    8000375c:	ffffe097          	auipc	ra,0xffffe
    80003760:	754080e7          	jalr	1876(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80003764:	00048513          	mv	a0,s1
    80003768:	ffffe097          	auipc	ra,0xffffe
    8000376c:	6b8080e7          	jalr	1720(ra) # 80001e20 <_ZdlPv>
    80003770:	01813083          	ld	ra,24(sp)
    80003774:	01013403          	ld	s0,16(sp)
    80003778:	00813483          	ld	s1,8(sp)
    8000377c:	02010113          	addi	sp,sp,32
    80003780:	00008067          	ret

0000000080003784 <_ZN7WorkerBD1Ev>:
class WorkerB: public Thread {
    80003784:	ff010113          	addi	sp,sp,-16
    80003788:	00113423          	sd	ra,8(sp)
    8000378c:	00813023          	sd	s0,0(sp)
    80003790:	01010413          	addi	s0,sp,16
    80003794:	00008797          	auipc	a5,0x8
    80003798:	cc478793          	addi	a5,a5,-828 # 8000b458 <_ZTV7WorkerB+0x10>
    8000379c:	00f53023          	sd	a5,0(a0)
    800037a0:	ffffe097          	auipc	ra,0xffffe
    800037a4:	710080e7          	jalr	1808(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    800037a8:	00813083          	ld	ra,8(sp)
    800037ac:	00013403          	ld	s0,0(sp)
    800037b0:	01010113          	addi	sp,sp,16
    800037b4:	00008067          	ret

00000000800037b8 <_ZN7WorkerBD0Ev>:
    800037b8:	fe010113          	addi	sp,sp,-32
    800037bc:	00113c23          	sd	ra,24(sp)
    800037c0:	00813823          	sd	s0,16(sp)
    800037c4:	00913423          	sd	s1,8(sp)
    800037c8:	02010413          	addi	s0,sp,32
    800037cc:	00050493          	mv	s1,a0
    800037d0:	00008797          	auipc	a5,0x8
    800037d4:	c8878793          	addi	a5,a5,-888 # 8000b458 <_ZTV7WorkerB+0x10>
    800037d8:	00f53023          	sd	a5,0(a0)
    800037dc:	ffffe097          	auipc	ra,0xffffe
    800037e0:	6d4080e7          	jalr	1748(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    800037e4:	00048513          	mv	a0,s1
    800037e8:	ffffe097          	auipc	ra,0xffffe
    800037ec:	638080e7          	jalr	1592(ra) # 80001e20 <_ZdlPv>
    800037f0:	01813083          	ld	ra,24(sp)
    800037f4:	01013403          	ld	s0,16(sp)
    800037f8:	00813483          	ld	s1,8(sp)
    800037fc:	02010113          	addi	sp,sp,32
    80003800:	00008067          	ret

0000000080003804 <_ZN7WorkerCD1Ev>:
class WorkerC: public Thread {
    80003804:	ff010113          	addi	sp,sp,-16
    80003808:	00113423          	sd	ra,8(sp)
    8000380c:	00813023          	sd	s0,0(sp)
    80003810:	01010413          	addi	s0,sp,16
    80003814:	00008797          	auipc	a5,0x8
    80003818:	c6c78793          	addi	a5,a5,-916 # 8000b480 <_ZTV7WorkerC+0x10>
    8000381c:	00f53023          	sd	a5,0(a0)
    80003820:	ffffe097          	auipc	ra,0xffffe
    80003824:	690080e7          	jalr	1680(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80003828:	00813083          	ld	ra,8(sp)
    8000382c:	00013403          	ld	s0,0(sp)
    80003830:	01010113          	addi	sp,sp,16
    80003834:	00008067          	ret

0000000080003838 <_ZN7WorkerCD0Ev>:
    80003838:	fe010113          	addi	sp,sp,-32
    8000383c:	00113c23          	sd	ra,24(sp)
    80003840:	00813823          	sd	s0,16(sp)
    80003844:	00913423          	sd	s1,8(sp)
    80003848:	02010413          	addi	s0,sp,32
    8000384c:	00050493          	mv	s1,a0
    80003850:	00008797          	auipc	a5,0x8
    80003854:	c3078793          	addi	a5,a5,-976 # 8000b480 <_ZTV7WorkerC+0x10>
    80003858:	00f53023          	sd	a5,0(a0)
    8000385c:	ffffe097          	auipc	ra,0xffffe
    80003860:	654080e7          	jalr	1620(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80003864:	00048513          	mv	a0,s1
    80003868:	ffffe097          	auipc	ra,0xffffe
    8000386c:	5b8080e7          	jalr	1464(ra) # 80001e20 <_ZdlPv>
    80003870:	01813083          	ld	ra,24(sp)
    80003874:	01013403          	ld	s0,16(sp)
    80003878:	00813483          	ld	s1,8(sp)
    8000387c:	02010113          	addi	sp,sp,32
    80003880:	00008067          	ret

0000000080003884 <_ZN7WorkerDD1Ev>:
class WorkerD: public Thread {
    80003884:	ff010113          	addi	sp,sp,-16
    80003888:	00113423          	sd	ra,8(sp)
    8000388c:	00813023          	sd	s0,0(sp)
    80003890:	01010413          	addi	s0,sp,16
    80003894:	00008797          	auipc	a5,0x8
    80003898:	c1478793          	addi	a5,a5,-1004 # 8000b4a8 <_ZTV7WorkerD+0x10>
    8000389c:	00f53023          	sd	a5,0(a0)
    800038a0:	ffffe097          	auipc	ra,0xffffe
    800038a4:	610080e7          	jalr	1552(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    800038a8:	00813083          	ld	ra,8(sp)
    800038ac:	00013403          	ld	s0,0(sp)
    800038b0:	01010113          	addi	sp,sp,16
    800038b4:	00008067          	ret

00000000800038b8 <_ZN7WorkerDD0Ev>:
    800038b8:	fe010113          	addi	sp,sp,-32
    800038bc:	00113c23          	sd	ra,24(sp)
    800038c0:	00813823          	sd	s0,16(sp)
    800038c4:	00913423          	sd	s1,8(sp)
    800038c8:	02010413          	addi	s0,sp,32
    800038cc:	00050493          	mv	s1,a0
    800038d0:	00008797          	auipc	a5,0x8
    800038d4:	bd878793          	addi	a5,a5,-1064 # 8000b4a8 <_ZTV7WorkerD+0x10>
    800038d8:	00f53023          	sd	a5,0(a0)
    800038dc:	ffffe097          	auipc	ra,0xffffe
    800038e0:	5d4080e7          	jalr	1492(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    800038e4:	00048513          	mv	a0,s1
    800038e8:	ffffe097          	auipc	ra,0xffffe
    800038ec:	538080e7          	jalr	1336(ra) # 80001e20 <_ZdlPv>
    800038f0:	01813083          	ld	ra,24(sp)
    800038f4:	01013403          	ld	s0,16(sp)
    800038f8:	00813483          	ld	s1,8(sp)
    800038fc:	02010113          	addi	sp,sp,32
    80003900:	00008067          	ret

0000000080003904 <_ZN7WorkerA3runEv>:
    void run() override {
    80003904:	ff010113          	addi	sp,sp,-16
    80003908:	00113423          	sd	ra,8(sp)
    8000390c:	00813023          	sd	s0,0(sp)
    80003910:	01010413          	addi	s0,sp,16
        workerBodyA(nullptr);
    80003914:	00000593          	li	a1,0
    80003918:	fffff097          	auipc	ra,0xfffff
    8000391c:	774080e7          	jalr	1908(ra) # 8000308c <_ZN7WorkerA11workerBodyAEPv>
    }
    80003920:	00813083          	ld	ra,8(sp)
    80003924:	00013403          	ld	s0,0(sp)
    80003928:	01010113          	addi	sp,sp,16
    8000392c:	00008067          	ret

0000000080003930 <_ZN7WorkerB3runEv>:
    void run() override {
    80003930:	ff010113          	addi	sp,sp,-16
    80003934:	00113423          	sd	ra,8(sp)
    80003938:	00813023          	sd	s0,0(sp)
    8000393c:	01010413          	addi	s0,sp,16
        workerBodyB(nullptr);
    80003940:	00000593          	li	a1,0
    80003944:	00000097          	auipc	ra,0x0
    80003948:	814080e7          	jalr	-2028(ra) # 80003158 <_ZN7WorkerB11workerBodyBEPv>
    }
    8000394c:	00813083          	ld	ra,8(sp)
    80003950:	00013403          	ld	s0,0(sp)
    80003954:	01010113          	addi	sp,sp,16
    80003958:	00008067          	ret

000000008000395c <_ZN7WorkerC3runEv>:
    void run() override {
    8000395c:	ff010113          	addi	sp,sp,-16
    80003960:	00113423          	sd	ra,8(sp)
    80003964:	00813023          	sd	s0,0(sp)
    80003968:	01010413          	addi	s0,sp,16
        workerBodyC(nullptr);
    8000396c:	00000593          	li	a1,0
    80003970:	00000097          	auipc	ra,0x0
    80003974:	8bc080e7          	jalr	-1860(ra) # 8000322c <_ZN7WorkerC11workerBodyCEPv>
    }
    80003978:	00813083          	ld	ra,8(sp)
    8000397c:	00013403          	ld	s0,0(sp)
    80003980:	01010113          	addi	sp,sp,16
    80003984:	00008067          	ret

0000000080003988 <_ZN7WorkerD3runEv>:
    void run() override {
    80003988:	ff010113          	addi	sp,sp,-16
    8000398c:	00113423          	sd	ra,8(sp)
    80003990:	00813023          	sd	s0,0(sp)
    80003994:	01010413          	addi	s0,sp,16
        workerBodyD(nullptr);
    80003998:	00000593          	li	a1,0
    8000399c:	00000097          	auipc	ra,0x0
    800039a0:	a10080e7          	jalr	-1520(ra) # 800033ac <_ZN7WorkerD11workerBodyDEPv>
    }
    800039a4:	00813083          	ld	ra,8(sp)
    800039a8:	00013403          	ld	s0,0(sp)
    800039ac:	01010113          	addi	sp,sp,16
    800039b0:	00008067          	ret

00000000800039b4 <_Z20testConsumerProducerv>:

        td->sem->signal();
    }
};

void testConsumerProducer() {
    800039b4:	f8010113          	addi	sp,sp,-128
    800039b8:	06113c23          	sd	ra,120(sp)
    800039bc:	06813823          	sd	s0,112(sp)
    800039c0:	06913423          	sd	s1,104(sp)
    800039c4:	07213023          	sd	s2,96(sp)
    800039c8:	05313c23          	sd	s3,88(sp)
    800039cc:	05413823          	sd	s4,80(sp)
    800039d0:	05513423          	sd	s5,72(sp)
    800039d4:	05613023          	sd	s6,64(sp)
    800039d8:	03713c23          	sd	s7,56(sp)
    800039dc:	03813823          	sd	s8,48(sp)
    800039e0:	03913423          	sd	s9,40(sp)
    800039e4:	08010413          	addi	s0,sp,128
    delete waitForAll;
    for (int i = 0; i < threadNum; i++) {
        delete producers[i];
    }
    delete consumer;
    delete buffer;
    800039e8:	00010c13          	mv	s8,sp
    printString("Unesite broj proizvodjaca?\n");
    800039ec:	00005517          	auipc	a0,0x5
    800039f0:	67450513          	addi	a0,a0,1652 # 80009060 <kvmincrease+0xa70>
    800039f4:	00001097          	auipc	ra,0x1
    800039f8:	5a8080e7          	jalr	1448(ra) # 80004f9c <_Z11printStringPKc>
    getString(input, 30);
    800039fc:	01e00593          	li	a1,30
    80003a00:	f8040493          	addi	s1,s0,-128
    80003a04:	00048513          	mv	a0,s1
    80003a08:	00001097          	auipc	ra,0x1
    80003a0c:	61c080e7          	jalr	1564(ra) # 80005024 <_Z9getStringPci>
    threadNum = stringToInt(input);
    80003a10:	00048513          	mv	a0,s1
    80003a14:	00001097          	auipc	ra,0x1
    80003a18:	6e8080e7          	jalr	1768(ra) # 800050fc <_Z11stringToIntPKc>
    80003a1c:	00050993          	mv	s3,a0
    printString("Unesite velicinu bafera?\n");
    80003a20:	00005517          	auipc	a0,0x5
    80003a24:	66050513          	addi	a0,a0,1632 # 80009080 <kvmincrease+0xa90>
    80003a28:	00001097          	auipc	ra,0x1
    80003a2c:	574080e7          	jalr	1396(ra) # 80004f9c <_Z11printStringPKc>
    getString(input, 30);
    80003a30:	01e00593          	li	a1,30
    80003a34:	00048513          	mv	a0,s1
    80003a38:	00001097          	auipc	ra,0x1
    80003a3c:	5ec080e7          	jalr	1516(ra) # 80005024 <_Z9getStringPci>
    n = stringToInt(input);
    80003a40:	00048513          	mv	a0,s1
    80003a44:	00001097          	auipc	ra,0x1
    80003a48:	6b8080e7          	jalr	1720(ra) # 800050fc <_Z11stringToIntPKc>
    80003a4c:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca ");
    80003a50:	00005517          	auipc	a0,0x5
    80003a54:	65050513          	addi	a0,a0,1616 # 800090a0 <kvmincrease+0xab0>
    80003a58:	00001097          	auipc	ra,0x1
    80003a5c:	544080e7          	jalr	1348(ra) # 80004f9c <_Z11printStringPKc>
    printInt(threadNum);
    80003a60:	00000613          	li	a2,0
    80003a64:	00a00593          	li	a1,10
    80003a68:	00098513          	mv	a0,s3
    80003a6c:	00001097          	auipc	ra,0x1
    80003a70:	6e0080e7          	jalr	1760(ra) # 8000514c <_Z8printIntiii>
    printString(" i velicina bafera ");
    80003a74:	00005517          	auipc	a0,0x5
    80003a78:	64450513          	addi	a0,a0,1604 # 800090b8 <kvmincrease+0xac8>
    80003a7c:	00001097          	auipc	ra,0x1
    80003a80:	520080e7          	jalr	1312(ra) # 80004f9c <_Z11printStringPKc>
    printInt(n);
    80003a84:	00000613          	li	a2,0
    80003a88:	00a00593          	li	a1,10
    80003a8c:	00048513          	mv	a0,s1
    80003a90:	00001097          	auipc	ra,0x1
    80003a94:	6bc080e7          	jalr	1724(ra) # 8000514c <_Z8printIntiii>
    printString(".\n");
    80003a98:	00005517          	auipc	a0,0x5
    80003a9c:	59050513          	addi	a0,a0,1424 # 80009028 <kvmincrease+0xa38>
    80003aa0:	00001097          	auipc	ra,0x1
    80003aa4:	4fc080e7          	jalr	1276(ra) # 80004f9c <_Z11printStringPKc>
    if (threadNum > n) {
    80003aa8:	0334c463          	blt	s1,s3,80003ad0 <_Z20testConsumerProducerv+0x11c>
    } else if (threadNum < 1) {
    80003aac:	03305c63          	blez	s3,80003ae4 <_Z20testConsumerProducerv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80003ab0:	03800513          	li	a0,56
    80003ab4:	ffffe097          	auipc	ra,0xffffe
    80003ab8:	31c080e7          	jalr	796(ra) # 80001dd0 <_Znwm>
    80003abc:	00050a93          	mv	s5,a0
    80003ac0:	00048593          	mv	a1,s1
    80003ac4:	00001097          	auipc	ra,0x1
    80003ac8:	7a8080e7          	jalr	1960(ra) # 8000526c <_ZN9BufferCPPC1Ei>
    80003acc:	0300006f          	j	80003afc <_Z20testConsumerProducerv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80003ad0:	00005517          	auipc	a0,0x5
    80003ad4:	60050513          	addi	a0,a0,1536 # 800090d0 <kvmincrease+0xae0>
    80003ad8:	00001097          	auipc	ra,0x1
    80003adc:	4c4080e7          	jalr	1220(ra) # 80004f9c <_Z11printStringPKc>
        return;
    80003ae0:	0140006f          	j	80003af4 <_Z20testConsumerProducerv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80003ae4:	00005517          	auipc	a0,0x5
    80003ae8:	62c50513          	addi	a0,a0,1580 # 80009110 <kvmincrease+0xb20>
    80003aec:	00001097          	auipc	ra,0x1
    80003af0:	4b0080e7          	jalr	1200(ra) # 80004f9c <_Z11printStringPKc>
        return;
    80003af4:	000c0113          	mv	sp,s8
    80003af8:	2140006f          	j	80003d0c <_Z20testConsumerProducerv+0x358>
    waitForAll = new Semaphore(0);
    80003afc:	01000513          	li	a0,16
    80003b00:	ffffe097          	auipc	ra,0xffffe
    80003b04:	2d0080e7          	jalr	720(ra) # 80001dd0 <_Znwm>
    80003b08:	00050913          	mv	s2,a0
    80003b0c:	00000593          	li	a1,0
    80003b10:	ffffe097          	auipc	ra,0xffffe
    80003b14:	56c080e7          	jalr	1388(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    80003b18:	00008797          	auipc	a5,0x8
    80003b1c:	b927b823          	sd	s2,-1136(a5) # 8000b6a8 <_ZL10waitForAll>
    Thread *producers[threadNum];
    80003b20:	00399793          	slli	a5,s3,0x3
    80003b24:	00f78793          	addi	a5,a5,15
    80003b28:	ff07f793          	andi	a5,a5,-16
    80003b2c:	40f10133          	sub	sp,sp,a5
    80003b30:	00010a13          	mv	s4,sp
    thread_data threadData[threadNum + 1];
    80003b34:	0019871b          	addiw	a4,s3,1
    80003b38:	00171793          	slli	a5,a4,0x1
    80003b3c:	00e787b3          	add	a5,a5,a4
    80003b40:	00379793          	slli	a5,a5,0x3
    80003b44:	00f78793          	addi	a5,a5,15
    80003b48:	ff07f793          	andi	a5,a5,-16
    80003b4c:	40f10133          	sub	sp,sp,a5
    80003b50:	00010b13          	mv	s6,sp
    threadData[threadNum].id = threadNum;
    80003b54:	00199493          	slli	s1,s3,0x1
    80003b58:	013484b3          	add	s1,s1,s3
    80003b5c:	00349493          	slli	s1,s1,0x3
    80003b60:	009b04b3          	add	s1,s6,s1
    80003b64:	0134a023          	sw	s3,0(s1)
    threadData[threadNum].buffer = buffer;
    80003b68:	0154b423          	sd	s5,8(s1)
    threadData[threadNum].sem = waitForAll;
    80003b6c:	0124b823          	sd	s2,16(s1)
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003b70:	01800513          	li	a0,24
    80003b74:	ffffe097          	auipc	ra,0xffffe
    80003b78:	25c080e7          	jalr	604(ra) # 80001dd0 <_Znwm>
    80003b7c:	00050b93          	mv	s7,a0
    Consumer(thread_data *_td) : Thread(), td(_td) {}
    80003b80:	ffffe097          	auipc	ra,0xffffe
    80003b84:	4b4080e7          	jalr	1204(ra) # 80002034 <_ZN6ThreadC1Ev>
    80003b88:	00008797          	auipc	a5,0x8
    80003b8c:	99878793          	addi	a5,a5,-1640 # 8000b520 <_ZTV8Consumer+0x10>
    80003b90:	00fbb023          	sd	a5,0(s7)
    80003b94:	009bb823          	sd	s1,16(s7)
    consumer->start();
    80003b98:	000b8513          	mv	a0,s7
    80003b9c:	ffffe097          	auipc	ra,0xffffe
    80003ba0:	3f4080e7          	jalr	1012(ra) # 80001f90 <_ZN6Thread5startEv>
    threadData[0].id = 0;
    80003ba4:	000b2023          	sw	zero,0(s6)
    threadData[0].buffer = buffer;
    80003ba8:	015b3423          	sd	s5,8(s6)
    threadData[0].sem = waitForAll;
    80003bac:	00008797          	auipc	a5,0x8
    80003bb0:	afc7b783          	ld	a5,-1284(a5) # 8000b6a8 <_ZL10waitForAll>
    80003bb4:	00fb3823          	sd	a5,16(s6)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003bb8:	01800513          	li	a0,24
    80003bbc:	ffffe097          	auipc	ra,0xffffe
    80003bc0:	214080e7          	jalr	532(ra) # 80001dd0 <_Znwm>
    80003bc4:	00050493          	mv	s1,a0
    ProducerKeyborad(thread_data *_td) : Thread(), td(_td) {}
    80003bc8:	ffffe097          	auipc	ra,0xffffe
    80003bcc:	46c080e7          	jalr	1132(ra) # 80002034 <_ZN6ThreadC1Ev>
    80003bd0:	00008797          	auipc	a5,0x8
    80003bd4:	90078793          	addi	a5,a5,-1792 # 8000b4d0 <_ZTV16ProducerKeyborad+0x10>
    80003bd8:	00f4b023          	sd	a5,0(s1)
    80003bdc:	0164b823          	sd	s6,16(s1)
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003be0:	009a3023          	sd	s1,0(s4)
    producers[0]->start();
    80003be4:	00048513          	mv	a0,s1
    80003be8:	ffffe097          	auipc	ra,0xffffe
    80003bec:	3a8080e7          	jalr	936(ra) # 80001f90 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80003bf0:	00100913          	li	s2,1
    80003bf4:	0300006f          	j	80003c24 <_Z20testConsumerProducerv+0x270>
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80003bf8:	00008797          	auipc	a5,0x8
    80003bfc:	90078793          	addi	a5,a5,-1792 # 8000b4f8 <_ZTV8Producer+0x10>
    80003c00:	00fcb023          	sd	a5,0(s9)
    80003c04:	009cb823          	sd	s1,16(s9)
        producers[i] = new Producer(&threadData[i]);
    80003c08:	00391793          	slli	a5,s2,0x3
    80003c0c:	00fa07b3          	add	a5,s4,a5
    80003c10:	0197b023          	sd	s9,0(a5)
        producers[i]->start();
    80003c14:	000c8513          	mv	a0,s9
    80003c18:	ffffe097          	auipc	ra,0xffffe
    80003c1c:	378080e7          	jalr	888(ra) # 80001f90 <_ZN6Thread5startEv>
    for (int i = 1; i < threadNum; i++) {
    80003c20:	0019091b          	addiw	s2,s2,1
    80003c24:	05395263          	bge	s2,s3,80003c68 <_Z20testConsumerProducerv+0x2b4>
        threadData[i].id = i;
    80003c28:	00191493          	slli	s1,s2,0x1
    80003c2c:	012484b3          	add	s1,s1,s2
    80003c30:	00349493          	slli	s1,s1,0x3
    80003c34:	009b04b3          	add	s1,s6,s1
    80003c38:	0124a023          	sw	s2,0(s1)
        threadData[i].buffer = buffer;
    80003c3c:	0154b423          	sd	s5,8(s1)
        threadData[i].sem = waitForAll;
    80003c40:	00008797          	auipc	a5,0x8
    80003c44:	a687b783          	ld	a5,-1432(a5) # 8000b6a8 <_ZL10waitForAll>
    80003c48:	00f4b823          	sd	a5,16(s1)
        producers[i] = new Producer(&threadData[i]);
    80003c4c:	01800513          	li	a0,24
    80003c50:	ffffe097          	auipc	ra,0xffffe
    80003c54:	180080e7          	jalr	384(ra) # 80001dd0 <_Znwm>
    80003c58:	00050c93          	mv	s9,a0
    Producer(thread_data *_td) : Thread(), td(_td) {}
    80003c5c:	ffffe097          	auipc	ra,0xffffe
    80003c60:	3d8080e7          	jalr	984(ra) # 80002034 <_ZN6ThreadC1Ev>
    80003c64:	f95ff06f          	j	80003bf8 <_Z20testConsumerProducerv+0x244>
    Thread::dispatch();
    80003c68:	ffffe097          	auipc	ra,0xffffe
    80003c6c:	378080e7          	jalr	888(ra) # 80001fe0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80003c70:	00000493          	li	s1,0
    80003c74:	0099ce63          	blt	s3,s1,80003c90 <_Z20testConsumerProducerv+0x2dc>
        waitForAll->wait();
    80003c78:	00008517          	auipc	a0,0x8
    80003c7c:	a3053503          	ld	a0,-1488(a0) # 8000b6a8 <_ZL10waitForAll>
    80003c80:	ffffe097          	auipc	ra,0xffffe
    80003c84:	438080e7          	jalr	1080(ra) # 800020b8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80003c88:	0014849b          	addiw	s1,s1,1
    80003c8c:	fe9ff06f          	j	80003c74 <_Z20testConsumerProducerv+0x2c0>
    delete waitForAll;
    80003c90:	00008517          	auipc	a0,0x8
    80003c94:	a1853503          	ld	a0,-1512(a0) # 8000b6a8 <_ZL10waitForAll>
    80003c98:	00050863          	beqz	a0,80003ca8 <_Z20testConsumerProducerv+0x2f4>
    80003c9c:	00053783          	ld	a5,0(a0)
    80003ca0:	0087b783          	ld	a5,8(a5)
    80003ca4:	000780e7          	jalr	a5
    for (int i = 0; i <= threadNum; i++) {
    80003ca8:	00000493          	li	s1,0
    80003cac:	0080006f          	j	80003cb4 <_Z20testConsumerProducerv+0x300>
    for (int i = 0; i < threadNum; i++) {
    80003cb0:	0014849b          	addiw	s1,s1,1
    80003cb4:	0334d263          	bge	s1,s3,80003cd8 <_Z20testConsumerProducerv+0x324>
        delete producers[i];
    80003cb8:	00349793          	slli	a5,s1,0x3
    80003cbc:	00fa07b3          	add	a5,s4,a5
    80003cc0:	0007b503          	ld	a0,0(a5)
    80003cc4:	fe0506e3          	beqz	a0,80003cb0 <_Z20testConsumerProducerv+0x2fc>
    80003cc8:	00053783          	ld	a5,0(a0)
    80003ccc:	0087b783          	ld	a5,8(a5)
    80003cd0:	000780e7          	jalr	a5
    80003cd4:	fddff06f          	j	80003cb0 <_Z20testConsumerProducerv+0x2fc>
    delete consumer;
    80003cd8:	000b8a63          	beqz	s7,80003cec <_Z20testConsumerProducerv+0x338>
    80003cdc:	000bb783          	ld	a5,0(s7)
    80003ce0:	0087b783          	ld	a5,8(a5)
    80003ce4:	000b8513          	mv	a0,s7
    80003ce8:	000780e7          	jalr	a5
    delete buffer;
    80003cec:	000a8e63          	beqz	s5,80003d08 <_Z20testConsumerProducerv+0x354>
    80003cf0:	000a8513          	mv	a0,s5
    80003cf4:	00002097          	auipc	ra,0x2
    80003cf8:	870080e7          	jalr	-1936(ra) # 80005564 <_ZN9BufferCPPD1Ev>
    80003cfc:	000a8513          	mv	a0,s5
    80003d00:	ffffe097          	auipc	ra,0xffffe
    80003d04:	120080e7          	jalr	288(ra) # 80001e20 <_ZdlPv>
    80003d08:	000c0113          	mv	sp,s8
}
    80003d0c:	f8040113          	addi	sp,s0,-128
    80003d10:	07813083          	ld	ra,120(sp)
    80003d14:	07013403          	ld	s0,112(sp)
    80003d18:	06813483          	ld	s1,104(sp)
    80003d1c:	06013903          	ld	s2,96(sp)
    80003d20:	05813983          	ld	s3,88(sp)
    80003d24:	05013a03          	ld	s4,80(sp)
    80003d28:	04813a83          	ld	s5,72(sp)
    80003d2c:	04013b03          	ld	s6,64(sp)
    80003d30:	03813b83          	ld	s7,56(sp)
    80003d34:	03013c03          	ld	s8,48(sp)
    80003d38:	02813c83          	ld	s9,40(sp)
    80003d3c:	08010113          	addi	sp,sp,128
    80003d40:	00008067          	ret
    80003d44:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80003d48:	000a8513          	mv	a0,s5
    80003d4c:	ffffe097          	auipc	ra,0xffffe
    80003d50:	0d4080e7          	jalr	212(ra) # 80001e20 <_ZdlPv>
    80003d54:	00048513          	mv	a0,s1
    80003d58:	00009097          	auipc	ra,0x9
    80003d5c:	a50080e7          	jalr	-1456(ra) # 8000c7a8 <_Unwind_Resume>
    80003d60:	00050493          	mv	s1,a0
    waitForAll = new Semaphore(0);
    80003d64:	00090513          	mv	a0,s2
    80003d68:	ffffe097          	auipc	ra,0xffffe
    80003d6c:	0b8080e7          	jalr	184(ra) # 80001e20 <_ZdlPv>
    80003d70:	00048513          	mv	a0,s1
    80003d74:	00009097          	auipc	ra,0x9
    80003d78:	a34080e7          	jalr	-1484(ra) # 8000c7a8 <_Unwind_Resume>
    80003d7c:	00050493          	mv	s1,a0
    Thread *consumer = new Consumer(&threadData[threadNum]);
    80003d80:	000b8513          	mv	a0,s7
    80003d84:	ffffe097          	auipc	ra,0xffffe
    80003d88:	09c080e7          	jalr	156(ra) # 80001e20 <_ZdlPv>
    80003d8c:	00048513          	mv	a0,s1
    80003d90:	00009097          	auipc	ra,0x9
    80003d94:	a18080e7          	jalr	-1512(ra) # 8000c7a8 <_Unwind_Resume>
    80003d98:	00050913          	mv	s2,a0
    producers[0] = new ProducerKeyborad(&threadData[0]);
    80003d9c:	00048513          	mv	a0,s1
    80003da0:	ffffe097          	auipc	ra,0xffffe
    80003da4:	080080e7          	jalr	128(ra) # 80001e20 <_ZdlPv>
    80003da8:	00090513          	mv	a0,s2
    80003dac:	00009097          	auipc	ra,0x9
    80003db0:	9fc080e7          	jalr	-1540(ra) # 8000c7a8 <_Unwind_Resume>
    80003db4:	00050493          	mv	s1,a0
        producers[i] = new Producer(&threadData[i]);
    80003db8:	000c8513          	mv	a0,s9
    80003dbc:	ffffe097          	auipc	ra,0xffffe
    80003dc0:	064080e7          	jalr	100(ra) # 80001e20 <_ZdlPv>
    80003dc4:	00048513          	mv	a0,s1
    80003dc8:	00009097          	auipc	ra,0x9
    80003dcc:	9e0080e7          	jalr	-1568(ra) # 8000c7a8 <_Unwind_Resume>

0000000080003dd0 <_ZN8Consumer3runEv>:
    void run() override {
    80003dd0:	fd010113          	addi	sp,sp,-48
    80003dd4:	02113423          	sd	ra,40(sp)
    80003dd8:	02813023          	sd	s0,32(sp)
    80003ddc:	00913c23          	sd	s1,24(sp)
    80003de0:	01213823          	sd	s2,16(sp)
    80003de4:	01313423          	sd	s3,8(sp)
    80003de8:	03010413          	addi	s0,sp,48
    80003dec:	00050913          	mv	s2,a0
        int i = 0;
    80003df0:	00000993          	li	s3,0
    80003df4:	0100006f          	j	80003e04 <_ZN8Consumer3runEv+0x34>
                Console::putc('\n');
    80003df8:	00a00513          	li	a0,10
    80003dfc:	ffffe097          	auipc	ra,0xffffe
    80003e00:	408080e7          	jalr	1032(ra) # 80002204 <_ZN7Console4putcEc>
        while (!threadEnd) {
    80003e04:	00008797          	auipc	a5,0x8
    80003e08:	89c7a783          	lw	a5,-1892(a5) # 8000b6a0 <_ZL9threadEnd>
    80003e0c:	04079a63          	bnez	a5,80003e60 <_ZN8Consumer3runEv+0x90>
            int key = td->buffer->get();
    80003e10:	01093783          	ld	a5,16(s2)
    80003e14:	0087b503          	ld	a0,8(a5)
    80003e18:	00001097          	auipc	ra,0x1
    80003e1c:	638080e7          	jalr	1592(ra) # 80005450 <_ZN9BufferCPP3getEv>
            i++;
    80003e20:	0019849b          	addiw	s1,s3,1
    80003e24:	0004899b          	sext.w	s3,s1
            Console::putc(key);
    80003e28:	0ff57513          	andi	a0,a0,255
    80003e2c:	ffffe097          	auipc	ra,0xffffe
    80003e30:	3d8080e7          	jalr	984(ra) # 80002204 <_ZN7Console4putcEc>
            if (i % 80 == 0) {
    80003e34:	05000793          	li	a5,80
    80003e38:	02f4e4bb          	remw	s1,s1,a5
    80003e3c:	fc0494e3          	bnez	s1,80003e04 <_ZN8Consumer3runEv+0x34>
    80003e40:	fb9ff06f          	j	80003df8 <_ZN8Consumer3runEv+0x28>
            int key = td->buffer->get();
    80003e44:	01093783          	ld	a5,16(s2)
    80003e48:	0087b503          	ld	a0,8(a5)
    80003e4c:	00001097          	auipc	ra,0x1
    80003e50:	604080e7          	jalr	1540(ra) # 80005450 <_ZN9BufferCPP3getEv>
            Console::putc(key);
    80003e54:	0ff57513          	andi	a0,a0,255
    80003e58:	ffffe097          	auipc	ra,0xffffe
    80003e5c:	3ac080e7          	jalr	940(ra) # 80002204 <_ZN7Console4putcEc>
        while (td->buffer->getCnt() > 0) {
    80003e60:	01093783          	ld	a5,16(s2)
    80003e64:	0087b503          	ld	a0,8(a5)
    80003e68:	00001097          	auipc	ra,0x1
    80003e6c:	674080e7          	jalr	1652(ra) # 800054dc <_ZN9BufferCPP6getCntEv>
    80003e70:	fca04ae3          	bgtz	a0,80003e44 <_ZN8Consumer3runEv+0x74>
        td->sem->signal();
    80003e74:	01093783          	ld	a5,16(s2)
    80003e78:	0107b503          	ld	a0,16(a5)
    80003e7c:	ffffe097          	auipc	ra,0xffffe
    80003e80:	268080e7          	jalr	616(ra) # 800020e4 <_ZN9Semaphore6signalEv>
    }
    80003e84:	02813083          	ld	ra,40(sp)
    80003e88:	02013403          	ld	s0,32(sp)
    80003e8c:	01813483          	ld	s1,24(sp)
    80003e90:	01013903          	ld	s2,16(sp)
    80003e94:	00813983          	ld	s3,8(sp)
    80003e98:	03010113          	addi	sp,sp,48
    80003e9c:	00008067          	ret

0000000080003ea0 <_ZN8ConsumerD1Ev>:
class Consumer : public Thread {
    80003ea0:	ff010113          	addi	sp,sp,-16
    80003ea4:	00113423          	sd	ra,8(sp)
    80003ea8:	00813023          	sd	s0,0(sp)
    80003eac:	01010413          	addi	s0,sp,16
    80003eb0:	00007797          	auipc	a5,0x7
    80003eb4:	67078793          	addi	a5,a5,1648 # 8000b520 <_ZTV8Consumer+0x10>
    80003eb8:	00f53023          	sd	a5,0(a0)
    80003ebc:	ffffe097          	auipc	ra,0xffffe
    80003ec0:	ff4080e7          	jalr	-12(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80003ec4:	00813083          	ld	ra,8(sp)
    80003ec8:	00013403          	ld	s0,0(sp)
    80003ecc:	01010113          	addi	sp,sp,16
    80003ed0:	00008067          	ret

0000000080003ed4 <_ZN8ConsumerD0Ev>:
    80003ed4:	fe010113          	addi	sp,sp,-32
    80003ed8:	00113c23          	sd	ra,24(sp)
    80003edc:	00813823          	sd	s0,16(sp)
    80003ee0:	00913423          	sd	s1,8(sp)
    80003ee4:	02010413          	addi	s0,sp,32
    80003ee8:	00050493          	mv	s1,a0
    80003eec:	00007797          	auipc	a5,0x7
    80003ef0:	63478793          	addi	a5,a5,1588 # 8000b520 <_ZTV8Consumer+0x10>
    80003ef4:	00f53023          	sd	a5,0(a0)
    80003ef8:	ffffe097          	auipc	ra,0xffffe
    80003efc:	fb8080e7          	jalr	-72(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80003f00:	00048513          	mv	a0,s1
    80003f04:	ffffe097          	auipc	ra,0xffffe
    80003f08:	f1c080e7          	jalr	-228(ra) # 80001e20 <_ZdlPv>
    80003f0c:	01813083          	ld	ra,24(sp)
    80003f10:	01013403          	ld	s0,16(sp)
    80003f14:	00813483          	ld	s1,8(sp)
    80003f18:	02010113          	addi	sp,sp,32
    80003f1c:	00008067          	ret

0000000080003f20 <_ZN16ProducerKeyboradD1Ev>:
class ProducerKeyborad : public Thread {
    80003f20:	ff010113          	addi	sp,sp,-16
    80003f24:	00113423          	sd	ra,8(sp)
    80003f28:	00813023          	sd	s0,0(sp)
    80003f2c:	01010413          	addi	s0,sp,16
    80003f30:	00007797          	auipc	a5,0x7
    80003f34:	5a078793          	addi	a5,a5,1440 # 8000b4d0 <_ZTV16ProducerKeyborad+0x10>
    80003f38:	00f53023          	sd	a5,0(a0)
    80003f3c:	ffffe097          	auipc	ra,0xffffe
    80003f40:	f74080e7          	jalr	-140(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80003f44:	00813083          	ld	ra,8(sp)
    80003f48:	00013403          	ld	s0,0(sp)
    80003f4c:	01010113          	addi	sp,sp,16
    80003f50:	00008067          	ret

0000000080003f54 <_ZN16ProducerKeyboradD0Ev>:
    80003f54:	fe010113          	addi	sp,sp,-32
    80003f58:	00113c23          	sd	ra,24(sp)
    80003f5c:	00813823          	sd	s0,16(sp)
    80003f60:	00913423          	sd	s1,8(sp)
    80003f64:	02010413          	addi	s0,sp,32
    80003f68:	00050493          	mv	s1,a0
    80003f6c:	00007797          	auipc	a5,0x7
    80003f70:	56478793          	addi	a5,a5,1380 # 8000b4d0 <_ZTV16ProducerKeyborad+0x10>
    80003f74:	00f53023          	sd	a5,0(a0)
    80003f78:	ffffe097          	auipc	ra,0xffffe
    80003f7c:	f38080e7          	jalr	-200(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80003f80:	00048513          	mv	a0,s1
    80003f84:	ffffe097          	auipc	ra,0xffffe
    80003f88:	e9c080e7          	jalr	-356(ra) # 80001e20 <_ZdlPv>
    80003f8c:	01813083          	ld	ra,24(sp)
    80003f90:	01013403          	ld	s0,16(sp)
    80003f94:	00813483          	ld	s1,8(sp)
    80003f98:	02010113          	addi	sp,sp,32
    80003f9c:	00008067          	ret

0000000080003fa0 <_ZN8ProducerD1Ev>:
class Producer : public Thread {
    80003fa0:	ff010113          	addi	sp,sp,-16
    80003fa4:	00113423          	sd	ra,8(sp)
    80003fa8:	00813023          	sd	s0,0(sp)
    80003fac:	01010413          	addi	s0,sp,16
    80003fb0:	00007797          	auipc	a5,0x7
    80003fb4:	54878793          	addi	a5,a5,1352 # 8000b4f8 <_ZTV8Producer+0x10>
    80003fb8:	00f53023          	sd	a5,0(a0)
    80003fbc:	ffffe097          	auipc	ra,0xffffe
    80003fc0:	ef4080e7          	jalr	-268(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80003fc4:	00813083          	ld	ra,8(sp)
    80003fc8:	00013403          	ld	s0,0(sp)
    80003fcc:	01010113          	addi	sp,sp,16
    80003fd0:	00008067          	ret

0000000080003fd4 <_ZN8ProducerD0Ev>:
    80003fd4:	fe010113          	addi	sp,sp,-32
    80003fd8:	00113c23          	sd	ra,24(sp)
    80003fdc:	00813823          	sd	s0,16(sp)
    80003fe0:	00913423          	sd	s1,8(sp)
    80003fe4:	02010413          	addi	s0,sp,32
    80003fe8:	00050493          	mv	s1,a0
    80003fec:	00007797          	auipc	a5,0x7
    80003ff0:	50c78793          	addi	a5,a5,1292 # 8000b4f8 <_ZTV8Producer+0x10>
    80003ff4:	00f53023          	sd	a5,0(a0)
    80003ff8:	ffffe097          	auipc	ra,0xffffe
    80003ffc:	eb8080e7          	jalr	-328(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80004000:	00048513          	mv	a0,s1
    80004004:	ffffe097          	auipc	ra,0xffffe
    80004008:	e1c080e7          	jalr	-484(ra) # 80001e20 <_ZdlPv>
    8000400c:	01813083          	ld	ra,24(sp)
    80004010:	01013403          	ld	s0,16(sp)
    80004014:	00813483          	ld	s1,8(sp)
    80004018:	02010113          	addi	sp,sp,32
    8000401c:	00008067          	ret

0000000080004020 <_ZN16ProducerKeyborad3runEv>:
    void run() override {
    80004020:	fe010113          	addi	sp,sp,-32
    80004024:	00113c23          	sd	ra,24(sp)
    80004028:	00813823          	sd	s0,16(sp)
    8000402c:	00913423          	sd	s1,8(sp)
    80004030:	02010413          	addi	s0,sp,32
    80004034:	00050493          	mv	s1,a0
        while ((key = getc()) != 0x1b) {
    80004038:	ffffd097          	auipc	ra,0xffffd
    8000403c:	5cc080e7          	jalr	1484(ra) # 80001604 <_Z4getcv>
    80004040:	0005059b          	sext.w	a1,a0
    80004044:	01b00793          	li	a5,27
    80004048:	00f58c63          	beq	a1,a5,80004060 <_ZN16ProducerKeyborad3runEv+0x40>
            td->buffer->put(key);
    8000404c:	0104b783          	ld	a5,16(s1)
    80004050:	0087b503          	ld	a0,8(a5)
    80004054:	00001097          	auipc	ra,0x1
    80004058:	36c080e7          	jalr	876(ra) # 800053c0 <_ZN9BufferCPP3putEi>
        while ((key = getc()) != 0x1b) {
    8000405c:	fddff06f          	j	80004038 <_ZN16ProducerKeyborad3runEv+0x18>
        threadEnd = 1;
    80004060:	00100793          	li	a5,1
    80004064:	00007717          	auipc	a4,0x7
    80004068:	62f72e23          	sw	a5,1596(a4) # 8000b6a0 <_ZL9threadEnd>
        td->buffer->put('!');
    8000406c:	0104b783          	ld	a5,16(s1)
    80004070:	02100593          	li	a1,33
    80004074:	0087b503          	ld	a0,8(a5)
    80004078:	00001097          	auipc	ra,0x1
    8000407c:	348080e7          	jalr	840(ra) # 800053c0 <_ZN9BufferCPP3putEi>
        td->sem->signal();
    80004080:	0104b783          	ld	a5,16(s1)
    80004084:	0107b503          	ld	a0,16(a5)
    80004088:	ffffe097          	auipc	ra,0xffffe
    8000408c:	05c080e7          	jalr	92(ra) # 800020e4 <_ZN9Semaphore6signalEv>
    }
    80004090:	01813083          	ld	ra,24(sp)
    80004094:	01013403          	ld	s0,16(sp)
    80004098:	00813483          	ld	s1,8(sp)
    8000409c:	02010113          	addi	sp,sp,32
    800040a0:	00008067          	ret

00000000800040a4 <_ZN8Producer3runEv>:
    void run() override {
    800040a4:	fe010113          	addi	sp,sp,-32
    800040a8:	00113c23          	sd	ra,24(sp)
    800040ac:	00813823          	sd	s0,16(sp)
    800040b0:	00913423          	sd	s1,8(sp)
    800040b4:	01213023          	sd	s2,0(sp)
    800040b8:	02010413          	addi	s0,sp,32
    800040bc:	00050493          	mv	s1,a0
        int i = 0;
    800040c0:	00000913          	li	s2,0
        while (!threadEnd) {
    800040c4:	00007797          	auipc	a5,0x7
    800040c8:	5dc7a783          	lw	a5,1500(a5) # 8000b6a0 <_ZL9threadEnd>
    800040cc:	04079263          	bnez	a5,80004110 <_ZN8Producer3runEv+0x6c>
            td->buffer->put(td->id + '0');
    800040d0:	0104b783          	ld	a5,16(s1)
    800040d4:	0007a583          	lw	a1,0(a5)
    800040d8:	0305859b          	addiw	a1,a1,48
    800040dc:	0087b503          	ld	a0,8(a5)
    800040e0:	00001097          	auipc	ra,0x1
    800040e4:	2e0080e7          	jalr	736(ra) # 800053c0 <_ZN9BufferCPP3putEi>
            i++;
    800040e8:	0019071b          	addiw	a4,s2,1
    800040ec:	0007091b          	sext.w	s2,a4
            Thread::sleep((i + td->id) % 5);
    800040f0:	0104b783          	ld	a5,16(s1)
    800040f4:	0007a783          	lw	a5,0(a5)
    800040f8:	00e787bb          	addw	a5,a5,a4
    800040fc:	00500513          	li	a0,5
    80004100:	02a7e53b          	remw	a0,a5,a0
    80004104:	ffffe097          	auipc	ra,0xffffe
    80004108:	f04080e7          	jalr	-252(ra) # 80002008 <_ZN6Thread5sleepEm>
        while (!threadEnd) {
    8000410c:	fb9ff06f          	j	800040c4 <_ZN8Producer3runEv+0x20>
        td->sem->signal();
    80004110:	0104b783          	ld	a5,16(s1)
    80004114:	0107b503          	ld	a0,16(a5)
    80004118:	ffffe097          	auipc	ra,0xffffe
    8000411c:	fcc080e7          	jalr	-52(ra) # 800020e4 <_ZN9Semaphore6signalEv>
    }
    80004120:	01813083          	ld	ra,24(sp)
    80004124:	01013403          	ld	s0,16(sp)
    80004128:	00813483          	ld	s1,8(sp)
    8000412c:	00013903          	ld	s2,0(sp)
    80004130:	02010113          	addi	sp,sp,32
    80004134:	00008067          	ret

0000000080004138 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    80004138:	fe010113          	addi	sp,sp,-32
    8000413c:	00113c23          	sd	ra,24(sp)
    80004140:	00813823          	sd	s0,16(sp)
    80004144:	00913423          	sd	s1,8(sp)
    80004148:	01213023          	sd	s2,0(sp)
    8000414c:	02010413          	addi	s0,sp,32
    80004150:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80004154:	00100793          	li	a5,1
    80004158:	02a7f863          	bgeu	a5,a0,80004188 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    8000415c:	00a00793          	li	a5,10
    80004160:	02f577b3          	remu	a5,a0,a5
    80004164:	02078e63          	beqz	a5,800041a0 <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80004168:	fff48513          	addi	a0,s1,-1
    8000416c:	00000097          	auipc	ra,0x0
    80004170:	fcc080e7          	jalr	-52(ra) # 80004138 <_ZL9fibonaccim>
    80004174:	00050913          	mv	s2,a0
    80004178:	ffe48513          	addi	a0,s1,-2
    8000417c:	00000097          	auipc	ra,0x0
    80004180:	fbc080e7          	jalr	-68(ra) # 80004138 <_ZL9fibonaccim>
    80004184:	00a90533          	add	a0,s2,a0
}
    80004188:	01813083          	ld	ra,24(sp)
    8000418c:	01013403          	ld	s0,16(sp)
    80004190:	00813483          	ld	s1,8(sp)
    80004194:	00013903          	ld	s2,0(sp)
    80004198:	02010113          	addi	sp,sp,32
    8000419c:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    800041a0:	ffffd097          	auipc	ra,0xffffd
    800041a4:	308080e7          	jalr	776(ra) # 800014a8 <_Z15thread_dispatchv>
    800041a8:	fc1ff06f          	j	80004168 <_ZL9fibonaccim+0x30>

00000000800041ac <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    800041ac:	fe010113          	addi	sp,sp,-32
    800041b0:	00113c23          	sd	ra,24(sp)
    800041b4:	00813823          	sd	s0,16(sp)
    800041b8:	00913423          	sd	s1,8(sp)
    800041bc:	01213023          	sd	s2,0(sp)
    800041c0:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    800041c4:	00a00493          	li	s1,10
    800041c8:	0400006f          	j	80004208 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    800041cc:	00005517          	auipc	a0,0x5
    800041d0:	fd450513          	addi	a0,a0,-44 # 800091a0 <kvmincrease+0xbb0>
    800041d4:	00001097          	auipc	ra,0x1
    800041d8:	dc8080e7          	jalr	-568(ra) # 80004f9c <_Z11printStringPKc>
    800041dc:	00000613          	li	a2,0
    800041e0:	00a00593          	li	a1,10
    800041e4:	00048513          	mv	a0,s1
    800041e8:	00001097          	auipc	ra,0x1
    800041ec:	f64080e7          	jalr	-156(ra) # 8000514c <_Z8printIntiii>
    800041f0:	00005517          	auipc	a0,0x5
    800041f4:	1a050513          	addi	a0,a0,416 # 80009390 <kvmincrease+0xda0>
    800041f8:	00001097          	auipc	ra,0x1
    800041fc:	da4080e7          	jalr	-604(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 13; i++) {
    80004200:	0014849b          	addiw	s1,s1,1
    80004204:	0ff4f493          	andi	s1,s1,255
    80004208:	00c00793          	li	a5,12
    8000420c:	fc97f0e3          	bgeu	a5,s1,800041cc <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    80004210:	00005517          	auipc	a0,0x5
    80004214:	f9850513          	addi	a0,a0,-104 # 800091a8 <kvmincrease+0xbb8>
    80004218:	00001097          	auipc	ra,0x1
    8000421c:	d84080e7          	jalr	-636(ra) # 80004f9c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    80004220:	00500313          	li	t1,5
    thread_dispatch();
    80004224:	ffffd097          	auipc	ra,0xffffd
    80004228:	284080e7          	jalr	644(ra) # 800014a8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    8000422c:	01000513          	li	a0,16
    80004230:	00000097          	auipc	ra,0x0
    80004234:	f08080e7          	jalr	-248(ra) # 80004138 <_ZL9fibonaccim>
    80004238:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    8000423c:	00005517          	auipc	a0,0x5
    80004240:	f7c50513          	addi	a0,a0,-132 # 800091b8 <kvmincrease+0xbc8>
    80004244:	00001097          	auipc	ra,0x1
    80004248:	d58080e7          	jalr	-680(ra) # 80004f9c <_Z11printStringPKc>
    8000424c:	00000613          	li	a2,0
    80004250:	00a00593          	li	a1,10
    80004254:	0009051b          	sext.w	a0,s2
    80004258:	00001097          	auipc	ra,0x1
    8000425c:	ef4080e7          	jalr	-268(ra) # 8000514c <_Z8printIntiii>
    80004260:	00005517          	auipc	a0,0x5
    80004264:	13050513          	addi	a0,a0,304 # 80009390 <kvmincrease+0xda0>
    80004268:	00001097          	auipc	ra,0x1
    8000426c:	d34080e7          	jalr	-716(ra) # 80004f9c <_Z11printStringPKc>
    80004270:	0400006f          	j	800042b0 <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80004274:	00005517          	auipc	a0,0x5
    80004278:	f2c50513          	addi	a0,a0,-212 # 800091a0 <kvmincrease+0xbb0>
    8000427c:	00001097          	auipc	ra,0x1
    80004280:	d20080e7          	jalr	-736(ra) # 80004f9c <_Z11printStringPKc>
    80004284:	00000613          	li	a2,0
    80004288:	00a00593          	li	a1,10
    8000428c:	00048513          	mv	a0,s1
    80004290:	00001097          	auipc	ra,0x1
    80004294:	ebc080e7          	jalr	-324(ra) # 8000514c <_Z8printIntiii>
    80004298:	00005517          	auipc	a0,0x5
    8000429c:	0f850513          	addi	a0,a0,248 # 80009390 <kvmincrease+0xda0>
    800042a0:	00001097          	auipc	ra,0x1
    800042a4:	cfc080e7          	jalr	-772(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 16; i++) {
    800042a8:	0014849b          	addiw	s1,s1,1
    800042ac:	0ff4f493          	andi	s1,s1,255
    800042b0:	00f00793          	li	a5,15
    800042b4:	fc97f0e3          	bgeu	a5,s1,80004274 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    800042b8:	00005517          	auipc	a0,0x5
    800042bc:	f1050513          	addi	a0,a0,-240 # 800091c8 <kvmincrease+0xbd8>
    800042c0:	00001097          	auipc	ra,0x1
    800042c4:	cdc080e7          	jalr	-804(ra) # 80004f9c <_Z11printStringPKc>
    finishedD = true;
    800042c8:	00100793          	li	a5,1
    800042cc:	00007717          	auipc	a4,0x7
    800042d0:	3ef70223          	sb	a5,996(a4) # 8000b6b0 <_ZL9finishedD>
    thread_dispatch();
    800042d4:	ffffd097          	auipc	ra,0xffffd
    800042d8:	1d4080e7          	jalr	468(ra) # 800014a8 <_Z15thread_dispatchv>
}
    800042dc:	01813083          	ld	ra,24(sp)
    800042e0:	01013403          	ld	s0,16(sp)
    800042e4:	00813483          	ld	s1,8(sp)
    800042e8:	00013903          	ld	s2,0(sp)
    800042ec:	02010113          	addi	sp,sp,32
    800042f0:	00008067          	ret

00000000800042f4 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    800042f4:	fe010113          	addi	sp,sp,-32
    800042f8:	00113c23          	sd	ra,24(sp)
    800042fc:	00813823          	sd	s0,16(sp)
    80004300:	00913423          	sd	s1,8(sp)
    80004304:	01213023          	sd	s2,0(sp)
    80004308:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    8000430c:	00000493          	li	s1,0
    80004310:	0400006f          	j	80004350 <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80004314:	00005517          	auipc	a0,0x5
    80004318:	e5c50513          	addi	a0,a0,-420 # 80009170 <kvmincrease+0xb80>
    8000431c:	00001097          	auipc	ra,0x1
    80004320:	c80080e7          	jalr	-896(ra) # 80004f9c <_Z11printStringPKc>
    80004324:	00000613          	li	a2,0
    80004328:	00a00593          	li	a1,10
    8000432c:	00048513          	mv	a0,s1
    80004330:	00001097          	auipc	ra,0x1
    80004334:	e1c080e7          	jalr	-484(ra) # 8000514c <_Z8printIntiii>
    80004338:	00005517          	auipc	a0,0x5
    8000433c:	05850513          	addi	a0,a0,88 # 80009390 <kvmincrease+0xda0>
    80004340:	00001097          	auipc	ra,0x1
    80004344:	c5c080e7          	jalr	-932(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80004348:	0014849b          	addiw	s1,s1,1
    8000434c:	0ff4f493          	andi	s1,s1,255
    80004350:	00200793          	li	a5,2
    80004354:	fc97f0e3          	bgeu	a5,s1,80004314 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80004358:	00005517          	auipc	a0,0x5
    8000435c:	e2050513          	addi	a0,a0,-480 # 80009178 <kvmincrease+0xb88>
    80004360:	00001097          	auipc	ra,0x1
    80004364:	c3c080e7          	jalr	-964(ra) # 80004f9c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80004368:	00700313          	li	t1,7
    thread_dispatch();
    8000436c:	ffffd097          	auipc	ra,0xffffd
    80004370:	13c080e7          	jalr	316(ra) # 800014a8 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80004374:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80004378:	00005517          	auipc	a0,0x5
    8000437c:	e1050513          	addi	a0,a0,-496 # 80009188 <kvmincrease+0xb98>
    80004380:	00001097          	auipc	ra,0x1
    80004384:	c1c080e7          	jalr	-996(ra) # 80004f9c <_Z11printStringPKc>
    80004388:	00000613          	li	a2,0
    8000438c:	00a00593          	li	a1,10
    80004390:	0009051b          	sext.w	a0,s2
    80004394:	00001097          	auipc	ra,0x1
    80004398:	db8080e7          	jalr	-584(ra) # 8000514c <_Z8printIntiii>
    8000439c:	00005517          	auipc	a0,0x5
    800043a0:	ff450513          	addi	a0,a0,-12 # 80009390 <kvmincrease+0xda0>
    800043a4:	00001097          	auipc	ra,0x1
    800043a8:	bf8080e7          	jalr	-1032(ra) # 80004f9c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    800043ac:	00c00513          	li	a0,12
    800043b0:	00000097          	auipc	ra,0x0
    800043b4:	d88080e7          	jalr	-632(ra) # 80004138 <_ZL9fibonaccim>
    800043b8:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    800043bc:	00005517          	auipc	a0,0x5
    800043c0:	dd450513          	addi	a0,a0,-556 # 80009190 <kvmincrease+0xba0>
    800043c4:	00001097          	auipc	ra,0x1
    800043c8:	bd8080e7          	jalr	-1064(ra) # 80004f9c <_Z11printStringPKc>
    800043cc:	00000613          	li	a2,0
    800043d0:	00a00593          	li	a1,10
    800043d4:	0009051b          	sext.w	a0,s2
    800043d8:	00001097          	auipc	ra,0x1
    800043dc:	d74080e7          	jalr	-652(ra) # 8000514c <_Z8printIntiii>
    800043e0:	00005517          	auipc	a0,0x5
    800043e4:	fb050513          	addi	a0,a0,-80 # 80009390 <kvmincrease+0xda0>
    800043e8:	00001097          	auipc	ra,0x1
    800043ec:	bb4080e7          	jalr	-1100(ra) # 80004f9c <_Z11printStringPKc>
    800043f0:	0400006f          	j	80004430 <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    800043f4:	00005517          	auipc	a0,0x5
    800043f8:	d7c50513          	addi	a0,a0,-644 # 80009170 <kvmincrease+0xb80>
    800043fc:	00001097          	auipc	ra,0x1
    80004400:	ba0080e7          	jalr	-1120(ra) # 80004f9c <_Z11printStringPKc>
    80004404:	00000613          	li	a2,0
    80004408:	00a00593          	li	a1,10
    8000440c:	00048513          	mv	a0,s1
    80004410:	00001097          	auipc	ra,0x1
    80004414:	d3c080e7          	jalr	-708(ra) # 8000514c <_Z8printIntiii>
    80004418:	00005517          	auipc	a0,0x5
    8000441c:	f7850513          	addi	a0,a0,-136 # 80009390 <kvmincrease+0xda0>
    80004420:	00001097          	auipc	ra,0x1
    80004424:	b7c080e7          	jalr	-1156(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80004428:	0014849b          	addiw	s1,s1,1
    8000442c:	0ff4f493          	andi	s1,s1,255
    80004430:	00500793          	li	a5,5
    80004434:	fc97f0e3          	bgeu	a5,s1,800043f4 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80004438:	00005517          	auipc	a0,0x5
    8000443c:	d1050513          	addi	a0,a0,-752 # 80009148 <kvmincrease+0xb58>
    80004440:	00001097          	auipc	ra,0x1
    80004444:	b5c080e7          	jalr	-1188(ra) # 80004f9c <_Z11printStringPKc>
    finishedC = true;
    80004448:	00100793          	li	a5,1
    8000444c:	00007717          	auipc	a4,0x7
    80004450:	26f702a3          	sb	a5,613(a4) # 8000b6b1 <_ZL9finishedC>
    thread_dispatch();
    80004454:	ffffd097          	auipc	ra,0xffffd
    80004458:	054080e7          	jalr	84(ra) # 800014a8 <_Z15thread_dispatchv>
}
    8000445c:	01813083          	ld	ra,24(sp)
    80004460:	01013403          	ld	s0,16(sp)
    80004464:	00813483          	ld	s1,8(sp)
    80004468:	00013903          	ld	s2,0(sp)
    8000446c:	02010113          	addi	sp,sp,32
    80004470:	00008067          	ret

0000000080004474 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80004474:	fe010113          	addi	sp,sp,-32
    80004478:	00113c23          	sd	ra,24(sp)
    8000447c:	00813823          	sd	s0,16(sp)
    80004480:	00913423          	sd	s1,8(sp)
    80004484:	01213023          	sd	s2,0(sp)
    80004488:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    8000448c:	00000913          	li	s2,0
    80004490:	0380006f          	j	800044c8 <_ZL11workerBodyBPv+0x54>
            thread_dispatch();
    80004494:	ffffd097          	auipc	ra,0xffffd
    80004498:	014080e7          	jalr	20(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    8000449c:	00148493          	addi	s1,s1,1
    800044a0:	000027b7          	lui	a5,0x2
    800044a4:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    800044a8:	0097ee63          	bltu	a5,s1,800044c4 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    800044ac:	00000713          	li	a4,0
    800044b0:	000077b7          	lui	a5,0x7
    800044b4:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    800044b8:	fce7eee3          	bltu	a5,a4,80004494 <_ZL11workerBodyBPv+0x20>
    800044bc:	00170713          	addi	a4,a4,1
    800044c0:	ff1ff06f          	j	800044b0 <_ZL11workerBodyBPv+0x3c>
    for (uint64 i = 0; i < 16; i++) {
    800044c4:	00190913          	addi	s2,s2,1
    800044c8:	00f00793          	li	a5,15
    800044cc:	0527e063          	bltu	a5,s2,8000450c <_ZL11workerBodyBPv+0x98>
        printString("B: i="); printInt(i); printString("\n");
    800044d0:	00005517          	auipc	a0,0x5
    800044d4:	c8850513          	addi	a0,a0,-888 # 80009158 <kvmincrease+0xb68>
    800044d8:	00001097          	auipc	ra,0x1
    800044dc:	ac4080e7          	jalr	-1340(ra) # 80004f9c <_Z11printStringPKc>
    800044e0:	00000613          	li	a2,0
    800044e4:	00a00593          	li	a1,10
    800044e8:	0009051b          	sext.w	a0,s2
    800044ec:	00001097          	auipc	ra,0x1
    800044f0:	c60080e7          	jalr	-928(ra) # 8000514c <_Z8printIntiii>
    800044f4:	00005517          	auipc	a0,0x5
    800044f8:	e9c50513          	addi	a0,a0,-356 # 80009390 <kvmincrease+0xda0>
    800044fc:	00001097          	auipc	ra,0x1
    80004500:	aa0080e7          	jalr	-1376(ra) # 80004f9c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80004504:	00000493          	li	s1,0
    80004508:	f99ff06f          	j	800044a0 <_ZL11workerBodyBPv+0x2c>
    printString("B finished!\n");
    8000450c:	00005517          	auipc	a0,0x5
    80004510:	c5450513          	addi	a0,a0,-940 # 80009160 <kvmincrease+0xb70>
    80004514:	00001097          	auipc	ra,0x1
    80004518:	a88080e7          	jalr	-1400(ra) # 80004f9c <_Z11printStringPKc>
    finishedB = true;
    8000451c:	00100793          	li	a5,1
    80004520:	00007717          	auipc	a4,0x7
    80004524:	18f70923          	sb	a5,402(a4) # 8000b6b2 <_ZL9finishedB>
    thread_dispatch();
    80004528:	ffffd097          	auipc	ra,0xffffd
    8000452c:	f80080e7          	jalr	-128(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80004530:	01813083          	ld	ra,24(sp)
    80004534:	01013403          	ld	s0,16(sp)
    80004538:	00813483          	ld	s1,8(sp)
    8000453c:	00013903          	ld	s2,0(sp)
    80004540:	02010113          	addi	sp,sp,32
    80004544:	00008067          	ret

0000000080004548 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80004548:	fe010113          	addi	sp,sp,-32
    8000454c:	00113c23          	sd	ra,24(sp)
    80004550:	00813823          	sd	s0,16(sp)
    80004554:	00913423          	sd	s1,8(sp)
    80004558:	01213023          	sd	s2,0(sp)
    8000455c:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80004560:	00000913          	li	s2,0
    80004564:	0380006f          	j	8000459c <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80004568:	ffffd097          	auipc	ra,0xffffd
    8000456c:	f40080e7          	jalr	-192(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80004570:	00148493          	addi	s1,s1,1
    80004574:	000027b7          	lui	a5,0x2
    80004578:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    8000457c:	0097ee63          	bltu	a5,s1,80004598 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80004580:	00000713          	li	a4,0
    80004584:	000077b7          	lui	a5,0x7
    80004588:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    8000458c:	fce7eee3          	bltu	a5,a4,80004568 <_ZL11workerBodyAPv+0x20>
    80004590:	00170713          	addi	a4,a4,1
    80004594:	ff1ff06f          	j	80004584 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80004598:	00190913          	addi	s2,s2,1
    8000459c:	00900793          	li	a5,9
    800045a0:	0527e063          	bltu	a5,s2,800045e0 <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    800045a4:	00005517          	auipc	a0,0x5
    800045a8:	b9c50513          	addi	a0,a0,-1124 # 80009140 <kvmincrease+0xb50>
    800045ac:	00001097          	auipc	ra,0x1
    800045b0:	9f0080e7          	jalr	-1552(ra) # 80004f9c <_Z11printStringPKc>
    800045b4:	00000613          	li	a2,0
    800045b8:	00a00593          	li	a1,10
    800045bc:	0009051b          	sext.w	a0,s2
    800045c0:	00001097          	auipc	ra,0x1
    800045c4:	b8c080e7          	jalr	-1140(ra) # 8000514c <_Z8printIntiii>
    800045c8:	00005517          	auipc	a0,0x5
    800045cc:	dc850513          	addi	a0,a0,-568 # 80009390 <kvmincrease+0xda0>
    800045d0:	00001097          	auipc	ra,0x1
    800045d4:	9cc080e7          	jalr	-1588(ra) # 80004f9c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    800045d8:	00000493          	li	s1,0
    800045dc:	f99ff06f          	j	80004574 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    800045e0:	00005517          	auipc	a0,0x5
    800045e4:	b6850513          	addi	a0,a0,-1176 # 80009148 <kvmincrease+0xb58>
    800045e8:	00001097          	auipc	ra,0x1
    800045ec:	9b4080e7          	jalr	-1612(ra) # 80004f9c <_Z11printStringPKc>
    finishedA = true;
    800045f0:	00100793          	li	a5,1
    800045f4:	00007717          	auipc	a4,0x7
    800045f8:	0af70fa3          	sb	a5,191(a4) # 8000b6b3 <_ZL9finishedA>
}
    800045fc:	01813083          	ld	ra,24(sp)
    80004600:	01013403          	ld	s0,16(sp)
    80004604:	00813483          	ld	s1,8(sp)
    80004608:	00013903          	ld	s2,0(sp)
    8000460c:	02010113          	addi	sp,sp,32
    80004610:	00008067          	ret

0000000080004614 <_Z18Threads_C_API_testv>:


void Threads_C_API_test() {
    80004614:	fd010113          	addi	sp,sp,-48
    80004618:	02113423          	sd	ra,40(sp)
    8000461c:	02813023          	sd	s0,32(sp)
    80004620:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80004624:	00000613          	li	a2,0
    80004628:	00000597          	auipc	a1,0x0
    8000462c:	f2058593          	addi	a1,a1,-224 # 80004548 <_ZL11workerBodyAPv>
    80004630:	fd040513          	addi	a0,s0,-48
    80004634:	ffffd097          	auipc	ra,0xffffd
    80004638:	dd0080e7          	jalr	-560(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    8000463c:	00005517          	auipc	a0,0x5
    80004640:	b9c50513          	addi	a0,a0,-1124 # 800091d8 <kvmincrease+0xbe8>
    80004644:	00001097          	auipc	ra,0x1
    80004648:	958080e7          	jalr	-1704(ra) # 80004f9c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    8000464c:	00000613          	li	a2,0
    80004650:	00000597          	auipc	a1,0x0
    80004654:	e2458593          	addi	a1,a1,-476 # 80004474 <_ZL11workerBodyBPv>
    80004658:	fd840513          	addi	a0,s0,-40
    8000465c:	ffffd097          	auipc	ra,0xffffd
    80004660:	da8080e7          	jalr	-600(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80004664:	00005517          	auipc	a0,0x5
    80004668:	b8c50513          	addi	a0,a0,-1140 # 800091f0 <kvmincrease+0xc00>
    8000466c:	00001097          	auipc	ra,0x1
    80004670:	930080e7          	jalr	-1744(ra) # 80004f9c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80004674:	00000613          	li	a2,0
    80004678:	00000597          	auipc	a1,0x0
    8000467c:	c7c58593          	addi	a1,a1,-900 # 800042f4 <_ZL11workerBodyCPv>
    80004680:	fe040513          	addi	a0,s0,-32
    80004684:	ffffd097          	auipc	ra,0xffffd
    80004688:	d80080e7          	jalr	-640(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    8000468c:	00005517          	auipc	a0,0x5
    80004690:	b7c50513          	addi	a0,a0,-1156 # 80009208 <kvmincrease+0xc18>
    80004694:	00001097          	auipc	ra,0x1
    80004698:	908080e7          	jalr	-1784(ra) # 80004f9c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    8000469c:	00000613          	li	a2,0
    800046a0:	00000597          	auipc	a1,0x0
    800046a4:	b0c58593          	addi	a1,a1,-1268 # 800041ac <_ZL11workerBodyDPv>
    800046a8:	fe840513          	addi	a0,s0,-24
    800046ac:	ffffd097          	auipc	ra,0xffffd
    800046b0:	d58080e7          	jalr	-680(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    800046b4:	00005517          	auipc	a0,0x5
    800046b8:	b6c50513          	addi	a0,a0,-1172 # 80009220 <kvmincrease+0xc30>
    800046bc:	00001097          	auipc	ra,0x1
    800046c0:	8e0080e7          	jalr	-1824(ra) # 80004f9c <_Z11printStringPKc>
    800046c4:	00c0006f          	j	800046d0 <_Z18Threads_C_API_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    800046c8:	ffffd097          	auipc	ra,0xffffd
    800046cc:	de0080e7          	jalr	-544(ra) # 800014a8 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    800046d0:	00007797          	auipc	a5,0x7
    800046d4:	fe37c783          	lbu	a5,-29(a5) # 8000b6b3 <_ZL9finishedA>
    800046d8:	fe0788e3          	beqz	a5,800046c8 <_Z18Threads_C_API_testv+0xb4>
    800046dc:	00007797          	auipc	a5,0x7
    800046e0:	fd67c783          	lbu	a5,-42(a5) # 8000b6b2 <_ZL9finishedB>
    800046e4:	fe0782e3          	beqz	a5,800046c8 <_Z18Threads_C_API_testv+0xb4>
    800046e8:	00007797          	auipc	a5,0x7
    800046ec:	fc97c783          	lbu	a5,-55(a5) # 8000b6b1 <_ZL9finishedC>
    800046f0:	fc078ce3          	beqz	a5,800046c8 <_Z18Threads_C_API_testv+0xb4>
    800046f4:	00007797          	auipc	a5,0x7
    800046f8:	fbc7c783          	lbu	a5,-68(a5) # 8000b6b0 <_ZL9finishedD>
    800046fc:	fc0786e3          	beqz	a5,800046c8 <_Z18Threads_C_API_testv+0xb4>
    }

}
    80004700:	02813083          	ld	ra,40(sp)
    80004704:	02013403          	ld	s0,32(sp)
    80004708:	03010113          	addi	sp,sp,48
    8000470c:	00008067          	ret

0000000080004710 <_ZN16ProducerKeyboard16producerKeyboardEPv>:
    void run() override {
        producerKeyboard(td);
    }
};

void ProducerKeyboard::producerKeyboard(void *arg) {
    80004710:	fd010113          	addi	sp,sp,-48
    80004714:	02113423          	sd	ra,40(sp)
    80004718:	02813023          	sd	s0,32(sp)
    8000471c:	00913c23          	sd	s1,24(sp)
    80004720:	01213823          	sd	s2,16(sp)
    80004724:	01313423          	sd	s3,8(sp)
    80004728:	03010413          	addi	s0,sp,48
    8000472c:	00050993          	mv	s3,a0
    80004730:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int key;
    int i = 0;
    80004734:	00000913          	li	s2,0
    80004738:	00c0006f          	j	80004744 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    while ((key = getc()) != 0x1b) {
        data->buffer->put(key);
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    8000473c:	ffffe097          	auipc	ra,0xffffe
    80004740:	8a4080e7          	jalr	-1884(ra) # 80001fe0 <_ZN6Thread8dispatchEv>
    while ((key = getc()) != 0x1b) {
    80004744:	ffffd097          	auipc	ra,0xffffd
    80004748:	ec0080e7          	jalr	-320(ra) # 80001604 <_Z4getcv>
    8000474c:	0005059b          	sext.w	a1,a0
    80004750:	01b00793          	li	a5,27
    80004754:	02f58a63          	beq	a1,a5,80004788 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x78>
        data->buffer->put(key);
    80004758:	0084b503          	ld	a0,8(s1)
    8000475c:	00001097          	auipc	ra,0x1
    80004760:	c64080e7          	jalr	-924(ra) # 800053c0 <_ZN9BufferCPP3putEi>
        i++;
    80004764:	0019071b          	addiw	a4,s2,1
    80004768:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    8000476c:	0004a683          	lw	a3,0(s1)
    80004770:	0026979b          	slliw	a5,a3,0x2
    80004774:	00d787bb          	addw	a5,a5,a3
    80004778:	0017979b          	slliw	a5,a5,0x1
    8000477c:	02f767bb          	remw	a5,a4,a5
    80004780:	fc0792e3          	bnez	a5,80004744 <_ZN16ProducerKeyboard16producerKeyboardEPv+0x34>
    80004784:	fb9ff06f          	j	8000473c <_ZN16ProducerKeyboard16producerKeyboardEPv+0x2c>
        }
    }

    threadEnd = 1;
    80004788:	00100793          	li	a5,1
    8000478c:	00007717          	auipc	a4,0x7
    80004790:	f2f72623          	sw	a5,-212(a4) # 8000b6b8 <_ZL9threadEnd>
    td->buffer->put('!');
    80004794:	0109b783          	ld	a5,16(s3)
    80004798:	02100593          	li	a1,33
    8000479c:	0087b503          	ld	a0,8(a5)
    800047a0:	00001097          	auipc	ra,0x1
    800047a4:	c20080e7          	jalr	-992(ra) # 800053c0 <_ZN9BufferCPP3putEi>

    data->wait->signal();
    800047a8:	0104b503          	ld	a0,16(s1)
    800047ac:	ffffe097          	auipc	ra,0xffffe
    800047b0:	938080e7          	jalr	-1736(ra) # 800020e4 <_ZN9Semaphore6signalEv>
}
    800047b4:	02813083          	ld	ra,40(sp)
    800047b8:	02013403          	ld	s0,32(sp)
    800047bc:	01813483          	ld	s1,24(sp)
    800047c0:	01013903          	ld	s2,16(sp)
    800047c4:	00813983          	ld	s3,8(sp)
    800047c8:	03010113          	addi	sp,sp,48
    800047cc:	00008067          	ret

00000000800047d0 <_ZN12ProducerSync8producerEPv>:
    void run() override {
        producer(td);
    }
};

void ProducerSync::producer(void *arg) {
    800047d0:	fe010113          	addi	sp,sp,-32
    800047d4:	00113c23          	sd	ra,24(sp)
    800047d8:	00813823          	sd	s0,16(sp)
    800047dc:	00913423          	sd	s1,8(sp)
    800047e0:	01213023          	sd	s2,0(sp)
    800047e4:	02010413          	addi	s0,sp,32
    800047e8:	00058493          	mv	s1,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    800047ec:	00000913          	li	s2,0
    800047f0:	00c0006f          	j	800047fc <_ZN12ProducerSync8producerEPv+0x2c>
    while (!threadEnd) {
        data->buffer->put(data->id + '0');
        i++;

        if (i % (10 * data->id) == 0) {
            Thread::dispatch();
    800047f4:	ffffd097          	auipc	ra,0xffffd
    800047f8:	7ec080e7          	jalr	2028(ra) # 80001fe0 <_ZN6Thread8dispatchEv>
    while (!threadEnd) {
    800047fc:	00007797          	auipc	a5,0x7
    80004800:	ebc7a783          	lw	a5,-324(a5) # 8000b6b8 <_ZL9threadEnd>
    80004804:	02079e63          	bnez	a5,80004840 <_ZN12ProducerSync8producerEPv+0x70>
        data->buffer->put(data->id + '0');
    80004808:	0004a583          	lw	a1,0(s1)
    8000480c:	0305859b          	addiw	a1,a1,48
    80004810:	0084b503          	ld	a0,8(s1)
    80004814:	00001097          	auipc	ra,0x1
    80004818:	bac080e7          	jalr	-1108(ra) # 800053c0 <_ZN9BufferCPP3putEi>
        i++;
    8000481c:	0019071b          	addiw	a4,s2,1
    80004820:	0007091b          	sext.w	s2,a4
        if (i % (10 * data->id) == 0) {
    80004824:	0004a683          	lw	a3,0(s1)
    80004828:	0026979b          	slliw	a5,a3,0x2
    8000482c:	00d787bb          	addw	a5,a5,a3
    80004830:	0017979b          	slliw	a5,a5,0x1
    80004834:	02f767bb          	remw	a5,a4,a5
    80004838:	fc0792e3          	bnez	a5,800047fc <_ZN12ProducerSync8producerEPv+0x2c>
    8000483c:	fb9ff06f          	j	800047f4 <_ZN12ProducerSync8producerEPv+0x24>
        }
    }

    data->wait->signal();
    80004840:	0104b503          	ld	a0,16(s1)
    80004844:	ffffe097          	auipc	ra,0xffffe
    80004848:	8a0080e7          	jalr	-1888(ra) # 800020e4 <_ZN9Semaphore6signalEv>
}
    8000484c:	01813083          	ld	ra,24(sp)
    80004850:	01013403          	ld	s0,16(sp)
    80004854:	00813483          	ld	s1,8(sp)
    80004858:	00013903          	ld	s2,0(sp)
    8000485c:	02010113          	addi	sp,sp,32
    80004860:	00008067          	ret

0000000080004864 <_ZN12ConsumerSync8consumerEPv>:
    void run() override {
        consumer(td);
    }
};

void ConsumerSync::consumer(void *arg) {
    80004864:	fd010113          	addi	sp,sp,-48
    80004868:	02113423          	sd	ra,40(sp)
    8000486c:	02813023          	sd	s0,32(sp)
    80004870:	00913c23          	sd	s1,24(sp)
    80004874:	01213823          	sd	s2,16(sp)
    80004878:	01313423          	sd	s3,8(sp)
    8000487c:	01413023          	sd	s4,0(sp)
    80004880:	03010413          	addi	s0,sp,48
    80004884:	00050993          	mv	s3,a0
    80004888:	00058913          	mv	s2,a1
    struct thread_data *data = (struct thread_data *) arg;

    int i = 0;
    8000488c:	00000a13          	li	s4,0
    80004890:	01c0006f          	j	800048ac <_ZN12ConsumerSync8consumerEPv+0x48>
        i++;

        putc(key);

        if (i % (5 * data->id) == 0) {
            Thread::dispatch();
    80004894:	ffffd097          	auipc	ra,0xffffd
    80004898:	74c080e7          	jalr	1868(ra) # 80001fe0 <_ZN6Thread8dispatchEv>
    8000489c:	0500006f          	j	800048ec <_ZN12ConsumerSync8consumerEPv+0x88>
        }

        if (i % 80 == 0) {
            putc('\n');
    800048a0:	00a00513          	li	a0,10
    800048a4:	ffffd097          	auipc	ra,0xffffd
    800048a8:	d94080e7          	jalr	-620(ra) # 80001638 <_Z4putcc>
    while (!threadEnd) {
    800048ac:	00007797          	auipc	a5,0x7
    800048b0:	e0c7a783          	lw	a5,-500(a5) # 8000b6b8 <_ZL9threadEnd>
    800048b4:	06079263          	bnez	a5,80004918 <_ZN12ConsumerSync8consumerEPv+0xb4>
        int key = data->buffer->get();
    800048b8:	00893503          	ld	a0,8(s2)
    800048bc:	00001097          	auipc	ra,0x1
    800048c0:	b94080e7          	jalr	-1132(ra) # 80005450 <_ZN9BufferCPP3getEv>
        i++;
    800048c4:	001a049b          	addiw	s1,s4,1
    800048c8:	00048a1b          	sext.w	s4,s1
        putc(key);
    800048cc:	0ff57513          	andi	a0,a0,255
    800048d0:	ffffd097          	auipc	ra,0xffffd
    800048d4:	d68080e7          	jalr	-664(ra) # 80001638 <_Z4putcc>
        if (i % (5 * data->id) == 0) {
    800048d8:	00092703          	lw	a4,0(s2)
    800048dc:	0027179b          	slliw	a5,a4,0x2
    800048e0:	00e787bb          	addw	a5,a5,a4
    800048e4:	02f4e7bb          	remw	a5,s1,a5
    800048e8:	fa0786e3          	beqz	a5,80004894 <_ZN12ConsumerSync8consumerEPv+0x30>
        if (i % 80 == 0) {
    800048ec:	05000793          	li	a5,80
    800048f0:	02f4e4bb          	remw	s1,s1,a5
    800048f4:	fa049ce3          	bnez	s1,800048ac <_ZN12ConsumerSync8consumerEPv+0x48>
    800048f8:	fa9ff06f          	j	800048a0 <_ZN12ConsumerSync8consumerEPv+0x3c>
        }
    }


    while (td->buffer->getCnt() > 0) {
        int key = td->buffer->get();
    800048fc:	0109b783          	ld	a5,16(s3)
    80004900:	0087b503          	ld	a0,8(a5)
    80004904:	00001097          	auipc	ra,0x1
    80004908:	b4c080e7          	jalr	-1204(ra) # 80005450 <_ZN9BufferCPP3getEv>
        Console::putc(key);
    8000490c:	0ff57513          	andi	a0,a0,255
    80004910:	ffffe097          	auipc	ra,0xffffe
    80004914:	8f4080e7          	jalr	-1804(ra) # 80002204 <_ZN7Console4putcEc>
    while (td->buffer->getCnt() > 0) {
    80004918:	0109b783          	ld	a5,16(s3)
    8000491c:	0087b503          	ld	a0,8(a5)
    80004920:	00001097          	auipc	ra,0x1
    80004924:	bbc080e7          	jalr	-1092(ra) # 800054dc <_ZN9BufferCPP6getCntEv>
    80004928:	fca04ae3          	bgtz	a0,800048fc <_ZN12ConsumerSync8consumerEPv+0x98>
    }

    data->wait->signal();
    8000492c:	01093503          	ld	a0,16(s2)
    80004930:	ffffd097          	auipc	ra,0xffffd
    80004934:	7b4080e7          	jalr	1972(ra) # 800020e4 <_ZN9Semaphore6signalEv>
}
    80004938:	02813083          	ld	ra,40(sp)
    8000493c:	02013403          	ld	s0,32(sp)
    80004940:	01813483          	ld	s1,24(sp)
    80004944:	01013903          	ld	s2,16(sp)
    80004948:	00813983          	ld	s3,8(sp)
    8000494c:	00013a03          	ld	s4,0(sp)
    80004950:	03010113          	addi	sp,sp,48
    80004954:	00008067          	ret

0000000080004958 <_Z29producerConsumer_CPP_Sync_APIv>:

void producerConsumer_CPP_Sync_API() {
    80004958:	f8010113          	addi	sp,sp,-128
    8000495c:	06113c23          	sd	ra,120(sp)
    80004960:	06813823          	sd	s0,112(sp)
    80004964:	06913423          	sd	s1,104(sp)
    80004968:	07213023          	sd	s2,96(sp)
    8000496c:	05313c23          	sd	s3,88(sp)
    80004970:	05413823          	sd	s4,80(sp)
    80004974:	05513423          	sd	s5,72(sp)
    80004978:	05613023          	sd	s6,64(sp)
    8000497c:	03713c23          	sd	s7,56(sp)
    80004980:	03813823          	sd	s8,48(sp)
    80004984:	03913423          	sd	s9,40(sp)
    80004988:	08010413          	addi	s0,sp,128
    for (int i = 0; i < threadNum; i++) {
        delete threads[i];
    }
    delete consumerThread;
    delete waitForAll;
    delete buffer;
    8000498c:	00010b93          	mv	s7,sp
    printString("Unesite broj proizvodjaca?\n");
    80004990:	00004517          	auipc	a0,0x4
    80004994:	6d050513          	addi	a0,a0,1744 # 80009060 <kvmincrease+0xa70>
    80004998:	00000097          	auipc	ra,0x0
    8000499c:	604080e7          	jalr	1540(ra) # 80004f9c <_Z11printStringPKc>
    getString(input, 30);
    800049a0:	01e00593          	li	a1,30
    800049a4:	f8040493          	addi	s1,s0,-128
    800049a8:	00048513          	mv	a0,s1
    800049ac:	00000097          	auipc	ra,0x0
    800049b0:	678080e7          	jalr	1656(ra) # 80005024 <_Z9getStringPci>
    threadNum = stringToInt(input);
    800049b4:	00048513          	mv	a0,s1
    800049b8:	00000097          	auipc	ra,0x0
    800049bc:	744080e7          	jalr	1860(ra) # 800050fc <_Z11stringToIntPKc>
    800049c0:	00050913          	mv	s2,a0
    printString("Unesite velicinu bafera?\n");
    800049c4:	00004517          	auipc	a0,0x4
    800049c8:	6bc50513          	addi	a0,a0,1724 # 80009080 <kvmincrease+0xa90>
    800049cc:	00000097          	auipc	ra,0x0
    800049d0:	5d0080e7          	jalr	1488(ra) # 80004f9c <_Z11printStringPKc>
    getString(input, 30);
    800049d4:	01e00593          	li	a1,30
    800049d8:	00048513          	mv	a0,s1
    800049dc:	00000097          	auipc	ra,0x0
    800049e0:	648080e7          	jalr	1608(ra) # 80005024 <_Z9getStringPci>
    n = stringToInt(input);
    800049e4:	00048513          	mv	a0,s1
    800049e8:	00000097          	auipc	ra,0x0
    800049ec:	714080e7          	jalr	1812(ra) # 800050fc <_Z11stringToIntPKc>
    800049f0:	00050493          	mv	s1,a0
    printString("Broj proizvodjaca "); printInt(threadNum);
    800049f4:	00004517          	auipc	a0,0x4
    800049f8:	6ac50513          	addi	a0,a0,1708 # 800090a0 <kvmincrease+0xab0>
    800049fc:	00000097          	auipc	ra,0x0
    80004a00:	5a0080e7          	jalr	1440(ra) # 80004f9c <_Z11printStringPKc>
    80004a04:	00000613          	li	a2,0
    80004a08:	00a00593          	li	a1,10
    80004a0c:	00090513          	mv	a0,s2
    80004a10:	00000097          	auipc	ra,0x0
    80004a14:	73c080e7          	jalr	1852(ra) # 8000514c <_Z8printIntiii>
    printString(" i velicina bafera "); printInt(n);
    80004a18:	00004517          	auipc	a0,0x4
    80004a1c:	6a050513          	addi	a0,a0,1696 # 800090b8 <kvmincrease+0xac8>
    80004a20:	00000097          	auipc	ra,0x0
    80004a24:	57c080e7          	jalr	1404(ra) # 80004f9c <_Z11printStringPKc>
    80004a28:	00000613          	li	a2,0
    80004a2c:	00a00593          	li	a1,10
    80004a30:	00048513          	mv	a0,s1
    80004a34:	00000097          	auipc	ra,0x0
    80004a38:	718080e7          	jalr	1816(ra) # 8000514c <_Z8printIntiii>
    printString(".\n");
    80004a3c:	00004517          	auipc	a0,0x4
    80004a40:	5ec50513          	addi	a0,a0,1516 # 80009028 <kvmincrease+0xa38>
    80004a44:	00000097          	auipc	ra,0x0
    80004a48:	558080e7          	jalr	1368(ra) # 80004f9c <_Z11printStringPKc>
    if(threadNum > n) {
    80004a4c:	0324c463          	blt	s1,s2,80004a74 <_Z29producerConsumer_CPP_Sync_APIv+0x11c>
    } else if (threadNum < 1) {
    80004a50:	03205c63          	blez	s2,80004a88 <_Z29producerConsumer_CPP_Sync_APIv+0x130>
    BufferCPP *buffer = new BufferCPP(n);
    80004a54:	03800513          	li	a0,56
    80004a58:	ffffd097          	auipc	ra,0xffffd
    80004a5c:	378080e7          	jalr	888(ra) # 80001dd0 <_Znwm>
    80004a60:	00050a93          	mv	s5,a0
    80004a64:	00048593          	mv	a1,s1
    80004a68:	00001097          	auipc	ra,0x1
    80004a6c:	804080e7          	jalr	-2044(ra) # 8000526c <_ZN9BufferCPPC1Ei>
    80004a70:	0300006f          	j	80004aa0 <_Z29producerConsumer_CPP_Sync_APIv+0x148>
        printString("Broj proizvodjaca ne sme biti manji od velicine bafera!\n");
    80004a74:	00004517          	auipc	a0,0x4
    80004a78:	65c50513          	addi	a0,a0,1628 # 800090d0 <kvmincrease+0xae0>
    80004a7c:	00000097          	auipc	ra,0x0
    80004a80:	520080e7          	jalr	1312(ra) # 80004f9c <_Z11printStringPKc>
        return;
    80004a84:	0140006f          	j	80004a98 <_Z29producerConsumer_CPP_Sync_APIv+0x140>
        printString("Broj proizvodjaca mora biti veci od nula!\n");
    80004a88:	00004517          	auipc	a0,0x4
    80004a8c:	68850513          	addi	a0,a0,1672 # 80009110 <kvmincrease+0xb20>
    80004a90:	00000097          	auipc	ra,0x0
    80004a94:	50c080e7          	jalr	1292(ra) # 80004f9c <_Z11printStringPKc>
        return;
    80004a98:	000b8113          	mv	sp,s7
    80004a9c:	2380006f          	j	80004cd4 <_Z29producerConsumer_CPP_Sync_APIv+0x37c>
    waitForAll = new Semaphore(0);
    80004aa0:	01000513          	li	a0,16
    80004aa4:	ffffd097          	auipc	ra,0xffffd
    80004aa8:	32c080e7          	jalr	812(ra) # 80001dd0 <_Znwm>
    80004aac:	00050493          	mv	s1,a0
    80004ab0:	00000593          	li	a1,0
    80004ab4:	ffffd097          	auipc	ra,0xffffd
    80004ab8:	5c8080e7          	jalr	1480(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    80004abc:	00007797          	auipc	a5,0x7
    80004ac0:	c097b223          	sd	s1,-1020(a5) # 8000b6c0 <_ZL10waitForAll>
    Thread* threads[threadNum];
    80004ac4:	00391793          	slli	a5,s2,0x3
    80004ac8:	00f78793          	addi	a5,a5,15
    80004acc:	ff07f793          	andi	a5,a5,-16
    80004ad0:	40f10133          	sub	sp,sp,a5
    80004ad4:	00010993          	mv	s3,sp
    struct thread_data data[threadNum + 1];
    80004ad8:	0019071b          	addiw	a4,s2,1
    80004adc:	00171793          	slli	a5,a4,0x1
    80004ae0:	00e787b3          	add	a5,a5,a4
    80004ae4:	00379793          	slli	a5,a5,0x3
    80004ae8:	00f78793          	addi	a5,a5,15
    80004aec:	ff07f793          	andi	a5,a5,-16
    80004af0:	40f10133          	sub	sp,sp,a5
    80004af4:	00010a13          	mv	s4,sp
    data[threadNum].id = threadNum;
    80004af8:	00191c13          	slli	s8,s2,0x1
    80004afc:	012c07b3          	add	a5,s8,s2
    80004b00:	00379793          	slli	a5,a5,0x3
    80004b04:	00fa07b3          	add	a5,s4,a5
    80004b08:	0127a023          	sw	s2,0(a5)
    data[threadNum].buffer = buffer;
    80004b0c:	0157b423          	sd	s5,8(a5)
    data[threadNum].wait = waitForAll;
    80004b10:	0097b823          	sd	s1,16(a5)
    consumerThread = new ConsumerSync(data+threadNum);
    80004b14:	01800513          	li	a0,24
    80004b18:	ffffd097          	auipc	ra,0xffffd
    80004b1c:	2b8080e7          	jalr	696(ra) # 80001dd0 <_Znwm>
    80004b20:	00050b13          	mv	s6,a0
    80004b24:	012c0c33          	add	s8,s8,s2
    80004b28:	003c1c13          	slli	s8,s8,0x3
    80004b2c:	018a0c33          	add	s8,s4,s8
    ConsumerSync(thread_data* _td):Thread(), td(_td) {}
    80004b30:	ffffd097          	auipc	ra,0xffffd
    80004b34:	504080e7          	jalr	1284(ra) # 80002034 <_ZN6ThreadC1Ev>
    80004b38:	00007797          	auipc	a5,0x7
    80004b3c:	a6078793          	addi	a5,a5,-1440 # 8000b598 <_ZTV12ConsumerSync+0x10>
    80004b40:	00fb3023          	sd	a5,0(s6)
    80004b44:	018b3823          	sd	s8,16(s6)
    consumerThread->start();
    80004b48:	000b0513          	mv	a0,s6
    80004b4c:	ffffd097          	auipc	ra,0xffffd
    80004b50:	444080e7          	jalr	1092(ra) # 80001f90 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004b54:	00000493          	li	s1,0
    80004b58:	0380006f          	j	80004b90 <_Z29producerConsumer_CPP_Sync_APIv+0x238>
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004b5c:	00007797          	auipc	a5,0x7
    80004b60:	a1478793          	addi	a5,a5,-1516 # 8000b570 <_ZTV12ProducerSync+0x10>
    80004b64:	00fcb023          	sd	a5,0(s9)
    80004b68:	018cb823          	sd	s8,16(s9)
            threads[i] = new ProducerSync(data+i);
    80004b6c:	00349793          	slli	a5,s1,0x3
    80004b70:	00f987b3          	add	a5,s3,a5
    80004b74:	0197b023          	sd	s9,0(a5)
        threads[i]->start();
    80004b78:	00349793          	slli	a5,s1,0x3
    80004b7c:	00f987b3          	add	a5,s3,a5
    80004b80:	0007b503          	ld	a0,0(a5)
    80004b84:	ffffd097          	auipc	ra,0xffffd
    80004b88:	40c080e7          	jalr	1036(ra) # 80001f90 <_ZN6Thread5startEv>
    for (int i = 0; i < threadNum; i++) {
    80004b8c:	0014849b          	addiw	s1,s1,1
    80004b90:	0b24d063          	bge	s1,s2,80004c30 <_Z29producerConsumer_CPP_Sync_APIv+0x2d8>
        data[i].id = i;
    80004b94:	00149793          	slli	a5,s1,0x1
    80004b98:	009787b3          	add	a5,a5,s1
    80004b9c:	00379793          	slli	a5,a5,0x3
    80004ba0:	00fa07b3          	add	a5,s4,a5
    80004ba4:	0097a023          	sw	s1,0(a5)
        data[i].buffer = buffer;
    80004ba8:	0157b423          	sd	s5,8(a5)
        data[i].wait = waitForAll;
    80004bac:	00007717          	auipc	a4,0x7
    80004bb0:	b1473703          	ld	a4,-1260(a4) # 8000b6c0 <_ZL10waitForAll>
    80004bb4:	00e7b823          	sd	a4,16(a5)
        if(i>0) {
    80004bb8:	02905863          	blez	s1,80004be8 <_Z29producerConsumer_CPP_Sync_APIv+0x290>
            threads[i] = new ProducerSync(data+i);
    80004bbc:	01800513          	li	a0,24
    80004bc0:	ffffd097          	auipc	ra,0xffffd
    80004bc4:	210080e7          	jalr	528(ra) # 80001dd0 <_Znwm>
    80004bc8:	00050c93          	mv	s9,a0
    80004bcc:	00149c13          	slli	s8,s1,0x1
    80004bd0:	009c0c33          	add	s8,s8,s1
    80004bd4:	003c1c13          	slli	s8,s8,0x3
    80004bd8:	018a0c33          	add	s8,s4,s8
    ProducerSync(thread_data* _td):Thread(), td(_td) {}
    80004bdc:	ffffd097          	auipc	ra,0xffffd
    80004be0:	458080e7          	jalr	1112(ra) # 80002034 <_ZN6ThreadC1Ev>
    80004be4:	f79ff06f          	j	80004b5c <_Z29producerConsumer_CPP_Sync_APIv+0x204>
            threads[i] = new ProducerKeyboard(data+i);
    80004be8:	01800513          	li	a0,24
    80004bec:	ffffd097          	auipc	ra,0xffffd
    80004bf0:	1e4080e7          	jalr	484(ra) # 80001dd0 <_Znwm>
    80004bf4:	00050c93          	mv	s9,a0
    80004bf8:	00149c13          	slli	s8,s1,0x1
    80004bfc:	009c0c33          	add	s8,s8,s1
    80004c00:	003c1c13          	slli	s8,s8,0x3
    80004c04:	018a0c33          	add	s8,s4,s8
    ProducerKeyboard(thread_data* _td):Thread(), td(_td) {}
    80004c08:	ffffd097          	auipc	ra,0xffffd
    80004c0c:	42c080e7          	jalr	1068(ra) # 80002034 <_ZN6ThreadC1Ev>
    80004c10:	00007797          	auipc	a5,0x7
    80004c14:	93878793          	addi	a5,a5,-1736 # 8000b548 <_ZTV16ProducerKeyboard+0x10>
    80004c18:	00fcb023          	sd	a5,0(s9)
    80004c1c:	018cb823          	sd	s8,16(s9)
            threads[i] = new ProducerKeyboard(data+i);
    80004c20:	00349793          	slli	a5,s1,0x3
    80004c24:	00f987b3          	add	a5,s3,a5
    80004c28:	0197b023          	sd	s9,0(a5)
    80004c2c:	f4dff06f          	j	80004b78 <_Z29producerConsumer_CPP_Sync_APIv+0x220>
    Thread::dispatch();
    80004c30:	ffffd097          	auipc	ra,0xffffd
    80004c34:	3b0080e7          	jalr	944(ra) # 80001fe0 <_ZN6Thread8dispatchEv>
    for (int i = 0; i <= threadNum; i++) {
    80004c38:	00000493          	li	s1,0
    80004c3c:	00994e63          	blt	s2,s1,80004c58 <_Z29producerConsumer_CPP_Sync_APIv+0x300>
        waitForAll->wait();
    80004c40:	00007517          	auipc	a0,0x7
    80004c44:	a8053503          	ld	a0,-1408(a0) # 8000b6c0 <_ZL10waitForAll>
    80004c48:	ffffd097          	auipc	ra,0xffffd
    80004c4c:	470080e7          	jalr	1136(ra) # 800020b8 <_ZN9Semaphore4waitEv>
    for (int i = 0; i <= threadNum; i++) {
    80004c50:	0014849b          	addiw	s1,s1,1
    80004c54:	fe9ff06f          	j	80004c3c <_Z29producerConsumer_CPP_Sync_APIv+0x2e4>
    for (int i = 0; i < threadNum; i++) {
    80004c58:	00000493          	li	s1,0
    80004c5c:	0080006f          	j	80004c64 <_Z29producerConsumer_CPP_Sync_APIv+0x30c>
    80004c60:	0014849b          	addiw	s1,s1,1
    80004c64:	0324d263          	bge	s1,s2,80004c88 <_Z29producerConsumer_CPP_Sync_APIv+0x330>
        delete threads[i];
    80004c68:	00349793          	slli	a5,s1,0x3
    80004c6c:	00f987b3          	add	a5,s3,a5
    80004c70:	0007b503          	ld	a0,0(a5)
    80004c74:	fe0506e3          	beqz	a0,80004c60 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    80004c78:	00053783          	ld	a5,0(a0)
    80004c7c:	0087b783          	ld	a5,8(a5)
    80004c80:	000780e7          	jalr	a5
    80004c84:	fddff06f          	j	80004c60 <_Z29producerConsumer_CPP_Sync_APIv+0x308>
    delete consumerThread;
    80004c88:	000b0a63          	beqz	s6,80004c9c <_Z29producerConsumer_CPP_Sync_APIv+0x344>
    80004c8c:	000b3783          	ld	a5,0(s6)
    80004c90:	0087b783          	ld	a5,8(a5)
    80004c94:	000b0513          	mv	a0,s6
    80004c98:	000780e7          	jalr	a5
    delete waitForAll;
    80004c9c:	00007517          	auipc	a0,0x7
    80004ca0:	a2453503          	ld	a0,-1500(a0) # 8000b6c0 <_ZL10waitForAll>
    80004ca4:	00050863          	beqz	a0,80004cb4 <_Z29producerConsumer_CPP_Sync_APIv+0x35c>
    80004ca8:	00053783          	ld	a5,0(a0)
    80004cac:	0087b783          	ld	a5,8(a5)
    80004cb0:	000780e7          	jalr	a5
    delete buffer;
    80004cb4:	000a8e63          	beqz	s5,80004cd0 <_Z29producerConsumer_CPP_Sync_APIv+0x378>
    80004cb8:	000a8513          	mv	a0,s5
    80004cbc:	00001097          	auipc	ra,0x1
    80004cc0:	8a8080e7          	jalr	-1880(ra) # 80005564 <_ZN9BufferCPPD1Ev>
    80004cc4:	000a8513          	mv	a0,s5
    80004cc8:	ffffd097          	auipc	ra,0xffffd
    80004ccc:	158080e7          	jalr	344(ra) # 80001e20 <_ZdlPv>
    80004cd0:	000b8113          	mv	sp,s7

}
    80004cd4:	f8040113          	addi	sp,s0,-128
    80004cd8:	07813083          	ld	ra,120(sp)
    80004cdc:	07013403          	ld	s0,112(sp)
    80004ce0:	06813483          	ld	s1,104(sp)
    80004ce4:	06013903          	ld	s2,96(sp)
    80004ce8:	05813983          	ld	s3,88(sp)
    80004cec:	05013a03          	ld	s4,80(sp)
    80004cf0:	04813a83          	ld	s5,72(sp)
    80004cf4:	04013b03          	ld	s6,64(sp)
    80004cf8:	03813b83          	ld	s7,56(sp)
    80004cfc:	03013c03          	ld	s8,48(sp)
    80004d00:	02813c83          	ld	s9,40(sp)
    80004d04:	08010113          	addi	sp,sp,128
    80004d08:	00008067          	ret
    80004d0c:	00050493          	mv	s1,a0
    BufferCPP *buffer = new BufferCPP(n);
    80004d10:	000a8513          	mv	a0,s5
    80004d14:	ffffd097          	auipc	ra,0xffffd
    80004d18:	10c080e7          	jalr	268(ra) # 80001e20 <_ZdlPv>
    80004d1c:	00048513          	mv	a0,s1
    80004d20:	00008097          	auipc	ra,0x8
    80004d24:	a88080e7          	jalr	-1400(ra) # 8000c7a8 <_Unwind_Resume>
    80004d28:	00050913          	mv	s2,a0
    waitForAll = new Semaphore(0);
    80004d2c:	00048513          	mv	a0,s1
    80004d30:	ffffd097          	auipc	ra,0xffffd
    80004d34:	0f0080e7          	jalr	240(ra) # 80001e20 <_ZdlPv>
    80004d38:	00090513          	mv	a0,s2
    80004d3c:	00008097          	auipc	ra,0x8
    80004d40:	a6c080e7          	jalr	-1428(ra) # 8000c7a8 <_Unwind_Resume>
    80004d44:	00050493          	mv	s1,a0
    consumerThread = new ConsumerSync(data+threadNum);
    80004d48:	000b0513          	mv	a0,s6
    80004d4c:	ffffd097          	auipc	ra,0xffffd
    80004d50:	0d4080e7          	jalr	212(ra) # 80001e20 <_ZdlPv>
    80004d54:	00048513          	mv	a0,s1
    80004d58:	00008097          	auipc	ra,0x8
    80004d5c:	a50080e7          	jalr	-1456(ra) # 8000c7a8 <_Unwind_Resume>
    80004d60:	00050493          	mv	s1,a0
            threads[i] = new ProducerSync(data+i);
    80004d64:	000c8513          	mv	a0,s9
    80004d68:	ffffd097          	auipc	ra,0xffffd
    80004d6c:	0b8080e7          	jalr	184(ra) # 80001e20 <_ZdlPv>
    80004d70:	00048513          	mv	a0,s1
    80004d74:	00008097          	auipc	ra,0x8
    80004d78:	a34080e7          	jalr	-1484(ra) # 8000c7a8 <_Unwind_Resume>
    80004d7c:	00050493          	mv	s1,a0
            threads[i] = new ProducerKeyboard(data+i);
    80004d80:	000c8513          	mv	a0,s9
    80004d84:	ffffd097          	auipc	ra,0xffffd
    80004d88:	09c080e7          	jalr	156(ra) # 80001e20 <_ZdlPv>
    80004d8c:	00048513          	mv	a0,s1
    80004d90:	00008097          	auipc	ra,0x8
    80004d94:	a18080e7          	jalr	-1512(ra) # 8000c7a8 <_Unwind_Resume>

0000000080004d98 <_ZN12ConsumerSyncD1Ev>:
class ConsumerSync:public Thread {
    80004d98:	ff010113          	addi	sp,sp,-16
    80004d9c:	00113423          	sd	ra,8(sp)
    80004da0:	00813023          	sd	s0,0(sp)
    80004da4:	01010413          	addi	s0,sp,16
    80004da8:	00006797          	auipc	a5,0x6
    80004dac:	7f078793          	addi	a5,a5,2032 # 8000b598 <_ZTV12ConsumerSync+0x10>
    80004db0:	00f53023          	sd	a5,0(a0)
    80004db4:	ffffd097          	auipc	ra,0xffffd
    80004db8:	0fc080e7          	jalr	252(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80004dbc:	00813083          	ld	ra,8(sp)
    80004dc0:	00013403          	ld	s0,0(sp)
    80004dc4:	01010113          	addi	sp,sp,16
    80004dc8:	00008067          	ret

0000000080004dcc <_ZN12ConsumerSyncD0Ev>:
    80004dcc:	fe010113          	addi	sp,sp,-32
    80004dd0:	00113c23          	sd	ra,24(sp)
    80004dd4:	00813823          	sd	s0,16(sp)
    80004dd8:	00913423          	sd	s1,8(sp)
    80004ddc:	02010413          	addi	s0,sp,32
    80004de0:	00050493          	mv	s1,a0
    80004de4:	00006797          	auipc	a5,0x6
    80004de8:	7b478793          	addi	a5,a5,1972 # 8000b598 <_ZTV12ConsumerSync+0x10>
    80004dec:	00f53023          	sd	a5,0(a0)
    80004df0:	ffffd097          	auipc	ra,0xffffd
    80004df4:	0c0080e7          	jalr	192(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80004df8:	00048513          	mv	a0,s1
    80004dfc:	ffffd097          	auipc	ra,0xffffd
    80004e00:	024080e7          	jalr	36(ra) # 80001e20 <_ZdlPv>
    80004e04:	01813083          	ld	ra,24(sp)
    80004e08:	01013403          	ld	s0,16(sp)
    80004e0c:	00813483          	ld	s1,8(sp)
    80004e10:	02010113          	addi	sp,sp,32
    80004e14:	00008067          	ret

0000000080004e18 <_ZN12ProducerSyncD1Ev>:
class ProducerSync:public Thread {
    80004e18:	ff010113          	addi	sp,sp,-16
    80004e1c:	00113423          	sd	ra,8(sp)
    80004e20:	00813023          	sd	s0,0(sp)
    80004e24:	01010413          	addi	s0,sp,16
    80004e28:	00006797          	auipc	a5,0x6
    80004e2c:	74878793          	addi	a5,a5,1864 # 8000b570 <_ZTV12ProducerSync+0x10>
    80004e30:	00f53023          	sd	a5,0(a0)
    80004e34:	ffffd097          	auipc	ra,0xffffd
    80004e38:	07c080e7          	jalr	124(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80004e3c:	00813083          	ld	ra,8(sp)
    80004e40:	00013403          	ld	s0,0(sp)
    80004e44:	01010113          	addi	sp,sp,16
    80004e48:	00008067          	ret

0000000080004e4c <_ZN12ProducerSyncD0Ev>:
    80004e4c:	fe010113          	addi	sp,sp,-32
    80004e50:	00113c23          	sd	ra,24(sp)
    80004e54:	00813823          	sd	s0,16(sp)
    80004e58:	00913423          	sd	s1,8(sp)
    80004e5c:	02010413          	addi	s0,sp,32
    80004e60:	00050493          	mv	s1,a0
    80004e64:	00006797          	auipc	a5,0x6
    80004e68:	70c78793          	addi	a5,a5,1804 # 8000b570 <_ZTV12ProducerSync+0x10>
    80004e6c:	00f53023          	sd	a5,0(a0)
    80004e70:	ffffd097          	auipc	ra,0xffffd
    80004e74:	040080e7          	jalr	64(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80004e78:	00048513          	mv	a0,s1
    80004e7c:	ffffd097          	auipc	ra,0xffffd
    80004e80:	fa4080e7          	jalr	-92(ra) # 80001e20 <_ZdlPv>
    80004e84:	01813083          	ld	ra,24(sp)
    80004e88:	01013403          	ld	s0,16(sp)
    80004e8c:	00813483          	ld	s1,8(sp)
    80004e90:	02010113          	addi	sp,sp,32
    80004e94:	00008067          	ret

0000000080004e98 <_ZN16ProducerKeyboardD1Ev>:
class ProducerKeyboard:public Thread {
    80004e98:	ff010113          	addi	sp,sp,-16
    80004e9c:	00113423          	sd	ra,8(sp)
    80004ea0:	00813023          	sd	s0,0(sp)
    80004ea4:	01010413          	addi	s0,sp,16
    80004ea8:	00006797          	auipc	a5,0x6
    80004eac:	6a078793          	addi	a5,a5,1696 # 8000b548 <_ZTV16ProducerKeyboard+0x10>
    80004eb0:	00f53023          	sd	a5,0(a0)
    80004eb4:	ffffd097          	auipc	ra,0xffffd
    80004eb8:	ffc080e7          	jalr	-4(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80004ebc:	00813083          	ld	ra,8(sp)
    80004ec0:	00013403          	ld	s0,0(sp)
    80004ec4:	01010113          	addi	sp,sp,16
    80004ec8:	00008067          	ret

0000000080004ecc <_ZN16ProducerKeyboardD0Ev>:
    80004ecc:	fe010113          	addi	sp,sp,-32
    80004ed0:	00113c23          	sd	ra,24(sp)
    80004ed4:	00813823          	sd	s0,16(sp)
    80004ed8:	00913423          	sd	s1,8(sp)
    80004edc:	02010413          	addi	s0,sp,32
    80004ee0:	00050493          	mv	s1,a0
    80004ee4:	00006797          	auipc	a5,0x6
    80004ee8:	66478793          	addi	a5,a5,1636 # 8000b548 <_ZTV16ProducerKeyboard+0x10>
    80004eec:	00f53023          	sd	a5,0(a0)
    80004ef0:	ffffd097          	auipc	ra,0xffffd
    80004ef4:	fc0080e7          	jalr	-64(ra) # 80001eb0 <_ZN6ThreadD1Ev>
    80004ef8:	00048513          	mv	a0,s1
    80004efc:	ffffd097          	auipc	ra,0xffffd
    80004f00:	f24080e7          	jalr	-220(ra) # 80001e20 <_ZdlPv>
    80004f04:	01813083          	ld	ra,24(sp)
    80004f08:	01013403          	ld	s0,16(sp)
    80004f0c:	00813483          	ld	s1,8(sp)
    80004f10:	02010113          	addi	sp,sp,32
    80004f14:	00008067          	ret

0000000080004f18 <_ZN16ProducerKeyboard3runEv>:
    void run() override {
    80004f18:	ff010113          	addi	sp,sp,-16
    80004f1c:	00113423          	sd	ra,8(sp)
    80004f20:	00813023          	sd	s0,0(sp)
    80004f24:	01010413          	addi	s0,sp,16
        producerKeyboard(td);
    80004f28:	01053583          	ld	a1,16(a0)
    80004f2c:	fffff097          	auipc	ra,0xfffff
    80004f30:	7e4080e7          	jalr	2020(ra) # 80004710 <_ZN16ProducerKeyboard16producerKeyboardEPv>
    }
    80004f34:	00813083          	ld	ra,8(sp)
    80004f38:	00013403          	ld	s0,0(sp)
    80004f3c:	01010113          	addi	sp,sp,16
    80004f40:	00008067          	ret

0000000080004f44 <_ZN12ProducerSync3runEv>:
    void run() override {
    80004f44:	ff010113          	addi	sp,sp,-16
    80004f48:	00113423          	sd	ra,8(sp)
    80004f4c:	00813023          	sd	s0,0(sp)
    80004f50:	01010413          	addi	s0,sp,16
        producer(td);
    80004f54:	01053583          	ld	a1,16(a0)
    80004f58:	00000097          	auipc	ra,0x0
    80004f5c:	878080e7          	jalr	-1928(ra) # 800047d0 <_ZN12ProducerSync8producerEPv>
    }
    80004f60:	00813083          	ld	ra,8(sp)
    80004f64:	00013403          	ld	s0,0(sp)
    80004f68:	01010113          	addi	sp,sp,16
    80004f6c:	00008067          	ret

0000000080004f70 <_ZN12ConsumerSync3runEv>:
    void run() override {
    80004f70:	ff010113          	addi	sp,sp,-16
    80004f74:	00113423          	sd	ra,8(sp)
    80004f78:	00813023          	sd	s0,0(sp)
    80004f7c:	01010413          	addi	s0,sp,16
        consumer(td);
    80004f80:	01053583          	ld	a1,16(a0)
    80004f84:	00000097          	auipc	ra,0x0
    80004f88:	8e0080e7          	jalr	-1824(ra) # 80004864 <_ZN12ConsumerSync8consumerEPv>
    }
    80004f8c:	00813083          	ld	ra,8(sp)
    80004f90:	00013403          	ld	s0,0(sp)
    80004f94:	01010113          	addi	sp,sp,16
    80004f98:	00008067          	ret

0000000080004f9c <_Z11printStringPKc>:

#define LOCK() while(copy_and_swap(lockPrint, 0, 1)) thread_dispatch()
#define UNLOCK() while(copy_and_swap(lockPrint, 1, 0))

void printString(char const *string)
{
    80004f9c:	fe010113          	addi	sp,sp,-32
    80004fa0:	00113c23          	sd	ra,24(sp)
    80004fa4:	00813823          	sd	s0,16(sp)
    80004fa8:	00913423          	sd	s1,8(sp)
    80004fac:	02010413          	addi	s0,sp,32
    80004fb0:	00050493          	mv	s1,a0
    LOCK();
    80004fb4:	00100613          	li	a2,1
    80004fb8:	00000593          	li	a1,0
    80004fbc:	00006517          	auipc	a0,0x6
    80004fc0:	70c50513          	addi	a0,a0,1804 # 8000b6c8 <lockPrint>
    80004fc4:	ffffc097          	auipc	ra,0xffffc
    80004fc8:	3a8080e7          	jalr	936(ra) # 8000136c <copy_and_swap>
    80004fcc:	00050863          	beqz	a0,80004fdc <_Z11printStringPKc+0x40>
    80004fd0:	ffffc097          	auipc	ra,0xffffc
    80004fd4:	4d8080e7          	jalr	1240(ra) # 800014a8 <_Z15thread_dispatchv>
    80004fd8:	fddff06f          	j	80004fb4 <_Z11printStringPKc+0x18>
    while (*string != '\0')
    80004fdc:	0004c503          	lbu	a0,0(s1)
    80004fe0:	00050a63          	beqz	a0,80004ff4 <_Z11printStringPKc+0x58>
    {
        putc(*string);
    80004fe4:	ffffc097          	auipc	ra,0xffffc
    80004fe8:	654080e7          	jalr	1620(ra) # 80001638 <_Z4putcc>
        string++;
    80004fec:	00148493          	addi	s1,s1,1
    while (*string != '\0')
    80004ff0:	fedff06f          	j	80004fdc <_Z11printStringPKc+0x40>
    }
    UNLOCK();
    80004ff4:	00000613          	li	a2,0
    80004ff8:	00100593          	li	a1,1
    80004ffc:	00006517          	auipc	a0,0x6
    80005000:	6cc50513          	addi	a0,a0,1740 # 8000b6c8 <lockPrint>
    80005004:	ffffc097          	auipc	ra,0xffffc
    80005008:	368080e7          	jalr	872(ra) # 8000136c <copy_and_swap>
    8000500c:	fe0514e3          	bnez	a0,80004ff4 <_Z11printStringPKc+0x58>
}
    80005010:	01813083          	ld	ra,24(sp)
    80005014:	01013403          	ld	s0,16(sp)
    80005018:	00813483          	ld	s1,8(sp)
    8000501c:	02010113          	addi	sp,sp,32
    80005020:	00008067          	ret

0000000080005024 <_Z9getStringPci>:

char* getString(char *buf, int max) {
    80005024:	fd010113          	addi	sp,sp,-48
    80005028:	02113423          	sd	ra,40(sp)
    8000502c:	02813023          	sd	s0,32(sp)
    80005030:	00913c23          	sd	s1,24(sp)
    80005034:	01213823          	sd	s2,16(sp)
    80005038:	01313423          	sd	s3,8(sp)
    8000503c:	01413023          	sd	s4,0(sp)
    80005040:	03010413          	addi	s0,sp,48
    80005044:	00050993          	mv	s3,a0
    80005048:	00058a13          	mv	s4,a1
    LOCK();
    8000504c:	00100613          	li	a2,1
    80005050:	00000593          	li	a1,0
    80005054:	00006517          	auipc	a0,0x6
    80005058:	67450513          	addi	a0,a0,1652 # 8000b6c8 <lockPrint>
    8000505c:	ffffc097          	auipc	ra,0xffffc
    80005060:	310080e7          	jalr	784(ra) # 8000136c <copy_and_swap>
    80005064:	00050863          	beqz	a0,80005074 <_Z9getStringPci+0x50>
    80005068:	ffffc097          	auipc	ra,0xffffc
    8000506c:	440080e7          	jalr	1088(ra) # 800014a8 <_Z15thread_dispatchv>
    80005070:	fddff06f          	j	8000504c <_Z9getStringPci+0x28>
    int i, cc;
    char c;

    for(i=0; i+1 < max; ){
    80005074:	00000913          	li	s2,0
    80005078:	00090493          	mv	s1,s2
    8000507c:	0019091b          	addiw	s2,s2,1
    80005080:	03495a63          	bge	s2,s4,800050b4 <_Z9getStringPci+0x90>
        cc = getc();
    80005084:	ffffc097          	auipc	ra,0xffffc
    80005088:	580080e7          	jalr	1408(ra) # 80001604 <_Z4getcv>
        if(cc < 1)
    8000508c:	02050463          	beqz	a0,800050b4 <_Z9getStringPci+0x90>
            break;
        c = cc;
        buf[i++] = c;
    80005090:	009984b3          	add	s1,s3,s1
    80005094:	00a48023          	sb	a0,0(s1)
        if(c == '\n' || c == '\r')
    80005098:	00a00793          	li	a5,10
    8000509c:	00f50a63          	beq	a0,a5,800050b0 <_Z9getStringPci+0x8c>
    800050a0:	00d00793          	li	a5,13
    800050a4:	fcf51ae3          	bne	a0,a5,80005078 <_Z9getStringPci+0x54>
        buf[i++] = c;
    800050a8:	00090493          	mv	s1,s2
    800050ac:	0080006f          	j	800050b4 <_Z9getStringPci+0x90>
    800050b0:	00090493          	mv	s1,s2
            break;
    }
    buf[i] = '\0';
    800050b4:	009984b3          	add	s1,s3,s1
    800050b8:	00048023          	sb	zero,0(s1)

    UNLOCK();
    800050bc:	00000613          	li	a2,0
    800050c0:	00100593          	li	a1,1
    800050c4:	00006517          	auipc	a0,0x6
    800050c8:	60450513          	addi	a0,a0,1540 # 8000b6c8 <lockPrint>
    800050cc:	ffffc097          	auipc	ra,0xffffc
    800050d0:	2a0080e7          	jalr	672(ra) # 8000136c <copy_and_swap>
    800050d4:	fe0514e3          	bnez	a0,800050bc <_Z9getStringPci+0x98>
    return buf;
}
    800050d8:	00098513          	mv	a0,s3
    800050dc:	02813083          	ld	ra,40(sp)
    800050e0:	02013403          	ld	s0,32(sp)
    800050e4:	01813483          	ld	s1,24(sp)
    800050e8:	01013903          	ld	s2,16(sp)
    800050ec:	00813983          	ld	s3,8(sp)
    800050f0:	00013a03          	ld	s4,0(sp)
    800050f4:	03010113          	addi	sp,sp,48
    800050f8:	00008067          	ret

00000000800050fc <_Z11stringToIntPKc>:

int stringToInt(const char *s) {
    800050fc:	ff010113          	addi	sp,sp,-16
    80005100:	00813423          	sd	s0,8(sp)
    80005104:	01010413          	addi	s0,sp,16
    80005108:	00050693          	mv	a3,a0
    int n;

    n = 0;
    8000510c:	00000513          	li	a0,0
    while ('0' <= *s && *s <= '9')
    80005110:	0006c603          	lbu	a2,0(a3) # 8000 <_entry-0x7fff8000>
    80005114:	fd06071b          	addiw	a4,a2,-48
    80005118:	0ff77713          	andi	a4,a4,255
    8000511c:	00900793          	li	a5,9
    80005120:	02e7e063          	bltu	a5,a4,80005140 <_Z11stringToIntPKc+0x44>
        n = n * 10 + *s++ - '0';
    80005124:	0025179b          	slliw	a5,a0,0x2
    80005128:	00a787bb          	addw	a5,a5,a0
    8000512c:	0017979b          	slliw	a5,a5,0x1
    80005130:	00168693          	addi	a3,a3,1
    80005134:	00c787bb          	addw	a5,a5,a2
    80005138:	fd07851b          	addiw	a0,a5,-48
    while ('0' <= *s && *s <= '9')
    8000513c:	fd5ff06f          	j	80005110 <_Z11stringToIntPKc+0x14>
    return n;
}
    80005140:	00813403          	ld	s0,8(sp)
    80005144:	01010113          	addi	sp,sp,16
    80005148:	00008067          	ret

000000008000514c <_Z8printIntiii>:

char digits[] = "0123456789ABCDEF";

void printInt(int xx, int base, int sgn)
{
    8000514c:	fc010113          	addi	sp,sp,-64
    80005150:	02113c23          	sd	ra,56(sp)
    80005154:	02813823          	sd	s0,48(sp)
    80005158:	02913423          	sd	s1,40(sp)
    8000515c:	03213023          	sd	s2,32(sp)
    80005160:	01313c23          	sd	s3,24(sp)
    80005164:	04010413          	addi	s0,sp,64
    80005168:	00050493          	mv	s1,a0
    8000516c:	00058913          	mv	s2,a1
    80005170:	00060993          	mv	s3,a2
    LOCK();
    80005174:	00100613          	li	a2,1
    80005178:	00000593          	li	a1,0
    8000517c:	00006517          	auipc	a0,0x6
    80005180:	54c50513          	addi	a0,a0,1356 # 8000b6c8 <lockPrint>
    80005184:	ffffc097          	auipc	ra,0xffffc
    80005188:	1e8080e7          	jalr	488(ra) # 8000136c <copy_and_swap>
    8000518c:	00050863          	beqz	a0,8000519c <_Z8printIntiii+0x50>
    80005190:	ffffc097          	auipc	ra,0xffffc
    80005194:	318080e7          	jalr	792(ra) # 800014a8 <_Z15thread_dispatchv>
    80005198:	fddff06f          	j	80005174 <_Z8printIntiii+0x28>
    char buf[16];
    int i, neg;
    uint x;

    neg = 0;
    if(sgn && xx < 0){
    8000519c:	00098463          	beqz	s3,800051a4 <_Z8printIntiii+0x58>
    800051a0:	0804c463          	bltz	s1,80005228 <_Z8printIntiii+0xdc>
        neg = 1;
        x = -xx;
    } else {
        x = xx;
    800051a4:	0004851b          	sext.w	a0,s1
    neg = 0;
    800051a8:	00000593          	li	a1,0
    }

    i = 0;
    800051ac:	00000493          	li	s1,0
    do{
        buf[i++] = digits[x % base];
    800051b0:	0009079b          	sext.w	a5,s2
    800051b4:	0325773b          	remuw	a4,a0,s2
    800051b8:	00048613          	mv	a2,s1
    800051bc:	0014849b          	addiw	s1,s1,1
    800051c0:	02071693          	slli	a3,a4,0x20
    800051c4:	0206d693          	srli	a3,a3,0x20
    800051c8:	00006717          	auipc	a4,0x6
    800051cc:	3e870713          	addi	a4,a4,1000 # 8000b5b0 <digits>
    800051d0:	00d70733          	add	a4,a4,a3
    800051d4:	00074683          	lbu	a3,0(a4)
    800051d8:	fd040713          	addi	a4,s0,-48
    800051dc:	00c70733          	add	a4,a4,a2
    800051e0:	fed70823          	sb	a3,-16(a4)
    }while((x /= base) != 0);
    800051e4:	0005071b          	sext.w	a4,a0
    800051e8:	0325553b          	divuw	a0,a0,s2
    800051ec:	fcf772e3          	bgeu	a4,a5,800051b0 <_Z8printIntiii+0x64>
    if(neg)
    800051f0:	00058c63          	beqz	a1,80005208 <_Z8printIntiii+0xbc>
        buf[i++] = '-';
    800051f4:	fd040793          	addi	a5,s0,-48
    800051f8:	009784b3          	add	s1,a5,s1
    800051fc:	02d00793          	li	a5,45
    80005200:	fef48823          	sb	a5,-16(s1)
    80005204:	0026049b          	addiw	s1,a2,2

    while(--i >= 0)
    80005208:	fff4849b          	addiw	s1,s1,-1
    8000520c:	0204c463          	bltz	s1,80005234 <_Z8printIntiii+0xe8>
        putc(buf[i]);
    80005210:	fd040793          	addi	a5,s0,-48
    80005214:	009787b3          	add	a5,a5,s1
    80005218:	ff07c503          	lbu	a0,-16(a5)
    8000521c:	ffffc097          	auipc	ra,0xffffc
    80005220:	41c080e7          	jalr	1052(ra) # 80001638 <_Z4putcc>
    80005224:	fe5ff06f          	j	80005208 <_Z8printIntiii+0xbc>
        x = -xx;
    80005228:	4090053b          	negw	a0,s1
        neg = 1;
    8000522c:	00100593          	li	a1,1
        x = -xx;
    80005230:	f7dff06f          	j	800051ac <_Z8printIntiii+0x60>

    UNLOCK();
    80005234:	00000613          	li	a2,0
    80005238:	00100593          	li	a1,1
    8000523c:	00006517          	auipc	a0,0x6
    80005240:	48c50513          	addi	a0,a0,1164 # 8000b6c8 <lockPrint>
    80005244:	ffffc097          	auipc	ra,0xffffc
    80005248:	128080e7          	jalr	296(ra) # 8000136c <copy_and_swap>
    8000524c:	fe0514e3          	bnez	a0,80005234 <_Z8printIntiii+0xe8>
    80005250:	03813083          	ld	ra,56(sp)
    80005254:	03013403          	ld	s0,48(sp)
    80005258:	02813483          	ld	s1,40(sp)
    8000525c:	02013903          	ld	s2,32(sp)
    80005260:	01813983          	ld	s3,24(sp)
    80005264:	04010113          	addi	sp,sp,64
    80005268:	00008067          	ret

000000008000526c <_ZN9BufferCPPC1Ei>:
#include "buffer_CPP_API.hpp"

BufferCPP::BufferCPP(int _cap) : cap(_cap + 1), head(0), tail(0) {
    8000526c:	fd010113          	addi	sp,sp,-48
    80005270:	02113423          	sd	ra,40(sp)
    80005274:	02813023          	sd	s0,32(sp)
    80005278:	00913c23          	sd	s1,24(sp)
    8000527c:	01213823          	sd	s2,16(sp)
    80005280:	01313423          	sd	s3,8(sp)
    80005284:	03010413          	addi	s0,sp,48
    80005288:	00050493          	mv	s1,a0
    8000528c:	00058913          	mv	s2,a1
    80005290:	0015879b          	addiw	a5,a1,1
    80005294:	0007851b          	sext.w	a0,a5
    80005298:	00f4a023          	sw	a5,0(s1)
    8000529c:	0004a823          	sw	zero,16(s1)
    800052a0:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    800052a4:	00251513          	slli	a0,a0,0x2
    800052a8:	ffffc097          	auipc	ra,0xffffc
    800052ac:	0e4080e7          	jalr	228(ra) # 8000138c <_Z9mem_allocm>
    800052b0:	00a4b423          	sd	a0,8(s1)
    itemAvailable = new Semaphore(0);
    800052b4:	01000513          	li	a0,16
    800052b8:	ffffd097          	auipc	ra,0xffffd
    800052bc:	b18080e7          	jalr	-1256(ra) # 80001dd0 <_Znwm>
    800052c0:	00050993          	mv	s3,a0
    800052c4:	00000593          	li	a1,0
    800052c8:	ffffd097          	auipc	ra,0xffffd
    800052cc:	db4080e7          	jalr	-588(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    800052d0:	0334b023          	sd	s3,32(s1)
    spaceAvailable = new Semaphore(_cap);
    800052d4:	01000513          	li	a0,16
    800052d8:	ffffd097          	auipc	ra,0xffffd
    800052dc:	af8080e7          	jalr	-1288(ra) # 80001dd0 <_Znwm>
    800052e0:	00050993          	mv	s3,a0
    800052e4:	00090593          	mv	a1,s2
    800052e8:	ffffd097          	auipc	ra,0xffffd
    800052ec:	d94080e7          	jalr	-620(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    800052f0:	0134bc23          	sd	s3,24(s1)
    mutexHead = new Semaphore(1);
    800052f4:	01000513          	li	a0,16
    800052f8:	ffffd097          	auipc	ra,0xffffd
    800052fc:	ad8080e7          	jalr	-1320(ra) # 80001dd0 <_Znwm>
    80005300:	00050913          	mv	s2,a0
    80005304:	00100593          	li	a1,1
    80005308:	ffffd097          	auipc	ra,0xffffd
    8000530c:	d74080e7          	jalr	-652(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    80005310:	0324b423          	sd	s2,40(s1)
    mutexTail = new Semaphore(1);
    80005314:	01000513          	li	a0,16
    80005318:	ffffd097          	auipc	ra,0xffffd
    8000531c:	ab8080e7          	jalr	-1352(ra) # 80001dd0 <_Znwm>
    80005320:	00050913          	mv	s2,a0
    80005324:	00100593          	li	a1,1
    80005328:	ffffd097          	auipc	ra,0xffffd
    8000532c:	d54080e7          	jalr	-684(ra) # 8000207c <_ZN9SemaphoreC1Ej>
    80005330:	0324b823          	sd	s2,48(s1)
}
    80005334:	02813083          	ld	ra,40(sp)
    80005338:	02013403          	ld	s0,32(sp)
    8000533c:	01813483          	ld	s1,24(sp)
    80005340:	01013903          	ld	s2,16(sp)
    80005344:	00813983          	ld	s3,8(sp)
    80005348:	03010113          	addi	sp,sp,48
    8000534c:	00008067          	ret
    80005350:	00050493          	mv	s1,a0
    itemAvailable = new Semaphore(0);
    80005354:	00098513          	mv	a0,s3
    80005358:	ffffd097          	auipc	ra,0xffffd
    8000535c:	ac8080e7          	jalr	-1336(ra) # 80001e20 <_ZdlPv>
    80005360:	00048513          	mv	a0,s1
    80005364:	00007097          	auipc	ra,0x7
    80005368:	444080e7          	jalr	1092(ra) # 8000c7a8 <_Unwind_Resume>
    8000536c:	00050493          	mv	s1,a0
    spaceAvailable = new Semaphore(_cap);
    80005370:	00098513          	mv	a0,s3
    80005374:	ffffd097          	auipc	ra,0xffffd
    80005378:	aac080e7          	jalr	-1364(ra) # 80001e20 <_ZdlPv>
    8000537c:	00048513          	mv	a0,s1
    80005380:	00007097          	auipc	ra,0x7
    80005384:	428080e7          	jalr	1064(ra) # 8000c7a8 <_Unwind_Resume>
    80005388:	00050493          	mv	s1,a0
    mutexHead = new Semaphore(1);
    8000538c:	00090513          	mv	a0,s2
    80005390:	ffffd097          	auipc	ra,0xffffd
    80005394:	a90080e7          	jalr	-1392(ra) # 80001e20 <_ZdlPv>
    80005398:	00048513          	mv	a0,s1
    8000539c:	00007097          	auipc	ra,0x7
    800053a0:	40c080e7          	jalr	1036(ra) # 8000c7a8 <_Unwind_Resume>
    800053a4:	00050493          	mv	s1,a0
    mutexTail = new Semaphore(1);
    800053a8:	00090513          	mv	a0,s2
    800053ac:	ffffd097          	auipc	ra,0xffffd
    800053b0:	a74080e7          	jalr	-1420(ra) # 80001e20 <_ZdlPv>
    800053b4:	00048513          	mv	a0,s1
    800053b8:	00007097          	auipc	ra,0x7
    800053bc:	3f0080e7          	jalr	1008(ra) # 8000c7a8 <_Unwind_Resume>

00000000800053c0 <_ZN9BufferCPP3putEi>:
    delete mutexTail;
    delete mutexHead;

}

void BufferCPP::put(int val) {
    800053c0:	fe010113          	addi	sp,sp,-32
    800053c4:	00113c23          	sd	ra,24(sp)
    800053c8:	00813823          	sd	s0,16(sp)
    800053cc:	00913423          	sd	s1,8(sp)
    800053d0:	01213023          	sd	s2,0(sp)
    800053d4:	02010413          	addi	s0,sp,32
    800053d8:	00050493          	mv	s1,a0
    800053dc:	00058913          	mv	s2,a1
    spaceAvailable->wait();
    800053e0:	01853503          	ld	a0,24(a0)
    800053e4:	ffffd097          	auipc	ra,0xffffd
    800053e8:	cd4080e7          	jalr	-812(ra) # 800020b8 <_ZN9Semaphore4waitEv>

    mutexTail->wait();
    800053ec:	0304b503          	ld	a0,48(s1)
    800053f0:	ffffd097          	auipc	ra,0xffffd
    800053f4:	cc8080e7          	jalr	-824(ra) # 800020b8 <_ZN9Semaphore4waitEv>
    buffer[tail] = val;
    800053f8:	0084b783          	ld	a5,8(s1)
    800053fc:	0144a703          	lw	a4,20(s1)
    80005400:	00271713          	slli	a4,a4,0x2
    80005404:	00e787b3          	add	a5,a5,a4
    80005408:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    8000540c:	0144a783          	lw	a5,20(s1)
    80005410:	0017879b          	addiw	a5,a5,1
    80005414:	0004a703          	lw	a4,0(s1)
    80005418:	02e7e7bb          	remw	a5,a5,a4
    8000541c:	00f4aa23          	sw	a5,20(s1)
    mutexTail->signal();
    80005420:	0304b503          	ld	a0,48(s1)
    80005424:	ffffd097          	auipc	ra,0xffffd
    80005428:	cc0080e7          	jalr	-832(ra) # 800020e4 <_ZN9Semaphore6signalEv>

    itemAvailable->signal();
    8000542c:	0204b503          	ld	a0,32(s1)
    80005430:	ffffd097          	auipc	ra,0xffffd
    80005434:	cb4080e7          	jalr	-844(ra) # 800020e4 <_ZN9Semaphore6signalEv>

}
    80005438:	01813083          	ld	ra,24(sp)
    8000543c:	01013403          	ld	s0,16(sp)
    80005440:	00813483          	ld	s1,8(sp)
    80005444:	00013903          	ld	s2,0(sp)
    80005448:	02010113          	addi	sp,sp,32
    8000544c:	00008067          	ret

0000000080005450 <_ZN9BufferCPP3getEv>:

int BufferCPP::get() {
    80005450:	fe010113          	addi	sp,sp,-32
    80005454:	00113c23          	sd	ra,24(sp)
    80005458:	00813823          	sd	s0,16(sp)
    8000545c:	00913423          	sd	s1,8(sp)
    80005460:	01213023          	sd	s2,0(sp)
    80005464:	02010413          	addi	s0,sp,32
    80005468:	00050493          	mv	s1,a0
    itemAvailable->wait();
    8000546c:	02053503          	ld	a0,32(a0)
    80005470:	ffffd097          	auipc	ra,0xffffd
    80005474:	c48080e7          	jalr	-952(ra) # 800020b8 <_ZN9Semaphore4waitEv>

    mutexHead->wait();
    80005478:	0284b503          	ld	a0,40(s1)
    8000547c:	ffffd097          	auipc	ra,0xffffd
    80005480:	c3c080e7          	jalr	-964(ra) # 800020b8 <_ZN9Semaphore4waitEv>

    int ret = buffer[head];
    80005484:	0084b703          	ld	a4,8(s1)
    80005488:	0104a783          	lw	a5,16(s1)
    8000548c:	00279693          	slli	a3,a5,0x2
    80005490:	00d70733          	add	a4,a4,a3
    80005494:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80005498:	0017879b          	addiw	a5,a5,1
    8000549c:	0004a703          	lw	a4,0(s1)
    800054a0:	02e7e7bb          	remw	a5,a5,a4
    800054a4:	00f4a823          	sw	a5,16(s1)
    mutexHead->signal();
    800054a8:	0284b503          	ld	a0,40(s1)
    800054ac:	ffffd097          	auipc	ra,0xffffd
    800054b0:	c38080e7          	jalr	-968(ra) # 800020e4 <_ZN9Semaphore6signalEv>

    spaceAvailable->signal();
    800054b4:	0184b503          	ld	a0,24(s1)
    800054b8:	ffffd097          	auipc	ra,0xffffd
    800054bc:	c2c080e7          	jalr	-980(ra) # 800020e4 <_ZN9Semaphore6signalEv>

    return ret;
}
    800054c0:	00090513          	mv	a0,s2
    800054c4:	01813083          	ld	ra,24(sp)
    800054c8:	01013403          	ld	s0,16(sp)
    800054cc:	00813483          	ld	s1,8(sp)
    800054d0:	00013903          	ld	s2,0(sp)
    800054d4:	02010113          	addi	sp,sp,32
    800054d8:	00008067          	ret

00000000800054dc <_ZN9BufferCPP6getCntEv>:

int BufferCPP::getCnt() {
    800054dc:	fe010113          	addi	sp,sp,-32
    800054e0:	00113c23          	sd	ra,24(sp)
    800054e4:	00813823          	sd	s0,16(sp)
    800054e8:	00913423          	sd	s1,8(sp)
    800054ec:	01213023          	sd	s2,0(sp)
    800054f0:	02010413          	addi	s0,sp,32
    800054f4:	00050493          	mv	s1,a0
    int ret;

    mutexHead->wait();
    800054f8:	02853503          	ld	a0,40(a0)
    800054fc:	ffffd097          	auipc	ra,0xffffd
    80005500:	bbc080e7          	jalr	-1092(ra) # 800020b8 <_ZN9Semaphore4waitEv>
    mutexTail->wait();
    80005504:	0304b503          	ld	a0,48(s1)
    80005508:	ffffd097          	auipc	ra,0xffffd
    8000550c:	bb0080e7          	jalr	-1104(ra) # 800020b8 <_ZN9Semaphore4waitEv>

    if (tail >= head) {
    80005510:	0144a783          	lw	a5,20(s1)
    80005514:	0104a903          	lw	s2,16(s1)
    80005518:	0327ce63          	blt	a5,s2,80005554 <_ZN9BufferCPP6getCntEv+0x78>
        ret = tail - head;
    8000551c:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    mutexTail->signal();
    80005520:	0304b503          	ld	a0,48(s1)
    80005524:	ffffd097          	auipc	ra,0xffffd
    80005528:	bc0080e7          	jalr	-1088(ra) # 800020e4 <_ZN9Semaphore6signalEv>
    mutexHead->signal();
    8000552c:	0284b503          	ld	a0,40(s1)
    80005530:	ffffd097          	auipc	ra,0xffffd
    80005534:	bb4080e7          	jalr	-1100(ra) # 800020e4 <_ZN9Semaphore6signalEv>

    return ret;
}
    80005538:	00090513          	mv	a0,s2
    8000553c:	01813083          	ld	ra,24(sp)
    80005540:	01013403          	ld	s0,16(sp)
    80005544:	00813483          	ld	s1,8(sp)
    80005548:	00013903          	ld	s2,0(sp)
    8000554c:	02010113          	addi	sp,sp,32
    80005550:	00008067          	ret
        ret = cap - head + tail;
    80005554:	0004a703          	lw	a4,0(s1)
    80005558:	4127093b          	subw	s2,a4,s2
    8000555c:	00f9093b          	addw	s2,s2,a5
    80005560:	fc1ff06f          	j	80005520 <_ZN9BufferCPP6getCntEv+0x44>

0000000080005564 <_ZN9BufferCPPD1Ev>:
BufferCPP::~BufferCPP() {
    80005564:	fe010113          	addi	sp,sp,-32
    80005568:	00113c23          	sd	ra,24(sp)
    8000556c:	00813823          	sd	s0,16(sp)
    80005570:	00913423          	sd	s1,8(sp)
    80005574:	02010413          	addi	s0,sp,32
    80005578:	00050493          	mv	s1,a0
    Console::putc('\n');
    8000557c:	00a00513          	li	a0,10
    80005580:	ffffd097          	auipc	ra,0xffffd
    80005584:	c84080e7          	jalr	-892(ra) # 80002204 <_ZN7Console4putcEc>
    printString("Buffer deleted!\n");
    80005588:	00004517          	auipc	a0,0x4
    8000558c:	cb050513          	addi	a0,a0,-848 # 80009238 <kvmincrease+0xc48>
    80005590:	00000097          	auipc	ra,0x0
    80005594:	a0c080e7          	jalr	-1524(ra) # 80004f9c <_Z11printStringPKc>
    while (getCnt()) {
    80005598:	00048513          	mv	a0,s1
    8000559c:	00000097          	auipc	ra,0x0
    800055a0:	f40080e7          	jalr	-192(ra) # 800054dc <_ZN9BufferCPP6getCntEv>
    800055a4:	02050c63          	beqz	a0,800055dc <_ZN9BufferCPPD1Ev+0x78>
        char ch = buffer[head];
    800055a8:	0084b783          	ld	a5,8(s1)
    800055ac:	0104a703          	lw	a4,16(s1)
    800055b0:	00271713          	slli	a4,a4,0x2
    800055b4:	00e787b3          	add	a5,a5,a4
        Console::putc(ch);
    800055b8:	0007c503          	lbu	a0,0(a5)
    800055bc:	ffffd097          	auipc	ra,0xffffd
    800055c0:	c48080e7          	jalr	-952(ra) # 80002204 <_ZN7Console4putcEc>
        head = (head + 1) % cap;
    800055c4:	0104a783          	lw	a5,16(s1)
    800055c8:	0017879b          	addiw	a5,a5,1
    800055cc:	0004a703          	lw	a4,0(s1)
    800055d0:	02e7e7bb          	remw	a5,a5,a4
    800055d4:	00f4a823          	sw	a5,16(s1)
    while (getCnt()) {
    800055d8:	fc1ff06f          	j	80005598 <_ZN9BufferCPPD1Ev+0x34>
    Console::putc('!');
    800055dc:	02100513          	li	a0,33
    800055e0:	ffffd097          	auipc	ra,0xffffd
    800055e4:	c24080e7          	jalr	-988(ra) # 80002204 <_ZN7Console4putcEc>
    Console::putc('\n');
    800055e8:	00a00513          	li	a0,10
    800055ec:	ffffd097          	auipc	ra,0xffffd
    800055f0:	c18080e7          	jalr	-1000(ra) # 80002204 <_ZN7Console4putcEc>
    mem_free(buffer);
    800055f4:	0084b503          	ld	a0,8(s1)
    800055f8:	ffffc097          	auipc	ra,0xffffc
    800055fc:	dd4080e7          	jalr	-556(ra) # 800013cc <_Z8mem_freePv>
    delete itemAvailable;
    80005600:	0204b503          	ld	a0,32(s1)
    80005604:	00050863          	beqz	a0,80005614 <_ZN9BufferCPPD1Ev+0xb0>
    80005608:	00053783          	ld	a5,0(a0)
    8000560c:	0087b783          	ld	a5,8(a5)
    80005610:	000780e7          	jalr	a5
    delete spaceAvailable;
    80005614:	0184b503          	ld	a0,24(s1)
    80005618:	00050863          	beqz	a0,80005628 <_ZN9BufferCPPD1Ev+0xc4>
    8000561c:	00053783          	ld	a5,0(a0)
    80005620:	0087b783          	ld	a5,8(a5)
    80005624:	000780e7          	jalr	a5
    delete mutexTail;
    80005628:	0304b503          	ld	a0,48(s1)
    8000562c:	00050863          	beqz	a0,8000563c <_ZN9BufferCPPD1Ev+0xd8>
    80005630:	00053783          	ld	a5,0(a0)
    80005634:	0087b783          	ld	a5,8(a5)
    80005638:	000780e7          	jalr	a5
    delete mutexHead;
    8000563c:	0284b503          	ld	a0,40(s1)
    80005640:	00050863          	beqz	a0,80005650 <_ZN9BufferCPPD1Ev+0xec>
    80005644:	00053783          	ld	a5,0(a0)
    80005648:	0087b783          	ld	a5,8(a5)
    8000564c:	000780e7          	jalr	a5
}
    80005650:	01813083          	ld	ra,24(sp)
    80005654:	01013403          	ld	s0,16(sp)
    80005658:	00813483          	ld	s1,8(sp)
    8000565c:	02010113          	addi	sp,sp,32
    80005660:	00008067          	ret

0000000080005664 <_Z8userMainv>:
#include "../test/ConsumerProducer_CPP_API_test.hpp"
#include "System_Mode_test.hpp"

#endif

void userMain() {
    80005664:	fe010113          	addi	sp,sp,-32
    80005668:	00113c23          	sd	ra,24(sp)
    8000566c:	00813823          	sd	s0,16(sp)
    80005670:	00913423          	sd	s1,8(sp)
    80005674:	02010413          	addi	s0,sp,32
    printString("Unesite broj testa? [1-7]\n");
    80005678:	00004517          	auipc	a0,0x4
    8000567c:	bd850513          	addi	a0,a0,-1064 # 80009250 <kvmincrease+0xc60>
    80005680:	00000097          	auipc	ra,0x0
    80005684:	91c080e7          	jalr	-1764(ra) # 80004f9c <_Z11printStringPKc>
    int test = getc() - '0';
    80005688:	ffffc097          	auipc	ra,0xffffc
    8000568c:	f7c080e7          	jalr	-132(ra) # 80001604 <_Z4getcv>
    80005690:	fd05049b          	addiw	s1,a0,-48
    getc(); // Enter posle broja
    80005694:	ffffc097          	auipc	ra,0xffffc
    80005698:	f70080e7          	jalr	-144(ra) # 80001604 <_Z4getcv>
            printString("Nije navedeno da je zadatak 4 implementiran\n");
            return;
        }
    }

    switch (test) {
    8000569c:	00700793          	li	a5,7
    800056a0:	1097e263          	bltu	a5,s1,800057a4 <_Z8userMainv+0x140>
    800056a4:	00249493          	slli	s1,s1,0x2
    800056a8:	00004717          	auipc	a4,0x4
    800056ac:	e0070713          	addi	a4,a4,-512 # 800094a8 <kvmincrease+0xeb8>
    800056b0:	00e484b3          	add	s1,s1,a4
    800056b4:	0004a783          	lw	a5,0(s1)
    800056b8:	00e787b3          	add	a5,a5,a4
    800056bc:	00078067          	jr	a5
        case 1:
#if LEVEL_2_IMPLEMENTED == 1
            Threads_C_API_test();
    800056c0:	fffff097          	auipc	ra,0xfffff
    800056c4:	f54080e7          	jalr	-172(ra) # 80004614 <_Z18Threads_C_API_testv>
            printString("TEST 1 (zadatak 2, niti C API i sinhrona promena konteksta)\n");
    800056c8:	00004517          	auipc	a0,0x4
    800056cc:	ba850513          	addi	a0,a0,-1112 # 80009270 <kvmincrease+0xc80>
    800056d0:	00000097          	auipc	ra,0x0
    800056d4:	8cc080e7          	jalr	-1844(ra) # 80004f9c <_Z11printStringPKc>
#endif
            break;
        default:
            printString("Niste uneli odgovarajuci broj za test\n");
    }
    800056d8:	01813083          	ld	ra,24(sp)
    800056dc:	01013403          	ld	s0,16(sp)
    800056e0:	00813483          	ld	s1,8(sp)
    800056e4:	02010113          	addi	sp,sp,32
    800056e8:	00008067          	ret
            Threads_CPP_API_test();
    800056ec:	ffffe097          	auipc	ra,0xffffe
    800056f0:	e08080e7          	jalr	-504(ra) # 800034f4 <_Z20Threads_CPP_API_testv>
            printString("TEST 2 (zadatak 2., niti CPP API i sinhrona promena konteksta)\n");
    800056f4:	00004517          	auipc	a0,0x4
    800056f8:	bbc50513          	addi	a0,a0,-1092 # 800092b0 <kvmincrease+0xcc0>
    800056fc:	00000097          	auipc	ra,0x0
    80005700:	8a0080e7          	jalr	-1888(ra) # 80004f9c <_Z11printStringPKc>
            break;
    80005704:	fd5ff06f          	j	800056d8 <_Z8userMainv+0x74>
            producerConsumer_C_API();
    80005708:	ffffd097          	auipc	ra,0xffffd
    8000570c:	640080e7          	jalr	1600(ra) # 80002d48 <_Z22producerConsumer_C_APIv>
            printString("TEST 3 (zadatak 3., kompletan C API sa semaforima, sinhrona promena konteksta)\n");
    80005710:	00004517          	auipc	a0,0x4
    80005714:	be050513          	addi	a0,a0,-1056 # 800092f0 <kvmincrease+0xd00>
    80005718:	00000097          	auipc	ra,0x0
    8000571c:	884080e7          	jalr	-1916(ra) # 80004f9c <_Z11printStringPKc>
            break;
    80005720:	fb9ff06f          	j	800056d8 <_Z8userMainv+0x74>
            producerConsumer_CPP_Sync_API();
    80005724:	fffff097          	auipc	ra,0xfffff
    80005728:	234080e7          	jalr	564(ra) # 80004958 <_Z29producerConsumer_CPP_Sync_APIv>
            printString("TEST 4 (zadatak 3., kompletan CPP API sa semaforima, sinhrona promena konteksta)\n");
    8000572c:	00004517          	auipc	a0,0x4
    80005730:	c1450513          	addi	a0,a0,-1004 # 80009340 <kvmincrease+0xd50>
    80005734:	00000097          	auipc	ra,0x0
    80005738:	868080e7          	jalr	-1944(ra) # 80004f9c <_Z11printStringPKc>
            break;
    8000573c:	f9dff06f          	j	800056d8 <_Z8userMainv+0x74>
            testSleeping();
    80005740:	00000097          	auipc	ra,0x0
    80005744:	11c080e7          	jalr	284(ra) # 8000585c <_Z12testSleepingv>
            printString("TEST 5 (zadatak 4., thread_sleep test C API)\n");
    80005748:	00004517          	auipc	a0,0x4
    8000574c:	c5050513          	addi	a0,a0,-944 # 80009398 <kvmincrease+0xda8>
    80005750:	00000097          	auipc	ra,0x0
    80005754:	84c080e7          	jalr	-1972(ra) # 80004f9c <_Z11printStringPKc>
            break;
    80005758:	f81ff06f          	j	800056d8 <_Z8userMainv+0x74>
            testConsumerProducer();
    8000575c:	ffffe097          	auipc	ra,0xffffe
    80005760:	258080e7          	jalr	600(ra) # 800039b4 <_Z20testConsumerProducerv>
            printString("TEST 6 (zadatak 4. CPP API i asinhrona promena konteksta)\n");
    80005764:	00004517          	auipc	a0,0x4
    80005768:	c6450513          	addi	a0,a0,-924 # 800093c8 <kvmincrease+0xdd8>
    8000576c:	00000097          	auipc	ra,0x0
    80005770:	830080e7          	jalr	-2000(ra) # 80004f9c <_Z11printStringPKc>
            break;
    80005774:	f65ff06f          	j	800056d8 <_Z8userMainv+0x74>
            System_Mode_test();
    80005778:	00000097          	auipc	ra,0x0
    8000577c:	658080e7          	jalr	1624(ra) # 80005dd0 <_Z16System_Mode_testv>
            printString("Test se nije uspesno zavrsio\n");
    80005780:	00004517          	auipc	a0,0x4
    80005784:	c8850513          	addi	a0,a0,-888 # 80009408 <kvmincrease+0xe18>
    80005788:	00000097          	auipc	ra,0x0
    8000578c:	814080e7          	jalr	-2028(ra) # 80004f9c <_Z11printStringPKc>
            printString("TEST 7 (zadatak 2., testiranje da li se korisnicki kod izvrsava u korisnickom rezimu)\n");
    80005790:	00004517          	auipc	a0,0x4
    80005794:	c9850513          	addi	a0,a0,-872 # 80009428 <kvmincrease+0xe38>
    80005798:	00000097          	auipc	ra,0x0
    8000579c:	804080e7          	jalr	-2044(ra) # 80004f9c <_Z11printStringPKc>
            break;
    800057a0:	f39ff06f          	j	800056d8 <_Z8userMainv+0x74>
            printString("Niste uneli odgovarajuci broj za test\n");
    800057a4:	00004517          	auipc	a0,0x4
    800057a8:	cdc50513          	addi	a0,a0,-804 # 80009480 <kvmincrease+0xe90>
    800057ac:	fffff097          	auipc	ra,0xfffff
    800057b0:	7f0080e7          	jalr	2032(ra) # 80004f9c <_Z11printStringPKc>
    800057b4:	f25ff06f          	j	800056d8 <_Z8userMainv+0x74>

00000000800057b8 <_ZL9sleepyRunPv>:

#include "printing.hpp"

static volatile bool finished[2];

static void sleepyRun(void *arg) {
    800057b8:	fe010113          	addi	sp,sp,-32
    800057bc:	00113c23          	sd	ra,24(sp)
    800057c0:	00813823          	sd	s0,16(sp)
    800057c4:	00913423          	sd	s1,8(sp)
    800057c8:	01213023          	sd	s2,0(sp)
    800057cc:	02010413          	addi	s0,sp,32
    time_t sleep_time = *((time_t *) arg);
    800057d0:	00053903          	ld	s2,0(a0)
    int i = 6;
    800057d4:	00600493          	li	s1,6
    while (--i > 0) {
    800057d8:	fff4849b          	addiw	s1,s1,-1
    800057dc:	04905463          	blez	s1,80005824 <_ZL9sleepyRunPv+0x6c>

        printString("Hello ");
    800057e0:	00004517          	auipc	a0,0x4
    800057e4:	ce850513          	addi	a0,a0,-792 # 800094c8 <kvmincrease+0xed8>
    800057e8:	fffff097          	auipc	ra,0xfffff
    800057ec:	7b4080e7          	jalr	1972(ra) # 80004f9c <_Z11printStringPKc>
        printInt(sleep_time);
    800057f0:	00000613          	li	a2,0
    800057f4:	00a00593          	li	a1,10
    800057f8:	0009051b          	sext.w	a0,s2
    800057fc:	00000097          	auipc	ra,0x0
    80005800:	950080e7          	jalr	-1712(ra) # 8000514c <_Z8printIntiii>
        printString(" !\n");
    80005804:	00004517          	auipc	a0,0x4
    80005808:	ccc50513          	addi	a0,a0,-820 # 800094d0 <kvmincrease+0xee0>
    8000580c:	fffff097          	auipc	ra,0xfffff
    80005810:	790080e7          	jalr	1936(ra) # 80004f9c <_Z11printStringPKc>
        time_sleep(sleep_time);
    80005814:	00090513          	mv	a0,s2
    80005818:	ffffc097          	auipc	ra,0xffffc
    8000581c:	dc0080e7          	jalr	-576(ra) # 800015d8 <_Z10time_sleepm>
    while (--i > 0) {
    80005820:	fb9ff06f          	j	800057d8 <_ZL9sleepyRunPv+0x20>
    }
    finished[sleep_time/10-1] = true;
    80005824:	00a00793          	li	a5,10
    80005828:	02f95933          	divu	s2,s2,a5
    8000582c:	fff90913          	addi	s2,s2,-1
    80005830:	00006797          	auipc	a5,0x6
    80005834:	ea078793          	addi	a5,a5,-352 # 8000b6d0 <_ZL8finished>
    80005838:	01278933          	add	s2,a5,s2
    8000583c:	00100793          	li	a5,1
    80005840:	00f90023          	sb	a5,0(s2)
}
    80005844:	01813083          	ld	ra,24(sp)
    80005848:	01013403          	ld	s0,16(sp)
    8000584c:	00813483          	ld	s1,8(sp)
    80005850:	00013903          	ld	s2,0(sp)
    80005854:	02010113          	addi	sp,sp,32
    80005858:	00008067          	ret

000000008000585c <_Z12testSleepingv>:

void testSleeping() {
    8000585c:	fc010113          	addi	sp,sp,-64
    80005860:	02113c23          	sd	ra,56(sp)
    80005864:	02813823          	sd	s0,48(sp)
    80005868:	02913423          	sd	s1,40(sp)
    8000586c:	04010413          	addi	s0,sp,64
    const int sleepy_thread_count = 2;
    time_t sleep_times[sleepy_thread_count] = {10, 20};
    80005870:	00a00793          	li	a5,10
    80005874:	fcf43823          	sd	a5,-48(s0)
    80005878:	01400793          	li	a5,20
    8000587c:	fcf43c23          	sd	a5,-40(s0)
    thread_t sleepyThread[sleepy_thread_count];

    for (int i = 0; i < sleepy_thread_count; i++) {
    80005880:	00000493          	li	s1,0
    80005884:	02c0006f          	j	800058b0 <_Z12testSleepingv+0x54>
        thread_create(&sleepyThread[i], sleepyRun, sleep_times + i);
    80005888:	00349793          	slli	a5,s1,0x3
    8000588c:	fd040613          	addi	a2,s0,-48
    80005890:	00f60633          	add	a2,a2,a5
    80005894:	00000597          	auipc	a1,0x0
    80005898:	f2458593          	addi	a1,a1,-220 # 800057b8 <_ZL9sleepyRunPv>
    8000589c:	fc040513          	addi	a0,s0,-64
    800058a0:	00f50533          	add	a0,a0,a5
    800058a4:	ffffc097          	auipc	ra,0xffffc
    800058a8:	b60080e7          	jalr	-1184(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    for (int i = 0; i < sleepy_thread_count; i++) {
    800058ac:	0014849b          	addiw	s1,s1,1
    800058b0:	00100793          	li	a5,1
    800058b4:	fc97dae3          	bge	a5,s1,80005888 <_Z12testSleepingv+0x2c>
    }

    while (!(finished[0] && finished[1])) {}
    800058b8:	00006797          	auipc	a5,0x6
    800058bc:	e187c783          	lbu	a5,-488(a5) # 8000b6d0 <_ZL8finished>
    800058c0:	fe078ce3          	beqz	a5,800058b8 <_Z12testSleepingv+0x5c>
    800058c4:	00006797          	auipc	a5,0x6
    800058c8:	e0d7c783          	lbu	a5,-499(a5) # 8000b6d1 <_ZL8finished+0x1>
    800058cc:	fe0786e3          	beqz	a5,800058b8 <_Z12testSleepingv+0x5c>
}
    800058d0:	03813083          	ld	ra,56(sp)
    800058d4:	03013403          	ld	s0,48(sp)
    800058d8:	02813483          	ld	s1,40(sp)
    800058dc:	04010113          	addi	sp,sp,64
    800058e0:	00008067          	ret

00000000800058e4 <_ZL9fibonaccim>:
static volatile bool finishedA = false;
static volatile bool finishedB = false;
static volatile bool finishedC = false;
static volatile bool finishedD = false;

static uint64 fibonacci(uint64 n) {
    800058e4:	fe010113          	addi	sp,sp,-32
    800058e8:	00113c23          	sd	ra,24(sp)
    800058ec:	00813823          	sd	s0,16(sp)
    800058f0:	00913423          	sd	s1,8(sp)
    800058f4:	01213023          	sd	s2,0(sp)
    800058f8:	02010413          	addi	s0,sp,32
    800058fc:	00050493          	mv	s1,a0
    if (n == 0 || n == 1) { return n; }
    80005900:	00100793          	li	a5,1
    80005904:	02a7f863          	bgeu	a5,a0,80005934 <_ZL9fibonaccim+0x50>
    if (n % 10 == 0) { thread_dispatch(); }
    80005908:	00a00793          	li	a5,10
    8000590c:	02f577b3          	remu	a5,a0,a5
    80005910:	02078e63          	beqz	a5,8000594c <_ZL9fibonaccim+0x68>
    return fibonacci(n - 1) + fibonacci(n - 2);
    80005914:	fff48513          	addi	a0,s1,-1
    80005918:	00000097          	auipc	ra,0x0
    8000591c:	fcc080e7          	jalr	-52(ra) # 800058e4 <_ZL9fibonaccim>
    80005920:	00050913          	mv	s2,a0
    80005924:	ffe48513          	addi	a0,s1,-2
    80005928:	00000097          	auipc	ra,0x0
    8000592c:	fbc080e7          	jalr	-68(ra) # 800058e4 <_ZL9fibonaccim>
    80005930:	00a90533          	add	a0,s2,a0
}
    80005934:	01813083          	ld	ra,24(sp)
    80005938:	01013403          	ld	s0,16(sp)
    8000593c:	00813483          	ld	s1,8(sp)
    80005940:	00013903          	ld	s2,0(sp)
    80005944:	02010113          	addi	sp,sp,32
    80005948:	00008067          	ret
    if (n % 10 == 0) { thread_dispatch(); }
    8000594c:	ffffc097          	auipc	ra,0xffffc
    80005950:	b5c080e7          	jalr	-1188(ra) # 800014a8 <_Z15thread_dispatchv>
    80005954:	fc1ff06f          	j	80005914 <_ZL9fibonaccim+0x30>

0000000080005958 <_ZL11workerBodyDPv>:
    printString("A finished!\n");
    finishedC = true;
    thread_dispatch();
}

static void workerBodyD(void* arg) {
    80005958:	fe010113          	addi	sp,sp,-32
    8000595c:	00113c23          	sd	ra,24(sp)
    80005960:	00813823          	sd	s0,16(sp)
    80005964:	00913423          	sd	s1,8(sp)
    80005968:	01213023          	sd	s2,0(sp)
    8000596c:	02010413          	addi	s0,sp,32
    uint8 i = 10;
    80005970:	00a00493          	li	s1,10
    80005974:	0400006f          	j	800059b4 <_ZL11workerBodyDPv+0x5c>
    for (; i < 13; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005978:	00004517          	auipc	a0,0x4
    8000597c:	82850513          	addi	a0,a0,-2008 # 800091a0 <kvmincrease+0xbb0>
    80005980:	fffff097          	auipc	ra,0xfffff
    80005984:	61c080e7          	jalr	1564(ra) # 80004f9c <_Z11printStringPKc>
    80005988:	00000613          	li	a2,0
    8000598c:	00a00593          	li	a1,10
    80005990:	00048513          	mv	a0,s1
    80005994:	fffff097          	auipc	ra,0xfffff
    80005998:	7b8080e7          	jalr	1976(ra) # 8000514c <_Z8printIntiii>
    8000599c:	00004517          	auipc	a0,0x4
    800059a0:	9f450513          	addi	a0,a0,-1548 # 80009390 <kvmincrease+0xda0>
    800059a4:	fffff097          	auipc	ra,0xfffff
    800059a8:	5f8080e7          	jalr	1528(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 13; i++) {
    800059ac:	0014849b          	addiw	s1,s1,1
    800059b0:	0ff4f493          	andi	s1,s1,255
    800059b4:	00c00793          	li	a5,12
    800059b8:	fc97f0e3          	bgeu	a5,s1,80005978 <_ZL11workerBodyDPv+0x20>
    }

    printString("D: dispatch\n");
    800059bc:	00003517          	auipc	a0,0x3
    800059c0:	7ec50513          	addi	a0,a0,2028 # 800091a8 <kvmincrease+0xbb8>
    800059c4:	fffff097          	auipc	ra,0xfffff
    800059c8:	5d8080e7          	jalr	1496(ra) # 80004f9c <_Z11printStringPKc>
    __asm__ ("li t1, 5");
    800059cc:	00500313          	li	t1,5
    thread_dispatch();
    800059d0:	ffffc097          	auipc	ra,0xffffc
    800059d4:	ad8080e7          	jalr	-1320(ra) # 800014a8 <_Z15thread_dispatchv>

    uint64 result = fibonacci(16);
    800059d8:	01000513          	li	a0,16
    800059dc:	00000097          	auipc	ra,0x0
    800059e0:	f08080e7          	jalr	-248(ra) # 800058e4 <_ZL9fibonaccim>
    800059e4:	00050913          	mv	s2,a0
    printString("D: fibonaci="); printInt(result); printString("\n");
    800059e8:	00003517          	auipc	a0,0x3
    800059ec:	7d050513          	addi	a0,a0,2000 # 800091b8 <kvmincrease+0xbc8>
    800059f0:	fffff097          	auipc	ra,0xfffff
    800059f4:	5ac080e7          	jalr	1452(ra) # 80004f9c <_Z11printStringPKc>
    800059f8:	00000613          	li	a2,0
    800059fc:	00a00593          	li	a1,10
    80005a00:	0009051b          	sext.w	a0,s2
    80005a04:	fffff097          	auipc	ra,0xfffff
    80005a08:	748080e7          	jalr	1864(ra) # 8000514c <_Z8printIntiii>
    80005a0c:	00004517          	auipc	a0,0x4
    80005a10:	98450513          	addi	a0,a0,-1660 # 80009390 <kvmincrease+0xda0>
    80005a14:	fffff097          	auipc	ra,0xfffff
    80005a18:	588080e7          	jalr	1416(ra) # 80004f9c <_Z11printStringPKc>
    80005a1c:	0400006f          	j	80005a5c <_ZL11workerBodyDPv+0x104>

    for (; i < 16; i++) {
        printString("D: i="); printInt(i); printString("\n");
    80005a20:	00003517          	auipc	a0,0x3
    80005a24:	78050513          	addi	a0,a0,1920 # 800091a0 <kvmincrease+0xbb0>
    80005a28:	fffff097          	auipc	ra,0xfffff
    80005a2c:	574080e7          	jalr	1396(ra) # 80004f9c <_Z11printStringPKc>
    80005a30:	00000613          	li	a2,0
    80005a34:	00a00593          	li	a1,10
    80005a38:	00048513          	mv	a0,s1
    80005a3c:	fffff097          	auipc	ra,0xfffff
    80005a40:	710080e7          	jalr	1808(ra) # 8000514c <_Z8printIntiii>
    80005a44:	00004517          	auipc	a0,0x4
    80005a48:	94c50513          	addi	a0,a0,-1716 # 80009390 <kvmincrease+0xda0>
    80005a4c:	fffff097          	auipc	ra,0xfffff
    80005a50:	550080e7          	jalr	1360(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 16; i++) {
    80005a54:	0014849b          	addiw	s1,s1,1
    80005a58:	0ff4f493          	andi	s1,s1,255
    80005a5c:	00f00793          	li	a5,15
    80005a60:	fc97f0e3          	bgeu	a5,s1,80005a20 <_ZL11workerBodyDPv+0xc8>
    }

    printString("D finished!\n");
    80005a64:	00003517          	auipc	a0,0x3
    80005a68:	76450513          	addi	a0,a0,1892 # 800091c8 <kvmincrease+0xbd8>
    80005a6c:	fffff097          	auipc	ra,0xfffff
    80005a70:	530080e7          	jalr	1328(ra) # 80004f9c <_Z11printStringPKc>
    finishedD = true;
    80005a74:	00100793          	li	a5,1
    80005a78:	00006717          	auipc	a4,0x6
    80005a7c:	c4f70d23          	sb	a5,-934(a4) # 8000b6d2 <_ZL9finishedD>
    thread_dispatch();
    80005a80:	ffffc097          	auipc	ra,0xffffc
    80005a84:	a28080e7          	jalr	-1496(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80005a88:	01813083          	ld	ra,24(sp)
    80005a8c:	01013403          	ld	s0,16(sp)
    80005a90:	00813483          	ld	s1,8(sp)
    80005a94:	00013903          	ld	s2,0(sp)
    80005a98:	02010113          	addi	sp,sp,32
    80005a9c:	00008067          	ret

0000000080005aa0 <_ZL11workerBodyCPv>:
static void workerBodyC(void* arg) {
    80005aa0:	fe010113          	addi	sp,sp,-32
    80005aa4:	00113c23          	sd	ra,24(sp)
    80005aa8:	00813823          	sd	s0,16(sp)
    80005aac:	00913423          	sd	s1,8(sp)
    80005ab0:	01213023          	sd	s2,0(sp)
    80005ab4:	02010413          	addi	s0,sp,32
    uint8 i = 0;
    80005ab8:	00000493          	li	s1,0
    80005abc:	0400006f          	j	80005afc <_ZL11workerBodyCPv+0x5c>
        printString("C: i="); printInt(i); printString("\n");
    80005ac0:	00003517          	auipc	a0,0x3
    80005ac4:	6b050513          	addi	a0,a0,1712 # 80009170 <kvmincrease+0xb80>
    80005ac8:	fffff097          	auipc	ra,0xfffff
    80005acc:	4d4080e7          	jalr	1236(ra) # 80004f9c <_Z11printStringPKc>
    80005ad0:	00000613          	li	a2,0
    80005ad4:	00a00593          	li	a1,10
    80005ad8:	00048513          	mv	a0,s1
    80005adc:	fffff097          	auipc	ra,0xfffff
    80005ae0:	670080e7          	jalr	1648(ra) # 8000514c <_Z8printIntiii>
    80005ae4:	00004517          	auipc	a0,0x4
    80005ae8:	8ac50513          	addi	a0,a0,-1876 # 80009390 <kvmincrease+0xda0>
    80005aec:	fffff097          	auipc	ra,0xfffff
    80005af0:	4b0080e7          	jalr	1200(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 3; i++) {
    80005af4:	0014849b          	addiw	s1,s1,1
    80005af8:	0ff4f493          	andi	s1,s1,255
    80005afc:	00200793          	li	a5,2
    80005b00:	fc97f0e3          	bgeu	a5,s1,80005ac0 <_ZL11workerBodyCPv+0x20>
    printString("C: dispatch\n");
    80005b04:	00003517          	auipc	a0,0x3
    80005b08:	67450513          	addi	a0,a0,1652 # 80009178 <kvmincrease+0xb88>
    80005b0c:	fffff097          	auipc	ra,0xfffff
    80005b10:	490080e7          	jalr	1168(ra) # 80004f9c <_Z11printStringPKc>
    __asm__ ("li t1, 7");
    80005b14:	00700313          	li	t1,7
    thread_dispatch();
    80005b18:	ffffc097          	auipc	ra,0xffffc
    80005b1c:	990080e7          	jalr	-1648(ra) # 800014a8 <_Z15thread_dispatchv>
    __asm__ ("mv %[t1], t1" : [t1] "=r"(t1));
    80005b20:	00030913          	mv	s2,t1
    printString("C: t1="); printInt(t1); printString("\n");
    80005b24:	00003517          	auipc	a0,0x3
    80005b28:	66450513          	addi	a0,a0,1636 # 80009188 <kvmincrease+0xb98>
    80005b2c:	fffff097          	auipc	ra,0xfffff
    80005b30:	470080e7          	jalr	1136(ra) # 80004f9c <_Z11printStringPKc>
    80005b34:	00000613          	li	a2,0
    80005b38:	00a00593          	li	a1,10
    80005b3c:	0009051b          	sext.w	a0,s2
    80005b40:	fffff097          	auipc	ra,0xfffff
    80005b44:	60c080e7          	jalr	1548(ra) # 8000514c <_Z8printIntiii>
    80005b48:	00004517          	auipc	a0,0x4
    80005b4c:	84850513          	addi	a0,a0,-1976 # 80009390 <kvmincrease+0xda0>
    80005b50:	fffff097          	auipc	ra,0xfffff
    80005b54:	44c080e7          	jalr	1100(ra) # 80004f9c <_Z11printStringPKc>
    uint64 result = fibonacci(12);
    80005b58:	00c00513          	li	a0,12
    80005b5c:	00000097          	auipc	ra,0x0
    80005b60:	d88080e7          	jalr	-632(ra) # 800058e4 <_ZL9fibonaccim>
    80005b64:	00050913          	mv	s2,a0
    printString("C: fibonaci="); printInt(result); printString("\n");
    80005b68:	00003517          	auipc	a0,0x3
    80005b6c:	62850513          	addi	a0,a0,1576 # 80009190 <kvmincrease+0xba0>
    80005b70:	fffff097          	auipc	ra,0xfffff
    80005b74:	42c080e7          	jalr	1068(ra) # 80004f9c <_Z11printStringPKc>
    80005b78:	00000613          	li	a2,0
    80005b7c:	00a00593          	li	a1,10
    80005b80:	0009051b          	sext.w	a0,s2
    80005b84:	fffff097          	auipc	ra,0xfffff
    80005b88:	5c8080e7          	jalr	1480(ra) # 8000514c <_Z8printIntiii>
    80005b8c:	00004517          	auipc	a0,0x4
    80005b90:	80450513          	addi	a0,a0,-2044 # 80009390 <kvmincrease+0xda0>
    80005b94:	fffff097          	auipc	ra,0xfffff
    80005b98:	408080e7          	jalr	1032(ra) # 80004f9c <_Z11printStringPKc>
    80005b9c:	0400006f          	j	80005bdc <_ZL11workerBodyCPv+0x13c>
        printString("C: i="); printInt(i); printString("\n");
    80005ba0:	00003517          	auipc	a0,0x3
    80005ba4:	5d050513          	addi	a0,a0,1488 # 80009170 <kvmincrease+0xb80>
    80005ba8:	fffff097          	auipc	ra,0xfffff
    80005bac:	3f4080e7          	jalr	1012(ra) # 80004f9c <_Z11printStringPKc>
    80005bb0:	00000613          	li	a2,0
    80005bb4:	00a00593          	li	a1,10
    80005bb8:	00048513          	mv	a0,s1
    80005bbc:	fffff097          	auipc	ra,0xfffff
    80005bc0:	590080e7          	jalr	1424(ra) # 8000514c <_Z8printIntiii>
    80005bc4:	00003517          	auipc	a0,0x3
    80005bc8:	7cc50513          	addi	a0,a0,1996 # 80009390 <kvmincrease+0xda0>
    80005bcc:	fffff097          	auipc	ra,0xfffff
    80005bd0:	3d0080e7          	jalr	976(ra) # 80004f9c <_Z11printStringPKc>
    for (; i < 6; i++) {
    80005bd4:	0014849b          	addiw	s1,s1,1
    80005bd8:	0ff4f493          	andi	s1,s1,255
    80005bdc:	00500793          	li	a5,5
    80005be0:	fc97f0e3          	bgeu	a5,s1,80005ba0 <_ZL11workerBodyCPv+0x100>
    printString("A finished!\n");
    80005be4:	00003517          	auipc	a0,0x3
    80005be8:	56450513          	addi	a0,a0,1380 # 80009148 <kvmincrease+0xb58>
    80005bec:	fffff097          	auipc	ra,0xfffff
    80005bf0:	3b0080e7          	jalr	944(ra) # 80004f9c <_Z11printStringPKc>
    finishedC = true;
    80005bf4:	00100793          	li	a5,1
    80005bf8:	00006717          	auipc	a4,0x6
    80005bfc:	acf70da3          	sb	a5,-1317(a4) # 8000b6d3 <_ZL9finishedC>
    thread_dispatch();
    80005c00:	ffffc097          	auipc	ra,0xffffc
    80005c04:	8a8080e7          	jalr	-1880(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80005c08:	01813083          	ld	ra,24(sp)
    80005c0c:	01013403          	ld	s0,16(sp)
    80005c10:	00813483          	ld	s1,8(sp)
    80005c14:	00013903          	ld	s2,0(sp)
    80005c18:	02010113          	addi	sp,sp,32
    80005c1c:	00008067          	ret

0000000080005c20 <_ZL11workerBodyBPv>:
static void workerBodyB(void* arg) {
    80005c20:	fe010113          	addi	sp,sp,-32
    80005c24:	00113c23          	sd	ra,24(sp)
    80005c28:	00813823          	sd	s0,16(sp)
    80005c2c:	00913423          	sd	s1,8(sp)
    80005c30:	01213023          	sd	s2,0(sp)
    80005c34:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 16; i++) {
    80005c38:	00000913          	li	s2,0
    80005c3c:	0400006f          	j	80005c7c <_ZL11workerBodyBPv+0x5c>
            thread_dispatch();
    80005c40:	ffffc097          	auipc	ra,0xffffc
    80005c44:	868080e7          	jalr	-1944(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005c48:	00148493          	addi	s1,s1,1
    80005c4c:	000027b7          	lui	a5,0x2
    80005c50:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005c54:	0097ee63          	bltu	a5,s1,80005c70 <_ZL11workerBodyBPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005c58:	00000713          	li	a4,0
    80005c5c:	000077b7          	lui	a5,0x7
    80005c60:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005c64:	fce7eee3          	bltu	a5,a4,80005c40 <_ZL11workerBodyBPv+0x20>
    80005c68:	00170713          	addi	a4,a4,1
    80005c6c:	ff1ff06f          	j	80005c5c <_ZL11workerBodyBPv+0x3c>
        if (i == 10) {
    80005c70:	00a00793          	li	a5,10
    80005c74:	04f90663          	beq	s2,a5,80005cc0 <_ZL11workerBodyBPv+0xa0>
    for (uint64 i = 0; i < 16; i++) {
    80005c78:	00190913          	addi	s2,s2,1
    80005c7c:	00f00793          	li	a5,15
    80005c80:	0527e463          	bltu	a5,s2,80005cc8 <_ZL11workerBodyBPv+0xa8>
        printString("B: i="); printInt(i); printString("\n");
    80005c84:	00003517          	auipc	a0,0x3
    80005c88:	4d450513          	addi	a0,a0,1236 # 80009158 <kvmincrease+0xb68>
    80005c8c:	fffff097          	auipc	ra,0xfffff
    80005c90:	310080e7          	jalr	784(ra) # 80004f9c <_Z11printStringPKc>
    80005c94:	00000613          	li	a2,0
    80005c98:	00a00593          	li	a1,10
    80005c9c:	0009051b          	sext.w	a0,s2
    80005ca0:	fffff097          	auipc	ra,0xfffff
    80005ca4:	4ac080e7          	jalr	1196(ra) # 8000514c <_Z8printIntiii>
    80005ca8:	00003517          	auipc	a0,0x3
    80005cac:	6e850513          	addi	a0,a0,1768 # 80009390 <kvmincrease+0xda0>
    80005cb0:	fffff097          	auipc	ra,0xfffff
    80005cb4:	2ec080e7          	jalr	748(ra) # 80004f9c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005cb8:	00000493          	li	s1,0
    80005cbc:	f91ff06f          	j	80005c4c <_ZL11workerBodyBPv+0x2c>
            asm volatile("csrr t6, sepc");
    80005cc0:	14102ff3          	csrr	t6,sepc
    80005cc4:	fb5ff06f          	j	80005c78 <_ZL11workerBodyBPv+0x58>
    printString("B finished!\n");
    80005cc8:	00003517          	auipc	a0,0x3
    80005ccc:	49850513          	addi	a0,a0,1176 # 80009160 <kvmincrease+0xb70>
    80005cd0:	fffff097          	auipc	ra,0xfffff
    80005cd4:	2cc080e7          	jalr	716(ra) # 80004f9c <_Z11printStringPKc>
    finishedB = true;
    80005cd8:	00100793          	li	a5,1
    80005cdc:	00006717          	auipc	a4,0x6
    80005ce0:	9ef70c23          	sb	a5,-1544(a4) # 8000b6d4 <_ZL9finishedB>
    thread_dispatch();
    80005ce4:	ffffb097          	auipc	ra,0xffffb
    80005ce8:	7c4080e7          	jalr	1988(ra) # 800014a8 <_Z15thread_dispatchv>
}
    80005cec:	01813083          	ld	ra,24(sp)
    80005cf0:	01013403          	ld	s0,16(sp)
    80005cf4:	00813483          	ld	s1,8(sp)
    80005cf8:	00013903          	ld	s2,0(sp)
    80005cfc:	02010113          	addi	sp,sp,32
    80005d00:	00008067          	ret

0000000080005d04 <_ZL11workerBodyAPv>:
static void workerBodyA(void* arg) {
    80005d04:	fe010113          	addi	sp,sp,-32
    80005d08:	00113c23          	sd	ra,24(sp)
    80005d0c:	00813823          	sd	s0,16(sp)
    80005d10:	00913423          	sd	s1,8(sp)
    80005d14:	01213023          	sd	s2,0(sp)
    80005d18:	02010413          	addi	s0,sp,32
    for (uint64 i = 0; i < 10; i++) {
    80005d1c:	00000913          	li	s2,0
    80005d20:	0380006f          	j	80005d58 <_ZL11workerBodyAPv+0x54>
            thread_dispatch();
    80005d24:	ffffb097          	auipc	ra,0xffffb
    80005d28:	784080e7          	jalr	1924(ra) # 800014a8 <_Z15thread_dispatchv>
        for (uint64 j = 0; j < 10000; j++) {
    80005d2c:	00148493          	addi	s1,s1,1
    80005d30:	000027b7          	lui	a5,0x2
    80005d34:	70f78793          	addi	a5,a5,1807 # 270f <_entry-0x7fffd8f1>
    80005d38:	0097ee63          	bltu	a5,s1,80005d54 <_ZL11workerBodyAPv+0x50>
            for (uint64 k = 0; k < 30000; k++) { /* busy wait */ }
    80005d3c:	00000713          	li	a4,0
    80005d40:	000077b7          	lui	a5,0x7
    80005d44:	52f78793          	addi	a5,a5,1327 # 752f <_entry-0x7fff8ad1>
    80005d48:	fce7eee3          	bltu	a5,a4,80005d24 <_ZL11workerBodyAPv+0x20>
    80005d4c:	00170713          	addi	a4,a4,1
    80005d50:	ff1ff06f          	j	80005d40 <_ZL11workerBodyAPv+0x3c>
    for (uint64 i = 0; i < 10; i++) {
    80005d54:	00190913          	addi	s2,s2,1
    80005d58:	00900793          	li	a5,9
    80005d5c:	0527e063          	bltu	a5,s2,80005d9c <_ZL11workerBodyAPv+0x98>
        printString("A: i="); printInt(i); printString("\n");
    80005d60:	00003517          	auipc	a0,0x3
    80005d64:	3e050513          	addi	a0,a0,992 # 80009140 <kvmincrease+0xb50>
    80005d68:	fffff097          	auipc	ra,0xfffff
    80005d6c:	234080e7          	jalr	564(ra) # 80004f9c <_Z11printStringPKc>
    80005d70:	00000613          	li	a2,0
    80005d74:	00a00593          	li	a1,10
    80005d78:	0009051b          	sext.w	a0,s2
    80005d7c:	fffff097          	auipc	ra,0xfffff
    80005d80:	3d0080e7          	jalr	976(ra) # 8000514c <_Z8printIntiii>
    80005d84:	00003517          	auipc	a0,0x3
    80005d88:	60c50513          	addi	a0,a0,1548 # 80009390 <kvmincrease+0xda0>
    80005d8c:	fffff097          	auipc	ra,0xfffff
    80005d90:	210080e7          	jalr	528(ra) # 80004f9c <_Z11printStringPKc>
        for (uint64 j = 0; j < 10000; j++) {
    80005d94:	00000493          	li	s1,0
    80005d98:	f99ff06f          	j	80005d30 <_ZL11workerBodyAPv+0x2c>
    printString("A finished!\n");
    80005d9c:	00003517          	auipc	a0,0x3
    80005da0:	3ac50513          	addi	a0,a0,940 # 80009148 <kvmincrease+0xb58>
    80005da4:	fffff097          	auipc	ra,0xfffff
    80005da8:	1f8080e7          	jalr	504(ra) # 80004f9c <_Z11printStringPKc>
    finishedA = true;
    80005dac:	00100793          	li	a5,1
    80005db0:	00006717          	auipc	a4,0x6
    80005db4:	92f702a3          	sb	a5,-1755(a4) # 8000b6d5 <_ZL9finishedA>
}
    80005db8:	01813083          	ld	ra,24(sp)
    80005dbc:	01013403          	ld	s0,16(sp)
    80005dc0:	00813483          	ld	s1,8(sp)
    80005dc4:	00013903          	ld	s2,0(sp)
    80005dc8:	02010113          	addi	sp,sp,32
    80005dcc:	00008067          	ret

0000000080005dd0 <_Z16System_Mode_testv>:


void System_Mode_test() {
    80005dd0:	fd010113          	addi	sp,sp,-48
    80005dd4:	02113423          	sd	ra,40(sp)
    80005dd8:	02813023          	sd	s0,32(sp)
    80005ddc:	03010413          	addi	s0,sp,48
    thread_t threads[4];
    thread_create(&threads[0], workerBodyA, nullptr);
    80005de0:	00000613          	li	a2,0
    80005de4:	00000597          	auipc	a1,0x0
    80005de8:	f2058593          	addi	a1,a1,-224 # 80005d04 <_ZL11workerBodyAPv>
    80005dec:	fd040513          	addi	a0,s0,-48
    80005df0:	ffffb097          	auipc	ra,0xffffb
    80005df4:	614080e7          	jalr	1556(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadA created\n");
    80005df8:	00003517          	auipc	a0,0x3
    80005dfc:	3e050513          	addi	a0,a0,992 # 800091d8 <kvmincrease+0xbe8>
    80005e00:	fffff097          	auipc	ra,0xfffff
    80005e04:	19c080e7          	jalr	412(ra) # 80004f9c <_Z11printStringPKc>

    thread_create(&threads[1], workerBodyB, nullptr);
    80005e08:	00000613          	li	a2,0
    80005e0c:	00000597          	auipc	a1,0x0
    80005e10:	e1458593          	addi	a1,a1,-492 # 80005c20 <_ZL11workerBodyBPv>
    80005e14:	fd840513          	addi	a0,s0,-40
    80005e18:	ffffb097          	auipc	ra,0xffffb
    80005e1c:	5ec080e7          	jalr	1516(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadB created\n");
    80005e20:	00003517          	auipc	a0,0x3
    80005e24:	3d050513          	addi	a0,a0,976 # 800091f0 <kvmincrease+0xc00>
    80005e28:	fffff097          	auipc	ra,0xfffff
    80005e2c:	174080e7          	jalr	372(ra) # 80004f9c <_Z11printStringPKc>

    thread_create(&threads[2], workerBodyC, nullptr);
    80005e30:	00000613          	li	a2,0
    80005e34:	00000597          	auipc	a1,0x0
    80005e38:	c6c58593          	addi	a1,a1,-916 # 80005aa0 <_ZL11workerBodyCPv>
    80005e3c:	fe040513          	addi	a0,s0,-32
    80005e40:	ffffb097          	auipc	ra,0xffffb
    80005e44:	5c4080e7          	jalr	1476(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadC created\n");
    80005e48:	00003517          	auipc	a0,0x3
    80005e4c:	3c050513          	addi	a0,a0,960 # 80009208 <kvmincrease+0xc18>
    80005e50:	fffff097          	auipc	ra,0xfffff
    80005e54:	14c080e7          	jalr	332(ra) # 80004f9c <_Z11printStringPKc>

    thread_create(&threads[3], workerBodyD, nullptr);
    80005e58:	00000613          	li	a2,0
    80005e5c:	00000597          	auipc	a1,0x0
    80005e60:	afc58593          	addi	a1,a1,-1284 # 80005958 <_ZL11workerBodyDPv>
    80005e64:	fe840513          	addi	a0,s0,-24
    80005e68:	ffffb097          	auipc	ra,0xffffb
    80005e6c:	59c080e7          	jalr	1436(ra) # 80001404 <_Z13thread_createPP3TCBPFvPvES2_>
    printString("ThreadD created\n");
    80005e70:	00003517          	auipc	a0,0x3
    80005e74:	3b050513          	addi	a0,a0,944 # 80009220 <kvmincrease+0xc30>
    80005e78:	fffff097          	auipc	ra,0xfffff
    80005e7c:	124080e7          	jalr	292(ra) # 80004f9c <_Z11printStringPKc>
    80005e80:	00c0006f          	j	80005e8c <_Z16System_Mode_testv+0xbc>

    while (!(finishedA && finishedB && finishedC && finishedD)) {
        thread_dispatch();
    80005e84:	ffffb097          	auipc	ra,0xffffb
    80005e88:	624080e7          	jalr	1572(ra) # 800014a8 <_Z15thread_dispatchv>
    while (!(finishedA && finishedB && finishedC && finishedD)) {
    80005e8c:	00006797          	auipc	a5,0x6
    80005e90:	8497c783          	lbu	a5,-1975(a5) # 8000b6d5 <_ZL9finishedA>
    80005e94:	fe0788e3          	beqz	a5,80005e84 <_Z16System_Mode_testv+0xb4>
    80005e98:	00006797          	auipc	a5,0x6
    80005e9c:	83c7c783          	lbu	a5,-1988(a5) # 8000b6d4 <_ZL9finishedB>
    80005ea0:	fe0782e3          	beqz	a5,80005e84 <_Z16System_Mode_testv+0xb4>
    80005ea4:	00006797          	auipc	a5,0x6
    80005ea8:	82f7c783          	lbu	a5,-2001(a5) # 8000b6d3 <_ZL9finishedC>
    80005eac:	fc078ce3          	beqz	a5,80005e84 <_Z16System_Mode_testv+0xb4>
    80005eb0:	00006797          	auipc	a5,0x6
    80005eb4:	8227c783          	lbu	a5,-2014(a5) # 8000b6d2 <_ZL9finishedD>
    80005eb8:	fc0786e3          	beqz	a5,80005e84 <_Z16System_Mode_testv+0xb4>
    }

}
    80005ebc:	02813083          	ld	ra,40(sp)
    80005ec0:	02013403          	ld	s0,32(sp)
    80005ec4:	03010113          	addi	sp,sp,48
    80005ec8:	00008067          	ret

0000000080005ecc <_ZN6BufferC1Ei>:
#include "buffer.hpp"

Buffer::Buffer(int _cap) : cap(_cap + 1), head(0), tail(0) {
    80005ecc:	fe010113          	addi	sp,sp,-32
    80005ed0:	00113c23          	sd	ra,24(sp)
    80005ed4:	00813823          	sd	s0,16(sp)
    80005ed8:	00913423          	sd	s1,8(sp)
    80005edc:	01213023          	sd	s2,0(sp)
    80005ee0:	02010413          	addi	s0,sp,32
    80005ee4:	00050493          	mv	s1,a0
    80005ee8:	00058913          	mv	s2,a1
    80005eec:	0015879b          	addiw	a5,a1,1
    80005ef0:	0007851b          	sext.w	a0,a5
    80005ef4:	00f4a023          	sw	a5,0(s1)
    80005ef8:	0004a823          	sw	zero,16(s1)
    80005efc:	0004aa23          	sw	zero,20(s1)
    buffer = (int *)mem_alloc(sizeof(int) * cap);
    80005f00:	00251513          	slli	a0,a0,0x2
    80005f04:	ffffb097          	auipc	ra,0xffffb
    80005f08:	488080e7          	jalr	1160(ra) # 8000138c <_Z9mem_allocm>
    80005f0c:	00a4b423          	sd	a0,8(s1)
    sem_open(&itemAvailable, 0);
    80005f10:	00000593          	li	a1,0
    80005f14:	02048513          	addi	a0,s1,32
    80005f18:	ffffb097          	auipc	ra,0xffffb
    80005f1c:	5dc080e7          	jalr	1500(ra) # 800014f4 <_Z8sem_openPP3semj>
    sem_open(&spaceAvailable, _cap);
    80005f20:	00090593          	mv	a1,s2
    80005f24:	01848513          	addi	a0,s1,24
    80005f28:	ffffb097          	auipc	ra,0xffffb
    80005f2c:	5cc080e7          	jalr	1484(ra) # 800014f4 <_Z8sem_openPP3semj>
    sem_open(&mutexHead, 1);
    80005f30:	00100593          	li	a1,1
    80005f34:	02848513          	addi	a0,s1,40
    80005f38:	ffffb097          	auipc	ra,0xffffb
    80005f3c:	5bc080e7          	jalr	1468(ra) # 800014f4 <_Z8sem_openPP3semj>
    sem_open(&mutexTail, 1);
    80005f40:	00100593          	li	a1,1
    80005f44:	03048513          	addi	a0,s1,48
    80005f48:	ffffb097          	auipc	ra,0xffffb
    80005f4c:	5ac080e7          	jalr	1452(ra) # 800014f4 <_Z8sem_openPP3semj>
}
    80005f50:	01813083          	ld	ra,24(sp)
    80005f54:	01013403          	ld	s0,16(sp)
    80005f58:	00813483          	ld	s1,8(sp)
    80005f5c:	00013903          	ld	s2,0(sp)
    80005f60:	02010113          	addi	sp,sp,32
    80005f64:	00008067          	ret

0000000080005f68 <_ZN6Buffer3putEi>:
    sem_close(spaceAvailable);
    sem_close(mutexTail);
    sem_close(mutexHead);
}

void Buffer::put(int val) {
    80005f68:	fe010113          	addi	sp,sp,-32
    80005f6c:	00113c23          	sd	ra,24(sp)
    80005f70:	00813823          	sd	s0,16(sp)
    80005f74:	00913423          	sd	s1,8(sp)
    80005f78:	01213023          	sd	s2,0(sp)
    80005f7c:	02010413          	addi	s0,sp,32
    80005f80:	00050493          	mv	s1,a0
    80005f84:	00058913          	mv	s2,a1
    sem_wait(spaceAvailable);
    80005f88:	01853503          	ld	a0,24(a0)
    80005f8c:	ffffb097          	auipc	ra,0xffffb
    80005f90:	5dc080e7          	jalr	1500(ra) # 80001568 <_Z8sem_waitP3sem>

    sem_wait(mutexTail);
    80005f94:	0304b503          	ld	a0,48(s1)
    80005f98:	ffffb097          	auipc	ra,0xffffb
    80005f9c:	5d0080e7          	jalr	1488(ra) # 80001568 <_Z8sem_waitP3sem>
    buffer[tail] = val;
    80005fa0:	0084b783          	ld	a5,8(s1)
    80005fa4:	0144a703          	lw	a4,20(s1)
    80005fa8:	00271713          	slli	a4,a4,0x2
    80005fac:	00e787b3          	add	a5,a5,a4
    80005fb0:	0127a023          	sw	s2,0(a5)
    tail = (tail + 1) % cap;
    80005fb4:	0144a783          	lw	a5,20(s1)
    80005fb8:	0017879b          	addiw	a5,a5,1
    80005fbc:	0004a703          	lw	a4,0(s1)
    80005fc0:	02e7e7bb          	remw	a5,a5,a4
    80005fc4:	00f4aa23          	sw	a5,20(s1)
    sem_signal(mutexTail);
    80005fc8:	0304b503          	ld	a0,48(s1)
    80005fcc:	ffffb097          	auipc	ra,0xffffb
    80005fd0:	5d4080e7          	jalr	1492(ra) # 800015a0 <_Z10sem_signalP3sem>

    sem_signal(itemAvailable);
    80005fd4:	0204b503          	ld	a0,32(s1)
    80005fd8:	ffffb097          	auipc	ra,0xffffb
    80005fdc:	5c8080e7          	jalr	1480(ra) # 800015a0 <_Z10sem_signalP3sem>

}
    80005fe0:	01813083          	ld	ra,24(sp)
    80005fe4:	01013403          	ld	s0,16(sp)
    80005fe8:	00813483          	ld	s1,8(sp)
    80005fec:	00013903          	ld	s2,0(sp)
    80005ff0:	02010113          	addi	sp,sp,32
    80005ff4:	00008067          	ret

0000000080005ff8 <_ZN6Buffer3getEv>:

int Buffer::get() {
    80005ff8:	fe010113          	addi	sp,sp,-32
    80005ffc:	00113c23          	sd	ra,24(sp)
    80006000:	00813823          	sd	s0,16(sp)
    80006004:	00913423          	sd	s1,8(sp)
    80006008:	01213023          	sd	s2,0(sp)
    8000600c:	02010413          	addi	s0,sp,32
    80006010:	00050493          	mv	s1,a0
    sem_wait(itemAvailable);
    80006014:	02053503          	ld	a0,32(a0)
    80006018:	ffffb097          	auipc	ra,0xffffb
    8000601c:	550080e7          	jalr	1360(ra) # 80001568 <_Z8sem_waitP3sem>

    sem_wait(mutexHead);
    80006020:	0284b503          	ld	a0,40(s1)
    80006024:	ffffb097          	auipc	ra,0xffffb
    80006028:	544080e7          	jalr	1348(ra) # 80001568 <_Z8sem_waitP3sem>

    int ret = buffer[head];
    8000602c:	0084b703          	ld	a4,8(s1)
    80006030:	0104a783          	lw	a5,16(s1)
    80006034:	00279693          	slli	a3,a5,0x2
    80006038:	00d70733          	add	a4,a4,a3
    8000603c:	00072903          	lw	s2,0(a4)
    head = (head + 1) % cap;
    80006040:	0017879b          	addiw	a5,a5,1
    80006044:	0004a703          	lw	a4,0(s1)
    80006048:	02e7e7bb          	remw	a5,a5,a4
    8000604c:	00f4a823          	sw	a5,16(s1)
    sem_signal(mutexHead);
    80006050:	0284b503          	ld	a0,40(s1)
    80006054:	ffffb097          	auipc	ra,0xffffb
    80006058:	54c080e7          	jalr	1356(ra) # 800015a0 <_Z10sem_signalP3sem>

    sem_signal(spaceAvailable);
    8000605c:	0184b503          	ld	a0,24(s1)
    80006060:	ffffb097          	auipc	ra,0xffffb
    80006064:	540080e7          	jalr	1344(ra) # 800015a0 <_Z10sem_signalP3sem>

    return ret;
}
    80006068:	00090513          	mv	a0,s2
    8000606c:	01813083          	ld	ra,24(sp)
    80006070:	01013403          	ld	s0,16(sp)
    80006074:	00813483          	ld	s1,8(sp)
    80006078:	00013903          	ld	s2,0(sp)
    8000607c:	02010113          	addi	sp,sp,32
    80006080:	00008067          	ret

0000000080006084 <_ZN6Buffer6getCntEv>:

int Buffer::getCnt() {
    80006084:	fe010113          	addi	sp,sp,-32
    80006088:	00113c23          	sd	ra,24(sp)
    8000608c:	00813823          	sd	s0,16(sp)
    80006090:	00913423          	sd	s1,8(sp)
    80006094:	01213023          	sd	s2,0(sp)
    80006098:	02010413          	addi	s0,sp,32
    8000609c:	00050493          	mv	s1,a0
    int ret;

    sem_wait(mutexHead);
    800060a0:	02853503          	ld	a0,40(a0)
    800060a4:	ffffb097          	auipc	ra,0xffffb
    800060a8:	4c4080e7          	jalr	1220(ra) # 80001568 <_Z8sem_waitP3sem>
    sem_wait(mutexTail);
    800060ac:	0304b503          	ld	a0,48(s1)
    800060b0:	ffffb097          	auipc	ra,0xffffb
    800060b4:	4b8080e7          	jalr	1208(ra) # 80001568 <_Z8sem_waitP3sem>

    if (tail >= head) {
    800060b8:	0144a783          	lw	a5,20(s1)
    800060bc:	0104a903          	lw	s2,16(s1)
    800060c0:	0327ce63          	blt	a5,s2,800060fc <_ZN6Buffer6getCntEv+0x78>
        ret = tail - head;
    800060c4:	4127893b          	subw	s2,a5,s2
    } else {
        ret = cap - head + tail;
    }

    sem_signal(mutexTail);
    800060c8:	0304b503          	ld	a0,48(s1)
    800060cc:	ffffb097          	auipc	ra,0xffffb
    800060d0:	4d4080e7          	jalr	1236(ra) # 800015a0 <_Z10sem_signalP3sem>
    sem_signal(mutexHead);
    800060d4:	0284b503          	ld	a0,40(s1)
    800060d8:	ffffb097          	auipc	ra,0xffffb
    800060dc:	4c8080e7          	jalr	1224(ra) # 800015a0 <_Z10sem_signalP3sem>

    return ret;
}
    800060e0:	00090513          	mv	a0,s2
    800060e4:	01813083          	ld	ra,24(sp)
    800060e8:	01013403          	ld	s0,16(sp)
    800060ec:	00813483          	ld	s1,8(sp)
    800060f0:	00013903          	ld	s2,0(sp)
    800060f4:	02010113          	addi	sp,sp,32
    800060f8:	00008067          	ret
        ret = cap - head + tail;
    800060fc:	0004a703          	lw	a4,0(s1)
    80006100:	4127093b          	subw	s2,a4,s2
    80006104:	00f9093b          	addw	s2,s2,a5
    80006108:	fc1ff06f          	j	800060c8 <_ZN6Buffer6getCntEv+0x44>

000000008000610c <_ZN6BufferD1Ev>:
Buffer::~Buffer() {
    8000610c:	fe010113          	addi	sp,sp,-32
    80006110:	00113c23          	sd	ra,24(sp)
    80006114:	00813823          	sd	s0,16(sp)
    80006118:	00913423          	sd	s1,8(sp)
    8000611c:	02010413          	addi	s0,sp,32
    80006120:	00050493          	mv	s1,a0
    putc('\n');
    80006124:	00a00513          	li	a0,10
    80006128:	ffffb097          	auipc	ra,0xffffb
    8000612c:	510080e7          	jalr	1296(ra) # 80001638 <_Z4putcc>
    printString("Buffer deleted!\n");
    80006130:	00003517          	auipc	a0,0x3
    80006134:	10850513          	addi	a0,a0,264 # 80009238 <kvmincrease+0xc48>
    80006138:	fffff097          	auipc	ra,0xfffff
    8000613c:	e64080e7          	jalr	-412(ra) # 80004f9c <_Z11printStringPKc>
    while (getCnt() > 0) {
    80006140:	00048513          	mv	a0,s1
    80006144:	00000097          	auipc	ra,0x0
    80006148:	f40080e7          	jalr	-192(ra) # 80006084 <_ZN6Buffer6getCntEv>
    8000614c:	02a05c63          	blez	a0,80006184 <_ZN6BufferD1Ev+0x78>
        char ch = buffer[head];
    80006150:	0084b783          	ld	a5,8(s1)
    80006154:	0104a703          	lw	a4,16(s1)
    80006158:	00271713          	slli	a4,a4,0x2
    8000615c:	00e787b3          	add	a5,a5,a4
        putc(ch);
    80006160:	0007c503          	lbu	a0,0(a5)
    80006164:	ffffb097          	auipc	ra,0xffffb
    80006168:	4d4080e7          	jalr	1236(ra) # 80001638 <_Z4putcc>
        head = (head + 1) % cap;
    8000616c:	0104a783          	lw	a5,16(s1)
    80006170:	0017879b          	addiw	a5,a5,1
    80006174:	0004a703          	lw	a4,0(s1)
    80006178:	02e7e7bb          	remw	a5,a5,a4
    8000617c:	00f4a823          	sw	a5,16(s1)
    while (getCnt() > 0) {
    80006180:	fc1ff06f          	j	80006140 <_ZN6BufferD1Ev+0x34>
    putc('!');
    80006184:	02100513          	li	a0,33
    80006188:	ffffb097          	auipc	ra,0xffffb
    8000618c:	4b0080e7          	jalr	1200(ra) # 80001638 <_Z4putcc>
    putc('\n');
    80006190:	00a00513          	li	a0,10
    80006194:	ffffb097          	auipc	ra,0xffffb
    80006198:	4a4080e7          	jalr	1188(ra) # 80001638 <_Z4putcc>
    mem_free(buffer);
    8000619c:	0084b503          	ld	a0,8(s1)
    800061a0:	ffffb097          	auipc	ra,0xffffb
    800061a4:	22c080e7          	jalr	556(ra) # 800013cc <_Z8mem_freePv>
    sem_close(itemAvailable);
    800061a8:	0204b503          	ld	a0,32(s1)
    800061ac:	ffffb097          	auipc	ra,0xffffb
    800061b0:	384080e7          	jalr	900(ra) # 80001530 <_Z9sem_closeP3sem>
    sem_close(spaceAvailable);
    800061b4:	0184b503          	ld	a0,24(s1)
    800061b8:	ffffb097          	auipc	ra,0xffffb
    800061bc:	378080e7          	jalr	888(ra) # 80001530 <_Z9sem_closeP3sem>
    sem_close(mutexTail);
    800061c0:	0304b503          	ld	a0,48(s1)
    800061c4:	ffffb097          	auipc	ra,0xffffb
    800061c8:	36c080e7          	jalr	876(ra) # 80001530 <_Z9sem_closeP3sem>
    sem_close(mutexHead);
    800061cc:	0284b503          	ld	a0,40(s1)
    800061d0:	ffffb097          	auipc	ra,0xffffb
    800061d4:	360080e7          	jalr	864(ra) # 80001530 <_Z9sem_closeP3sem>
}
    800061d8:	01813083          	ld	ra,24(sp)
    800061dc:	01013403          	ld	s0,16(sp)
    800061e0:	00813483          	ld	s1,8(sp)
    800061e4:	02010113          	addi	sp,sp,32
    800061e8:	00008067          	ret

00000000800061ec <start>:
    800061ec:	ff010113          	addi	sp,sp,-16
    800061f0:	00813423          	sd	s0,8(sp)
    800061f4:	01010413          	addi	s0,sp,16
    800061f8:	300027f3          	csrr	a5,mstatus
    800061fc:	ffffe737          	lui	a4,0xffffe
    80006200:	7ff70713          	addi	a4,a4,2047 # ffffffffffffe7ff <end+0xffffffff7fff1eaf>
    80006204:	00e7f7b3          	and	a5,a5,a4
    80006208:	00001737          	lui	a4,0x1
    8000620c:	80070713          	addi	a4,a4,-2048 # 800 <_entry-0x7ffff800>
    80006210:	00e7e7b3          	or	a5,a5,a4
    80006214:	30079073          	csrw	mstatus,a5
    80006218:	00000797          	auipc	a5,0x0
    8000621c:	16078793          	addi	a5,a5,352 # 80006378 <system_main>
    80006220:	34179073          	csrw	mepc,a5
    80006224:	00000793          	li	a5,0
    80006228:	18079073          	csrw	satp,a5
    8000622c:	000107b7          	lui	a5,0x10
    80006230:	fff78793          	addi	a5,a5,-1 # ffff <_entry-0x7fff0001>
    80006234:	30279073          	csrw	medeleg,a5
    80006238:	30379073          	csrw	mideleg,a5
    8000623c:	104027f3          	csrr	a5,sie
    80006240:	2227e793          	ori	a5,a5,546
    80006244:	10479073          	csrw	sie,a5
    80006248:	fff00793          	li	a5,-1
    8000624c:	00a7d793          	srli	a5,a5,0xa
    80006250:	3b079073          	csrw	pmpaddr0,a5
    80006254:	00f00793          	li	a5,15
    80006258:	3a079073          	csrw	pmpcfg0,a5
    8000625c:	f14027f3          	csrr	a5,mhartid
    80006260:	0200c737          	lui	a4,0x200c
    80006264:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006268:	0007869b          	sext.w	a3,a5
    8000626c:	00269713          	slli	a4,a3,0x2
    80006270:	000f4637          	lui	a2,0xf4
    80006274:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006278:	00d70733          	add	a4,a4,a3
    8000627c:	0037979b          	slliw	a5,a5,0x3
    80006280:	020046b7          	lui	a3,0x2004
    80006284:	00d787b3          	add	a5,a5,a3
    80006288:	00c585b3          	add	a1,a1,a2
    8000628c:	00371693          	slli	a3,a4,0x3
    80006290:	00005717          	auipc	a4,0x5
    80006294:	45070713          	addi	a4,a4,1104 # 8000b6e0 <timer_scratch>
    80006298:	00b7b023          	sd	a1,0(a5)
    8000629c:	00d70733          	add	a4,a4,a3
    800062a0:	00f73c23          	sd	a5,24(a4)
    800062a4:	02c73023          	sd	a2,32(a4)
    800062a8:	34071073          	csrw	mscratch,a4
    800062ac:	00000797          	auipc	a5,0x0
    800062b0:	6e478793          	addi	a5,a5,1764 # 80006990 <timervec>
    800062b4:	30579073          	csrw	mtvec,a5
    800062b8:	300027f3          	csrr	a5,mstatus
    800062bc:	0087e793          	ori	a5,a5,8
    800062c0:	30079073          	csrw	mstatus,a5
    800062c4:	304027f3          	csrr	a5,mie
    800062c8:	0807e793          	ori	a5,a5,128
    800062cc:	30479073          	csrw	mie,a5
    800062d0:	f14027f3          	csrr	a5,mhartid
    800062d4:	0007879b          	sext.w	a5,a5
    800062d8:	00078213          	mv	tp,a5
    800062dc:	30200073          	mret
    800062e0:	00813403          	ld	s0,8(sp)
    800062e4:	01010113          	addi	sp,sp,16
    800062e8:	00008067          	ret

00000000800062ec <timerinit>:
    800062ec:	ff010113          	addi	sp,sp,-16
    800062f0:	00813423          	sd	s0,8(sp)
    800062f4:	01010413          	addi	s0,sp,16
    800062f8:	f14027f3          	csrr	a5,mhartid
    800062fc:	0200c737          	lui	a4,0x200c
    80006300:	ff873583          	ld	a1,-8(a4) # 200bff8 <_entry-0x7dff4008>
    80006304:	0007869b          	sext.w	a3,a5
    80006308:	00269713          	slli	a4,a3,0x2
    8000630c:	000f4637          	lui	a2,0xf4
    80006310:	24060613          	addi	a2,a2,576 # f4240 <_entry-0x7ff0bdc0>
    80006314:	00d70733          	add	a4,a4,a3
    80006318:	0037979b          	slliw	a5,a5,0x3
    8000631c:	020046b7          	lui	a3,0x2004
    80006320:	00d787b3          	add	a5,a5,a3
    80006324:	00c585b3          	add	a1,a1,a2
    80006328:	00371693          	slli	a3,a4,0x3
    8000632c:	00005717          	auipc	a4,0x5
    80006330:	3b470713          	addi	a4,a4,948 # 8000b6e0 <timer_scratch>
    80006334:	00b7b023          	sd	a1,0(a5)
    80006338:	00d70733          	add	a4,a4,a3
    8000633c:	00f73c23          	sd	a5,24(a4)
    80006340:	02c73023          	sd	a2,32(a4)
    80006344:	34071073          	csrw	mscratch,a4
    80006348:	00000797          	auipc	a5,0x0
    8000634c:	64878793          	addi	a5,a5,1608 # 80006990 <timervec>
    80006350:	30579073          	csrw	mtvec,a5
    80006354:	300027f3          	csrr	a5,mstatus
    80006358:	0087e793          	ori	a5,a5,8
    8000635c:	30079073          	csrw	mstatus,a5
    80006360:	304027f3          	csrr	a5,mie
    80006364:	0807e793          	ori	a5,a5,128
    80006368:	30479073          	csrw	mie,a5
    8000636c:	00813403          	ld	s0,8(sp)
    80006370:	01010113          	addi	sp,sp,16
    80006374:	00008067          	ret

0000000080006378 <system_main>:
    80006378:	fe010113          	addi	sp,sp,-32
    8000637c:	00813823          	sd	s0,16(sp)
    80006380:	00913423          	sd	s1,8(sp)
    80006384:	00113c23          	sd	ra,24(sp)
    80006388:	02010413          	addi	s0,sp,32
    8000638c:	00000097          	auipc	ra,0x0
    80006390:	0c4080e7          	jalr	196(ra) # 80006450 <cpuid>
    80006394:	00005497          	auipc	s1,0x5
    80006398:	27c48493          	addi	s1,s1,636 # 8000b610 <started>
    8000639c:	02050263          	beqz	a0,800063c0 <system_main+0x48>
    800063a0:	0004a783          	lw	a5,0(s1)
    800063a4:	0007879b          	sext.w	a5,a5
    800063a8:	fe078ce3          	beqz	a5,800063a0 <system_main+0x28>
    800063ac:	0ff0000f          	fence
    800063b0:	00003517          	auipc	a0,0x3
    800063b4:	15850513          	addi	a0,a0,344 # 80009508 <kvmincrease+0xf18>
    800063b8:	00001097          	auipc	ra,0x1
    800063bc:	a74080e7          	jalr	-1420(ra) # 80006e2c <panic>
    800063c0:	00001097          	auipc	ra,0x1
    800063c4:	9c8080e7          	jalr	-1592(ra) # 80006d88 <consoleinit>
    800063c8:	00001097          	auipc	ra,0x1
    800063cc:	154080e7          	jalr	340(ra) # 8000751c <printfinit>
    800063d0:	00003517          	auipc	a0,0x3
    800063d4:	fc050513          	addi	a0,a0,-64 # 80009390 <kvmincrease+0xda0>
    800063d8:	00001097          	auipc	ra,0x1
    800063dc:	ab0080e7          	jalr	-1360(ra) # 80006e88 <__printf>
    800063e0:	00003517          	auipc	a0,0x3
    800063e4:	0f850513          	addi	a0,a0,248 # 800094d8 <kvmincrease+0xee8>
    800063e8:	00001097          	auipc	ra,0x1
    800063ec:	aa0080e7          	jalr	-1376(ra) # 80006e88 <__printf>
    800063f0:	00003517          	auipc	a0,0x3
    800063f4:	fa050513          	addi	a0,a0,-96 # 80009390 <kvmincrease+0xda0>
    800063f8:	00001097          	auipc	ra,0x1
    800063fc:	a90080e7          	jalr	-1392(ra) # 80006e88 <__printf>
    80006400:	00001097          	auipc	ra,0x1
    80006404:	4a8080e7          	jalr	1192(ra) # 800078a8 <kinit>
    80006408:	00000097          	auipc	ra,0x0
    8000640c:	148080e7          	jalr	328(ra) # 80006550 <trapinit>
    80006410:	00000097          	auipc	ra,0x0
    80006414:	16c080e7          	jalr	364(ra) # 8000657c <trapinithart>
    80006418:	00000097          	auipc	ra,0x0
    8000641c:	5b8080e7          	jalr	1464(ra) # 800069d0 <plicinit>
    80006420:	00000097          	auipc	ra,0x0
    80006424:	5d8080e7          	jalr	1496(ra) # 800069f8 <plicinithart>
    80006428:	00000097          	auipc	ra,0x0
    8000642c:	078080e7          	jalr	120(ra) # 800064a0 <userinit>
    80006430:	0ff0000f          	fence
    80006434:	00100793          	li	a5,1
    80006438:	00003517          	auipc	a0,0x3
    8000643c:	0b850513          	addi	a0,a0,184 # 800094f0 <kvmincrease+0xf00>
    80006440:	00f4a023          	sw	a5,0(s1)
    80006444:	00001097          	auipc	ra,0x1
    80006448:	a44080e7          	jalr	-1468(ra) # 80006e88 <__printf>
    8000644c:	0000006f          	j	8000644c <system_main+0xd4>

0000000080006450 <cpuid>:
    80006450:	ff010113          	addi	sp,sp,-16
    80006454:	00813423          	sd	s0,8(sp)
    80006458:	01010413          	addi	s0,sp,16
    8000645c:	00020513          	mv	a0,tp
    80006460:	00813403          	ld	s0,8(sp)
    80006464:	0005051b          	sext.w	a0,a0
    80006468:	01010113          	addi	sp,sp,16
    8000646c:	00008067          	ret

0000000080006470 <mycpu>:
    80006470:	ff010113          	addi	sp,sp,-16
    80006474:	00813423          	sd	s0,8(sp)
    80006478:	01010413          	addi	s0,sp,16
    8000647c:	00020793          	mv	a5,tp
    80006480:	00813403          	ld	s0,8(sp)
    80006484:	0007879b          	sext.w	a5,a5
    80006488:	00779793          	slli	a5,a5,0x7
    8000648c:	00006517          	auipc	a0,0x6
    80006490:	28450513          	addi	a0,a0,644 # 8000c710 <cpus>
    80006494:	00f50533          	add	a0,a0,a5
    80006498:	01010113          	addi	sp,sp,16
    8000649c:	00008067          	ret

00000000800064a0 <userinit>:
    800064a0:	ff010113          	addi	sp,sp,-16
    800064a4:	00813423          	sd	s0,8(sp)
    800064a8:	01010413          	addi	s0,sp,16
    800064ac:	00813403          	ld	s0,8(sp)
    800064b0:	01010113          	addi	sp,sp,16
    800064b4:	ffffb317          	auipc	t1,0xffffb
    800064b8:	24c30067          	jr	588(t1) # 80001700 <main>

00000000800064bc <either_copyout>:
    800064bc:	ff010113          	addi	sp,sp,-16
    800064c0:	00813023          	sd	s0,0(sp)
    800064c4:	00113423          	sd	ra,8(sp)
    800064c8:	01010413          	addi	s0,sp,16
    800064cc:	02051663          	bnez	a0,800064f8 <either_copyout+0x3c>
    800064d0:	00058513          	mv	a0,a1
    800064d4:	00060593          	mv	a1,a2
    800064d8:	0006861b          	sext.w	a2,a3
    800064dc:	00002097          	auipc	ra,0x2
    800064e0:	c58080e7          	jalr	-936(ra) # 80008134 <__memmove>
    800064e4:	00813083          	ld	ra,8(sp)
    800064e8:	00013403          	ld	s0,0(sp)
    800064ec:	00000513          	li	a0,0
    800064f0:	01010113          	addi	sp,sp,16
    800064f4:	00008067          	ret
    800064f8:	00003517          	auipc	a0,0x3
    800064fc:	03850513          	addi	a0,a0,56 # 80009530 <kvmincrease+0xf40>
    80006500:	00001097          	auipc	ra,0x1
    80006504:	92c080e7          	jalr	-1748(ra) # 80006e2c <panic>

0000000080006508 <either_copyin>:
    80006508:	ff010113          	addi	sp,sp,-16
    8000650c:	00813023          	sd	s0,0(sp)
    80006510:	00113423          	sd	ra,8(sp)
    80006514:	01010413          	addi	s0,sp,16
    80006518:	02059463          	bnez	a1,80006540 <either_copyin+0x38>
    8000651c:	00060593          	mv	a1,a2
    80006520:	0006861b          	sext.w	a2,a3
    80006524:	00002097          	auipc	ra,0x2
    80006528:	c10080e7          	jalr	-1008(ra) # 80008134 <__memmove>
    8000652c:	00813083          	ld	ra,8(sp)
    80006530:	00013403          	ld	s0,0(sp)
    80006534:	00000513          	li	a0,0
    80006538:	01010113          	addi	sp,sp,16
    8000653c:	00008067          	ret
    80006540:	00003517          	auipc	a0,0x3
    80006544:	01850513          	addi	a0,a0,24 # 80009558 <kvmincrease+0xf68>
    80006548:	00001097          	auipc	ra,0x1
    8000654c:	8e4080e7          	jalr	-1820(ra) # 80006e2c <panic>

0000000080006550 <trapinit>:
    80006550:	ff010113          	addi	sp,sp,-16
    80006554:	00813423          	sd	s0,8(sp)
    80006558:	01010413          	addi	s0,sp,16
    8000655c:	00813403          	ld	s0,8(sp)
    80006560:	00003597          	auipc	a1,0x3
    80006564:	02058593          	addi	a1,a1,32 # 80009580 <kvmincrease+0xf90>
    80006568:	00006517          	auipc	a0,0x6
    8000656c:	22850513          	addi	a0,a0,552 # 8000c790 <tickslock>
    80006570:	01010113          	addi	sp,sp,16
    80006574:	00001317          	auipc	t1,0x1
    80006578:	5c430067          	jr	1476(t1) # 80007b38 <initlock>

000000008000657c <trapinithart>:
    8000657c:	ff010113          	addi	sp,sp,-16
    80006580:	00813423          	sd	s0,8(sp)
    80006584:	01010413          	addi	s0,sp,16
    80006588:	00000797          	auipc	a5,0x0
    8000658c:	2f878793          	addi	a5,a5,760 # 80006880 <kernelvec>
    80006590:	10579073          	csrw	stvec,a5
    80006594:	00813403          	ld	s0,8(sp)
    80006598:	01010113          	addi	sp,sp,16
    8000659c:	00008067          	ret

00000000800065a0 <usertrap>:
    800065a0:	ff010113          	addi	sp,sp,-16
    800065a4:	00813423          	sd	s0,8(sp)
    800065a8:	01010413          	addi	s0,sp,16
    800065ac:	00813403          	ld	s0,8(sp)
    800065b0:	01010113          	addi	sp,sp,16
    800065b4:	00008067          	ret

00000000800065b8 <usertrapret>:
    800065b8:	ff010113          	addi	sp,sp,-16
    800065bc:	00813423          	sd	s0,8(sp)
    800065c0:	01010413          	addi	s0,sp,16
    800065c4:	00813403          	ld	s0,8(sp)
    800065c8:	01010113          	addi	sp,sp,16
    800065cc:	00008067          	ret

00000000800065d0 <kerneltrap>:
    800065d0:	fe010113          	addi	sp,sp,-32
    800065d4:	00813823          	sd	s0,16(sp)
    800065d8:	00113c23          	sd	ra,24(sp)
    800065dc:	00913423          	sd	s1,8(sp)
    800065e0:	02010413          	addi	s0,sp,32
    800065e4:	142025f3          	csrr	a1,scause
    800065e8:	100027f3          	csrr	a5,sstatus
    800065ec:	0027f793          	andi	a5,a5,2
    800065f0:	10079c63          	bnez	a5,80006708 <kerneltrap+0x138>
    800065f4:	142027f3          	csrr	a5,scause
    800065f8:	0207ce63          	bltz	a5,80006634 <kerneltrap+0x64>
    800065fc:	00003517          	auipc	a0,0x3
    80006600:	fcc50513          	addi	a0,a0,-52 # 800095c8 <kvmincrease+0xfd8>
    80006604:	00001097          	auipc	ra,0x1
    80006608:	884080e7          	jalr	-1916(ra) # 80006e88 <__printf>
    8000660c:	141025f3          	csrr	a1,sepc
    80006610:	14302673          	csrr	a2,stval
    80006614:	00003517          	auipc	a0,0x3
    80006618:	fc450513          	addi	a0,a0,-60 # 800095d8 <kvmincrease+0xfe8>
    8000661c:	00001097          	auipc	ra,0x1
    80006620:	86c080e7          	jalr	-1940(ra) # 80006e88 <__printf>
    80006624:	00003517          	auipc	a0,0x3
    80006628:	fcc50513          	addi	a0,a0,-52 # 800095f0 <kvmincrease+0x1000>
    8000662c:	00001097          	auipc	ra,0x1
    80006630:	800080e7          	jalr	-2048(ra) # 80006e2c <panic>
    80006634:	0ff7f713          	andi	a4,a5,255
    80006638:	00900693          	li	a3,9
    8000663c:	04d70063          	beq	a4,a3,8000667c <kerneltrap+0xac>
    80006640:	fff00713          	li	a4,-1
    80006644:	03f71713          	slli	a4,a4,0x3f
    80006648:	00170713          	addi	a4,a4,1
    8000664c:	fae798e3          	bne	a5,a4,800065fc <kerneltrap+0x2c>
    80006650:	00000097          	auipc	ra,0x0
    80006654:	e00080e7          	jalr	-512(ra) # 80006450 <cpuid>
    80006658:	06050663          	beqz	a0,800066c4 <kerneltrap+0xf4>
    8000665c:	144027f3          	csrr	a5,sip
    80006660:	ffd7f793          	andi	a5,a5,-3
    80006664:	14479073          	csrw	sip,a5
    80006668:	01813083          	ld	ra,24(sp)
    8000666c:	01013403          	ld	s0,16(sp)
    80006670:	00813483          	ld	s1,8(sp)
    80006674:	02010113          	addi	sp,sp,32
    80006678:	00008067          	ret
    8000667c:	00000097          	auipc	ra,0x0
    80006680:	3c8080e7          	jalr	968(ra) # 80006a44 <plic_claim>
    80006684:	00a00793          	li	a5,10
    80006688:	00050493          	mv	s1,a0
    8000668c:	06f50863          	beq	a0,a5,800066fc <kerneltrap+0x12c>
    80006690:	fc050ce3          	beqz	a0,80006668 <kerneltrap+0x98>
    80006694:	00050593          	mv	a1,a0
    80006698:	00003517          	auipc	a0,0x3
    8000669c:	f1050513          	addi	a0,a0,-240 # 800095a8 <kvmincrease+0xfb8>
    800066a0:	00000097          	auipc	ra,0x0
    800066a4:	7e8080e7          	jalr	2024(ra) # 80006e88 <__printf>
    800066a8:	01013403          	ld	s0,16(sp)
    800066ac:	01813083          	ld	ra,24(sp)
    800066b0:	00048513          	mv	a0,s1
    800066b4:	00813483          	ld	s1,8(sp)
    800066b8:	02010113          	addi	sp,sp,32
    800066bc:	00000317          	auipc	t1,0x0
    800066c0:	3c030067          	jr	960(t1) # 80006a7c <plic_complete>
    800066c4:	00006517          	auipc	a0,0x6
    800066c8:	0cc50513          	addi	a0,a0,204 # 8000c790 <tickslock>
    800066cc:	00001097          	auipc	ra,0x1
    800066d0:	490080e7          	jalr	1168(ra) # 80007b5c <acquire>
    800066d4:	00005717          	auipc	a4,0x5
    800066d8:	f4070713          	addi	a4,a4,-192 # 8000b614 <ticks>
    800066dc:	00072783          	lw	a5,0(a4)
    800066e0:	00006517          	auipc	a0,0x6
    800066e4:	0b050513          	addi	a0,a0,176 # 8000c790 <tickslock>
    800066e8:	0017879b          	addiw	a5,a5,1
    800066ec:	00f72023          	sw	a5,0(a4)
    800066f0:	00001097          	auipc	ra,0x1
    800066f4:	538080e7          	jalr	1336(ra) # 80007c28 <release>
    800066f8:	f65ff06f          	j	8000665c <kerneltrap+0x8c>
    800066fc:	00001097          	auipc	ra,0x1
    80006700:	094080e7          	jalr	148(ra) # 80007790 <uartintr>
    80006704:	fa5ff06f          	j	800066a8 <kerneltrap+0xd8>
    80006708:	00003517          	auipc	a0,0x3
    8000670c:	e8050513          	addi	a0,a0,-384 # 80009588 <kvmincrease+0xf98>
    80006710:	00000097          	auipc	ra,0x0
    80006714:	71c080e7          	jalr	1820(ra) # 80006e2c <panic>

0000000080006718 <clockintr>:
    80006718:	fe010113          	addi	sp,sp,-32
    8000671c:	00813823          	sd	s0,16(sp)
    80006720:	00913423          	sd	s1,8(sp)
    80006724:	00113c23          	sd	ra,24(sp)
    80006728:	02010413          	addi	s0,sp,32
    8000672c:	00006497          	auipc	s1,0x6
    80006730:	06448493          	addi	s1,s1,100 # 8000c790 <tickslock>
    80006734:	00048513          	mv	a0,s1
    80006738:	00001097          	auipc	ra,0x1
    8000673c:	424080e7          	jalr	1060(ra) # 80007b5c <acquire>
    80006740:	00005717          	auipc	a4,0x5
    80006744:	ed470713          	addi	a4,a4,-300 # 8000b614 <ticks>
    80006748:	00072783          	lw	a5,0(a4)
    8000674c:	01013403          	ld	s0,16(sp)
    80006750:	01813083          	ld	ra,24(sp)
    80006754:	00048513          	mv	a0,s1
    80006758:	0017879b          	addiw	a5,a5,1
    8000675c:	00813483          	ld	s1,8(sp)
    80006760:	00f72023          	sw	a5,0(a4)
    80006764:	02010113          	addi	sp,sp,32
    80006768:	00001317          	auipc	t1,0x1
    8000676c:	4c030067          	jr	1216(t1) # 80007c28 <release>

0000000080006770 <devintr>:
    80006770:	142027f3          	csrr	a5,scause
    80006774:	00000513          	li	a0,0
    80006778:	0007c463          	bltz	a5,80006780 <devintr+0x10>
    8000677c:	00008067          	ret
    80006780:	fe010113          	addi	sp,sp,-32
    80006784:	00813823          	sd	s0,16(sp)
    80006788:	00113c23          	sd	ra,24(sp)
    8000678c:	00913423          	sd	s1,8(sp)
    80006790:	02010413          	addi	s0,sp,32
    80006794:	0ff7f713          	andi	a4,a5,255
    80006798:	00900693          	li	a3,9
    8000679c:	04d70c63          	beq	a4,a3,800067f4 <devintr+0x84>
    800067a0:	fff00713          	li	a4,-1
    800067a4:	03f71713          	slli	a4,a4,0x3f
    800067a8:	00170713          	addi	a4,a4,1
    800067ac:	00e78c63          	beq	a5,a4,800067c4 <devintr+0x54>
    800067b0:	01813083          	ld	ra,24(sp)
    800067b4:	01013403          	ld	s0,16(sp)
    800067b8:	00813483          	ld	s1,8(sp)
    800067bc:	02010113          	addi	sp,sp,32
    800067c0:	00008067          	ret
    800067c4:	00000097          	auipc	ra,0x0
    800067c8:	c8c080e7          	jalr	-884(ra) # 80006450 <cpuid>
    800067cc:	06050663          	beqz	a0,80006838 <devintr+0xc8>
    800067d0:	144027f3          	csrr	a5,sip
    800067d4:	ffd7f793          	andi	a5,a5,-3
    800067d8:	14479073          	csrw	sip,a5
    800067dc:	01813083          	ld	ra,24(sp)
    800067e0:	01013403          	ld	s0,16(sp)
    800067e4:	00813483          	ld	s1,8(sp)
    800067e8:	00200513          	li	a0,2
    800067ec:	02010113          	addi	sp,sp,32
    800067f0:	00008067          	ret
    800067f4:	00000097          	auipc	ra,0x0
    800067f8:	250080e7          	jalr	592(ra) # 80006a44 <plic_claim>
    800067fc:	00a00793          	li	a5,10
    80006800:	00050493          	mv	s1,a0
    80006804:	06f50663          	beq	a0,a5,80006870 <devintr+0x100>
    80006808:	00100513          	li	a0,1
    8000680c:	fa0482e3          	beqz	s1,800067b0 <devintr+0x40>
    80006810:	00048593          	mv	a1,s1
    80006814:	00003517          	auipc	a0,0x3
    80006818:	d9450513          	addi	a0,a0,-620 # 800095a8 <kvmincrease+0xfb8>
    8000681c:	00000097          	auipc	ra,0x0
    80006820:	66c080e7          	jalr	1644(ra) # 80006e88 <__printf>
    80006824:	00048513          	mv	a0,s1
    80006828:	00000097          	auipc	ra,0x0
    8000682c:	254080e7          	jalr	596(ra) # 80006a7c <plic_complete>
    80006830:	00100513          	li	a0,1
    80006834:	f7dff06f          	j	800067b0 <devintr+0x40>
    80006838:	00006517          	auipc	a0,0x6
    8000683c:	f5850513          	addi	a0,a0,-168 # 8000c790 <tickslock>
    80006840:	00001097          	auipc	ra,0x1
    80006844:	31c080e7          	jalr	796(ra) # 80007b5c <acquire>
    80006848:	00005717          	auipc	a4,0x5
    8000684c:	dcc70713          	addi	a4,a4,-564 # 8000b614 <ticks>
    80006850:	00072783          	lw	a5,0(a4)
    80006854:	00006517          	auipc	a0,0x6
    80006858:	f3c50513          	addi	a0,a0,-196 # 8000c790 <tickslock>
    8000685c:	0017879b          	addiw	a5,a5,1
    80006860:	00f72023          	sw	a5,0(a4)
    80006864:	00001097          	auipc	ra,0x1
    80006868:	3c4080e7          	jalr	964(ra) # 80007c28 <release>
    8000686c:	f65ff06f          	j	800067d0 <devintr+0x60>
    80006870:	00001097          	auipc	ra,0x1
    80006874:	f20080e7          	jalr	-224(ra) # 80007790 <uartintr>
    80006878:	fadff06f          	j	80006824 <devintr+0xb4>
    8000687c:	0000                	unimp
	...

0000000080006880 <kernelvec>:
    80006880:	f0010113          	addi	sp,sp,-256
    80006884:	00113023          	sd	ra,0(sp)
    80006888:	00213423          	sd	sp,8(sp)
    8000688c:	00313823          	sd	gp,16(sp)
    80006890:	00413c23          	sd	tp,24(sp)
    80006894:	02513023          	sd	t0,32(sp)
    80006898:	02613423          	sd	t1,40(sp)
    8000689c:	02713823          	sd	t2,48(sp)
    800068a0:	02813c23          	sd	s0,56(sp)
    800068a4:	04913023          	sd	s1,64(sp)
    800068a8:	04a13423          	sd	a0,72(sp)
    800068ac:	04b13823          	sd	a1,80(sp)
    800068b0:	04c13c23          	sd	a2,88(sp)
    800068b4:	06d13023          	sd	a3,96(sp)
    800068b8:	06e13423          	sd	a4,104(sp)
    800068bc:	06f13823          	sd	a5,112(sp)
    800068c0:	07013c23          	sd	a6,120(sp)
    800068c4:	09113023          	sd	a7,128(sp)
    800068c8:	09213423          	sd	s2,136(sp)
    800068cc:	09313823          	sd	s3,144(sp)
    800068d0:	09413c23          	sd	s4,152(sp)
    800068d4:	0b513023          	sd	s5,160(sp)
    800068d8:	0b613423          	sd	s6,168(sp)
    800068dc:	0b713823          	sd	s7,176(sp)
    800068e0:	0b813c23          	sd	s8,184(sp)
    800068e4:	0d913023          	sd	s9,192(sp)
    800068e8:	0da13423          	sd	s10,200(sp)
    800068ec:	0db13823          	sd	s11,208(sp)
    800068f0:	0dc13c23          	sd	t3,216(sp)
    800068f4:	0fd13023          	sd	t4,224(sp)
    800068f8:	0fe13423          	sd	t5,232(sp)
    800068fc:	0ff13823          	sd	t6,240(sp)
    80006900:	cd1ff0ef          	jal	ra,800065d0 <kerneltrap>
    80006904:	00013083          	ld	ra,0(sp)
    80006908:	00813103          	ld	sp,8(sp)
    8000690c:	01013183          	ld	gp,16(sp)
    80006910:	02013283          	ld	t0,32(sp)
    80006914:	02813303          	ld	t1,40(sp)
    80006918:	03013383          	ld	t2,48(sp)
    8000691c:	03813403          	ld	s0,56(sp)
    80006920:	04013483          	ld	s1,64(sp)
    80006924:	04813503          	ld	a0,72(sp)
    80006928:	05013583          	ld	a1,80(sp)
    8000692c:	05813603          	ld	a2,88(sp)
    80006930:	06013683          	ld	a3,96(sp)
    80006934:	06813703          	ld	a4,104(sp)
    80006938:	07013783          	ld	a5,112(sp)
    8000693c:	07813803          	ld	a6,120(sp)
    80006940:	08013883          	ld	a7,128(sp)
    80006944:	08813903          	ld	s2,136(sp)
    80006948:	09013983          	ld	s3,144(sp)
    8000694c:	09813a03          	ld	s4,152(sp)
    80006950:	0a013a83          	ld	s5,160(sp)
    80006954:	0a813b03          	ld	s6,168(sp)
    80006958:	0b013b83          	ld	s7,176(sp)
    8000695c:	0b813c03          	ld	s8,184(sp)
    80006960:	0c013c83          	ld	s9,192(sp)
    80006964:	0c813d03          	ld	s10,200(sp)
    80006968:	0d013d83          	ld	s11,208(sp)
    8000696c:	0d813e03          	ld	t3,216(sp)
    80006970:	0e013e83          	ld	t4,224(sp)
    80006974:	0e813f03          	ld	t5,232(sp)
    80006978:	0f013f83          	ld	t6,240(sp)
    8000697c:	10010113          	addi	sp,sp,256
    80006980:	10200073          	sret
    80006984:	00000013          	nop
    80006988:	00000013          	nop
    8000698c:	00000013          	nop

0000000080006990 <timervec>:
    80006990:	34051573          	csrrw	a0,mscratch,a0
    80006994:	00b53023          	sd	a1,0(a0)
    80006998:	00c53423          	sd	a2,8(a0)
    8000699c:	00d53823          	sd	a3,16(a0)
    800069a0:	01853583          	ld	a1,24(a0)
    800069a4:	02053603          	ld	a2,32(a0)
    800069a8:	0005b683          	ld	a3,0(a1)
    800069ac:	00c686b3          	add	a3,a3,a2
    800069b0:	00d5b023          	sd	a3,0(a1)
    800069b4:	00200593          	li	a1,2
    800069b8:	14459073          	csrw	sip,a1
    800069bc:	01053683          	ld	a3,16(a0)
    800069c0:	00853603          	ld	a2,8(a0)
    800069c4:	00053583          	ld	a1,0(a0)
    800069c8:	34051573          	csrrw	a0,mscratch,a0
    800069cc:	30200073          	mret

00000000800069d0 <plicinit>:
    800069d0:	ff010113          	addi	sp,sp,-16
    800069d4:	00813423          	sd	s0,8(sp)
    800069d8:	01010413          	addi	s0,sp,16
    800069dc:	00813403          	ld	s0,8(sp)
    800069e0:	0c0007b7          	lui	a5,0xc000
    800069e4:	00100713          	li	a4,1
    800069e8:	02e7a423          	sw	a4,40(a5) # c000028 <_entry-0x73ffffd8>
    800069ec:	00e7a223          	sw	a4,4(a5)
    800069f0:	01010113          	addi	sp,sp,16
    800069f4:	00008067          	ret

00000000800069f8 <plicinithart>:
    800069f8:	ff010113          	addi	sp,sp,-16
    800069fc:	00813023          	sd	s0,0(sp)
    80006a00:	00113423          	sd	ra,8(sp)
    80006a04:	01010413          	addi	s0,sp,16
    80006a08:	00000097          	auipc	ra,0x0
    80006a0c:	a48080e7          	jalr	-1464(ra) # 80006450 <cpuid>
    80006a10:	0085171b          	slliw	a4,a0,0x8
    80006a14:	0c0027b7          	lui	a5,0xc002
    80006a18:	00e787b3          	add	a5,a5,a4
    80006a1c:	40200713          	li	a4,1026
    80006a20:	08e7a023          	sw	a4,128(a5) # c002080 <_entry-0x73ffdf80>
    80006a24:	00813083          	ld	ra,8(sp)
    80006a28:	00013403          	ld	s0,0(sp)
    80006a2c:	00d5151b          	slliw	a0,a0,0xd
    80006a30:	0c2017b7          	lui	a5,0xc201
    80006a34:	00a78533          	add	a0,a5,a0
    80006a38:	00052023          	sw	zero,0(a0)
    80006a3c:	01010113          	addi	sp,sp,16
    80006a40:	00008067          	ret

0000000080006a44 <plic_claim>:
    80006a44:	ff010113          	addi	sp,sp,-16
    80006a48:	00813023          	sd	s0,0(sp)
    80006a4c:	00113423          	sd	ra,8(sp)
    80006a50:	01010413          	addi	s0,sp,16
    80006a54:	00000097          	auipc	ra,0x0
    80006a58:	9fc080e7          	jalr	-1540(ra) # 80006450 <cpuid>
    80006a5c:	00813083          	ld	ra,8(sp)
    80006a60:	00013403          	ld	s0,0(sp)
    80006a64:	00d5151b          	slliw	a0,a0,0xd
    80006a68:	0c2017b7          	lui	a5,0xc201
    80006a6c:	00a78533          	add	a0,a5,a0
    80006a70:	00452503          	lw	a0,4(a0)
    80006a74:	01010113          	addi	sp,sp,16
    80006a78:	00008067          	ret

0000000080006a7c <plic_complete>:
    80006a7c:	fe010113          	addi	sp,sp,-32
    80006a80:	00813823          	sd	s0,16(sp)
    80006a84:	00913423          	sd	s1,8(sp)
    80006a88:	00113c23          	sd	ra,24(sp)
    80006a8c:	02010413          	addi	s0,sp,32
    80006a90:	00050493          	mv	s1,a0
    80006a94:	00000097          	auipc	ra,0x0
    80006a98:	9bc080e7          	jalr	-1604(ra) # 80006450 <cpuid>
    80006a9c:	01813083          	ld	ra,24(sp)
    80006aa0:	01013403          	ld	s0,16(sp)
    80006aa4:	00d5179b          	slliw	a5,a0,0xd
    80006aa8:	0c201737          	lui	a4,0xc201
    80006aac:	00f707b3          	add	a5,a4,a5
    80006ab0:	0097a223          	sw	s1,4(a5) # c201004 <_entry-0x73dfeffc>
    80006ab4:	00813483          	ld	s1,8(sp)
    80006ab8:	02010113          	addi	sp,sp,32
    80006abc:	00008067          	ret

0000000080006ac0 <consolewrite>:
    80006ac0:	fb010113          	addi	sp,sp,-80
    80006ac4:	04813023          	sd	s0,64(sp)
    80006ac8:	04113423          	sd	ra,72(sp)
    80006acc:	02913c23          	sd	s1,56(sp)
    80006ad0:	03213823          	sd	s2,48(sp)
    80006ad4:	03313423          	sd	s3,40(sp)
    80006ad8:	03413023          	sd	s4,32(sp)
    80006adc:	01513c23          	sd	s5,24(sp)
    80006ae0:	05010413          	addi	s0,sp,80
    80006ae4:	06c05c63          	blez	a2,80006b5c <consolewrite+0x9c>
    80006ae8:	00060993          	mv	s3,a2
    80006aec:	00050a13          	mv	s4,a0
    80006af0:	00058493          	mv	s1,a1
    80006af4:	00000913          	li	s2,0
    80006af8:	fff00a93          	li	s5,-1
    80006afc:	01c0006f          	j	80006b18 <consolewrite+0x58>
    80006b00:	fbf44503          	lbu	a0,-65(s0)
    80006b04:	0019091b          	addiw	s2,s2,1
    80006b08:	00148493          	addi	s1,s1,1
    80006b0c:	00001097          	auipc	ra,0x1
    80006b10:	a9c080e7          	jalr	-1380(ra) # 800075a8 <uartputc>
    80006b14:	03298063          	beq	s3,s2,80006b34 <consolewrite+0x74>
    80006b18:	00048613          	mv	a2,s1
    80006b1c:	00100693          	li	a3,1
    80006b20:	000a0593          	mv	a1,s4
    80006b24:	fbf40513          	addi	a0,s0,-65
    80006b28:	00000097          	auipc	ra,0x0
    80006b2c:	9e0080e7          	jalr	-1568(ra) # 80006508 <either_copyin>
    80006b30:	fd5518e3          	bne	a0,s5,80006b00 <consolewrite+0x40>
    80006b34:	04813083          	ld	ra,72(sp)
    80006b38:	04013403          	ld	s0,64(sp)
    80006b3c:	03813483          	ld	s1,56(sp)
    80006b40:	02813983          	ld	s3,40(sp)
    80006b44:	02013a03          	ld	s4,32(sp)
    80006b48:	01813a83          	ld	s5,24(sp)
    80006b4c:	00090513          	mv	a0,s2
    80006b50:	03013903          	ld	s2,48(sp)
    80006b54:	05010113          	addi	sp,sp,80
    80006b58:	00008067          	ret
    80006b5c:	00000913          	li	s2,0
    80006b60:	fd5ff06f          	j	80006b34 <consolewrite+0x74>

0000000080006b64 <consoleread>:
    80006b64:	f9010113          	addi	sp,sp,-112
    80006b68:	06813023          	sd	s0,96(sp)
    80006b6c:	04913c23          	sd	s1,88(sp)
    80006b70:	05213823          	sd	s2,80(sp)
    80006b74:	05313423          	sd	s3,72(sp)
    80006b78:	05413023          	sd	s4,64(sp)
    80006b7c:	03513c23          	sd	s5,56(sp)
    80006b80:	03613823          	sd	s6,48(sp)
    80006b84:	03713423          	sd	s7,40(sp)
    80006b88:	03813023          	sd	s8,32(sp)
    80006b8c:	06113423          	sd	ra,104(sp)
    80006b90:	01913c23          	sd	s9,24(sp)
    80006b94:	07010413          	addi	s0,sp,112
    80006b98:	00060b93          	mv	s7,a2
    80006b9c:	00050913          	mv	s2,a0
    80006ba0:	00058c13          	mv	s8,a1
    80006ba4:	00060b1b          	sext.w	s6,a2
    80006ba8:	00006497          	auipc	s1,0x6
    80006bac:	c1048493          	addi	s1,s1,-1008 # 8000c7b8 <cons>
    80006bb0:	00400993          	li	s3,4
    80006bb4:	fff00a13          	li	s4,-1
    80006bb8:	00a00a93          	li	s5,10
    80006bbc:	05705e63          	blez	s7,80006c18 <consoleread+0xb4>
    80006bc0:	09c4a703          	lw	a4,156(s1)
    80006bc4:	0984a783          	lw	a5,152(s1)
    80006bc8:	0007071b          	sext.w	a4,a4
    80006bcc:	08e78463          	beq	a5,a4,80006c54 <consoleread+0xf0>
    80006bd0:	07f7f713          	andi	a4,a5,127
    80006bd4:	00e48733          	add	a4,s1,a4
    80006bd8:	01874703          	lbu	a4,24(a4) # c201018 <_entry-0x73dfefe8>
    80006bdc:	0017869b          	addiw	a3,a5,1
    80006be0:	08d4ac23          	sw	a3,152(s1)
    80006be4:	00070c9b          	sext.w	s9,a4
    80006be8:	0b370663          	beq	a4,s3,80006c94 <consoleread+0x130>
    80006bec:	00100693          	li	a3,1
    80006bf0:	f9f40613          	addi	a2,s0,-97
    80006bf4:	000c0593          	mv	a1,s8
    80006bf8:	00090513          	mv	a0,s2
    80006bfc:	f8e40fa3          	sb	a4,-97(s0)
    80006c00:	00000097          	auipc	ra,0x0
    80006c04:	8bc080e7          	jalr	-1860(ra) # 800064bc <either_copyout>
    80006c08:	01450863          	beq	a0,s4,80006c18 <consoleread+0xb4>
    80006c0c:	001c0c13          	addi	s8,s8,1
    80006c10:	fffb8b9b          	addiw	s7,s7,-1
    80006c14:	fb5c94e3          	bne	s9,s5,80006bbc <consoleread+0x58>
    80006c18:	000b851b          	sext.w	a0,s7
    80006c1c:	06813083          	ld	ra,104(sp)
    80006c20:	06013403          	ld	s0,96(sp)
    80006c24:	05813483          	ld	s1,88(sp)
    80006c28:	05013903          	ld	s2,80(sp)
    80006c2c:	04813983          	ld	s3,72(sp)
    80006c30:	04013a03          	ld	s4,64(sp)
    80006c34:	03813a83          	ld	s5,56(sp)
    80006c38:	02813b83          	ld	s7,40(sp)
    80006c3c:	02013c03          	ld	s8,32(sp)
    80006c40:	01813c83          	ld	s9,24(sp)
    80006c44:	40ab053b          	subw	a0,s6,a0
    80006c48:	03013b03          	ld	s6,48(sp)
    80006c4c:	07010113          	addi	sp,sp,112
    80006c50:	00008067          	ret
    80006c54:	00001097          	auipc	ra,0x1
    80006c58:	1d8080e7          	jalr	472(ra) # 80007e2c <push_on>
    80006c5c:	0984a703          	lw	a4,152(s1)
    80006c60:	09c4a783          	lw	a5,156(s1)
    80006c64:	0007879b          	sext.w	a5,a5
    80006c68:	fef70ce3          	beq	a4,a5,80006c60 <consoleread+0xfc>
    80006c6c:	00001097          	auipc	ra,0x1
    80006c70:	234080e7          	jalr	564(ra) # 80007ea0 <pop_on>
    80006c74:	0984a783          	lw	a5,152(s1)
    80006c78:	07f7f713          	andi	a4,a5,127
    80006c7c:	00e48733          	add	a4,s1,a4
    80006c80:	01874703          	lbu	a4,24(a4)
    80006c84:	0017869b          	addiw	a3,a5,1
    80006c88:	08d4ac23          	sw	a3,152(s1)
    80006c8c:	00070c9b          	sext.w	s9,a4
    80006c90:	f5371ee3          	bne	a4,s3,80006bec <consoleread+0x88>
    80006c94:	000b851b          	sext.w	a0,s7
    80006c98:	f96bf2e3          	bgeu	s7,s6,80006c1c <consoleread+0xb8>
    80006c9c:	08f4ac23          	sw	a5,152(s1)
    80006ca0:	f7dff06f          	j	80006c1c <consoleread+0xb8>

0000000080006ca4 <consputc>:
    80006ca4:	10000793          	li	a5,256
    80006ca8:	00f50663          	beq	a0,a5,80006cb4 <consputc+0x10>
    80006cac:	00001317          	auipc	t1,0x1
    80006cb0:	9f430067          	jr	-1548(t1) # 800076a0 <uartputc_sync>
    80006cb4:	ff010113          	addi	sp,sp,-16
    80006cb8:	00113423          	sd	ra,8(sp)
    80006cbc:	00813023          	sd	s0,0(sp)
    80006cc0:	01010413          	addi	s0,sp,16
    80006cc4:	00800513          	li	a0,8
    80006cc8:	00001097          	auipc	ra,0x1
    80006ccc:	9d8080e7          	jalr	-1576(ra) # 800076a0 <uartputc_sync>
    80006cd0:	02000513          	li	a0,32
    80006cd4:	00001097          	auipc	ra,0x1
    80006cd8:	9cc080e7          	jalr	-1588(ra) # 800076a0 <uartputc_sync>
    80006cdc:	00013403          	ld	s0,0(sp)
    80006ce0:	00813083          	ld	ra,8(sp)
    80006ce4:	00800513          	li	a0,8
    80006ce8:	01010113          	addi	sp,sp,16
    80006cec:	00001317          	auipc	t1,0x1
    80006cf0:	9b430067          	jr	-1612(t1) # 800076a0 <uartputc_sync>

0000000080006cf4 <consoleintr>:
    80006cf4:	fe010113          	addi	sp,sp,-32
    80006cf8:	00813823          	sd	s0,16(sp)
    80006cfc:	00913423          	sd	s1,8(sp)
    80006d00:	01213023          	sd	s2,0(sp)
    80006d04:	00113c23          	sd	ra,24(sp)
    80006d08:	02010413          	addi	s0,sp,32
    80006d0c:	00006917          	auipc	s2,0x6
    80006d10:	aac90913          	addi	s2,s2,-1364 # 8000c7b8 <cons>
    80006d14:	00050493          	mv	s1,a0
    80006d18:	00090513          	mv	a0,s2
    80006d1c:	00001097          	auipc	ra,0x1
    80006d20:	e40080e7          	jalr	-448(ra) # 80007b5c <acquire>
    80006d24:	02048c63          	beqz	s1,80006d5c <consoleintr+0x68>
    80006d28:	0a092783          	lw	a5,160(s2)
    80006d2c:	09892703          	lw	a4,152(s2)
    80006d30:	07f00693          	li	a3,127
    80006d34:	40e7873b          	subw	a4,a5,a4
    80006d38:	02e6e263          	bltu	a3,a4,80006d5c <consoleintr+0x68>
    80006d3c:	00d00713          	li	a4,13
    80006d40:	04e48063          	beq	s1,a4,80006d80 <consoleintr+0x8c>
    80006d44:	07f7f713          	andi	a4,a5,127
    80006d48:	00e90733          	add	a4,s2,a4
    80006d4c:	0017879b          	addiw	a5,a5,1
    80006d50:	0af92023          	sw	a5,160(s2)
    80006d54:	00970c23          	sb	s1,24(a4)
    80006d58:	08f92e23          	sw	a5,156(s2)
    80006d5c:	01013403          	ld	s0,16(sp)
    80006d60:	01813083          	ld	ra,24(sp)
    80006d64:	00813483          	ld	s1,8(sp)
    80006d68:	00013903          	ld	s2,0(sp)
    80006d6c:	00006517          	auipc	a0,0x6
    80006d70:	a4c50513          	addi	a0,a0,-1460 # 8000c7b8 <cons>
    80006d74:	02010113          	addi	sp,sp,32
    80006d78:	00001317          	auipc	t1,0x1
    80006d7c:	eb030067          	jr	-336(t1) # 80007c28 <release>
    80006d80:	00a00493          	li	s1,10
    80006d84:	fc1ff06f          	j	80006d44 <consoleintr+0x50>

0000000080006d88 <consoleinit>:
    80006d88:	fe010113          	addi	sp,sp,-32
    80006d8c:	00113c23          	sd	ra,24(sp)
    80006d90:	00813823          	sd	s0,16(sp)
    80006d94:	00913423          	sd	s1,8(sp)
    80006d98:	02010413          	addi	s0,sp,32
    80006d9c:	00006497          	auipc	s1,0x6
    80006da0:	a1c48493          	addi	s1,s1,-1508 # 8000c7b8 <cons>
    80006da4:	00048513          	mv	a0,s1
    80006da8:	00003597          	auipc	a1,0x3
    80006dac:	85858593          	addi	a1,a1,-1960 # 80009600 <kvmincrease+0x1010>
    80006db0:	00001097          	auipc	ra,0x1
    80006db4:	d88080e7          	jalr	-632(ra) # 80007b38 <initlock>
    80006db8:	00000097          	auipc	ra,0x0
    80006dbc:	7ac080e7          	jalr	1964(ra) # 80007564 <uartinit>
    80006dc0:	01813083          	ld	ra,24(sp)
    80006dc4:	01013403          	ld	s0,16(sp)
    80006dc8:	00000797          	auipc	a5,0x0
    80006dcc:	d9c78793          	addi	a5,a5,-612 # 80006b64 <consoleread>
    80006dd0:	0af4bc23          	sd	a5,184(s1)
    80006dd4:	00000797          	auipc	a5,0x0
    80006dd8:	cec78793          	addi	a5,a5,-788 # 80006ac0 <consolewrite>
    80006ddc:	0cf4b023          	sd	a5,192(s1)
    80006de0:	00813483          	ld	s1,8(sp)
    80006de4:	02010113          	addi	sp,sp,32
    80006de8:	00008067          	ret

0000000080006dec <console_read>:
    80006dec:	ff010113          	addi	sp,sp,-16
    80006df0:	00813423          	sd	s0,8(sp)
    80006df4:	01010413          	addi	s0,sp,16
    80006df8:	00813403          	ld	s0,8(sp)
    80006dfc:	00006317          	auipc	t1,0x6
    80006e00:	a7433303          	ld	t1,-1420(t1) # 8000c870 <devsw+0x10>
    80006e04:	01010113          	addi	sp,sp,16
    80006e08:	00030067          	jr	t1

0000000080006e0c <console_write>:
    80006e0c:	ff010113          	addi	sp,sp,-16
    80006e10:	00813423          	sd	s0,8(sp)
    80006e14:	01010413          	addi	s0,sp,16
    80006e18:	00813403          	ld	s0,8(sp)
    80006e1c:	00006317          	auipc	t1,0x6
    80006e20:	a5c33303          	ld	t1,-1444(t1) # 8000c878 <devsw+0x18>
    80006e24:	01010113          	addi	sp,sp,16
    80006e28:	00030067          	jr	t1

0000000080006e2c <panic>:
    80006e2c:	fe010113          	addi	sp,sp,-32
    80006e30:	00113c23          	sd	ra,24(sp)
    80006e34:	00813823          	sd	s0,16(sp)
    80006e38:	00913423          	sd	s1,8(sp)
    80006e3c:	02010413          	addi	s0,sp,32
    80006e40:	00050493          	mv	s1,a0
    80006e44:	00002517          	auipc	a0,0x2
    80006e48:	7c450513          	addi	a0,a0,1988 # 80009608 <kvmincrease+0x1018>
    80006e4c:	00006797          	auipc	a5,0x6
    80006e50:	ac07a623          	sw	zero,-1332(a5) # 8000c918 <pr+0x18>
    80006e54:	00000097          	auipc	ra,0x0
    80006e58:	034080e7          	jalr	52(ra) # 80006e88 <__printf>
    80006e5c:	00048513          	mv	a0,s1
    80006e60:	00000097          	auipc	ra,0x0
    80006e64:	028080e7          	jalr	40(ra) # 80006e88 <__printf>
    80006e68:	00002517          	auipc	a0,0x2
    80006e6c:	52850513          	addi	a0,a0,1320 # 80009390 <kvmincrease+0xda0>
    80006e70:	00000097          	auipc	ra,0x0
    80006e74:	018080e7          	jalr	24(ra) # 80006e88 <__printf>
    80006e78:	00100793          	li	a5,1
    80006e7c:	00004717          	auipc	a4,0x4
    80006e80:	78f72e23          	sw	a5,1948(a4) # 8000b618 <panicked>
    80006e84:	0000006f          	j	80006e84 <panic+0x58>

0000000080006e88 <__printf>:
    80006e88:	f3010113          	addi	sp,sp,-208
    80006e8c:	08813023          	sd	s0,128(sp)
    80006e90:	07313423          	sd	s3,104(sp)
    80006e94:	09010413          	addi	s0,sp,144
    80006e98:	05813023          	sd	s8,64(sp)
    80006e9c:	08113423          	sd	ra,136(sp)
    80006ea0:	06913c23          	sd	s1,120(sp)
    80006ea4:	07213823          	sd	s2,112(sp)
    80006ea8:	07413023          	sd	s4,96(sp)
    80006eac:	05513c23          	sd	s5,88(sp)
    80006eb0:	05613823          	sd	s6,80(sp)
    80006eb4:	05713423          	sd	s7,72(sp)
    80006eb8:	03913c23          	sd	s9,56(sp)
    80006ebc:	03a13823          	sd	s10,48(sp)
    80006ec0:	03b13423          	sd	s11,40(sp)
    80006ec4:	00006317          	auipc	t1,0x6
    80006ec8:	a3c30313          	addi	t1,t1,-1476 # 8000c900 <pr>
    80006ecc:	01832c03          	lw	s8,24(t1)
    80006ed0:	00b43423          	sd	a1,8(s0)
    80006ed4:	00c43823          	sd	a2,16(s0)
    80006ed8:	00d43c23          	sd	a3,24(s0)
    80006edc:	02e43023          	sd	a4,32(s0)
    80006ee0:	02f43423          	sd	a5,40(s0)
    80006ee4:	03043823          	sd	a6,48(s0)
    80006ee8:	03143c23          	sd	a7,56(s0)
    80006eec:	00050993          	mv	s3,a0
    80006ef0:	4a0c1663          	bnez	s8,8000739c <__printf+0x514>
    80006ef4:	60098c63          	beqz	s3,8000750c <__printf+0x684>
    80006ef8:	0009c503          	lbu	a0,0(s3)
    80006efc:	00840793          	addi	a5,s0,8
    80006f00:	f6f43c23          	sd	a5,-136(s0)
    80006f04:	00000493          	li	s1,0
    80006f08:	22050063          	beqz	a0,80007128 <__printf+0x2a0>
    80006f0c:	00002a37          	lui	s4,0x2
    80006f10:	00018ab7          	lui	s5,0x18
    80006f14:	000f4b37          	lui	s6,0xf4
    80006f18:	00989bb7          	lui	s7,0x989
    80006f1c:	70fa0a13          	addi	s4,s4,1807 # 270f <_entry-0x7fffd8f1>
    80006f20:	69fa8a93          	addi	s5,s5,1695 # 1869f <_entry-0x7ffe7961>
    80006f24:	23fb0b13          	addi	s6,s6,575 # f423f <_entry-0x7ff0bdc1>
    80006f28:	67fb8b93          	addi	s7,s7,1663 # 98967f <_entry-0x7f676981>
    80006f2c:	00148c9b          	addiw	s9,s1,1
    80006f30:	02500793          	li	a5,37
    80006f34:	01998933          	add	s2,s3,s9
    80006f38:	38f51263          	bne	a0,a5,800072bc <__printf+0x434>
    80006f3c:	00094783          	lbu	a5,0(s2)
    80006f40:	00078c9b          	sext.w	s9,a5
    80006f44:	1e078263          	beqz	a5,80007128 <__printf+0x2a0>
    80006f48:	0024849b          	addiw	s1,s1,2
    80006f4c:	07000713          	li	a4,112
    80006f50:	00998933          	add	s2,s3,s1
    80006f54:	38e78a63          	beq	a5,a4,800072e8 <__printf+0x460>
    80006f58:	20f76863          	bltu	a4,a5,80007168 <__printf+0x2e0>
    80006f5c:	42a78863          	beq	a5,a0,8000738c <__printf+0x504>
    80006f60:	06400713          	li	a4,100
    80006f64:	40e79663          	bne	a5,a4,80007370 <__printf+0x4e8>
    80006f68:	f7843783          	ld	a5,-136(s0)
    80006f6c:	0007a603          	lw	a2,0(a5)
    80006f70:	00878793          	addi	a5,a5,8
    80006f74:	f6f43c23          	sd	a5,-136(s0)
    80006f78:	42064a63          	bltz	a2,800073ac <__printf+0x524>
    80006f7c:	00a00713          	li	a4,10
    80006f80:	02e677bb          	remuw	a5,a2,a4
    80006f84:	00002d97          	auipc	s11,0x2
    80006f88:	6acd8d93          	addi	s11,s11,1708 # 80009630 <digits>
    80006f8c:	00900593          	li	a1,9
    80006f90:	0006051b          	sext.w	a0,a2
    80006f94:	00000c93          	li	s9,0
    80006f98:	02079793          	slli	a5,a5,0x20
    80006f9c:	0207d793          	srli	a5,a5,0x20
    80006fa0:	00fd87b3          	add	a5,s11,a5
    80006fa4:	0007c783          	lbu	a5,0(a5)
    80006fa8:	02e656bb          	divuw	a3,a2,a4
    80006fac:	f8f40023          	sb	a5,-128(s0)
    80006fb0:	14c5d863          	bge	a1,a2,80007100 <__printf+0x278>
    80006fb4:	06300593          	li	a1,99
    80006fb8:	00100c93          	li	s9,1
    80006fbc:	02e6f7bb          	remuw	a5,a3,a4
    80006fc0:	02079793          	slli	a5,a5,0x20
    80006fc4:	0207d793          	srli	a5,a5,0x20
    80006fc8:	00fd87b3          	add	a5,s11,a5
    80006fcc:	0007c783          	lbu	a5,0(a5)
    80006fd0:	02e6d73b          	divuw	a4,a3,a4
    80006fd4:	f8f400a3          	sb	a5,-127(s0)
    80006fd8:	12a5f463          	bgeu	a1,a0,80007100 <__printf+0x278>
    80006fdc:	00a00693          	li	a3,10
    80006fe0:	00900593          	li	a1,9
    80006fe4:	02d777bb          	remuw	a5,a4,a3
    80006fe8:	02079793          	slli	a5,a5,0x20
    80006fec:	0207d793          	srli	a5,a5,0x20
    80006ff0:	00fd87b3          	add	a5,s11,a5
    80006ff4:	0007c503          	lbu	a0,0(a5)
    80006ff8:	02d757bb          	divuw	a5,a4,a3
    80006ffc:	f8a40123          	sb	a0,-126(s0)
    80007000:	48e5f263          	bgeu	a1,a4,80007484 <__printf+0x5fc>
    80007004:	06300513          	li	a0,99
    80007008:	02d7f5bb          	remuw	a1,a5,a3
    8000700c:	02059593          	slli	a1,a1,0x20
    80007010:	0205d593          	srli	a1,a1,0x20
    80007014:	00bd85b3          	add	a1,s11,a1
    80007018:	0005c583          	lbu	a1,0(a1)
    8000701c:	02d7d7bb          	divuw	a5,a5,a3
    80007020:	f8b401a3          	sb	a1,-125(s0)
    80007024:	48e57263          	bgeu	a0,a4,800074a8 <__printf+0x620>
    80007028:	3e700513          	li	a0,999
    8000702c:	02d7f5bb          	remuw	a1,a5,a3
    80007030:	02059593          	slli	a1,a1,0x20
    80007034:	0205d593          	srli	a1,a1,0x20
    80007038:	00bd85b3          	add	a1,s11,a1
    8000703c:	0005c583          	lbu	a1,0(a1)
    80007040:	02d7d7bb          	divuw	a5,a5,a3
    80007044:	f8b40223          	sb	a1,-124(s0)
    80007048:	46e57663          	bgeu	a0,a4,800074b4 <__printf+0x62c>
    8000704c:	02d7f5bb          	remuw	a1,a5,a3
    80007050:	02059593          	slli	a1,a1,0x20
    80007054:	0205d593          	srli	a1,a1,0x20
    80007058:	00bd85b3          	add	a1,s11,a1
    8000705c:	0005c583          	lbu	a1,0(a1)
    80007060:	02d7d7bb          	divuw	a5,a5,a3
    80007064:	f8b402a3          	sb	a1,-123(s0)
    80007068:	46ea7863          	bgeu	s4,a4,800074d8 <__printf+0x650>
    8000706c:	02d7f5bb          	remuw	a1,a5,a3
    80007070:	02059593          	slli	a1,a1,0x20
    80007074:	0205d593          	srli	a1,a1,0x20
    80007078:	00bd85b3          	add	a1,s11,a1
    8000707c:	0005c583          	lbu	a1,0(a1)
    80007080:	02d7d7bb          	divuw	a5,a5,a3
    80007084:	f8b40323          	sb	a1,-122(s0)
    80007088:	3eeaf863          	bgeu	s5,a4,80007478 <__printf+0x5f0>
    8000708c:	02d7f5bb          	remuw	a1,a5,a3
    80007090:	02059593          	slli	a1,a1,0x20
    80007094:	0205d593          	srli	a1,a1,0x20
    80007098:	00bd85b3          	add	a1,s11,a1
    8000709c:	0005c583          	lbu	a1,0(a1)
    800070a0:	02d7d7bb          	divuw	a5,a5,a3
    800070a4:	f8b403a3          	sb	a1,-121(s0)
    800070a8:	42eb7e63          	bgeu	s6,a4,800074e4 <__printf+0x65c>
    800070ac:	02d7f5bb          	remuw	a1,a5,a3
    800070b0:	02059593          	slli	a1,a1,0x20
    800070b4:	0205d593          	srli	a1,a1,0x20
    800070b8:	00bd85b3          	add	a1,s11,a1
    800070bc:	0005c583          	lbu	a1,0(a1)
    800070c0:	02d7d7bb          	divuw	a5,a5,a3
    800070c4:	f8b40423          	sb	a1,-120(s0)
    800070c8:	42ebfc63          	bgeu	s7,a4,80007500 <__printf+0x678>
    800070cc:	02079793          	slli	a5,a5,0x20
    800070d0:	0207d793          	srli	a5,a5,0x20
    800070d4:	00fd8db3          	add	s11,s11,a5
    800070d8:	000dc703          	lbu	a4,0(s11)
    800070dc:	00a00793          	li	a5,10
    800070e0:	00900c93          	li	s9,9
    800070e4:	f8e404a3          	sb	a4,-119(s0)
    800070e8:	00065c63          	bgez	a2,80007100 <__printf+0x278>
    800070ec:	f9040713          	addi	a4,s0,-112
    800070f0:	00f70733          	add	a4,a4,a5
    800070f4:	02d00693          	li	a3,45
    800070f8:	fed70823          	sb	a3,-16(a4)
    800070fc:	00078c93          	mv	s9,a5
    80007100:	f8040793          	addi	a5,s0,-128
    80007104:	01978cb3          	add	s9,a5,s9
    80007108:	f7f40d13          	addi	s10,s0,-129
    8000710c:	000cc503          	lbu	a0,0(s9)
    80007110:	fffc8c93          	addi	s9,s9,-1
    80007114:	00000097          	auipc	ra,0x0
    80007118:	b90080e7          	jalr	-1136(ra) # 80006ca4 <consputc>
    8000711c:	ffac98e3          	bne	s9,s10,8000710c <__printf+0x284>
    80007120:	00094503          	lbu	a0,0(s2)
    80007124:	e00514e3          	bnez	a0,80006f2c <__printf+0xa4>
    80007128:	1a0c1663          	bnez	s8,800072d4 <__printf+0x44c>
    8000712c:	08813083          	ld	ra,136(sp)
    80007130:	08013403          	ld	s0,128(sp)
    80007134:	07813483          	ld	s1,120(sp)
    80007138:	07013903          	ld	s2,112(sp)
    8000713c:	06813983          	ld	s3,104(sp)
    80007140:	06013a03          	ld	s4,96(sp)
    80007144:	05813a83          	ld	s5,88(sp)
    80007148:	05013b03          	ld	s6,80(sp)
    8000714c:	04813b83          	ld	s7,72(sp)
    80007150:	04013c03          	ld	s8,64(sp)
    80007154:	03813c83          	ld	s9,56(sp)
    80007158:	03013d03          	ld	s10,48(sp)
    8000715c:	02813d83          	ld	s11,40(sp)
    80007160:	0d010113          	addi	sp,sp,208
    80007164:	00008067          	ret
    80007168:	07300713          	li	a4,115
    8000716c:	1ce78a63          	beq	a5,a4,80007340 <__printf+0x4b8>
    80007170:	07800713          	li	a4,120
    80007174:	1ee79e63          	bne	a5,a4,80007370 <__printf+0x4e8>
    80007178:	f7843783          	ld	a5,-136(s0)
    8000717c:	0007a703          	lw	a4,0(a5)
    80007180:	00878793          	addi	a5,a5,8
    80007184:	f6f43c23          	sd	a5,-136(s0)
    80007188:	28074263          	bltz	a4,8000740c <__printf+0x584>
    8000718c:	00002d97          	auipc	s11,0x2
    80007190:	4a4d8d93          	addi	s11,s11,1188 # 80009630 <digits>
    80007194:	00f77793          	andi	a5,a4,15
    80007198:	00fd87b3          	add	a5,s11,a5
    8000719c:	0007c683          	lbu	a3,0(a5)
    800071a0:	00f00613          	li	a2,15
    800071a4:	0007079b          	sext.w	a5,a4
    800071a8:	f8d40023          	sb	a3,-128(s0)
    800071ac:	0047559b          	srliw	a1,a4,0x4
    800071b0:	0047569b          	srliw	a3,a4,0x4
    800071b4:	00000c93          	li	s9,0
    800071b8:	0ee65063          	bge	a2,a4,80007298 <__printf+0x410>
    800071bc:	00f6f693          	andi	a3,a3,15
    800071c0:	00dd86b3          	add	a3,s11,a3
    800071c4:	0006c683          	lbu	a3,0(a3) # 2004000 <_entry-0x7dffc000>
    800071c8:	0087d79b          	srliw	a5,a5,0x8
    800071cc:	00100c93          	li	s9,1
    800071d0:	f8d400a3          	sb	a3,-127(s0)
    800071d4:	0cb67263          	bgeu	a2,a1,80007298 <__printf+0x410>
    800071d8:	00f7f693          	andi	a3,a5,15
    800071dc:	00dd86b3          	add	a3,s11,a3
    800071e0:	0006c583          	lbu	a1,0(a3)
    800071e4:	00f00613          	li	a2,15
    800071e8:	0047d69b          	srliw	a3,a5,0x4
    800071ec:	f8b40123          	sb	a1,-126(s0)
    800071f0:	0047d593          	srli	a1,a5,0x4
    800071f4:	28f67e63          	bgeu	a2,a5,80007490 <__printf+0x608>
    800071f8:	00f6f693          	andi	a3,a3,15
    800071fc:	00dd86b3          	add	a3,s11,a3
    80007200:	0006c503          	lbu	a0,0(a3)
    80007204:	0087d813          	srli	a6,a5,0x8
    80007208:	0087d69b          	srliw	a3,a5,0x8
    8000720c:	f8a401a3          	sb	a0,-125(s0)
    80007210:	28b67663          	bgeu	a2,a1,8000749c <__printf+0x614>
    80007214:	00f6f693          	andi	a3,a3,15
    80007218:	00dd86b3          	add	a3,s11,a3
    8000721c:	0006c583          	lbu	a1,0(a3)
    80007220:	00c7d513          	srli	a0,a5,0xc
    80007224:	00c7d69b          	srliw	a3,a5,0xc
    80007228:	f8b40223          	sb	a1,-124(s0)
    8000722c:	29067a63          	bgeu	a2,a6,800074c0 <__printf+0x638>
    80007230:	00f6f693          	andi	a3,a3,15
    80007234:	00dd86b3          	add	a3,s11,a3
    80007238:	0006c583          	lbu	a1,0(a3)
    8000723c:	0107d813          	srli	a6,a5,0x10
    80007240:	0107d69b          	srliw	a3,a5,0x10
    80007244:	f8b402a3          	sb	a1,-123(s0)
    80007248:	28a67263          	bgeu	a2,a0,800074cc <__printf+0x644>
    8000724c:	00f6f693          	andi	a3,a3,15
    80007250:	00dd86b3          	add	a3,s11,a3
    80007254:	0006c683          	lbu	a3,0(a3)
    80007258:	0147d79b          	srliw	a5,a5,0x14
    8000725c:	f8d40323          	sb	a3,-122(s0)
    80007260:	21067663          	bgeu	a2,a6,8000746c <__printf+0x5e4>
    80007264:	02079793          	slli	a5,a5,0x20
    80007268:	0207d793          	srli	a5,a5,0x20
    8000726c:	00fd8db3          	add	s11,s11,a5
    80007270:	000dc683          	lbu	a3,0(s11)
    80007274:	00800793          	li	a5,8
    80007278:	00700c93          	li	s9,7
    8000727c:	f8d403a3          	sb	a3,-121(s0)
    80007280:	00075c63          	bgez	a4,80007298 <__printf+0x410>
    80007284:	f9040713          	addi	a4,s0,-112
    80007288:	00f70733          	add	a4,a4,a5
    8000728c:	02d00693          	li	a3,45
    80007290:	fed70823          	sb	a3,-16(a4)
    80007294:	00078c93          	mv	s9,a5
    80007298:	f8040793          	addi	a5,s0,-128
    8000729c:	01978cb3          	add	s9,a5,s9
    800072a0:	f7f40d13          	addi	s10,s0,-129
    800072a4:	000cc503          	lbu	a0,0(s9)
    800072a8:	fffc8c93          	addi	s9,s9,-1
    800072ac:	00000097          	auipc	ra,0x0
    800072b0:	9f8080e7          	jalr	-1544(ra) # 80006ca4 <consputc>
    800072b4:	ff9d18e3          	bne	s10,s9,800072a4 <__printf+0x41c>
    800072b8:	0100006f          	j	800072c8 <__printf+0x440>
    800072bc:	00000097          	auipc	ra,0x0
    800072c0:	9e8080e7          	jalr	-1560(ra) # 80006ca4 <consputc>
    800072c4:	000c8493          	mv	s1,s9
    800072c8:	00094503          	lbu	a0,0(s2)
    800072cc:	c60510e3          	bnez	a0,80006f2c <__printf+0xa4>
    800072d0:	e40c0ee3          	beqz	s8,8000712c <__printf+0x2a4>
    800072d4:	00005517          	auipc	a0,0x5
    800072d8:	62c50513          	addi	a0,a0,1580 # 8000c900 <pr>
    800072dc:	00001097          	auipc	ra,0x1
    800072e0:	94c080e7          	jalr	-1716(ra) # 80007c28 <release>
    800072e4:	e49ff06f          	j	8000712c <__printf+0x2a4>
    800072e8:	f7843783          	ld	a5,-136(s0)
    800072ec:	03000513          	li	a0,48
    800072f0:	01000d13          	li	s10,16
    800072f4:	00878713          	addi	a4,a5,8
    800072f8:	0007bc83          	ld	s9,0(a5)
    800072fc:	f6e43c23          	sd	a4,-136(s0)
    80007300:	00000097          	auipc	ra,0x0
    80007304:	9a4080e7          	jalr	-1628(ra) # 80006ca4 <consputc>
    80007308:	07800513          	li	a0,120
    8000730c:	00000097          	auipc	ra,0x0
    80007310:	998080e7          	jalr	-1640(ra) # 80006ca4 <consputc>
    80007314:	00002d97          	auipc	s11,0x2
    80007318:	31cd8d93          	addi	s11,s11,796 # 80009630 <digits>
    8000731c:	03ccd793          	srli	a5,s9,0x3c
    80007320:	00fd87b3          	add	a5,s11,a5
    80007324:	0007c503          	lbu	a0,0(a5)
    80007328:	fffd0d1b          	addiw	s10,s10,-1
    8000732c:	004c9c93          	slli	s9,s9,0x4
    80007330:	00000097          	auipc	ra,0x0
    80007334:	974080e7          	jalr	-1676(ra) # 80006ca4 <consputc>
    80007338:	fe0d12e3          	bnez	s10,8000731c <__printf+0x494>
    8000733c:	f8dff06f          	j	800072c8 <__printf+0x440>
    80007340:	f7843783          	ld	a5,-136(s0)
    80007344:	0007bc83          	ld	s9,0(a5)
    80007348:	00878793          	addi	a5,a5,8
    8000734c:	f6f43c23          	sd	a5,-136(s0)
    80007350:	000c9a63          	bnez	s9,80007364 <__printf+0x4dc>
    80007354:	1080006f          	j	8000745c <__printf+0x5d4>
    80007358:	001c8c93          	addi	s9,s9,1
    8000735c:	00000097          	auipc	ra,0x0
    80007360:	948080e7          	jalr	-1720(ra) # 80006ca4 <consputc>
    80007364:	000cc503          	lbu	a0,0(s9)
    80007368:	fe0518e3          	bnez	a0,80007358 <__printf+0x4d0>
    8000736c:	f5dff06f          	j	800072c8 <__printf+0x440>
    80007370:	02500513          	li	a0,37
    80007374:	00000097          	auipc	ra,0x0
    80007378:	930080e7          	jalr	-1744(ra) # 80006ca4 <consputc>
    8000737c:	000c8513          	mv	a0,s9
    80007380:	00000097          	auipc	ra,0x0
    80007384:	924080e7          	jalr	-1756(ra) # 80006ca4 <consputc>
    80007388:	f41ff06f          	j	800072c8 <__printf+0x440>
    8000738c:	02500513          	li	a0,37
    80007390:	00000097          	auipc	ra,0x0
    80007394:	914080e7          	jalr	-1772(ra) # 80006ca4 <consputc>
    80007398:	f31ff06f          	j	800072c8 <__printf+0x440>
    8000739c:	00030513          	mv	a0,t1
    800073a0:	00000097          	auipc	ra,0x0
    800073a4:	7bc080e7          	jalr	1980(ra) # 80007b5c <acquire>
    800073a8:	b4dff06f          	j	80006ef4 <__printf+0x6c>
    800073ac:	40c0053b          	negw	a0,a2
    800073b0:	00a00713          	li	a4,10
    800073b4:	02e576bb          	remuw	a3,a0,a4
    800073b8:	00002d97          	auipc	s11,0x2
    800073bc:	278d8d93          	addi	s11,s11,632 # 80009630 <digits>
    800073c0:	ff700593          	li	a1,-9
    800073c4:	02069693          	slli	a3,a3,0x20
    800073c8:	0206d693          	srli	a3,a3,0x20
    800073cc:	00dd86b3          	add	a3,s11,a3
    800073d0:	0006c683          	lbu	a3,0(a3)
    800073d4:	02e557bb          	divuw	a5,a0,a4
    800073d8:	f8d40023          	sb	a3,-128(s0)
    800073dc:	10b65e63          	bge	a2,a1,800074f8 <__printf+0x670>
    800073e0:	06300593          	li	a1,99
    800073e4:	02e7f6bb          	remuw	a3,a5,a4
    800073e8:	02069693          	slli	a3,a3,0x20
    800073ec:	0206d693          	srli	a3,a3,0x20
    800073f0:	00dd86b3          	add	a3,s11,a3
    800073f4:	0006c683          	lbu	a3,0(a3)
    800073f8:	02e7d73b          	divuw	a4,a5,a4
    800073fc:	00200793          	li	a5,2
    80007400:	f8d400a3          	sb	a3,-127(s0)
    80007404:	bca5ece3          	bltu	a1,a0,80006fdc <__printf+0x154>
    80007408:	ce5ff06f          	j	800070ec <__printf+0x264>
    8000740c:	40e007bb          	negw	a5,a4
    80007410:	00002d97          	auipc	s11,0x2
    80007414:	220d8d93          	addi	s11,s11,544 # 80009630 <digits>
    80007418:	00f7f693          	andi	a3,a5,15
    8000741c:	00dd86b3          	add	a3,s11,a3
    80007420:	0006c583          	lbu	a1,0(a3)
    80007424:	ff100613          	li	a2,-15
    80007428:	0047d69b          	srliw	a3,a5,0x4
    8000742c:	f8b40023          	sb	a1,-128(s0)
    80007430:	0047d59b          	srliw	a1,a5,0x4
    80007434:	0ac75e63          	bge	a4,a2,800074f0 <__printf+0x668>
    80007438:	00f6f693          	andi	a3,a3,15
    8000743c:	00dd86b3          	add	a3,s11,a3
    80007440:	0006c603          	lbu	a2,0(a3)
    80007444:	00f00693          	li	a3,15
    80007448:	0087d79b          	srliw	a5,a5,0x8
    8000744c:	f8c400a3          	sb	a2,-127(s0)
    80007450:	d8b6e4e3          	bltu	a3,a1,800071d8 <__printf+0x350>
    80007454:	00200793          	li	a5,2
    80007458:	e2dff06f          	j	80007284 <__printf+0x3fc>
    8000745c:	00002c97          	auipc	s9,0x2
    80007460:	1b4c8c93          	addi	s9,s9,436 # 80009610 <kvmincrease+0x1020>
    80007464:	02800513          	li	a0,40
    80007468:	ef1ff06f          	j	80007358 <__printf+0x4d0>
    8000746c:	00700793          	li	a5,7
    80007470:	00600c93          	li	s9,6
    80007474:	e0dff06f          	j	80007280 <__printf+0x3f8>
    80007478:	00700793          	li	a5,7
    8000747c:	00600c93          	li	s9,6
    80007480:	c69ff06f          	j	800070e8 <__printf+0x260>
    80007484:	00300793          	li	a5,3
    80007488:	00200c93          	li	s9,2
    8000748c:	c5dff06f          	j	800070e8 <__printf+0x260>
    80007490:	00300793          	li	a5,3
    80007494:	00200c93          	li	s9,2
    80007498:	de9ff06f          	j	80007280 <__printf+0x3f8>
    8000749c:	00400793          	li	a5,4
    800074a0:	00300c93          	li	s9,3
    800074a4:	dddff06f          	j	80007280 <__printf+0x3f8>
    800074a8:	00400793          	li	a5,4
    800074ac:	00300c93          	li	s9,3
    800074b0:	c39ff06f          	j	800070e8 <__printf+0x260>
    800074b4:	00500793          	li	a5,5
    800074b8:	00400c93          	li	s9,4
    800074bc:	c2dff06f          	j	800070e8 <__printf+0x260>
    800074c0:	00500793          	li	a5,5
    800074c4:	00400c93          	li	s9,4
    800074c8:	db9ff06f          	j	80007280 <__printf+0x3f8>
    800074cc:	00600793          	li	a5,6
    800074d0:	00500c93          	li	s9,5
    800074d4:	dadff06f          	j	80007280 <__printf+0x3f8>
    800074d8:	00600793          	li	a5,6
    800074dc:	00500c93          	li	s9,5
    800074e0:	c09ff06f          	j	800070e8 <__printf+0x260>
    800074e4:	00800793          	li	a5,8
    800074e8:	00700c93          	li	s9,7
    800074ec:	bfdff06f          	j	800070e8 <__printf+0x260>
    800074f0:	00100793          	li	a5,1
    800074f4:	d91ff06f          	j	80007284 <__printf+0x3fc>
    800074f8:	00100793          	li	a5,1
    800074fc:	bf1ff06f          	j	800070ec <__printf+0x264>
    80007500:	00900793          	li	a5,9
    80007504:	00800c93          	li	s9,8
    80007508:	be1ff06f          	j	800070e8 <__printf+0x260>
    8000750c:	00002517          	auipc	a0,0x2
    80007510:	10c50513          	addi	a0,a0,268 # 80009618 <kvmincrease+0x1028>
    80007514:	00000097          	auipc	ra,0x0
    80007518:	918080e7          	jalr	-1768(ra) # 80006e2c <panic>

000000008000751c <printfinit>:
    8000751c:	fe010113          	addi	sp,sp,-32
    80007520:	00813823          	sd	s0,16(sp)
    80007524:	00913423          	sd	s1,8(sp)
    80007528:	00113c23          	sd	ra,24(sp)
    8000752c:	02010413          	addi	s0,sp,32
    80007530:	00005497          	auipc	s1,0x5
    80007534:	3d048493          	addi	s1,s1,976 # 8000c900 <pr>
    80007538:	00048513          	mv	a0,s1
    8000753c:	00002597          	auipc	a1,0x2
    80007540:	0ec58593          	addi	a1,a1,236 # 80009628 <kvmincrease+0x1038>
    80007544:	00000097          	auipc	ra,0x0
    80007548:	5f4080e7          	jalr	1524(ra) # 80007b38 <initlock>
    8000754c:	01813083          	ld	ra,24(sp)
    80007550:	01013403          	ld	s0,16(sp)
    80007554:	0004ac23          	sw	zero,24(s1)
    80007558:	00813483          	ld	s1,8(sp)
    8000755c:	02010113          	addi	sp,sp,32
    80007560:	00008067          	ret

0000000080007564 <uartinit>:
    80007564:	ff010113          	addi	sp,sp,-16
    80007568:	00813423          	sd	s0,8(sp)
    8000756c:	01010413          	addi	s0,sp,16
    80007570:	100007b7          	lui	a5,0x10000
    80007574:	000780a3          	sb	zero,1(a5) # 10000001 <_entry-0x6fffffff>
    80007578:	f8000713          	li	a4,-128
    8000757c:	00e781a3          	sb	a4,3(a5)
    80007580:	00300713          	li	a4,3
    80007584:	00e78023          	sb	a4,0(a5)
    80007588:	000780a3          	sb	zero,1(a5)
    8000758c:	00e781a3          	sb	a4,3(a5)
    80007590:	00700693          	li	a3,7
    80007594:	00d78123          	sb	a3,2(a5)
    80007598:	00e780a3          	sb	a4,1(a5)
    8000759c:	00813403          	ld	s0,8(sp)
    800075a0:	01010113          	addi	sp,sp,16
    800075a4:	00008067          	ret

00000000800075a8 <uartputc>:
    800075a8:	00004797          	auipc	a5,0x4
    800075ac:	0707a783          	lw	a5,112(a5) # 8000b618 <panicked>
    800075b0:	00078463          	beqz	a5,800075b8 <uartputc+0x10>
    800075b4:	0000006f          	j	800075b4 <uartputc+0xc>
    800075b8:	fd010113          	addi	sp,sp,-48
    800075bc:	02813023          	sd	s0,32(sp)
    800075c0:	00913c23          	sd	s1,24(sp)
    800075c4:	01213823          	sd	s2,16(sp)
    800075c8:	01313423          	sd	s3,8(sp)
    800075cc:	02113423          	sd	ra,40(sp)
    800075d0:	03010413          	addi	s0,sp,48
    800075d4:	00004917          	auipc	s2,0x4
    800075d8:	04c90913          	addi	s2,s2,76 # 8000b620 <uart_tx_r>
    800075dc:	00093783          	ld	a5,0(s2)
    800075e0:	00004497          	auipc	s1,0x4
    800075e4:	04848493          	addi	s1,s1,72 # 8000b628 <uart_tx_w>
    800075e8:	0004b703          	ld	a4,0(s1)
    800075ec:	02078693          	addi	a3,a5,32
    800075f0:	00050993          	mv	s3,a0
    800075f4:	02e69c63          	bne	a3,a4,8000762c <uartputc+0x84>
    800075f8:	00001097          	auipc	ra,0x1
    800075fc:	834080e7          	jalr	-1996(ra) # 80007e2c <push_on>
    80007600:	00093783          	ld	a5,0(s2)
    80007604:	0004b703          	ld	a4,0(s1)
    80007608:	02078793          	addi	a5,a5,32
    8000760c:	00e79463          	bne	a5,a4,80007614 <uartputc+0x6c>
    80007610:	0000006f          	j	80007610 <uartputc+0x68>
    80007614:	00001097          	auipc	ra,0x1
    80007618:	88c080e7          	jalr	-1908(ra) # 80007ea0 <pop_on>
    8000761c:	00093783          	ld	a5,0(s2)
    80007620:	0004b703          	ld	a4,0(s1)
    80007624:	02078693          	addi	a3,a5,32
    80007628:	fce688e3          	beq	a3,a4,800075f8 <uartputc+0x50>
    8000762c:	01f77693          	andi	a3,a4,31
    80007630:	00005597          	auipc	a1,0x5
    80007634:	2f058593          	addi	a1,a1,752 # 8000c920 <uart_tx_buf>
    80007638:	00d586b3          	add	a3,a1,a3
    8000763c:	00170713          	addi	a4,a4,1
    80007640:	01368023          	sb	s3,0(a3)
    80007644:	00e4b023          	sd	a4,0(s1)
    80007648:	10000637          	lui	a2,0x10000
    8000764c:	02f71063          	bne	a4,a5,8000766c <uartputc+0xc4>
    80007650:	0340006f          	j	80007684 <uartputc+0xdc>
    80007654:	00074703          	lbu	a4,0(a4)
    80007658:	00f93023          	sd	a5,0(s2)
    8000765c:	00e60023          	sb	a4,0(a2) # 10000000 <_entry-0x70000000>
    80007660:	00093783          	ld	a5,0(s2)
    80007664:	0004b703          	ld	a4,0(s1)
    80007668:	00f70e63          	beq	a4,a5,80007684 <uartputc+0xdc>
    8000766c:	00564683          	lbu	a3,5(a2)
    80007670:	01f7f713          	andi	a4,a5,31
    80007674:	00e58733          	add	a4,a1,a4
    80007678:	0206f693          	andi	a3,a3,32
    8000767c:	00178793          	addi	a5,a5,1
    80007680:	fc069ae3          	bnez	a3,80007654 <uartputc+0xac>
    80007684:	02813083          	ld	ra,40(sp)
    80007688:	02013403          	ld	s0,32(sp)
    8000768c:	01813483          	ld	s1,24(sp)
    80007690:	01013903          	ld	s2,16(sp)
    80007694:	00813983          	ld	s3,8(sp)
    80007698:	03010113          	addi	sp,sp,48
    8000769c:	00008067          	ret

00000000800076a0 <uartputc_sync>:
    800076a0:	ff010113          	addi	sp,sp,-16
    800076a4:	00813423          	sd	s0,8(sp)
    800076a8:	01010413          	addi	s0,sp,16
    800076ac:	00004717          	auipc	a4,0x4
    800076b0:	f6c72703          	lw	a4,-148(a4) # 8000b618 <panicked>
    800076b4:	02071663          	bnez	a4,800076e0 <uartputc_sync+0x40>
    800076b8:	00050793          	mv	a5,a0
    800076bc:	100006b7          	lui	a3,0x10000
    800076c0:	0056c703          	lbu	a4,5(a3) # 10000005 <_entry-0x6ffffffb>
    800076c4:	02077713          	andi	a4,a4,32
    800076c8:	fe070ce3          	beqz	a4,800076c0 <uartputc_sync+0x20>
    800076cc:	0ff7f793          	andi	a5,a5,255
    800076d0:	00f68023          	sb	a5,0(a3)
    800076d4:	00813403          	ld	s0,8(sp)
    800076d8:	01010113          	addi	sp,sp,16
    800076dc:	00008067          	ret
    800076e0:	0000006f          	j	800076e0 <uartputc_sync+0x40>

00000000800076e4 <uartstart>:
    800076e4:	ff010113          	addi	sp,sp,-16
    800076e8:	00813423          	sd	s0,8(sp)
    800076ec:	01010413          	addi	s0,sp,16
    800076f0:	00004617          	auipc	a2,0x4
    800076f4:	f3060613          	addi	a2,a2,-208 # 8000b620 <uart_tx_r>
    800076f8:	00004517          	auipc	a0,0x4
    800076fc:	f3050513          	addi	a0,a0,-208 # 8000b628 <uart_tx_w>
    80007700:	00063783          	ld	a5,0(a2)
    80007704:	00053703          	ld	a4,0(a0)
    80007708:	04f70263          	beq	a4,a5,8000774c <uartstart+0x68>
    8000770c:	100005b7          	lui	a1,0x10000
    80007710:	00005817          	auipc	a6,0x5
    80007714:	21080813          	addi	a6,a6,528 # 8000c920 <uart_tx_buf>
    80007718:	01c0006f          	j	80007734 <uartstart+0x50>
    8000771c:	0006c703          	lbu	a4,0(a3)
    80007720:	00f63023          	sd	a5,0(a2)
    80007724:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    80007728:	00063783          	ld	a5,0(a2)
    8000772c:	00053703          	ld	a4,0(a0)
    80007730:	00f70e63          	beq	a4,a5,8000774c <uartstart+0x68>
    80007734:	01f7f713          	andi	a4,a5,31
    80007738:	00e806b3          	add	a3,a6,a4
    8000773c:	0055c703          	lbu	a4,5(a1)
    80007740:	00178793          	addi	a5,a5,1
    80007744:	02077713          	andi	a4,a4,32
    80007748:	fc071ae3          	bnez	a4,8000771c <uartstart+0x38>
    8000774c:	00813403          	ld	s0,8(sp)
    80007750:	01010113          	addi	sp,sp,16
    80007754:	00008067          	ret

0000000080007758 <uartgetc>:
    80007758:	ff010113          	addi	sp,sp,-16
    8000775c:	00813423          	sd	s0,8(sp)
    80007760:	01010413          	addi	s0,sp,16
    80007764:	10000737          	lui	a4,0x10000
    80007768:	00574783          	lbu	a5,5(a4) # 10000005 <_entry-0x6ffffffb>
    8000776c:	0017f793          	andi	a5,a5,1
    80007770:	00078c63          	beqz	a5,80007788 <uartgetc+0x30>
    80007774:	00074503          	lbu	a0,0(a4)
    80007778:	0ff57513          	andi	a0,a0,255
    8000777c:	00813403          	ld	s0,8(sp)
    80007780:	01010113          	addi	sp,sp,16
    80007784:	00008067          	ret
    80007788:	fff00513          	li	a0,-1
    8000778c:	ff1ff06f          	j	8000777c <uartgetc+0x24>

0000000080007790 <uartintr>:
    80007790:	100007b7          	lui	a5,0x10000
    80007794:	0057c783          	lbu	a5,5(a5) # 10000005 <_entry-0x6ffffffb>
    80007798:	0017f793          	andi	a5,a5,1
    8000779c:	0a078463          	beqz	a5,80007844 <uartintr+0xb4>
    800077a0:	fe010113          	addi	sp,sp,-32
    800077a4:	00813823          	sd	s0,16(sp)
    800077a8:	00913423          	sd	s1,8(sp)
    800077ac:	00113c23          	sd	ra,24(sp)
    800077b0:	02010413          	addi	s0,sp,32
    800077b4:	100004b7          	lui	s1,0x10000
    800077b8:	0004c503          	lbu	a0,0(s1) # 10000000 <_entry-0x70000000>
    800077bc:	0ff57513          	andi	a0,a0,255
    800077c0:	fffff097          	auipc	ra,0xfffff
    800077c4:	534080e7          	jalr	1332(ra) # 80006cf4 <consoleintr>
    800077c8:	0054c783          	lbu	a5,5(s1)
    800077cc:	0017f793          	andi	a5,a5,1
    800077d0:	fe0794e3          	bnez	a5,800077b8 <uartintr+0x28>
    800077d4:	00004617          	auipc	a2,0x4
    800077d8:	e4c60613          	addi	a2,a2,-436 # 8000b620 <uart_tx_r>
    800077dc:	00004517          	auipc	a0,0x4
    800077e0:	e4c50513          	addi	a0,a0,-436 # 8000b628 <uart_tx_w>
    800077e4:	00063783          	ld	a5,0(a2)
    800077e8:	00053703          	ld	a4,0(a0)
    800077ec:	04f70263          	beq	a4,a5,80007830 <uartintr+0xa0>
    800077f0:	100005b7          	lui	a1,0x10000
    800077f4:	00005817          	auipc	a6,0x5
    800077f8:	12c80813          	addi	a6,a6,300 # 8000c920 <uart_tx_buf>
    800077fc:	01c0006f          	j	80007818 <uartintr+0x88>
    80007800:	0006c703          	lbu	a4,0(a3)
    80007804:	00f63023          	sd	a5,0(a2)
    80007808:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000780c:	00063783          	ld	a5,0(a2)
    80007810:	00053703          	ld	a4,0(a0)
    80007814:	00f70e63          	beq	a4,a5,80007830 <uartintr+0xa0>
    80007818:	01f7f713          	andi	a4,a5,31
    8000781c:	00e806b3          	add	a3,a6,a4
    80007820:	0055c703          	lbu	a4,5(a1)
    80007824:	00178793          	addi	a5,a5,1
    80007828:	02077713          	andi	a4,a4,32
    8000782c:	fc071ae3          	bnez	a4,80007800 <uartintr+0x70>
    80007830:	01813083          	ld	ra,24(sp)
    80007834:	01013403          	ld	s0,16(sp)
    80007838:	00813483          	ld	s1,8(sp)
    8000783c:	02010113          	addi	sp,sp,32
    80007840:	00008067          	ret
    80007844:	00004617          	auipc	a2,0x4
    80007848:	ddc60613          	addi	a2,a2,-548 # 8000b620 <uart_tx_r>
    8000784c:	00004517          	auipc	a0,0x4
    80007850:	ddc50513          	addi	a0,a0,-548 # 8000b628 <uart_tx_w>
    80007854:	00063783          	ld	a5,0(a2)
    80007858:	00053703          	ld	a4,0(a0)
    8000785c:	04f70263          	beq	a4,a5,800078a0 <uartintr+0x110>
    80007860:	100005b7          	lui	a1,0x10000
    80007864:	00005817          	auipc	a6,0x5
    80007868:	0bc80813          	addi	a6,a6,188 # 8000c920 <uart_tx_buf>
    8000786c:	01c0006f          	j	80007888 <uartintr+0xf8>
    80007870:	0006c703          	lbu	a4,0(a3)
    80007874:	00f63023          	sd	a5,0(a2)
    80007878:	00e58023          	sb	a4,0(a1) # 10000000 <_entry-0x70000000>
    8000787c:	00063783          	ld	a5,0(a2)
    80007880:	00053703          	ld	a4,0(a0)
    80007884:	02f70063          	beq	a4,a5,800078a4 <uartintr+0x114>
    80007888:	01f7f713          	andi	a4,a5,31
    8000788c:	00e806b3          	add	a3,a6,a4
    80007890:	0055c703          	lbu	a4,5(a1)
    80007894:	00178793          	addi	a5,a5,1
    80007898:	02077713          	andi	a4,a4,32
    8000789c:	fc071ae3          	bnez	a4,80007870 <uartintr+0xe0>
    800078a0:	00008067          	ret
    800078a4:	00008067          	ret

00000000800078a8 <kinit>:
    800078a8:	fc010113          	addi	sp,sp,-64
    800078ac:	02913423          	sd	s1,40(sp)
    800078b0:	fffff7b7          	lui	a5,0xfffff
    800078b4:	00006497          	auipc	s1,0x6
    800078b8:	09b48493          	addi	s1,s1,155 # 8000d94f <end+0xfff>
    800078bc:	02813823          	sd	s0,48(sp)
    800078c0:	01313c23          	sd	s3,24(sp)
    800078c4:	00f4f4b3          	and	s1,s1,a5
    800078c8:	02113c23          	sd	ra,56(sp)
    800078cc:	03213023          	sd	s2,32(sp)
    800078d0:	01413823          	sd	s4,16(sp)
    800078d4:	01513423          	sd	s5,8(sp)
    800078d8:	04010413          	addi	s0,sp,64
    800078dc:	000017b7          	lui	a5,0x1
    800078e0:	01100993          	li	s3,17
    800078e4:	00f487b3          	add	a5,s1,a5
    800078e8:	01b99993          	slli	s3,s3,0x1b
    800078ec:	06f9e063          	bltu	s3,a5,8000794c <kinit+0xa4>
    800078f0:	00005a97          	auipc	s5,0x5
    800078f4:	060a8a93          	addi	s5,s5,96 # 8000c950 <end>
    800078f8:	0754ec63          	bltu	s1,s5,80007970 <kinit+0xc8>
    800078fc:	0734fa63          	bgeu	s1,s3,80007970 <kinit+0xc8>
    80007900:	00088a37          	lui	s4,0x88
    80007904:	fffa0a13          	addi	s4,s4,-1 # 87fff <_entry-0x7ff78001>
    80007908:	00004917          	auipc	s2,0x4
    8000790c:	d2890913          	addi	s2,s2,-728 # 8000b630 <kmem>
    80007910:	00ca1a13          	slli	s4,s4,0xc
    80007914:	0140006f          	j	80007928 <kinit+0x80>
    80007918:	000017b7          	lui	a5,0x1
    8000791c:	00f484b3          	add	s1,s1,a5
    80007920:	0554e863          	bltu	s1,s5,80007970 <kinit+0xc8>
    80007924:	0534f663          	bgeu	s1,s3,80007970 <kinit+0xc8>
    80007928:	00001637          	lui	a2,0x1
    8000792c:	00100593          	li	a1,1
    80007930:	00048513          	mv	a0,s1
    80007934:	00000097          	auipc	ra,0x0
    80007938:	5e4080e7          	jalr	1508(ra) # 80007f18 <__memset>
    8000793c:	00093783          	ld	a5,0(s2)
    80007940:	00f4b023          	sd	a5,0(s1)
    80007944:	00993023          	sd	s1,0(s2)
    80007948:	fd4498e3          	bne	s1,s4,80007918 <kinit+0x70>
    8000794c:	03813083          	ld	ra,56(sp)
    80007950:	03013403          	ld	s0,48(sp)
    80007954:	02813483          	ld	s1,40(sp)
    80007958:	02013903          	ld	s2,32(sp)
    8000795c:	01813983          	ld	s3,24(sp)
    80007960:	01013a03          	ld	s4,16(sp)
    80007964:	00813a83          	ld	s5,8(sp)
    80007968:	04010113          	addi	sp,sp,64
    8000796c:	00008067          	ret
    80007970:	00002517          	auipc	a0,0x2
    80007974:	cd850513          	addi	a0,a0,-808 # 80009648 <digits+0x18>
    80007978:	fffff097          	auipc	ra,0xfffff
    8000797c:	4b4080e7          	jalr	1204(ra) # 80006e2c <panic>

0000000080007980 <freerange>:
    80007980:	fc010113          	addi	sp,sp,-64
    80007984:	000017b7          	lui	a5,0x1
    80007988:	02913423          	sd	s1,40(sp)
    8000798c:	fff78493          	addi	s1,a5,-1 # fff <_entry-0x7ffff001>
    80007990:	009504b3          	add	s1,a0,s1
    80007994:	fffff537          	lui	a0,0xfffff
    80007998:	02813823          	sd	s0,48(sp)
    8000799c:	02113c23          	sd	ra,56(sp)
    800079a0:	03213023          	sd	s2,32(sp)
    800079a4:	01313c23          	sd	s3,24(sp)
    800079a8:	01413823          	sd	s4,16(sp)
    800079ac:	01513423          	sd	s5,8(sp)
    800079b0:	01613023          	sd	s6,0(sp)
    800079b4:	04010413          	addi	s0,sp,64
    800079b8:	00a4f4b3          	and	s1,s1,a0
    800079bc:	00f487b3          	add	a5,s1,a5
    800079c0:	06f5e463          	bltu	a1,a5,80007a28 <freerange+0xa8>
    800079c4:	00005a97          	auipc	s5,0x5
    800079c8:	f8ca8a93          	addi	s5,s5,-116 # 8000c950 <end>
    800079cc:	0954e263          	bltu	s1,s5,80007a50 <freerange+0xd0>
    800079d0:	01100993          	li	s3,17
    800079d4:	01b99993          	slli	s3,s3,0x1b
    800079d8:	0734fc63          	bgeu	s1,s3,80007a50 <freerange+0xd0>
    800079dc:	00058a13          	mv	s4,a1
    800079e0:	00004917          	auipc	s2,0x4
    800079e4:	c5090913          	addi	s2,s2,-944 # 8000b630 <kmem>
    800079e8:	00002b37          	lui	s6,0x2
    800079ec:	0140006f          	j	80007a00 <freerange+0x80>
    800079f0:	000017b7          	lui	a5,0x1
    800079f4:	00f484b3          	add	s1,s1,a5
    800079f8:	0554ec63          	bltu	s1,s5,80007a50 <freerange+0xd0>
    800079fc:	0534fa63          	bgeu	s1,s3,80007a50 <freerange+0xd0>
    80007a00:	00001637          	lui	a2,0x1
    80007a04:	00100593          	li	a1,1
    80007a08:	00048513          	mv	a0,s1
    80007a0c:	00000097          	auipc	ra,0x0
    80007a10:	50c080e7          	jalr	1292(ra) # 80007f18 <__memset>
    80007a14:	00093703          	ld	a4,0(s2)
    80007a18:	016487b3          	add	a5,s1,s6
    80007a1c:	00e4b023          	sd	a4,0(s1)
    80007a20:	00993023          	sd	s1,0(s2)
    80007a24:	fcfa76e3          	bgeu	s4,a5,800079f0 <freerange+0x70>
    80007a28:	03813083          	ld	ra,56(sp)
    80007a2c:	03013403          	ld	s0,48(sp)
    80007a30:	02813483          	ld	s1,40(sp)
    80007a34:	02013903          	ld	s2,32(sp)
    80007a38:	01813983          	ld	s3,24(sp)
    80007a3c:	01013a03          	ld	s4,16(sp)
    80007a40:	00813a83          	ld	s5,8(sp)
    80007a44:	00013b03          	ld	s6,0(sp)
    80007a48:	04010113          	addi	sp,sp,64
    80007a4c:	00008067          	ret
    80007a50:	00002517          	auipc	a0,0x2
    80007a54:	bf850513          	addi	a0,a0,-1032 # 80009648 <digits+0x18>
    80007a58:	fffff097          	auipc	ra,0xfffff
    80007a5c:	3d4080e7          	jalr	980(ra) # 80006e2c <panic>

0000000080007a60 <kfree>:
    80007a60:	fe010113          	addi	sp,sp,-32
    80007a64:	00813823          	sd	s0,16(sp)
    80007a68:	00113c23          	sd	ra,24(sp)
    80007a6c:	00913423          	sd	s1,8(sp)
    80007a70:	02010413          	addi	s0,sp,32
    80007a74:	03451793          	slli	a5,a0,0x34
    80007a78:	04079c63          	bnez	a5,80007ad0 <kfree+0x70>
    80007a7c:	00005797          	auipc	a5,0x5
    80007a80:	ed478793          	addi	a5,a5,-300 # 8000c950 <end>
    80007a84:	00050493          	mv	s1,a0
    80007a88:	04f56463          	bltu	a0,a5,80007ad0 <kfree+0x70>
    80007a8c:	01100793          	li	a5,17
    80007a90:	01b79793          	slli	a5,a5,0x1b
    80007a94:	02f57e63          	bgeu	a0,a5,80007ad0 <kfree+0x70>
    80007a98:	00001637          	lui	a2,0x1
    80007a9c:	00100593          	li	a1,1
    80007aa0:	00000097          	auipc	ra,0x0
    80007aa4:	478080e7          	jalr	1144(ra) # 80007f18 <__memset>
    80007aa8:	00004797          	auipc	a5,0x4
    80007aac:	b8878793          	addi	a5,a5,-1144 # 8000b630 <kmem>
    80007ab0:	0007b703          	ld	a4,0(a5)
    80007ab4:	01813083          	ld	ra,24(sp)
    80007ab8:	01013403          	ld	s0,16(sp)
    80007abc:	00e4b023          	sd	a4,0(s1)
    80007ac0:	0097b023          	sd	s1,0(a5)
    80007ac4:	00813483          	ld	s1,8(sp)
    80007ac8:	02010113          	addi	sp,sp,32
    80007acc:	00008067          	ret
    80007ad0:	00002517          	auipc	a0,0x2
    80007ad4:	b7850513          	addi	a0,a0,-1160 # 80009648 <digits+0x18>
    80007ad8:	fffff097          	auipc	ra,0xfffff
    80007adc:	354080e7          	jalr	852(ra) # 80006e2c <panic>

0000000080007ae0 <kalloc>:
    80007ae0:	fe010113          	addi	sp,sp,-32
    80007ae4:	00813823          	sd	s0,16(sp)
    80007ae8:	00913423          	sd	s1,8(sp)
    80007aec:	00113c23          	sd	ra,24(sp)
    80007af0:	02010413          	addi	s0,sp,32
    80007af4:	00004797          	auipc	a5,0x4
    80007af8:	b3c78793          	addi	a5,a5,-1220 # 8000b630 <kmem>
    80007afc:	0007b483          	ld	s1,0(a5)
    80007b00:	02048063          	beqz	s1,80007b20 <kalloc+0x40>
    80007b04:	0004b703          	ld	a4,0(s1)
    80007b08:	00001637          	lui	a2,0x1
    80007b0c:	00500593          	li	a1,5
    80007b10:	00048513          	mv	a0,s1
    80007b14:	00e7b023          	sd	a4,0(a5)
    80007b18:	00000097          	auipc	ra,0x0
    80007b1c:	400080e7          	jalr	1024(ra) # 80007f18 <__memset>
    80007b20:	01813083          	ld	ra,24(sp)
    80007b24:	01013403          	ld	s0,16(sp)
    80007b28:	00048513          	mv	a0,s1
    80007b2c:	00813483          	ld	s1,8(sp)
    80007b30:	02010113          	addi	sp,sp,32
    80007b34:	00008067          	ret

0000000080007b38 <initlock>:
    80007b38:	ff010113          	addi	sp,sp,-16
    80007b3c:	00813423          	sd	s0,8(sp)
    80007b40:	01010413          	addi	s0,sp,16
    80007b44:	00813403          	ld	s0,8(sp)
    80007b48:	00b53423          	sd	a1,8(a0)
    80007b4c:	00052023          	sw	zero,0(a0)
    80007b50:	00053823          	sd	zero,16(a0)
    80007b54:	01010113          	addi	sp,sp,16
    80007b58:	00008067          	ret

0000000080007b5c <acquire>:
    80007b5c:	fe010113          	addi	sp,sp,-32
    80007b60:	00813823          	sd	s0,16(sp)
    80007b64:	00913423          	sd	s1,8(sp)
    80007b68:	00113c23          	sd	ra,24(sp)
    80007b6c:	01213023          	sd	s2,0(sp)
    80007b70:	02010413          	addi	s0,sp,32
    80007b74:	00050493          	mv	s1,a0
    80007b78:	10002973          	csrr	s2,sstatus
    80007b7c:	100027f3          	csrr	a5,sstatus
    80007b80:	ffd7f793          	andi	a5,a5,-3
    80007b84:	10079073          	csrw	sstatus,a5
    80007b88:	fffff097          	auipc	ra,0xfffff
    80007b8c:	8e8080e7          	jalr	-1816(ra) # 80006470 <mycpu>
    80007b90:	07852783          	lw	a5,120(a0)
    80007b94:	06078e63          	beqz	a5,80007c10 <acquire+0xb4>
    80007b98:	fffff097          	auipc	ra,0xfffff
    80007b9c:	8d8080e7          	jalr	-1832(ra) # 80006470 <mycpu>
    80007ba0:	07852783          	lw	a5,120(a0)
    80007ba4:	0004a703          	lw	a4,0(s1)
    80007ba8:	0017879b          	addiw	a5,a5,1
    80007bac:	06f52c23          	sw	a5,120(a0)
    80007bb0:	04071063          	bnez	a4,80007bf0 <acquire+0x94>
    80007bb4:	00100713          	li	a4,1
    80007bb8:	00070793          	mv	a5,a4
    80007bbc:	0cf4a7af          	amoswap.w.aq	a5,a5,(s1)
    80007bc0:	0007879b          	sext.w	a5,a5
    80007bc4:	fe079ae3          	bnez	a5,80007bb8 <acquire+0x5c>
    80007bc8:	0ff0000f          	fence
    80007bcc:	fffff097          	auipc	ra,0xfffff
    80007bd0:	8a4080e7          	jalr	-1884(ra) # 80006470 <mycpu>
    80007bd4:	01813083          	ld	ra,24(sp)
    80007bd8:	01013403          	ld	s0,16(sp)
    80007bdc:	00a4b823          	sd	a0,16(s1)
    80007be0:	00013903          	ld	s2,0(sp)
    80007be4:	00813483          	ld	s1,8(sp)
    80007be8:	02010113          	addi	sp,sp,32
    80007bec:	00008067          	ret
    80007bf0:	0104b903          	ld	s2,16(s1)
    80007bf4:	fffff097          	auipc	ra,0xfffff
    80007bf8:	87c080e7          	jalr	-1924(ra) # 80006470 <mycpu>
    80007bfc:	faa91ce3          	bne	s2,a0,80007bb4 <acquire+0x58>
    80007c00:	00002517          	auipc	a0,0x2
    80007c04:	a5050513          	addi	a0,a0,-1456 # 80009650 <digits+0x20>
    80007c08:	fffff097          	auipc	ra,0xfffff
    80007c0c:	224080e7          	jalr	548(ra) # 80006e2c <panic>
    80007c10:	00195913          	srli	s2,s2,0x1
    80007c14:	fffff097          	auipc	ra,0xfffff
    80007c18:	85c080e7          	jalr	-1956(ra) # 80006470 <mycpu>
    80007c1c:	00197913          	andi	s2,s2,1
    80007c20:	07252e23          	sw	s2,124(a0)
    80007c24:	f75ff06f          	j	80007b98 <acquire+0x3c>

0000000080007c28 <release>:
    80007c28:	fe010113          	addi	sp,sp,-32
    80007c2c:	00813823          	sd	s0,16(sp)
    80007c30:	00113c23          	sd	ra,24(sp)
    80007c34:	00913423          	sd	s1,8(sp)
    80007c38:	01213023          	sd	s2,0(sp)
    80007c3c:	02010413          	addi	s0,sp,32
    80007c40:	00052783          	lw	a5,0(a0)
    80007c44:	00079a63          	bnez	a5,80007c58 <release+0x30>
    80007c48:	00002517          	auipc	a0,0x2
    80007c4c:	a1050513          	addi	a0,a0,-1520 # 80009658 <digits+0x28>
    80007c50:	fffff097          	auipc	ra,0xfffff
    80007c54:	1dc080e7          	jalr	476(ra) # 80006e2c <panic>
    80007c58:	01053903          	ld	s2,16(a0)
    80007c5c:	00050493          	mv	s1,a0
    80007c60:	fffff097          	auipc	ra,0xfffff
    80007c64:	810080e7          	jalr	-2032(ra) # 80006470 <mycpu>
    80007c68:	fea910e3          	bne	s2,a0,80007c48 <release+0x20>
    80007c6c:	0004b823          	sd	zero,16(s1)
    80007c70:	0ff0000f          	fence
    80007c74:	0f50000f          	fence	iorw,ow
    80007c78:	0804a02f          	amoswap.w	zero,zero,(s1)
    80007c7c:	ffffe097          	auipc	ra,0xffffe
    80007c80:	7f4080e7          	jalr	2036(ra) # 80006470 <mycpu>
    80007c84:	100027f3          	csrr	a5,sstatus
    80007c88:	0027f793          	andi	a5,a5,2
    80007c8c:	04079a63          	bnez	a5,80007ce0 <release+0xb8>
    80007c90:	07852783          	lw	a5,120(a0)
    80007c94:	02f05e63          	blez	a5,80007cd0 <release+0xa8>
    80007c98:	fff7871b          	addiw	a4,a5,-1
    80007c9c:	06e52c23          	sw	a4,120(a0)
    80007ca0:	00071c63          	bnez	a4,80007cb8 <release+0x90>
    80007ca4:	07c52783          	lw	a5,124(a0)
    80007ca8:	00078863          	beqz	a5,80007cb8 <release+0x90>
    80007cac:	100027f3          	csrr	a5,sstatus
    80007cb0:	0027e793          	ori	a5,a5,2
    80007cb4:	10079073          	csrw	sstatus,a5
    80007cb8:	01813083          	ld	ra,24(sp)
    80007cbc:	01013403          	ld	s0,16(sp)
    80007cc0:	00813483          	ld	s1,8(sp)
    80007cc4:	00013903          	ld	s2,0(sp)
    80007cc8:	02010113          	addi	sp,sp,32
    80007ccc:	00008067          	ret
    80007cd0:	00002517          	auipc	a0,0x2
    80007cd4:	9a850513          	addi	a0,a0,-1624 # 80009678 <digits+0x48>
    80007cd8:	fffff097          	auipc	ra,0xfffff
    80007cdc:	154080e7          	jalr	340(ra) # 80006e2c <panic>
    80007ce0:	00002517          	auipc	a0,0x2
    80007ce4:	98050513          	addi	a0,a0,-1664 # 80009660 <digits+0x30>
    80007ce8:	fffff097          	auipc	ra,0xfffff
    80007cec:	144080e7          	jalr	324(ra) # 80006e2c <panic>

0000000080007cf0 <holding>:
    80007cf0:	00052783          	lw	a5,0(a0)
    80007cf4:	00079663          	bnez	a5,80007d00 <holding+0x10>
    80007cf8:	00000513          	li	a0,0
    80007cfc:	00008067          	ret
    80007d00:	fe010113          	addi	sp,sp,-32
    80007d04:	00813823          	sd	s0,16(sp)
    80007d08:	00913423          	sd	s1,8(sp)
    80007d0c:	00113c23          	sd	ra,24(sp)
    80007d10:	02010413          	addi	s0,sp,32
    80007d14:	01053483          	ld	s1,16(a0)
    80007d18:	ffffe097          	auipc	ra,0xffffe
    80007d1c:	758080e7          	jalr	1880(ra) # 80006470 <mycpu>
    80007d20:	01813083          	ld	ra,24(sp)
    80007d24:	01013403          	ld	s0,16(sp)
    80007d28:	40a48533          	sub	a0,s1,a0
    80007d2c:	00153513          	seqz	a0,a0
    80007d30:	00813483          	ld	s1,8(sp)
    80007d34:	02010113          	addi	sp,sp,32
    80007d38:	00008067          	ret

0000000080007d3c <push_off>:
    80007d3c:	fe010113          	addi	sp,sp,-32
    80007d40:	00813823          	sd	s0,16(sp)
    80007d44:	00113c23          	sd	ra,24(sp)
    80007d48:	00913423          	sd	s1,8(sp)
    80007d4c:	02010413          	addi	s0,sp,32
    80007d50:	100024f3          	csrr	s1,sstatus
    80007d54:	100027f3          	csrr	a5,sstatus
    80007d58:	ffd7f793          	andi	a5,a5,-3
    80007d5c:	10079073          	csrw	sstatus,a5
    80007d60:	ffffe097          	auipc	ra,0xffffe
    80007d64:	710080e7          	jalr	1808(ra) # 80006470 <mycpu>
    80007d68:	07852783          	lw	a5,120(a0)
    80007d6c:	02078663          	beqz	a5,80007d98 <push_off+0x5c>
    80007d70:	ffffe097          	auipc	ra,0xffffe
    80007d74:	700080e7          	jalr	1792(ra) # 80006470 <mycpu>
    80007d78:	07852783          	lw	a5,120(a0)
    80007d7c:	01813083          	ld	ra,24(sp)
    80007d80:	01013403          	ld	s0,16(sp)
    80007d84:	0017879b          	addiw	a5,a5,1
    80007d88:	06f52c23          	sw	a5,120(a0)
    80007d8c:	00813483          	ld	s1,8(sp)
    80007d90:	02010113          	addi	sp,sp,32
    80007d94:	00008067          	ret
    80007d98:	0014d493          	srli	s1,s1,0x1
    80007d9c:	ffffe097          	auipc	ra,0xffffe
    80007da0:	6d4080e7          	jalr	1748(ra) # 80006470 <mycpu>
    80007da4:	0014f493          	andi	s1,s1,1
    80007da8:	06952e23          	sw	s1,124(a0)
    80007dac:	fc5ff06f          	j	80007d70 <push_off+0x34>

0000000080007db0 <pop_off>:
    80007db0:	ff010113          	addi	sp,sp,-16
    80007db4:	00813023          	sd	s0,0(sp)
    80007db8:	00113423          	sd	ra,8(sp)
    80007dbc:	01010413          	addi	s0,sp,16
    80007dc0:	ffffe097          	auipc	ra,0xffffe
    80007dc4:	6b0080e7          	jalr	1712(ra) # 80006470 <mycpu>
    80007dc8:	100027f3          	csrr	a5,sstatus
    80007dcc:	0027f793          	andi	a5,a5,2
    80007dd0:	04079663          	bnez	a5,80007e1c <pop_off+0x6c>
    80007dd4:	07852783          	lw	a5,120(a0)
    80007dd8:	02f05a63          	blez	a5,80007e0c <pop_off+0x5c>
    80007ddc:	fff7871b          	addiw	a4,a5,-1
    80007de0:	06e52c23          	sw	a4,120(a0)
    80007de4:	00071c63          	bnez	a4,80007dfc <pop_off+0x4c>
    80007de8:	07c52783          	lw	a5,124(a0)
    80007dec:	00078863          	beqz	a5,80007dfc <pop_off+0x4c>
    80007df0:	100027f3          	csrr	a5,sstatus
    80007df4:	0027e793          	ori	a5,a5,2
    80007df8:	10079073          	csrw	sstatus,a5
    80007dfc:	00813083          	ld	ra,8(sp)
    80007e00:	00013403          	ld	s0,0(sp)
    80007e04:	01010113          	addi	sp,sp,16
    80007e08:	00008067          	ret
    80007e0c:	00002517          	auipc	a0,0x2
    80007e10:	86c50513          	addi	a0,a0,-1940 # 80009678 <digits+0x48>
    80007e14:	fffff097          	auipc	ra,0xfffff
    80007e18:	018080e7          	jalr	24(ra) # 80006e2c <panic>
    80007e1c:	00002517          	auipc	a0,0x2
    80007e20:	84450513          	addi	a0,a0,-1980 # 80009660 <digits+0x30>
    80007e24:	fffff097          	auipc	ra,0xfffff
    80007e28:	008080e7          	jalr	8(ra) # 80006e2c <panic>

0000000080007e2c <push_on>:
    80007e2c:	fe010113          	addi	sp,sp,-32
    80007e30:	00813823          	sd	s0,16(sp)
    80007e34:	00113c23          	sd	ra,24(sp)
    80007e38:	00913423          	sd	s1,8(sp)
    80007e3c:	02010413          	addi	s0,sp,32
    80007e40:	100024f3          	csrr	s1,sstatus
    80007e44:	100027f3          	csrr	a5,sstatus
    80007e48:	0027e793          	ori	a5,a5,2
    80007e4c:	10079073          	csrw	sstatus,a5
    80007e50:	ffffe097          	auipc	ra,0xffffe
    80007e54:	620080e7          	jalr	1568(ra) # 80006470 <mycpu>
    80007e58:	07852783          	lw	a5,120(a0)
    80007e5c:	02078663          	beqz	a5,80007e88 <push_on+0x5c>
    80007e60:	ffffe097          	auipc	ra,0xffffe
    80007e64:	610080e7          	jalr	1552(ra) # 80006470 <mycpu>
    80007e68:	07852783          	lw	a5,120(a0)
    80007e6c:	01813083          	ld	ra,24(sp)
    80007e70:	01013403          	ld	s0,16(sp)
    80007e74:	0017879b          	addiw	a5,a5,1
    80007e78:	06f52c23          	sw	a5,120(a0)
    80007e7c:	00813483          	ld	s1,8(sp)
    80007e80:	02010113          	addi	sp,sp,32
    80007e84:	00008067          	ret
    80007e88:	0014d493          	srli	s1,s1,0x1
    80007e8c:	ffffe097          	auipc	ra,0xffffe
    80007e90:	5e4080e7          	jalr	1508(ra) # 80006470 <mycpu>
    80007e94:	0014f493          	andi	s1,s1,1
    80007e98:	06952e23          	sw	s1,124(a0)
    80007e9c:	fc5ff06f          	j	80007e60 <push_on+0x34>

0000000080007ea0 <pop_on>:
    80007ea0:	ff010113          	addi	sp,sp,-16
    80007ea4:	00813023          	sd	s0,0(sp)
    80007ea8:	00113423          	sd	ra,8(sp)
    80007eac:	01010413          	addi	s0,sp,16
    80007eb0:	ffffe097          	auipc	ra,0xffffe
    80007eb4:	5c0080e7          	jalr	1472(ra) # 80006470 <mycpu>
    80007eb8:	100027f3          	csrr	a5,sstatus
    80007ebc:	0027f793          	andi	a5,a5,2
    80007ec0:	04078463          	beqz	a5,80007f08 <pop_on+0x68>
    80007ec4:	07852783          	lw	a5,120(a0)
    80007ec8:	02f05863          	blez	a5,80007ef8 <pop_on+0x58>
    80007ecc:	fff7879b          	addiw	a5,a5,-1
    80007ed0:	06f52c23          	sw	a5,120(a0)
    80007ed4:	07853783          	ld	a5,120(a0)
    80007ed8:	00079863          	bnez	a5,80007ee8 <pop_on+0x48>
    80007edc:	100027f3          	csrr	a5,sstatus
    80007ee0:	ffd7f793          	andi	a5,a5,-3
    80007ee4:	10079073          	csrw	sstatus,a5
    80007ee8:	00813083          	ld	ra,8(sp)
    80007eec:	00013403          	ld	s0,0(sp)
    80007ef0:	01010113          	addi	sp,sp,16
    80007ef4:	00008067          	ret
    80007ef8:	00001517          	auipc	a0,0x1
    80007efc:	7a850513          	addi	a0,a0,1960 # 800096a0 <digits+0x70>
    80007f00:	fffff097          	auipc	ra,0xfffff
    80007f04:	f2c080e7          	jalr	-212(ra) # 80006e2c <panic>
    80007f08:	00001517          	auipc	a0,0x1
    80007f0c:	77850513          	addi	a0,a0,1912 # 80009680 <digits+0x50>
    80007f10:	fffff097          	auipc	ra,0xfffff
    80007f14:	f1c080e7          	jalr	-228(ra) # 80006e2c <panic>

0000000080007f18 <__memset>:
    80007f18:	ff010113          	addi	sp,sp,-16
    80007f1c:	00813423          	sd	s0,8(sp)
    80007f20:	01010413          	addi	s0,sp,16
    80007f24:	1a060e63          	beqz	a2,800080e0 <__memset+0x1c8>
    80007f28:	40a007b3          	neg	a5,a0
    80007f2c:	0077f793          	andi	a5,a5,7
    80007f30:	00778693          	addi	a3,a5,7
    80007f34:	00b00813          	li	a6,11
    80007f38:	0ff5f593          	andi	a1,a1,255
    80007f3c:	fff6071b          	addiw	a4,a2,-1
    80007f40:	1b06e663          	bltu	a3,a6,800080ec <__memset+0x1d4>
    80007f44:	1cd76463          	bltu	a4,a3,8000810c <__memset+0x1f4>
    80007f48:	1a078e63          	beqz	a5,80008104 <__memset+0x1ec>
    80007f4c:	00b50023          	sb	a1,0(a0)
    80007f50:	00100713          	li	a4,1
    80007f54:	1ae78463          	beq	a5,a4,800080fc <__memset+0x1e4>
    80007f58:	00b500a3          	sb	a1,1(a0)
    80007f5c:	00200713          	li	a4,2
    80007f60:	1ae78a63          	beq	a5,a4,80008114 <__memset+0x1fc>
    80007f64:	00b50123          	sb	a1,2(a0)
    80007f68:	00300713          	li	a4,3
    80007f6c:	18e78463          	beq	a5,a4,800080f4 <__memset+0x1dc>
    80007f70:	00b501a3          	sb	a1,3(a0)
    80007f74:	00400713          	li	a4,4
    80007f78:	1ae78263          	beq	a5,a4,8000811c <__memset+0x204>
    80007f7c:	00b50223          	sb	a1,4(a0)
    80007f80:	00500713          	li	a4,5
    80007f84:	1ae78063          	beq	a5,a4,80008124 <__memset+0x20c>
    80007f88:	00b502a3          	sb	a1,5(a0)
    80007f8c:	00700713          	li	a4,7
    80007f90:	18e79e63          	bne	a5,a4,8000812c <__memset+0x214>
    80007f94:	00b50323          	sb	a1,6(a0)
    80007f98:	00700e93          	li	t4,7
    80007f9c:	00859713          	slli	a4,a1,0x8
    80007fa0:	00e5e733          	or	a4,a1,a4
    80007fa4:	01059e13          	slli	t3,a1,0x10
    80007fa8:	01c76e33          	or	t3,a4,t3
    80007fac:	01859313          	slli	t1,a1,0x18
    80007fb0:	006e6333          	or	t1,t3,t1
    80007fb4:	02059893          	slli	a7,a1,0x20
    80007fb8:	40f60e3b          	subw	t3,a2,a5
    80007fbc:	011368b3          	or	a7,t1,a7
    80007fc0:	02859813          	slli	a6,a1,0x28
    80007fc4:	0108e833          	or	a6,a7,a6
    80007fc8:	03059693          	slli	a3,a1,0x30
    80007fcc:	003e589b          	srliw	a7,t3,0x3
    80007fd0:	00d866b3          	or	a3,a6,a3
    80007fd4:	03859713          	slli	a4,a1,0x38
    80007fd8:	00389813          	slli	a6,a7,0x3
    80007fdc:	00f507b3          	add	a5,a0,a5
    80007fe0:	00e6e733          	or	a4,a3,a4
    80007fe4:	000e089b          	sext.w	a7,t3
    80007fe8:	00f806b3          	add	a3,a6,a5
    80007fec:	00e7b023          	sd	a4,0(a5)
    80007ff0:	00878793          	addi	a5,a5,8
    80007ff4:	fed79ce3          	bne	a5,a3,80007fec <__memset+0xd4>
    80007ff8:	ff8e7793          	andi	a5,t3,-8
    80007ffc:	0007871b          	sext.w	a4,a5
    80008000:	01d787bb          	addw	a5,a5,t4
    80008004:	0ce88e63          	beq	a7,a4,800080e0 <__memset+0x1c8>
    80008008:	00f50733          	add	a4,a0,a5
    8000800c:	00b70023          	sb	a1,0(a4)
    80008010:	0017871b          	addiw	a4,a5,1
    80008014:	0cc77663          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    80008018:	00e50733          	add	a4,a0,a4
    8000801c:	00b70023          	sb	a1,0(a4)
    80008020:	0027871b          	addiw	a4,a5,2
    80008024:	0ac77e63          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    80008028:	00e50733          	add	a4,a0,a4
    8000802c:	00b70023          	sb	a1,0(a4)
    80008030:	0037871b          	addiw	a4,a5,3
    80008034:	0ac77663          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    80008038:	00e50733          	add	a4,a0,a4
    8000803c:	00b70023          	sb	a1,0(a4)
    80008040:	0047871b          	addiw	a4,a5,4
    80008044:	08c77e63          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    80008048:	00e50733          	add	a4,a0,a4
    8000804c:	00b70023          	sb	a1,0(a4)
    80008050:	0057871b          	addiw	a4,a5,5
    80008054:	08c77663          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    80008058:	00e50733          	add	a4,a0,a4
    8000805c:	00b70023          	sb	a1,0(a4)
    80008060:	0067871b          	addiw	a4,a5,6
    80008064:	06c77e63          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    80008068:	00e50733          	add	a4,a0,a4
    8000806c:	00b70023          	sb	a1,0(a4)
    80008070:	0077871b          	addiw	a4,a5,7
    80008074:	06c77663          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    80008078:	00e50733          	add	a4,a0,a4
    8000807c:	00b70023          	sb	a1,0(a4)
    80008080:	0087871b          	addiw	a4,a5,8
    80008084:	04c77e63          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    80008088:	00e50733          	add	a4,a0,a4
    8000808c:	00b70023          	sb	a1,0(a4)
    80008090:	0097871b          	addiw	a4,a5,9
    80008094:	04c77663          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    80008098:	00e50733          	add	a4,a0,a4
    8000809c:	00b70023          	sb	a1,0(a4)
    800080a0:	00a7871b          	addiw	a4,a5,10
    800080a4:	02c77e63          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    800080a8:	00e50733          	add	a4,a0,a4
    800080ac:	00b70023          	sb	a1,0(a4)
    800080b0:	00b7871b          	addiw	a4,a5,11
    800080b4:	02c77663          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    800080b8:	00e50733          	add	a4,a0,a4
    800080bc:	00b70023          	sb	a1,0(a4)
    800080c0:	00c7871b          	addiw	a4,a5,12
    800080c4:	00c77e63          	bgeu	a4,a2,800080e0 <__memset+0x1c8>
    800080c8:	00e50733          	add	a4,a0,a4
    800080cc:	00b70023          	sb	a1,0(a4)
    800080d0:	00d7879b          	addiw	a5,a5,13
    800080d4:	00c7f663          	bgeu	a5,a2,800080e0 <__memset+0x1c8>
    800080d8:	00f507b3          	add	a5,a0,a5
    800080dc:	00b78023          	sb	a1,0(a5)
    800080e0:	00813403          	ld	s0,8(sp)
    800080e4:	01010113          	addi	sp,sp,16
    800080e8:	00008067          	ret
    800080ec:	00b00693          	li	a3,11
    800080f0:	e55ff06f          	j	80007f44 <__memset+0x2c>
    800080f4:	00300e93          	li	t4,3
    800080f8:	ea5ff06f          	j	80007f9c <__memset+0x84>
    800080fc:	00100e93          	li	t4,1
    80008100:	e9dff06f          	j	80007f9c <__memset+0x84>
    80008104:	00000e93          	li	t4,0
    80008108:	e95ff06f          	j	80007f9c <__memset+0x84>
    8000810c:	00000793          	li	a5,0
    80008110:	ef9ff06f          	j	80008008 <__memset+0xf0>
    80008114:	00200e93          	li	t4,2
    80008118:	e85ff06f          	j	80007f9c <__memset+0x84>
    8000811c:	00400e93          	li	t4,4
    80008120:	e7dff06f          	j	80007f9c <__memset+0x84>
    80008124:	00500e93          	li	t4,5
    80008128:	e75ff06f          	j	80007f9c <__memset+0x84>
    8000812c:	00600e93          	li	t4,6
    80008130:	e6dff06f          	j	80007f9c <__memset+0x84>

0000000080008134 <__memmove>:
    80008134:	ff010113          	addi	sp,sp,-16
    80008138:	00813423          	sd	s0,8(sp)
    8000813c:	01010413          	addi	s0,sp,16
    80008140:	0e060863          	beqz	a2,80008230 <__memmove+0xfc>
    80008144:	fff6069b          	addiw	a3,a2,-1
    80008148:	0006881b          	sext.w	a6,a3
    8000814c:	0ea5e863          	bltu	a1,a0,8000823c <__memmove+0x108>
    80008150:	00758713          	addi	a4,a1,7
    80008154:	00a5e7b3          	or	a5,a1,a0
    80008158:	40a70733          	sub	a4,a4,a0
    8000815c:	0077f793          	andi	a5,a5,7
    80008160:	00f73713          	sltiu	a4,a4,15
    80008164:	00174713          	xori	a4,a4,1
    80008168:	0017b793          	seqz	a5,a5
    8000816c:	00e7f7b3          	and	a5,a5,a4
    80008170:	10078863          	beqz	a5,80008280 <__memmove+0x14c>
    80008174:	00900793          	li	a5,9
    80008178:	1107f463          	bgeu	a5,a6,80008280 <__memmove+0x14c>
    8000817c:	0036581b          	srliw	a6,a2,0x3
    80008180:	fff8081b          	addiw	a6,a6,-1
    80008184:	02081813          	slli	a6,a6,0x20
    80008188:	01d85893          	srli	a7,a6,0x1d
    8000818c:	00858813          	addi	a6,a1,8
    80008190:	00058793          	mv	a5,a1
    80008194:	00050713          	mv	a4,a0
    80008198:	01088833          	add	a6,a7,a6
    8000819c:	0007b883          	ld	a7,0(a5)
    800081a0:	00878793          	addi	a5,a5,8
    800081a4:	00870713          	addi	a4,a4,8
    800081a8:	ff173c23          	sd	a7,-8(a4)
    800081ac:	ff0798e3          	bne	a5,a6,8000819c <__memmove+0x68>
    800081b0:	ff867713          	andi	a4,a2,-8
    800081b4:	02071793          	slli	a5,a4,0x20
    800081b8:	0207d793          	srli	a5,a5,0x20
    800081bc:	00f585b3          	add	a1,a1,a5
    800081c0:	40e686bb          	subw	a3,a3,a4
    800081c4:	00f507b3          	add	a5,a0,a5
    800081c8:	06e60463          	beq	a2,a4,80008230 <__memmove+0xfc>
    800081cc:	0005c703          	lbu	a4,0(a1)
    800081d0:	00e78023          	sb	a4,0(a5)
    800081d4:	04068e63          	beqz	a3,80008230 <__memmove+0xfc>
    800081d8:	0015c603          	lbu	a2,1(a1)
    800081dc:	00100713          	li	a4,1
    800081e0:	00c780a3          	sb	a2,1(a5)
    800081e4:	04e68663          	beq	a3,a4,80008230 <__memmove+0xfc>
    800081e8:	0025c603          	lbu	a2,2(a1)
    800081ec:	00200713          	li	a4,2
    800081f0:	00c78123          	sb	a2,2(a5)
    800081f4:	02e68e63          	beq	a3,a4,80008230 <__memmove+0xfc>
    800081f8:	0035c603          	lbu	a2,3(a1)
    800081fc:	00300713          	li	a4,3
    80008200:	00c781a3          	sb	a2,3(a5)
    80008204:	02e68663          	beq	a3,a4,80008230 <__memmove+0xfc>
    80008208:	0045c603          	lbu	a2,4(a1)
    8000820c:	00400713          	li	a4,4
    80008210:	00c78223          	sb	a2,4(a5)
    80008214:	00e68e63          	beq	a3,a4,80008230 <__memmove+0xfc>
    80008218:	0055c603          	lbu	a2,5(a1)
    8000821c:	00500713          	li	a4,5
    80008220:	00c782a3          	sb	a2,5(a5)
    80008224:	00e68663          	beq	a3,a4,80008230 <__memmove+0xfc>
    80008228:	0065c703          	lbu	a4,6(a1)
    8000822c:	00e78323          	sb	a4,6(a5)
    80008230:	00813403          	ld	s0,8(sp)
    80008234:	01010113          	addi	sp,sp,16
    80008238:	00008067          	ret
    8000823c:	02061713          	slli	a4,a2,0x20
    80008240:	02075713          	srli	a4,a4,0x20
    80008244:	00e587b3          	add	a5,a1,a4
    80008248:	f0f574e3          	bgeu	a0,a5,80008150 <__memmove+0x1c>
    8000824c:	02069613          	slli	a2,a3,0x20
    80008250:	02065613          	srli	a2,a2,0x20
    80008254:	fff64613          	not	a2,a2
    80008258:	00e50733          	add	a4,a0,a4
    8000825c:	00c78633          	add	a2,a5,a2
    80008260:	fff7c683          	lbu	a3,-1(a5)
    80008264:	fff78793          	addi	a5,a5,-1
    80008268:	fff70713          	addi	a4,a4,-1
    8000826c:	00d70023          	sb	a3,0(a4)
    80008270:	fec798e3          	bne	a5,a2,80008260 <__memmove+0x12c>
    80008274:	00813403          	ld	s0,8(sp)
    80008278:	01010113          	addi	sp,sp,16
    8000827c:	00008067          	ret
    80008280:	02069713          	slli	a4,a3,0x20
    80008284:	02075713          	srli	a4,a4,0x20
    80008288:	00170713          	addi	a4,a4,1
    8000828c:	00e50733          	add	a4,a0,a4
    80008290:	00050793          	mv	a5,a0
    80008294:	0005c683          	lbu	a3,0(a1)
    80008298:	00178793          	addi	a5,a5,1
    8000829c:	00158593          	addi	a1,a1,1
    800082a0:	fed78fa3          	sb	a3,-1(a5)
    800082a4:	fee798e3          	bne	a5,a4,80008294 <__memmove+0x160>
    800082a8:	f89ff06f          	j	80008230 <__memmove+0xfc>

00000000800082ac <__mem_free>:
    800082ac:	ff010113          	addi	sp,sp,-16
    800082b0:	00813423          	sd	s0,8(sp)
    800082b4:	01010413          	addi	s0,sp,16
    800082b8:	00003597          	auipc	a1,0x3
    800082bc:	38058593          	addi	a1,a1,896 # 8000b638 <freep>
    800082c0:	0005b783          	ld	a5,0(a1)
    800082c4:	ff050693          	addi	a3,a0,-16
    800082c8:	0007b703          	ld	a4,0(a5)
    800082cc:	00d7fc63          	bgeu	a5,a3,800082e4 <__mem_free+0x38>
    800082d0:	00e6ee63          	bltu	a3,a4,800082ec <__mem_free+0x40>
    800082d4:	00e7fc63          	bgeu	a5,a4,800082ec <__mem_free+0x40>
    800082d8:	00070793          	mv	a5,a4
    800082dc:	0007b703          	ld	a4,0(a5)
    800082e0:	fed7e8e3          	bltu	a5,a3,800082d0 <__mem_free+0x24>
    800082e4:	fee7eae3          	bltu	a5,a4,800082d8 <__mem_free+0x2c>
    800082e8:	fee6f8e3          	bgeu	a3,a4,800082d8 <__mem_free+0x2c>
    800082ec:	ff852803          	lw	a6,-8(a0)
    800082f0:	02081613          	slli	a2,a6,0x20
    800082f4:	01c65613          	srli	a2,a2,0x1c
    800082f8:	00c68633          	add	a2,a3,a2
    800082fc:	02c70a63          	beq	a4,a2,80008330 <__mem_free+0x84>
    80008300:	fee53823          	sd	a4,-16(a0)
    80008304:	0087a503          	lw	a0,8(a5)
    80008308:	02051613          	slli	a2,a0,0x20
    8000830c:	01c65613          	srli	a2,a2,0x1c
    80008310:	00c78633          	add	a2,a5,a2
    80008314:	04c68263          	beq	a3,a2,80008358 <__mem_free+0xac>
    80008318:	00813403          	ld	s0,8(sp)
    8000831c:	00d7b023          	sd	a3,0(a5)
    80008320:	00f5b023          	sd	a5,0(a1)
    80008324:	00000513          	li	a0,0
    80008328:	01010113          	addi	sp,sp,16
    8000832c:	00008067          	ret
    80008330:	00872603          	lw	a2,8(a4)
    80008334:	00073703          	ld	a4,0(a4)
    80008338:	0106083b          	addw	a6,a2,a6
    8000833c:	ff052c23          	sw	a6,-8(a0)
    80008340:	fee53823          	sd	a4,-16(a0)
    80008344:	0087a503          	lw	a0,8(a5)
    80008348:	02051613          	slli	a2,a0,0x20
    8000834c:	01c65613          	srli	a2,a2,0x1c
    80008350:	00c78633          	add	a2,a5,a2
    80008354:	fcc692e3          	bne	a3,a2,80008318 <__mem_free+0x6c>
    80008358:	00813403          	ld	s0,8(sp)
    8000835c:	0105053b          	addw	a0,a0,a6
    80008360:	00a7a423          	sw	a0,8(a5)
    80008364:	00e7b023          	sd	a4,0(a5)
    80008368:	00f5b023          	sd	a5,0(a1)
    8000836c:	00000513          	li	a0,0
    80008370:	01010113          	addi	sp,sp,16
    80008374:	00008067          	ret

0000000080008378 <__mem_alloc>:
    80008378:	fc010113          	addi	sp,sp,-64
    8000837c:	02813823          	sd	s0,48(sp)
    80008380:	02913423          	sd	s1,40(sp)
    80008384:	03213023          	sd	s2,32(sp)
    80008388:	01513423          	sd	s5,8(sp)
    8000838c:	02113c23          	sd	ra,56(sp)
    80008390:	01313c23          	sd	s3,24(sp)
    80008394:	01413823          	sd	s4,16(sp)
    80008398:	01613023          	sd	s6,0(sp)
    8000839c:	04010413          	addi	s0,sp,64
    800083a0:	00003a97          	auipc	s5,0x3
    800083a4:	298a8a93          	addi	s5,s5,664 # 8000b638 <freep>
    800083a8:	00f50913          	addi	s2,a0,15
    800083ac:	000ab683          	ld	a3,0(s5)
    800083b0:	00495913          	srli	s2,s2,0x4
    800083b4:	0019049b          	addiw	s1,s2,1
    800083b8:	00048913          	mv	s2,s1
    800083bc:	0c068c63          	beqz	a3,80008494 <__mem_alloc+0x11c>
    800083c0:	0006b503          	ld	a0,0(a3)
    800083c4:	00852703          	lw	a4,8(a0)
    800083c8:	10977063          	bgeu	a4,s1,800084c8 <__mem_alloc+0x150>
    800083cc:	000017b7          	lui	a5,0x1
    800083d0:	0009099b          	sext.w	s3,s2
    800083d4:	0af4e863          	bltu	s1,a5,80008484 <__mem_alloc+0x10c>
    800083d8:	02099a13          	slli	s4,s3,0x20
    800083dc:	01ca5a13          	srli	s4,s4,0x1c
    800083e0:	fff00b13          	li	s6,-1
    800083e4:	0100006f          	j	800083f4 <__mem_alloc+0x7c>
    800083e8:	0007b503          	ld	a0,0(a5) # 1000 <_entry-0x7ffff000>
    800083ec:	00852703          	lw	a4,8(a0)
    800083f0:	04977463          	bgeu	a4,s1,80008438 <__mem_alloc+0xc0>
    800083f4:	00050793          	mv	a5,a0
    800083f8:	fea698e3          	bne	a3,a0,800083e8 <__mem_alloc+0x70>
    800083fc:	000a0513          	mv	a0,s4
    80008400:	00000097          	auipc	ra,0x0
    80008404:	1f0080e7          	jalr	496(ra) # 800085f0 <kvmincrease>
    80008408:	00050793          	mv	a5,a0
    8000840c:	01050513          	addi	a0,a0,16
    80008410:	07678e63          	beq	a5,s6,8000848c <__mem_alloc+0x114>
    80008414:	0137a423          	sw	s3,8(a5)
    80008418:	00000097          	auipc	ra,0x0
    8000841c:	e94080e7          	jalr	-364(ra) # 800082ac <__mem_free>
    80008420:	000ab783          	ld	a5,0(s5)
    80008424:	06078463          	beqz	a5,8000848c <__mem_alloc+0x114>
    80008428:	0007b503          	ld	a0,0(a5)
    8000842c:	00078693          	mv	a3,a5
    80008430:	00852703          	lw	a4,8(a0)
    80008434:	fc9760e3          	bltu	a4,s1,800083f4 <__mem_alloc+0x7c>
    80008438:	08e48263          	beq	s1,a4,800084bc <__mem_alloc+0x144>
    8000843c:	4127073b          	subw	a4,a4,s2
    80008440:	02071693          	slli	a3,a4,0x20
    80008444:	01c6d693          	srli	a3,a3,0x1c
    80008448:	00e52423          	sw	a4,8(a0)
    8000844c:	00d50533          	add	a0,a0,a3
    80008450:	01252423          	sw	s2,8(a0)
    80008454:	00fab023          	sd	a5,0(s5)
    80008458:	01050513          	addi	a0,a0,16
    8000845c:	03813083          	ld	ra,56(sp)
    80008460:	03013403          	ld	s0,48(sp)
    80008464:	02813483          	ld	s1,40(sp)
    80008468:	02013903          	ld	s2,32(sp)
    8000846c:	01813983          	ld	s3,24(sp)
    80008470:	01013a03          	ld	s4,16(sp)
    80008474:	00813a83          	ld	s5,8(sp)
    80008478:	00013b03          	ld	s6,0(sp)
    8000847c:	04010113          	addi	sp,sp,64
    80008480:	00008067          	ret
    80008484:	000019b7          	lui	s3,0x1
    80008488:	f51ff06f          	j	800083d8 <__mem_alloc+0x60>
    8000848c:	00000513          	li	a0,0
    80008490:	fcdff06f          	j	8000845c <__mem_alloc+0xe4>
    80008494:	00004797          	auipc	a5,0x4
    80008498:	4ac78793          	addi	a5,a5,1196 # 8000c940 <base>
    8000849c:	00078513          	mv	a0,a5
    800084a0:	00fab023          	sd	a5,0(s5)
    800084a4:	00f7b023          	sd	a5,0(a5)
    800084a8:	00000713          	li	a4,0
    800084ac:	00004797          	auipc	a5,0x4
    800084b0:	4807ae23          	sw	zero,1180(a5) # 8000c948 <base+0x8>
    800084b4:	00050693          	mv	a3,a0
    800084b8:	f11ff06f          	j	800083c8 <__mem_alloc+0x50>
    800084bc:	00053703          	ld	a4,0(a0)
    800084c0:	00e7b023          	sd	a4,0(a5)
    800084c4:	f91ff06f          	j	80008454 <__mem_alloc+0xdc>
    800084c8:	00068793          	mv	a5,a3
    800084cc:	f6dff06f          	j	80008438 <__mem_alloc+0xc0>

00000000800084d0 <__putc>:
    800084d0:	fe010113          	addi	sp,sp,-32
    800084d4:	00813823          	sd	s0,16(sp)
    800084d8:	00113c23          	sd	ra,24(sp)
    800084dc:	02010413          	addi	s0,sp,32
    800084e0:	00050793          	mv	a5,a0
    800084e4:	fef40593          	addi	a1,s0,-17
    800084e8:	00100613          	li	a2,1
    800084ec:	00000513          	li	a0,0
    800084f0:	fef407a3          	sb	a5,-17(s0)
    800084f4:	fffff097          	auipc	ra,0xfffff
    800084f8:	918080e7          	jalr	-1768(ra) # 80006e0c <console_write>
    800084fc:	01813083          	ld	ra,24(sp)
    80008500:	01013403          	ld	s0,16(sp)
    80008504:	02010113          	addi	sp,sp,32
    80008508:	00008067          	ret

000000008000850c <__getc>:
    8000850c:	fe010113          	addi	sp,sp,-32
    80008510:	00813823          	sd	s0,16(sp)
    80008514:	00113c23          	sd	ra,24(sp)
    80008518:	02010413          	addi	s0,sp,32
    8000851c:	fe840593          	addi	a1,s0,-24
    80008520:	00100613          	li	a2,1
    80008524:	00000513          	li	a0,0
    80008528:	fffff097          	auipc	ra,0xfffff
    8000852c:	8c4080e7          	jalr	-1852(ra) # 80006dec <console_read>
    80008530:	fe844503          	lbu	a0,-24(s0)
    80008534:	01813083          	ld	ra,24(sp)
    80008538:	01013403          	ld	s0,16(sp)
    8000853c:	02010113          	addi	sp,sp,32
    80008540:	00008067          	ret

0000000080008544 <console_handler>:
    80008544:	fe010113          	addi	sp,sp,-32
    80008548:	00813823          	sd	s0,16(sp)
    8000854c:	00113c23          	sd	ra,24(sp)
    80008550:	00913423          	sd	s1,8(sp)
    80008554:	02010413          	addi	s0,sp,32
    80008558:	14202773          	csrr	a4,scause
    8000855c:	100027f3          	csrr	a5,sstatus
    80008560:	0027f793          	andi	a5,a5,2
    80008564:	06079e63          	bnez	a5,800085e0 <console_handler+0x9c>
    80008568:	00074c63          	bltz	a4,80008580 <console_handler+0x3c>
    8000856c:	01813083          	ld	ra,24(sp)
    80008570:	01013403          	ld	s0,16(sp)
    80008574:	00813483          	ld	s1,8(sp)
    80008578:	02010113          	addi	sp,sp,32
    8000857c:	00008067          	ret
    80008580:	0ff77713          	andi	a4,a4,255
    80008584:	00900793          	li	a5,9
    80008588:	fef712e3          	bne	a4,a5,8000856c <console_handler+0x28>
    8000858c:	ffffe097          	auipc	ra,0xffffe
    80008590:	4b8080e7          	jalr	1208(ra) # 80006a44 <plic_claim>
    80008594:	00a00793          	li	a5,10
    80008598:	00050493          	mv	s1,a0
    8000859c:	02f50c63          	beq	a0,a5,800085d4 <console_handler+0x90>
    800085a0:	fc0506e3          	beqz	a0,8000856c <console_handler+0x28>
    800085a4:	00050593          	mv	a1,a0
    800085a8:	00001517          	auipc	a0,0x1
    800085ac:	00050513          	mv	a0,a0
    800085b0:	fffff097          	auipc	ra,0xfffff
    800085b4:	8d8080e7          	jalr	-1832(ra) # 80006e88 <__printf>
    800085b8:	01013403          	ld	s0,16(sp)
    800085bc:	01813083          	ld	ra,24(sp)
    800085c0:	00048513          	mv	a0,s1
    800085c4:	00813483          	ld	s1,8(sp)
    800085c8:	02010113          	addi	sp,sp,32
    800085cc:	ffffe317          	auipc	t1,0xffffe
    800085d0:	4b030067          	jr	1200(t1) # 80006a7c <plic_complete>
    800085d4:	fffff097          	auipc	ra,0xfffff
    800085d8:	1bc080e7          	jalr	444(ra) # 80007790 <uartintr>
    800085dc:	fddff06f          	j	800085b8 <console_handler+0x74>
    800085e0:	00001517          	auipc	a0,0x1
    800085e4:	0c850513          	addi	a0,a0,200 # 800096a8 <digits+0x78>
    800085e8:	fffff097          	auipc	ra,0xfffff
    800085ec:	844080e7          	jalr	-1980(ra) # 80006e2c <panic>

00000000800085f0 <kvmincrease>:
    800085f0:	fe010113          	addi	sp,sp,-32
    800085f4:	01213023          	sd	s2,0(sp)
    800085f8:	00001937          	lui	s2,0x1
    800085fc:	fff90913          	addi	s2,s2,-1 # fff <_entry-0x7ffff001>
    80008600:	00813823          	sd	s0,16(sp)
    80008604:	00113c23          	sd	ra,24(sp)
    80008608:	00913423          	sd	s1,8(sp)
    8000860c:	02010413          	addi	s0,sp,32
    80008610:	01250933          	add	s2,a0,s2
    80008614:	00c95913          	srli	s2,s2,0xc
    80008618:	02090863          	beqz	s2,80008648 <kvmincrease+0x58>
    8000861c:	00000493          	li	s1,0
    80008620:	00148493          	addi	s1,s1,1
    80008624:	fffff097          	auipc	ra,0xfffff
    80008628:	4bc080e7          	jalr	1212(ra) # 80007ae0 <kalloc>
    8000862c:	fe991ae3          	bne	s2,s1,80008620 <kvmincrease+0x30>
    80008630:	01813083          	ld	ra,24(sp)
    80008634:	01013403          	ld	s0,16(sp)
    80008638:	00813483          	ld	s1,8(sp)
    8000863c:	00013903          	ld	s2,0(sp)
    80008640:	02010113          	addi	sp,sp,32
    80008644:	00008067          	ret
    80008648:	01813083          	ld	ra,24(sp)
    8000864c:	01013403          	ld	s0,16(sp)
    80008650:	00813483          	ld	s1,8(sp)
    80008654:	00013903          	ld	s2,0(sp)
    80008658:	00000513          	li	a0,0
    8000865c:	02010113          	addi	sp,sp,32
    80008660:	00008067          	ret
	...
