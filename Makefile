DBG	= gdb				# debugger
DBG_CMD1= "unset environment"		# debugger commands (initialization)
RUNAS	= setarch i686 -3 -R		# x86, 3GB address space, no ASLR
ENV     = env -i        	# empty environment
CFLAGS	+= -m64 -ggdb3			# x86 (64-bit) code, debug information
TEXT_ADDR= $(shell ./trnd)		# .text starting address
					# x86 (64-bit) code, no {PIC, PIE},
					# executable stack, no RELRO,
					# relocated .text
CFLAGS_INIT0= -m64 -no-pie -fno-pic -fno-stack-protector -z norelro -Wl,-Ttext=$(TEXT_ADDR)

# phony targets
.PHONY: all clean vprog_0 vprog_1 vprog_2 expl
# build everything (default target)
all: vprog_0 vprog_1 vprog_2 expl

# build the apps
vprog_2: vprog_2.o
	$(CC) $(CFLAGS_INIT0) $< -o $@

# build the apps
vprog_1: vprog_1.o
	$(CC) $(CFLAGS_INIT0) $< -o $@

# without protection
vprog_0: vprog.c
	$(CC) $(CFLAGS_INIT0) $< -o $@

# build the exploits
expl: expl.c
	$(CC) $(CFLAGS) $< -o $@

# clean
clean:
	$(RM) expl vprog_0 vprog_1 vprog_2
