;a macro to print msgs
print macro string

 pusha
 lea dx, string
 mov ah, 09h
 int 21h
 
endm
; a macro for mouse cursor
mouse macro x, y
 pusha
 mov ah, 02h
 mov bx, 0
 mov dh, x
 mov dl, y
 int 10h

 popa
endm

.model small
.stack 0100h
.data
key db 0

; for line 1
xaxis1 dw 50
yaxis1 dw 20
xaxis2 dw 80
yaxis2 dw 20
xaxis3 dw 110
yaxis3 dw 20
xaxis4 dw 140
yaxis4 dw 20
xaxis5 dw 170
yaxis5 dw 20
xaxis6 dw 200
yaxis6 dw 20
xaxis7 dw 230
yaxis7 dw 20
xaxis8 dw 260
yaxis8 dw 20

; for line2
x1 dw 60          ; x for x axis
y1 dw 37          ; y for y axis
x2 dw 90
y2 dw 37
x3 dw 120
y3 dw 37
x4 dw 150
y4 dw 37
x5 dw 180
y5 dw 37
x6 dw 210
y6 dw 37
x7 dw 240
y7 dw 37

;for line 3

xcord1 dw 77    ; x coordinate
ycord1 dw 52    ; y coordinate
xcord2 dw 107   ; x coordinate
ycord2 dw 52    ; y coordinate
xcord3 dw 137   ; x coordinate
ycord3 dw 52    ; y coordinate
xcord4 dw 167   ; x coordinate
ycord4 dw 52    ; y coordinate
xcord5 dw 197   ; x coordinate
ycord5 dw 52    ; y coordinate 

;for line 4

xa dw 98    ; xa for brick1 
ya dw 68    ; ya for brick1
xb dw 115
yb dw 68
xc dw 130
yc dw 68
xd dw 195
yd dw 68

;line 5

xe dw 105
ye dw 84
xf dw 200
yf dw 84

;---paddle

px dw 10    ; paddle on x axis
py  dw 180   ; paddle on y axis
temp dw 180
tempx dw 90
tempy dw 180
temp2 dw 185

gamename db "/BRICK BREAKER\",'$'
gamename2 db"\             /",'$'
gamename3 db " ~~~~~~~~~~~~~",'$'
entername db"Player name: ",'$'
instruction1 db " INSTRUCTIONS:",'$'
instruction2 db "1.Hit the bricks with ball to break them", '$'
instruction3 db "2.The ball will be bounced using paddle",'$'
instruction4 db "3.The ball cannot touch the floor",'$'
instruction5 db "4.Break maximum bricks to earn score",'$'
instruction6 db "5.Enter your name to continue",'$'

;screen 2
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

score db "Score: $"
pname db "Name: $"
Level db "Level:2 $"

username db 7 dup('$') ,'$'

.code
main proc
mov ax, @data
mov ds,ax
firstScreen:
call clearscreen
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

lea dx,username
Mov ah, 3fh
Int 21h

call clearscreen
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

;call clearscreen
options:
mov ah,1
int 16h

;jz options

mov ah,00h
int 16h

cmp ah,4Bh
je firstScreen

;cmp ah,4Dh
;je right

cmp al,101
je Exit

cmp al, 112
je nextScreen 
JNE options

nextScreen:
call clearscreen

mouse 1,1
print score

mouse 1,12

mov dl,03  ; heart
mov ah,02
int 21h

mouse 1,13

mov dl,03  ; heart
mov ah,02
int 21h

mouse 1,14

mov dl,03  ; heart
mov ah,02
int 21h

mouse 1,18

print Level

mouse 1,28
print pname

mouse 1,33

mov si, offset username
mov cx, 7
hii:
mov ah, 02h
mov dl, [si]
inc si
int 21h
loop hii







;bricks-----------------------------
mov bx,0         ; counter
again:
mov xaxis1,50
mov bx,0


L1:
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, xaxis1       ; co-ordinates of X-axis 
MOV DX, yaxis1       ; co-ordinates of Y-axis 
INT 10H


inc xaxis1
inc bx
cmp bx,30
je fill
jne L1

fill:
inc yaxis1
cmp yaxis1,35
je box1
jne again


;-------------------------------------
box1:

