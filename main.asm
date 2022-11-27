;a macro to print msgs
print macro string

 pusha
 lea dx, string
 mov ah, 09h
 int 21h
 
endm

.model small
.stack 0100h
.data
gamename db "/BRICK BREAKER\",'$'
gamename2 db"\             /",'$'
gamename3 db " ~~~~~~~~~~~~~",'$'
entername db"Player name: ",'$'
username db ?
instruction1 db " INSTRUCTIONS:",'$'
instruction2 db "1.Hit the bricks with ball to break them", '$'
instruction3 db "2.The ball will be bounced using paddle",'$'
instruction4 db "3.The ball cannot touch the floor",'$'
instruction5 db "4.Break maximum bricks to earn score",'$'
instruction6 db "5.Enter your name to continue",'$'
.code
mov ax, @data
mov ds,ax

mov ah, 00h
mov al, 13h
int 10h


mov ah, 02h
mov bx, 0
mov dh, 1
mov dl, 13
int 10h

lea dx, gamename
mov ah, 09h
int 21h

mov ah, 02h
mov bx, 0
mov dh, 2
mov dl, 13
int 10h

print gamename2

mov ah, 02h
mov bx, 0
mov dh, 3
mov dl, 13
int 10h

print gamename3

mov ah, 02h
mov bx, 0
mov dh, 5
mov dl, 13
int 10h

print instruction1

mov ah, 02h
mov bx, 0
mov dh, 7
mov dl, 0
int 10h
print instruction2

mov ah, 02h
mov bx, 0
mov dh, 9
mov dl, 0
int 10h
print instruction3

mov ah, 02h
mov bx, 0
mov dh, 11
mov dl, 0
int 10h
print instruction4

mov ah, 02h
mov bx, 0
mov dh, 13
mov dl, 0
int 10h
print instruction5

mov ah, 02h
mov bx, 0
mov dh, 15
mov dl, 0
int 10h

print instruction6

mov ah, 02h
mov bx, 0
mov dh, 17
mov dl, 5
int 10h

lea dx, entername
mov ah, 09h
int 21h

Mov dx, offset username
Mov ah, 3fh
Int 21h



mov ah, 4ch
int 21h
end
