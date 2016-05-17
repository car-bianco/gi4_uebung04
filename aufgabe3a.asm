SECTION .data
a dd 0
b dd 7

SECTION .text
global main

main:
mov eax, dword [a] 	;
cmp eax, 0		;if (a++ == 0)
jne false
inc eax			;jetzt wird das Wert inkrementiert
mov dword [a], eax
mov dword [b], 1	;b = 1
jmp ende
false:			;Else-Teil der Anweisung
inc eax
mov dword [a], eax	;jetzt wird das Wert inkrementiert
mov dword [b], 0	;b = 0

ende:
mov ebx, 0		;erfolgreiche Ausfuehrung des Programms
mov eax, 1
int 0x80






