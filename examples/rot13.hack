%include "./examples/natives.hack"

; only this string needs to be changed
%bind secret "Uryyb, jbeyq! Sebz EBG13."

; TODO(#24): remove string length hack from rot13 example
; ---
; this small hack will take care of length of strign
%bind length ""

%bind ROT13 13
%bind MOD   26

%bind A 65
%bind Z 90
%bind a 97
%bind z 122

jmp main

; high >= value >= low
is_between:
    swap 3
    swap 1
    dup 1
    gei
    swap 2
    gei
    andb
    swap 1
    ret

rot13:
    swap 2
    dup 1
    minusi
    push ROT13
    plusi
    push MOD
    modi
    plusi
    swap 1
    ret

main:
    push 0

loop:
    dup 0
    read8

    upper_case:
        dup 0
        push A
        push Z
        call is_between
        not
        jmp_if lower_case

        push A      ; lower bound
        call rot13

        dup 1
        swap 1
        write8

        jmp inc

    lower_case:
        dup 0
        push a
        push z
        call is_between
        not
        jmp_if not_a_rot_char

        push a      ; lower bound
        call rot13

        dup 1
        swap 1
        write8

        jmp inc

    not_a_rot_char:
        drop    ; drop the current character on the stack as it's not supported
                ; by ROT13, effectively its state in memory is unaltered

    inc:
        push 1
        plusi

        dup 0
        push length
        eqi
        not
        jmp_if loop

print:
    push length
    push 10
    write8

    push 0
    push 1
    push length
    plusi
    native write

    halt
