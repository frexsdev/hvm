%include "./examples/natives.hack"
%bind hello "Hello, World"

push hello
push 12
plusi
push 10
write8

push hello
push 13
native write

halt