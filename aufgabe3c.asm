SECTION .data

i dd 10
ergebnis dd 1

SECTION .text
global main

main:

mov ecx, dword [i]
schleife:
dec ecx				;anders als bei a), hier Praedekrement:
mov dword [i], ecx		;zunaechst i dekrementieren, dann Vergleich
cmp ecx, 0			;falls i = 0, springe aufs Ende 
je ende
mov eax, dword [ergebnis]
imul ecx
mov dword [ergebnis], eax	;hier: Updaten der Variablen nach jedem Durchlauf
jmp schleife

ende:

mov ebx, 0
mov eax, 1
int 0x80
