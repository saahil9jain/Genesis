	.section	__TEXT,__text,regular,pure_instructions
	.macosx_version_min 10, 12
	.globl	_main                   ## -- Begin function main
	.p2align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:                                ## %entry
	subq	$88, %rsp
Lcfi0:
	.cfi_def_cfa_offset 96
	movq	$0, 32(%rsp)
	movl	$255, 40(%rsp)
	leaq	32(%rsp), %rax
	movq	%rax, 56(%rsp)
	movq	%rax, 72(%rsp)
	movq	%rax, (%rsp)
	movl	$50, %edi
	movl	$50, %esi
	movl	$100, %edx
	movl	$100, %ecx
	xorl	%r8d, %r8d
	xorl	%r9d, %r9d
	callq	_newCluster
	movl	%eax, 44(%rsp)
	movabsq	$1095216660480, %rax    ## imm = 0xFF00000000
	movq	%rax, 16(%rsp)
	movl	$0, 24(%rsp)
	leaq	16(%rsp), %rdi
	movq	%rdi, 48(%rsp)
	movq	%rdi, 64(%rsp)
	movl	$640, %esi              ## imm = 0x280
	movl	$480, %edx              ## imm = 0x1E0
	callq	_startGame
	leaq	L_fmt(%rip), %rdi
	movl	$1, %esi
	xorl	%eax, %eax
	callq	_printf
	xorl	%eax, %eax
	addq	$88, %rsp
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_init                   ## -- Begin function init
	.p2align	4, 0x90
_init:                                  ## @init
	.cfi_startproc
## BB#0:                                ## %entry
	retq
	.cfi_endproc
                                        ## -- End function
	.globl	_update                 ## -- Begin function update
	.p2align	4, 0x90
_update:                                ## @update
	.cfi_startproc
## BB#0:                                ## %entry
	pushq	%rax
Lcfi1:
	.cfi_def_cfa_offset 16
	movl	%edi, 4(%rsp)
	leaq	L_tmp(%rip), %rdi
	callq	_isKeyDown
	testb	$1, %al
	je	LBB2_1
## BB#5:                                ## %then
	leaq	L_fmt.8(%rip), %rdi
	leaq	L_tmp.9(%rip), %rsi
	xorl	%eax, %eax
	callq	_printf
LBB2_1:                                 ## %merge
	leaq	L_tmp.10(%rip), %rdi
	callq	_isKeyHeld
	testb	$1, %al
	je	LBB2_2
## BB#6:                                ## %then3
	leaq	L_fmt.8(%rip), %rdi
	leaq	L_tmp.11(%rip), %rsi
	xorl	%eax, %eax
	callq	_printf
LBB2_2:                                 ## %merge2
	leaq	L_tmp.12(%rip), %rdi
	callq	_isKeyUp
	testb	$1, %al
	je	LBB2_4
## BB#3:                                ## %then7
	leaq	L_fmt.8(%rip), %rdi
	leaq	L_tmp.13(%rip), %rsi
	xorl	%eax, %eax
	callq	_printf
LBB2_4:                                 ## %merge6
	popq	%rax
	retq
	.cfi_endproc
                                        ## -- End function
	.section	__TEXT,__cstring,cstring_literals
L_fmt:                                  ## @fmt
	.asciz	"%d\n"

L_fmt.1:                                ## @fmt.1
	.asciz	"%lf\n"

L_fmt.2:                                ## @fmt.2
	.asciz	"%s\n"

L_fmt.3:                                ## @fmt.3
	.asciz	"%d\n"

L_fmt.4:                                ## @fmt.4
	.asciz	"%lf\n"

L_fmt.5:                                ## @fmt.5
	.asciz	"%s\n"

L_fmt.6:                                ## @fmt.6
	.asciz	"%d\n"

L_fmt.7:                                ## @fmt.7
	.asciz	"%lf\n"

L_fmt.8:                                ## @fmt.8
	.asciz	"%s\n"

L_tmp:                                  ## @tmp
	.asciz	"Space"

L_tmp.9:                                ## @tmp.9
	.asciz	"Space pressed"

L_tmp.10:                               ## @tmp.10
	.asciz	"Space"

L_tmp.11:                               ## @tmp.11
	.asciz	"Space held"

L_tmp.12:                               ## @tmp.12
	.asciz	"Space"

L_tmp.13:                               ## @tmp.13
	.asciz	"Space released"


.subsections_via_symbols