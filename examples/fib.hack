main:
    push 0      ; F_0
    push 1      ; F_1
    push 30     ; N - the amount of iterations
loop:
    swap 2
    dup 0
    native 4
    dup 1
    plusi
    swap 1
    swap 2
    push 1
    minusi

    dup 0
    push 0
    eq
    not

    jmp_if loop        ; Repeat
    halt
