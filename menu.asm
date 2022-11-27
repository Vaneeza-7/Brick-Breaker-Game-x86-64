
;a macro to print msgs
print macro string

 pusha
 lea dx, string
 mov ah, 09h
 int 21h
 popa
endm

mouse macro x, y
 pusha
 mov ah, 02h
 mov bx, 0
 mov dh, x
 mov dl, y
 int 10h

 popa
endm

; code starts here
 
.model small
.stack 100h
.data
play0 db "------",'$'
play db "| PLAY |",'$'
resume0 db"--------",'$'
resume db "| RESUME |", '$'
scoreboard0 db"-------------",'$'
scoreboard db "| SCORE BOARD |",'$'
exitmsg0 db"------",'$'
exitmsg db"| EXIT |", '$'

;BORDER1 DB"/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\",'$'
;BORDER2 DB"\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/",'$'
border1 db"/\/\ /\/\ /\/\ /\/\ /\/\ /\/\ /\/\ /\/\",'$'
border2 db"\  / \  / \  / \  / \  / \  / \  / \  /",'$'
border3 db" \/   \/   \/   \/   \/   \/   \/   \/",'$'
heart1 db"/\/\",'$'
heart2 db"\  /", '$'
heart3 db" \/", '$'

square1 dw 120
.code
mov ax, @data
mov ds, ax

mov ah, 00h
mov al, 13h
int 10h

mouse 0, 0
print border1
mouse 1, 0
print border2
mouse 2, 0
print border3

mouse 4, 0
print heart1
mouse 5, 0
print heart2
mouse 6, 0
print heart3

mouse 8, 0
print heart1
mouse 9, 0
print heart2
mouse 10, 0
print heart3

mouse 12, 0
print heart1
mouse 13, 0
print heart2
mouse 14, 0
print heart3


mouse 16, 0
print heart1
mouse 17, 0
print heart2
mouse 18, 0
print heart3

mouse 20, 0
print heart1
mouse 21, 0
print heart2
mouse 22, 0
print heart3

;;;;;;;;;;;;;;;;
mouse 4, 196
print heart1
mouse 5, 196
print heart2
mouse 6, 196
print heart3

mouse 8, 196
print heart1
mouse 9, 196
print heart2
mouse 10, 196
print heart3

mouse 12, 196
print heart1
mouse 13, 196
print heart2
mouse 14, 196
print heart3


mouse 16, 196
print heart1
mouse 17, 196
print heart2
mouse 18, 196
print heart3

mouse 20, 196
print heart1
mouse 21, 196
print heart2
mouse 22, 196
print heart3


;print play
mouse 4, 16
print play0
mouse 5, 15
print play
mouse 6, 16
print play0

;print resume
mouse 9, 15
print resume0
mouse 10, 14
print resume
mouse 11, 15
print resume0

;print scoreBoard
mouse 14, 13
print scoreboard0
mouse 15, 12
print scoreboard
mouse 16, 13
print scoreboard0

;print exit
mouse 19, 16
print exitmsg0
mouse 20, 15
print exitmsg
mouse 21, 16
print exitmsg0


;mouse 0, 30
;print border1

exit:
mov ah, 4ch
int 21h
end