again1:
mov xaxis2,80
mov bx,0


L2:
MOV AH, 0Ch
MOV AL, 04h      ; Color Number
MOV CX, xaxis2      ; co-ordinates of X-axis 
MOV DX, yaxis2       ; co-ordinates of Y-axis 
INT 10H


inc xaxis2
inc bx
cmp bx,30
je color
jne L2

color:
inc yaxis2
cmp yaxis2,35
je box2
jne again1


;-----------------------------

box2:

again2:
mov xaxis3,110
mov bx,0


L3:
MOV AH, 0Ch
MOV AL, 0Eh      ; Color Number
MOV CX, xaxis3      ; co-ordinates of X-axis 
MOV DX, yaxis3       ; co-ordinates of Y-axis 
INT 10H


inc xaxis3
inc bx
cmp bx,30
je color1
jne L3

color1:
inc yaxis3
cmp yaxis3,35
je box3
jne again2

;--------------------------------------------

box3:

again3:
mov xaxis4,140
mov bx,0


L4:
MOV AH, 0Ch
MOV AL, 01h         ; Color Number
MOV CX, xaxis4      ; co-ordinates of X-axis 
MOV DX, yaxis4      ; co-ordinates of Y-axis 
INT 10H


inc xaxis4
inc bx
cmp bx,30
je color2
jne L4

color2:
inc yaxis4
cmp yaxis4,35
je box4
jne again3



;---------------------------------------
box4:

again4:
mov xaxis5,170
mov bx,0


L5:
MOV AH, 0Ch
MOV AL, 02h      ; Color Number
MOV CX, xaxis5      ; co-ordinates of X-axis 
MOV DX, yaxis5       ; co-ordinates of Y-axis 
INT 10H


inc xaxis5
inc bx
cmp bx,30
je color3
jne L5

color3:
inc yaxis5
cmp yaxis5,35
je box5
jne again4

;--------------------------------------
box5:

again5:
mov xaxis6,200
mov bx,0


L6:
MOV AH, 0Ch
MOV AL, 05h      ; Color Number
MOV CX, xaxis6      ; co-ordinates of X-axis 
MOV DX, yaxis6       ; co-ordinates of Y-axis 
INT 10H


inc xaxis6
inc bx
cmp bx,30
je color4
jne L6

color4:
inc yaxis6
cmp yaxis6,35
je box6
jne again5

;-----------------------------------------

box6:

again6:
mov xaxis7,230
mov bx,0


L7:
MOV AH, 0Ch
MOV AL, 02h      ; Color Number
MOV CX, xaxis7      ; co-ordinates of X-axis 
MOV DX, yaxis7       ; co-ordinates of Y-axis 
INT 10H


inc xaxis7
inc bx
cmp bx,30
je color5
jne L7

color5:
inc yaxis7
cmp yaxis7,35
je box7
jne again6


;---------------------------------

box7:

again7:
mov xaxis8,260
mov bx,0


L8:
MOV AH, 0Ch
MOV AL, 0Eh          ; Color Number
MOV CX, xaxis8       ; co-ordinates of X-axis 
MOV DX, yaxis8       ; co-ordinates of Y-axis 
INT 10H


inc xaxis8
inc bx
cmp bx,30
je color6
jne L8

color6:
inc yaxis8
cmp yaxis8,35
je rec1
jne again7


;--------------------

rec1:

r1:                  ; r = repeat process  
mov x1,60
mov bx,0


do1:                 ; do the process
MOV AH, 0Ch
MOV AL, 0Eh          ; Color Number
MOV CX, x1           ; co-ordinates of X-axis 
MOV DX, y1           ; co-ordinates of Y-axis 
INT 10H


inc x1
inc bx
cmp bx,30
je c1                ; c for coloring
jne do1

c1:
inc y1
cmp y1,50
je rec2
jne r1



;--------------------

rec2:

r2:                  
mov x2,90
mov bx,0


do2:                 ; do the process
MOV AH, 0Ch
MOV AL, 02h          ; Color Number
MOV CX, x2           ; co-ordinates of X-axis 
MOV DX, y2           ; co-ordinates of Y-axis 
INT 10H


inc x2
inc bx
cmp bx,30
je c2
jne do2

