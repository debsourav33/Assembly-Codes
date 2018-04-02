segment .data
datas: db "avro kedobru.",0
needle: db 'W'
n: dq 0
fmt: db "No. of vowels: %d",10,0
fmt2: db "No. of consonent: %d",10,0

;vowels: db 65,69,73,79,85,97,101,105,111,11
vowels: db 'a','e','i','o','u','A','E','I','O','U'
cons: db 'b','c','d','f','g','h','j','k','l','m','n','p','q','r','s','t','v','w','x','y','z'


segment .text
global main
extern printf

main:
push RBP

mov al, [datas]
mov RCX, 0
mov RDX, 0

while:
	mov RBX, vowels
	mov RSI, 0

	check:
		cmp al, [vowels+RSI]
		jne not
		inc RDX
		jmp cont
		not: 
		inc RSI
		cmp RSI, 10
		jne check


	cont: inc rcx
	mov al, [datas+rcx]
	cmp al, 0
	jnz while

mov RDI, fmt
mov RSI, RDX
xor RAX, RAX
call printf

mov al, [datas]
mov RCX, 0
mov RDX, 0

while2:
	mov RBX, vowels
	mov RSI, 0

	check2:
		cmp al, [cons+RSI]
		jne not2
		inc RDX
		jmp cont2
		not2: 
		inc RSI
		cmp RSI, 21
		jne check2
		

	cont2: inc rcx
	mov al, [datas+rcx]
	cmp al, 0
	jnz while2

mov RDI, fmt2
mov RSI, RDX
xor RAX, RAX
call printf



pop RBP
ret


