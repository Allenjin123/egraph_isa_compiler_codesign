	.file	"basicmath_small.c"
	.option nopic
	.option norelax
	.attribute arch, "rv32i2p1_m2p0_zicsr2p0_zifencei2p0_zmmul1p0"
	.attribute unaligned_access, 0
	.attribute stack_align, 16
	.text
	.align	2
	.type	my_cos, @function
my_cos:
.L3:
.L1:
.L2:
	.size	my_cos, .-my_cos
	.align	2
	.type	SolveCubic, @function
SolveCubic:
.L12:
.L24:
	addi	a3,a2,0
.L26:
.L28:
.L27:
.L25:
.L29:
.L10:
.L13:
.L20:
.L18:
.L19:
.L14:
.L22:
.L21:
.L53:
.L55:
.L52:
.L11:
.L54:
.L30:
.L56:
.L57:
.L33:
.L17:
.L32:
	.size	SolveCubic, .-SolveCubic
	.section	.rodata.str1.4,"aMS",@progbits,1
	.align	2
.LC0:
	.string	"********* CUBIC FUNCTIONS ***********"
	.align	2
.LC1:
	.string	"Solutions:"
	.align	2
.LC2:
	.string	" %ld.%03ld"
	.align	2
.LC3:
	.string	"********* INTEGER SQR ROOTS ***********"
	.align	2
.LC4:
	.string	"sqrt(%3d) = %2d\n"
	.align	2
.LC5:
	.string	"\nsqrt(%lX) = %X\n"
	.align	2
.LC6:
	.string	"********* ANGLE CONVERSION ***********"
	.align	2
.LC7:
	.string	"%3ld degrees = %ld.%03ld radians\n"
	.align	2
.LC8:
	.string	"%ld.%03ld radians = %3ld degrees\n"
	.section	.text.startup,"ax",@progbits
	.align	2
	.globl	main
	.type	main, @function
main:
.L60:
.L59:
.L62:
.L61:
.L64:
.L63:
.L66:
	jal	x0,.L66
.L65:
.L67:
.L75:
.L73:
.L70:
.L69:
.L68:
.L78:
.L77:
.L76:
	addi	a1,s2,0
	addi	a0,s3,0
.L80:
.L79:
.L81:
.L82:
	.size	main, .-main
	.ident	"GCC: (g1b306039a) 15.1.0"
	.section	.note.GNU-stack,"",@progbits


    .text
    .align 2
__mul:
.Mul_loop:
.Mul_skip:

.text
.align 2

# Signed 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_divsi3
__riscv_div_lib_divsi3:
	jal	x0,__riscv_div_lib_L10
    # Since the quotient is positive, fall into udivsi3

# Unsigned 32-bit division: a0 = a0 / a1
.global __riscv_div_lib_udivsi3
__riscv_div_lib_udivsi3:
__riscv_div_lib_L1:
__riscv_div_lib_L2:
__riscv_div_lib_L3:
__riscv_div_lib_L4:
__riscv_div_lib_L5:

# Unsigned 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_umodsi3
__riscv_div_lib_umodsi3:

# Handle negative arguments to divsi3
__riscv_div_lib_L10:
__riscv_div_lib_L11:                         # Compute udivsi3(a0, -a1), then negate
    sub   a1, zero, a1                        # neg a1, a1 -> sub a1, zero, a1
__riscv_div_lib_L12:

# Signed 32-bit remainder: a0 = a0 % a1
.global __riscv_div_lib_modsi3
__riscv_div_lib_modsi3:
__riscv_div_lib_L30:
__riscv_div_lib_L31:
__riscv_div_lib_L32:

# end of subrountine