c2:
inc y2
cmp y2,50
je rec3
jne r2

;--------------------

rec3:

r3:                   
mov x3,120
mov bx,0


do3:                 ; do the process
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, x3           ; co-ordinates of X-axis 
MOV DX, y3           ; co-ordinates of Y-axis 
INT 10H


inc x3
inc bx
cmp bx,30
je c3
jne do3

c3:
inc y3
cmp y3,50
je rec4
jne r3

;----------------

rec4:

r4:                 
mov x4,150
mov bx,0


do4:                 ; do the process
MOV AH, 0Ch
MOV AL, 05h          ; Color Number
MOV CX, x4           ; co-ordinates of X-axis 
MOV DX, y4           ; co-ordinates of Y-axis 
INT 10H


inc x4
inc bx
cmp bx,30
je c4
jne do4

c4:
inc y4
cmp y4,50
je rec5
jne r4


;----------------

rec5:

r5:                 
mov x5,180
mov bx,0


do5:                 ; do the process
MOV AH, 0Ch
MOV AL, 0Eh          ; Color Number
MOV CX, x5           ; co-ordinates of X-axis 
MOV DX, y5           ; co-ordinates of Y-axis 
INT 10H


inc x5
inc bx
cmp bx,30
je c5
jne do5

c5:
inc y5
cmp y5,50
je rec6
jne r5


;----------------

rec6:

r6:                 
mov x6,210
mov bx,0


do6:                 ; do the process
MOV AH, 0Ch
MOV AL, 02h          ; Color Number
MOV CX, x6           ; co-ordinates of X-axis 
MOV DX, y6           ; co-ordinates of Y-axis 
INT 10H


inc x6
inc bx
cmp bx,30
je c6
jne do6

c6:
inc y6
cmp y6,50
je rec7
jne r6

;----------------

rec7:

r7:               
mov x7,240
mov bx,0


do7:                 ; do the process
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, x7           ; co-ordinates of X-axis 
MOV DX, y7           ; co-ordinates of Y-axis 
INT 10H


inc x7
inc bx
cmp bx,30
je c7
jne do7

c7:
inc y7
cmp y7,50
je brick1
jne r7


;-----------------------

brick1:                

rep1:                  
mov xcord1,77
mov bx,0


make1:                ; make the brick
MOV AH, 0Ch
MOV AL, 02h          ; Color Number
MOV CX, xcord1           ; co-ordinates of X-axis 
MOV DX, ycord1          ; co-ordinates of Y-axis 
INT 10H


inc xcord1
inc bx
cmp bx,30
je  clr1                ; colour the brick
jne make1

clr1:
inc ycord1
cmp ycord1,65
je  brick2
jne rep1

;-----------------------

brick2:                

rep2:                  
mov xcord2,107
mov bx,0


make2:                ; make the brick
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, xcord2           ; co-ordinates of X-axis 
MOV DX, ycord2          ; co-ordinates of Y-axis 
INT 10H


inc xcord2
inc bx
cmp bx,30
je  clr2                ; colour the brick
jne make2

clr2:
inc ycord2
cmp ycord2,65
je  brick3
jne rep2

;-----------------------

brick3:                

rep3:                  
mov xcord3, 137
mov bx,0


make3:                ; make the brick
MOV AH, 0Ch
MOV AL, 05h          ; Color Number
MOV CX, xcord3           ; co-ordinates of X-axis 
MOV DX, ycord3          ; co-ordinates of Y-axis 
INT 10H


inc xcord3
inc bx
cmp bx,30
je  clr3                ; colour the brick
jne make3

clr3:
inc ycord3
cmp ycord3,65
je brick4
jne rep3

;-----------------------

brick4:                

rep4:                  
mov xcord4,167
mov bx,0


make4:                ; make the brick
MOV AH, 0Ch
MOV AL, 04h          ; Color Number
MOV CX, xcord4           ; co-ordinates of X-axis 
MOV DX, ycord4          ; co-ordinates of Y-axis 
INT 10H


inc xcord4
inc bx
cmp bx,30
je  clr4                ; colour the brick
jne make4

clr4:
inc ycord4
cmp ycord4,65
je brick5
jne rep4


;-----------------------

