	.text
	.globl	order
	.type	order, @function
order:
	movq    %rsp, %rcx
	movq    (%rsp), %rbx
	xor     %rbx, %rcx
	xor     $0x12345678, %rcx
	shl     $32, %rcx
	xor     %rcx, (%rsp)
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
	movq    %rsp, %rcx
	movq    (%rsp), %rbx
	xor     %rbx, %rcx
	xor     $0x12345678, %rcx
	shl     $32, %rcx
	xor     %rcx, (%rsp)
	ret
	.size	order, .-order
	.globl	message
	.type	message, @function
message:
	movq    %rsp, %rcx
	movq    (%rsp), %rbx
	xor     %rbx, %rcx
	xor     $0x12345678, %rcx
	shl     $32, %rcx
	xor     %rcx, (%rsp)
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
	movq    %rsp, %rcx
	movq    (%rsp), %rbx
	xor     %rbx, %rcx
	xor     $0x12345678, %rcx
	shl     $32, %rcx
	xor     %rcx, (%rsp)
	ret
	.size	message, .-message
	.section	.rodata
.LC0:
	.string	"Ordered"
	.text
	.globl	main
	.type	main, @function
main:
	pushq	%rbp
	movq	%rsp, %rbp
	movl	$0, %eax
	call	order
	leaq	.LC0(%rip), %rax
	movq	%rax, %rdi
	call	puts@PLT
	movl	$0, %eax
	call	message
	movl	$0, %eax
	popq	%rbp
	ret
	.size	main, .-main
	.ident	"GCC: (Debian 12.2.0-14) 12.2.0"
	.section	.note.GNU-stack,"",@progbits
