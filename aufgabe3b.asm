SECTION .data
a dd 0, 0, 0, 0, 0, 0, 0, 0, 0, 0	;int a[10]

SECTION .text
global main

main:
mov ecx, 0			;for (i=0;
schleife:			
cmp ecx, 10			;i < 10
je ende
mov dword [a+4*ecx], ecx	;a[i] = i
inc ecx				;i++
jmp schleife

ende:

mov ebx, 0		;Erfolgreiche Ausfuehrung des Programms
mov eax, 1
int 0x80