brick5:                

rep5:                  
mov xcord5,197
mov bx,0


make5:                ; make the brick
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, xcord5           ; co-ordinates of X-axis 
MOV DX, ycord5          ; co-ordinates of Y-axis 
INT 10H


inc xcord5
inc bx
cmp bx,40
je  clr5                ; colour the brick
jne make5

clr5:
inc ycord5
cmp ycord5,65
je br1
jne rep5


;-----------------------

br1:                

repeat1:                  
mov xa, 98
mov bx,0


m1:                      ; make the brick
MOV AH, 0Ch
MOV AL, 04h              ; Color Number
MOV CX, xa               ; co-ordinates of X-axis 
MOV DX, ya               ; co-ordinates of Y-axis 
INT 10H


inc xa
inc bx
cmp bx,45
je  co1                ; colour the brick
jne m1

co1:
inc ya
cmp ya,80
je br2
jne repeat1

;-----------------------

br2:                

repeat2:                  
mov xb, 115
mov bx,0


m2:                      ; make the brick
MOV AH, 0Ch
MOV AL, 01h              ; Color Number
MOV CX, xb               ; co-ordinates of X-axis 
MOV DX, yb               ; co-ordinates of Y-axis 
INT 10H


inc xb
inc bx
cmp bx,40
je  co2                ; colour the brick
jne m2

co2:
inc yb
cmp yb,80
je br3
jne repeat2

;-----------------------

br3:                

repeat3:                  
mov xc, 130
mov bx,0


m3:                      ; make the brick
MOV AH, 0Ch
MOV AL, 05h              ; Color Number
MOV CX, xc               ; co-ordinates of X-axis 
MOV DX, yc               ; co-ordinates of Y-axis 
INT 10H


inc xc
inc bx
cmp bx,28
je  co3                ; colour the brick
jne m3

co3:
inc yc
cmp yc,80
je br4
jne repeat3


;-----------------------

br4:                

repeat4:                  
mov xd, 195
mov bx,0


m4:                      ; make the brick
MOV AH, 0Ch
MOV AL, 02h              ; Color Number
MOV CX, xd              ; co-ordinates of X-axis 
MOV DX, yd               ; co-ordinates of Y-axis 
INT 10H


inc xd
inc bx
cmp bx,30
je  co4                ; colour the brick
jne m4

co4:
inc yd
cmp yd,80
je brkA
jne repeat4


;-----------------------

brkA:                

repeatA:                  
mov xe, 105
mov bx,0


mA:                      ; make the brick
MOV AH, 0Ch
MOV AL, 0Eh              ; Color Number
MOV CX, xe               ; co-ordinates of X-axis 
MOV DX, ye               ; co-ordinates of Y-axis 
INT 10H


inc xe
inc bx
cmp bx,40
je  coA                 ; colour the brick
jne mA

coA:
inc ye
cmp ye,95
je brkB
jne repeatA



brkB:                

repeatB:                  
mov xf, 200
mov bx,0


mB:                      ; make the brick
MOV AH, 0Ch
MOV AL, 05h              ; Color Number
MOV CX, xf               ; co-ordinates of X-axis 
MOV DX, yf               ; co-ordinates of Y-axis 
INT 10H


inc xf
inc bx
cmp bx,40
je  coB                 ; colour the brick
jne mB

coB:
inc yf
cmp yf,95
je makepaddle
jne repeatB
;------------------------------------------

makepaddle:
mov px,90
mov bx,0


PADDLE:
MOV AH, 0Ch
MOV AL, 0Ch      ; Color Number
MOV CX, px        ; co-ordinates of X-axis 
MOV DX, py       ; co-ordinates of Y-axis 
INT 10H


inc px
inc bx
cmp bx,40              ;length
je fillpaddle
jne PADDLE

fillpaddle:
inc py
cmp py,185
je  resetCoordinates               ;paddlemovement
jne makepaddle

resetCoordinates:
mov px, 90
mov py, 180

paddlemovement:

mov py, 180

mov ah,1 ; key pressed
int 16h

jz paddlemovement


mov ah,00h  ; which key pressed
int 16h

mov key,ah


cmp ah,4Bh
je left

cmp ah,4Dh
je right

