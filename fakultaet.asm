SECTION .data

n dd 0
ergebnis dd 0
output_str db "Die Fakultaet von %d ist %d", 10, 0

SECTION .text
global main
extern printf

main:
mov eax, dword [n]
cmp eax, 0
je fall_zero
mov ecx, eax
schleife:
dec ecx			;Zahl dekrementieren und mit eax multiplizieren
imul ecx
cmp ecx, 1
jne schleife
mov dword [ergebnis], eax
jmp ende

fall_zero:		
mov dword [ergebnis], 1 ;Falls n = 0, 0! = 1

ende:
push dword [ergebnis]	;Verwaltung der Ausgabe
push dword [n]
push dword output_str
call printf
add esp, 3*4

mov ebx, 0 		;Programm erfolgreich ausgefuehrt
mov eax, 1
int 0x80
