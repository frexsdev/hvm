# TODO(#1): rewrite fib.hack example
# - Limit amount of iterations
# - Print the generated numbers on each iteration
# ---
# Some nonsense to test label resolution
    jmp 1
    nop
    nop
    nop
# First two Fibonacci numbers
    push 0
    push 1
loop:
    dup 1   # The Loop
    dup 1
    plusi
    jmp loop   # Repeat