cmp al,13
je Exit
JNE paddlemovement


left:
mov bx, px ;90
mov tempx, bx   ; tempx = 90
mov bx, py      ;180
mov tempy, bx   ; tempy = 180
mov temp,40; length saved

makepaddle1:    ; black paddle
mov bx, px      ;90
mov tempx, bx  ;tempx = 90
mov bx,0

PADDLE1:
MOV AH, 0Ch
MOV AL, 00h          ; Color black(disappear paddle)
MOV CX, tempx        ; co-ordinates of X-axis 
MOV DX, tempy        ; co-ordinates of Y-axis 
INT 10H


inc tempx
inc bx
cmp bx, temp ; length =68
je fillpaddle1
jne PADDLE1

fillpaddle1:
inc tempy
cmp tempy,185        
je  moveleft
jne makepaddle1      ;PADDLE1



moveleft:
mov bx, px     ; 90
mov tempx, bx  ;90
sub tempx, 7   ; 90-5 = 85
sub px, 7      ; orignal coordinates

; subtracting for left moving
mov temp,40 ; length of paddle

mov bx, py    ; 180
mov tempy, bx ; 180

; finally moving left 
makepaddle2:
mov bx, px
mov tempx, bx
mov bx,0

PADDLE2:
MOV AH, 0Ch
MOV AL, 0Ch      ; Color Number
MOV CX, tempx        ; co-ordinates of X-axis 
MOV DX, tempy       ; co-ordinates of Y-axis 
INT 10H

inc tempx
inc bx
cmp bx, temp        ;68
je fillpaddle2
jne PADDLE2

fillpaddle2:
inc tempy 
cmp tempy, 185
je  paddlemovement                ;changeCoordinates;
jne makepaddle2                   ;moveleft 



right:
mov bx, px
mov tempx, bx
mov bx, py
mov tempy, bx
mov temp, 40; length saved

makepaddle3:
mov bx, px
mov tempx, bx
mov bx,0

PADDLE3:
MOV AH, 0Ch
MOV AL, 00h      ; Color (disappear paddle)
MOV CX, tempx        ; co-ordinates of X-axis 
MOV DX, tempy       ; co-ordinates of Y-axis 
INT 10H


inc tempx
inc bx
cmp bx, temp       ;68
je fillpaddle3
jne PADDLE3

fillpaddle3:
inc tempy
cmp tempy,185        ; width
je  moveright
jne makepaddle3


moveright:
mov bx, px
mov tempx, bx
add tempx, 7
add px, 7
mov temp,40      ;length

mov bx, py
mov tempy, bx

makepaddle4:
mov bx, px
mov tempx, bx
mov bx,0

PADDLE4:
MOV AH, 0Ch
MOV AL, 0Ch      ; Color Number
MOV CX, tempx        ; co-ordinates of X-axis 
MOV DX, tempy       ; co-ordinates of Y-axis 
INT 10H

inc tempx
inc bx
cmp bx, temp        
je fillpaddle4
jne PADDLE4

fillpaddle4:
inc tempy  
cmp tempy, 185
je  paddlemovement
jne makepaddle4
;------------------------------------------------------------------

Exit:
mov ah, 4ch
int 21h
main endp

;PROC to clear screen
clearscreen PROC uses ax bx cx dx bp
    mov bp,sp

    mov ah,00h
    mov al,13h 
    int 10h

    mov ah,0bh
    mov bx,[bp+12]
    mov bh,00h
    int 10h

    ret 2
clearscreen ENDP
end

;-----------------------(lives)
; lives proc

; MOV AH,02H
; MOV BX,0
; mov dl,11  ;xaxis
; mov dh,1  ;yaxis
; int 10h

; mov dl,03  ; heart
; mov ah,02
; int 21h
;---------------

; MOV AH,02H
; MOV BX,0
; mov dl,12  ;xaxis
; mov dh,1  ;yaxis
; int 10h

; mov dl,03  ;heart
; mov ah,02
; int 21h
;-----------------
; MOV AH,02H
; MOV BX,0
; mov dl,13  ;xaxis
; mov dh,1  ;yaxis
; int 10h

; mov dl,03  ; heart
; mov ah,02
; int 21h

; ret
; lives endp
