;; Fill up the memory with number from 0 to N
%include "./examples/natives.hack"

%bind N 256

main:
    push 0        ; i
loop:
    dup 0
    dup 0
    write8
    
    push 1
    plusi
    
    dup 0
    push N
    eqi
    not

    jmp_if loop
    
    push 0
    push N
    native dump_memory
    
    halt
    
%entry main