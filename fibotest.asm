SECTION .data
testvalue dd 89
ergebnis dd 0
output_str db "%d ist die %d te Fibonacci-Zahl", 10, 0

SECTION .text
global main
extern printf

main:
push ebp
mov ebp, esp
mov eax, 1
mov ebx, 0
cmp ebx, dword[testvalue] ;Verwaltung des Trivialfalles testvalue ==  0
je ende
mov ecx, 1
schleife:
cmp eax, dword[testvalue]
je write
push eax
add eax, ebx		;Berechnung der jeweiligen naechsten Fib-Zahl (siehe 2)
jo ende			;Bei Ueberlauf (keine passende Zahl gefunden, beenden)
pop ebx
inc ecx
jmp schleife


write:
mov dword[ergebnis], ecx ;Falls Zahl gefunden, schreibe Index

ende:

push dword [ergebnis]	;Verwaltung der Ausgabe
push dword [testvalue]
push dword output_str
call printf
add esp, 12

mov esp, ebp
pop ebp

mov ebx, 0		;Erfolgreiche Ausfuehrung
mov eax, 1
int 0x80
