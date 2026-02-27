.section .bss
.globl ram
.lcomm ram, 256        # Reserve 256 bytes of RAM (uninitialized memory)

.section .rodata
fmt:
    .string "%d\n"

.section .text
.globl find_sum      # Make function visible to C program


find_sum: 
    xor %eax, %eax #zero out eax
    jmp loop

loop:
    cmp $0, %rsi # check if count is now empty 
    je print

    add (%rdi), %eax # add the first int value to eax
    add $4, %rdi # increment across the array
    dec %rsi # decrement rsi 
    jmp loop

print: 
    movl %eax, %esi          # 2nd arg to printf = sum
    leaq fmt(%rip), %rdi     # 1st arg = format string
    xorl %eax, %eax          # rax = 0 for variadic call
    call printf
    ret

.section .note.GNU-stack,"",@progbits

