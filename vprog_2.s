	.text
	.globl	order
	.type	order, @function
order:
	movq    %rsp, %r12
	movq    (%rsp), %r13
	xor     %r13, %r12
	xor     %r15, %r12
	xor     $0x2222, %r12
	xor     $0x12345678, %r12
	shl     $32, %r12
	xor     %r12, (%rsp)
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$32, %rsp
	leaq	-32(%rbp), %rax
	movl	$20, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read@PLT
	movq	%rax, -8(%rbp)
	cmpq	$-1, -8(%rbp)
	jne	.L3
	movl	$1, %edi
	call	exit@PLT
.L3:
	nop
	leave
	movq    %rsp, %r12
	movq    (%rsp), %r13
	and     $0xffffffff, %r13d
	xor     %r13, %r12
	xor     %r15, %r12
	xor     $0x2222, %r12
	xor     $0x12345678, %r12
	shl     $32, %r12
	movq    (%rsp), %r13
	mov $0xffffffff00000000,%r14
	and     %r14, %r13
	cmp     %r12, %r13
	jne     handler
	xor     %r12, (%rsp)
	ret
	.size	order, .-order
	.globl	message
	.type	message, @function
message:
	movq    %rsp, %r12
	movq    (%rsp), %r13
	xor     %r13, %r12
	xor     %r15, %r12
	xor     $0x3333, %r12
	xor     $0x12345678, %r12
	shl     $32, %r12
	xor     %r12, (%rsp)
	pushq	%rbp
	movq	%rsp, %rbp
	subq	$80, %rsp
	leaq	-80(%rbp), %rax
	movl	$128, %edx
	movq	%rax, %rsi
	movl	$0, %edi
	call	read@PLT
	movq	%rax, -8(%rbp)
	cmpq	$-1, -8(%rbp)
	jne	.L6
	movl	$2, %edi
	call	exit@PLT
.L6:
	nop
	leave
	movq    %rsp, %r12
	movq    (%rsp), %r13
	and     $0xffffffff, %r13d
	xor     %r13, %r12
	xor     %r15, %r12
	xor     $0x3333, %r12
	xor     $0x12345678, %r12
	shl     $32, %r12
	movq    (%rsp), %r13
	mov $0xffffffff00000000,%r14
        and     %r14, %r13
	cmp     %r12, %r13
	jne     handler
	xor     %r12, (%rsp)
	ret
	.size	message, .-message
	.section	.rodata
handler:
	push 0x000a6873
	push 0x61682067
	push 0x6e6f7257
	mov  %rsp, %rsi
	mov  $11, %rdx
	mov  $1, %rdi
	mov  $1, %rax
	syscall
	mov  $60, %rax
	mov $1, %rdi
	syscall

.LC0:
	.string	"Ordered"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$0, %eax
	movq    $0x1111, %r15
	call	order
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	movq    $0x1111, %r15
	call	message
	movl	$0, %eax
	popq	%rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
