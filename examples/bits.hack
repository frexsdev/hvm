;; Print bits of number N
%include "./examples/natives.hack"

%bind N 69420

;; N >> 1

main:
    push N
loop:
    dup 0
    push 1
    andb
    native print_u64
    
    push 1
    shr
    
    dup 0
    push 0
    eqi
    not
    
    jmp_if loop
    
    halt

%entry main