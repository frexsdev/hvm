%include "./examples/natives.hack"

; a
; b
; t
; --
; a + (b - a) * t
lerpf:
    dup 3
    dup 3
    dup 1
    minusf
    dup 3
    multf
    plusf

    ; clean up
    swap 2
    drop
    swap 2
    drop
    swap 2
    drop
    ret

main:
    push 69.0       ; a
    push 420.0      ; b
    push 0.0        ; t
    push 1.0        ; 1
    push 10.0       ; n
    divf
loop:
    dup 3
    dup 3
    dup 3
    call lerpf
    native print_f64

    swap 1
    dup 1
    plusf
    swap 1

    dup 1
    push 1.0
    swap 1
    gef

    jmp_if loop
    halt

%entry main