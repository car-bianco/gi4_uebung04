SECTION .data
n dd 60 
zaehler dd 1
ergebnis dq 0
output_str db "Die %d te Fibonacci-Zahl ist %llu", 10, 0

SECTION .text
global main
extern printf

main:

push ebp		;Stack-Frame initialisieren
mov ebp, esp
mov edx, 0
mov ebx, 0
mov eax, 1
mov ecx, 0
cmp eax, dword [n] 
je fall_one
cmp ebx, dword [n]
je fall_zero
push 0
schleife:
pop ecx
push edx
push eax
add eax, ebx
adc edx, ecx
jo fall_zero
pop ebx
mov ecx, dword [zaehler]
inc ecx
mov dword [zaehler], ecx
cmp ecx, dword [n]
jne schleife
mov dword [ergebnis+4], eax
mov dword [ergebnis], edx
jmp ende

fall_one:		;Erste Fibonacci-Zahl
mov dword [ergebnis], 0001h
mov dword [ergebnis+4], 0000h
jmp ende

fall_zero:		;Nullte Fibonacci-Zahl oder Ueberlauf
mov dword [ergebnis], 0000h
mov dword [ergebnis+4], 0000h

ende:			;Verwaltung der Ausgabe
push dword [ergebnis]
push dword [ergebnis+4]
push dword [n]
push dword output_str
call printf
add esp, 16

mov esp, ebp		;Stack-Frame beenden
pop ebp


mov ebx, 0		;erfolgreiche Ausfuehrung des Programms
mov eax, 1
int 0x80
