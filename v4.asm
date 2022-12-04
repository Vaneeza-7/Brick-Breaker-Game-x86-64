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

s1 dw 1

;-----header
borderx dw 1
bordery dw 1

; for line 1
xaxis1 dw 0
yaxis1 dw 25
xaxis2 dw 0  
yaxis2 dw 25
xaxis3 dw 0
yaxis3 dw 25
xaxis4 dw 0
yaxis4 dw 25
xaxis5 dw 0
yaxis5 dw 25
xaxis6 dw 0
yaxis6 dw 25

xaxis8 dw 0
yaxis8 dw 25

; for line2
x1 dw 0         ; x for x axis
y1 dw 46          ; y for y axis
x2 dw 0
y2 dw 46
x3 dw 0
y3 dw 46
x4 dw 0
y4 dw 46
x5 dw 0
y5 dw 46
x6 dw 0
y6 dw 46
x7 dw 0
y7 dw 46

;for line 3

xcord1 dw 0    ; x coordinate
ycord1 dw 65    ; y coordinate
xcord2 dw 0   ; x coordinate
ycord2 dw 65    ; y coordinate
xcord3 dw 0   ; x coordinate
ycord3 dw 65    ; y coordinate
xcord4 dw 0   ; x coordinate
ycord4 dw 65    ; y coordinate
xcord5 dw 0   ; x coordinate
ycord5 dw 65    ; y coordinate 
xaxis7 dw 0
yaxis7 dw 65

;for line 4

xa dw 0    ; xa for brick1 
ya dw 87    ; ya for brick1
xb dw 0
yb dw 87
xc dw 0
yc dw 87
xd dw 0
yd dw 87
xe dw 0
ye dw 87
xf dw 0
yf dw 87


;---paddle

px    dw 10    ; paddle on x axis
py    dw 180   ; paddle on y axis
temp  dw 180
tempx dw 90
tempy dw 180
temp2 dw 185

;------ball coordinates
ballx dw 0
bally dw 0
squarex dw 90
squarey dw 160
balltmpx db 0
balltmpy db 0

time db 0
x_ball dw 0Ah
y_ball dw 0Ah
x_ballspeed dw 05h
y_ballspeed dw 05h
ball_size dw 05h
boundry_width dw 319
boundry_height dw 199
bounds dw 01
new_x dw 0
new_y dw 0


;----------for scores------
fn db "scores.txt", 0
handle dw ?
userScore db "0",'$'
space db "------------",'$'
read db 15 dup('$'),'$'
scoring db "SCORES",'$'
scoring0 db "~~~~~~",'$'
bcordx dw 0
bcordy dw 0
bcordx1 dw 0
bcordy1 dw 0
;-------------------------
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
Level db "Level:1 $"

username db 5 dup('$') ,'$'

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

call writeScore

menuscreen:
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

cmp al, 115
je scoreBoardfile

cmp al,101
je Exit

cmp al, 112
je nextScreen 
JNE options

scoreBoardfile:
call clearscreen
mov ah, 00h
mov al, 12h
int 10h
        mov bcordx,0
        mov bcordx1,640;340
        mov bcordy,0
        mov bcordy1,480;401
call createborders
mouse 100, 100
print scoring
mouse 101, 102
print scoring0
call readScore
options2:
mov ah,1
int 16h

mov ah,00h
int 16h

cmp ah,4Bh
je menuscreen
jne options2

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

;----------------------Screen border-----------------------
mov bx,0         ; counter
bor1:
MOV AH, 0Ch
MOV AL, 0Bh      ; Color Number
MOV CX, s1       ; co-ordinates of X-axis 
MOV DX, 1       ; co-ordinates of Y-axis 
INT 10H


inc s1
inc bx
cmp bx,318
je bor2
jne bor1
      
bor2:
mov bx, 1
mov s1, bx
mov bx, 0
bor3:
MOV AH, 0Ch
MOV AL, 0Bh      ; Color Number
MOV CX, 1       ; co-ordinates of X-axis 
MOV DX, s1       ; co-ordinates of Y-axis 
INT 10H


inc s1
inc bx
cmp bx,200
je bor4
jne bor3
 
 
bor4:
mov bx, 1
mov s1, bx
mov bx, 0
bor5:
MOV AH, 0Ch
MOV AL, 0Bh      ; Color Number
MOV CX, 318     ; co-ordinates of X-axis 
MOV DX, s1       ; co-ordinates of Y-axis 
INT 10H

inc s1
inc bx
cmp bx,200
je bor6
jne bor5


bor6:
mov bx, 1
mov s1, bx
mov bx, 0
bor7:
MOV AH, 0Ch
MOV AL, 0Bh      ; Color Number
MOV CX, s1       ; co-ordinates of X-axis 
MOV DX, 199       ; co-ordinates of Y-axis 
INT 10H

inc s1
inc bx
cmp bx,318
je Bricks 
jne bor7

;;;;;;;;;;;;;;;;;;;;;;;;BORDER FINISHED---------------
Bricks:
call createBricks

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
cmp bx,68;length
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
;je Exit
 ;---------------create BALL-------------- 
MOV CX,x_ball    ;x-cordinate (column)
MOV DX,y_ball    ;y-cordinate (row)
MOV AL,1110b  ;yellow color
MOV AH,0CH 
INT 10H

time_checker:
mov ah,2ch
int 21h
cmp dl,time
je time_checker
mov time,dl

call BALL_MOTION
;jmp paddlemovement
;call createBricks

mov ah, 0
mov al, 13h
int 10h

mov ah,08h
mov bh,0h
mov bl,0h
int 10h

call SHADOW_BALL
call ball
jmp time_checker

JNE paddlemovement


left:
mov bx, px ;90
mov tempx, bx   ; tempx = 90
mov bx, py      ;180
mov tempy, bx   ; tempy = 180




mov temp,68 ; length saved

makepaddle1:   ; black paddle

;mov bx, tempx
;mov px,bx ;90
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
sub tempx, 5   ; 90-5 = 85
sub px, 5      ; orignal coordinates

; subtracting for left moving
mov temp,68 ; length of paddle

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
mov temp, 68; length saved

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
add tempx, 5
add px, 5
mov temp,68

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

writeScore PROC uses ax bx cx dx

;creating file--------
mov ah,3ch
mov cx,0
mov dx,offset fn
int 21h

;opening file--------
mov ah,3dh
mov al,2
mov dx,offset fn
int 21h
mov handle,ax

;writing in file------------

mov cx,0
mov dx,0
mov ah,42h
mov al,2
int 21h

mov ah,40h
mov bx,handle
mov cx,15
mov dx,offset username
int 21h

; mov ah,40h
; mov bx,handle
; mov cx,15
; mov dx,offset space
; int 21h

; mov ah,40h
; mov bx,handle
; mov cx,15
; mov dx,offset userScore
; int 21h

;closing file------
mov ah, 03eh
mov bx, handle
int 21h
;======================
;opening file--------
mov ah,3dh
mov al,2
mov dx,offset fn
int 21h
mov handle,ax

;writing in file------------

mov cx,0
mov dx,0
mov ah,42h
mov al,2
int 21h

mov ah,40h
mov bx,handle
mov cx,15
mov dx,offset userScore
int 21h

;closing file------
mov ah, 03eh
mov bx, handle
int 21h

ret
writeScore endp

readScore proc uses ax bx cx dx
;opening file-------
mov ah,3dh
mov al,2
mov dx,offset fn
int 21h
mov handle,ax

;reading file------------
mov ah,3fh
mov cx,15
mov dx,offset read
mov bx,handle
int 21h

lea dx,read
mov ah,09h
int 21h

ret
readScore endp
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

createBricks proc uses ax bx cx dx
again:
mov xaxis1,30
mov bx,0


L1:
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, xaxis1       ; co-ordinates of X-axis 
MOV DX, yaxis1       ; co-ordinates of Y-axis 
INT 10H


inc xaxis1
inc bx
cmp bx,40
je fill
jne L1

fill:
inc yaxis1
cmp yaxis1,40
je box1
jne again


;-------------------------------------
box1:

again1:
mov xaxis2,75
mov bx,0


L2:
MOV AH, 0Ch
MOV AL, 04h         ; Color Number
MOV CX, xaxis2      ; co-ordinates of X-axis 
MOV DX, yaxis2       ; co-ordinates of Y-axis 
INT 10H


inc xaxis2
inc bx
cmp bx,40
je color
jne L2

color:
inc yaxis2
cmp yaxis2,40
je box2
jne again1


;-----------------------------

box2:

again2:
mov xaxis3,120
mov bx,0


L3:
MOV AH, 0Ch
MOV AL, 0Eh         ; Color Number
MOV CX, xaxis3      ; co-ordinates of X-axis 
MOV DX, yaxis3       ; co-ordinates of Y-axis 
INT 10H


inc xaxis3
inc bx
cmp bx,40
je color1
jne L3

color1:
inc yaxis3
cmp yaxis3,40
je box3
jne again2

;--------------------------------------------

box3:

again3:
mov xaxis4,165
mov bx,0


L4:
MOV AH, 0Ch
MOV AL, 03h         ; Color Number
MOV CX, xaxis4      ; co-ordinates of X-axis 
MOV DX, yaxis4      ; co-ordinates of Y-axis 
INT 10H


inc xaxis4
inc bx
cmp bx,40
je color2
jne L4

color2:
inc yaxis4
cmp yaxis4,40
je box4
jne again3



;---------------------------------------
box4:

again4:
mov xaxis5,210
mov bx,0


L5:
MOV AH, 0Ch
MOV AL, 02h      ; Color Number
MOV CX, xaxis5      ; co-ordinates of X-axis 
MOV DX, yaxis5       ; co-ordinates of Y-axis 
INT 10H


inc xaxis5
inc bx
cmp bx,40
je color3
jne L5

color3:
inc yaxis5
cmp yaxis5,40
je box5
jne again4

;--------------------------------------
box5:

again5:
mov xaxis6,260
mov bx,0


L6:
MOV AH, 0Ch
MOV AL, 05h      ; Color Number
MOV CX, xaxis6      ; co-ordinates of X-axis 
MOV DX, yaxis6       ; co-ordinates of Y-axis 
INT 10H


inc xaxis6
inc bx
cmp bx,40
je color4
jne L6

color4:
inc yaxis6
cmp yaxis6,40
je rec1
jne again5

;-----------------------------------------

; box6:

; again6:
; mov xaxis7,310
; mov bx,0


; L7:
; MOV AH, 0Ch
; MOV AL, 06h      ; Color Number
; MOV CX, xaxis7      ; co-ordinates of X-axis 
; MOV DX, yaxis7       ; co-ordinates of Y-axis 
; INT 10H


; inc xaxis7
; inc bx
; cmp bx,30
; je color5
; jne L7

; color5:
; inc yaxis7
; cmp yaxis7,40
; je box7
; jne again6


;---------------------------------

; box7:

; again7:
; mov xaxis8,260
; mov bx,0


; L8:
; MOV AH, 0Ch
; MOV AL, 07h          ; Color Number
; MOV CX, xaxis8       ; co-ordinates of X-axis 
; MOV DX, yaxis8       ; co-ordinates of Y-axis 
; INT 10H


; inc xaxis8
; inc bx
; cmp bx,30
; je color6
; jne L8

; color6:
; inc yaxis8
; cmp yaxis8,40
; je rec1
; jne again7


;--------------------

rec1:

r1:                  ; r = repeat process  
mov x1,30
mov bx,0


do1:                 ; do the process
MOV AH, 0Ch
MOV AL, 03h          ; Color Number
MOV CX, x1           ; co-ordinates of X-axis 
MOV DX, y1           ; co-ordinates of Y-axis 
INT 10H


inc x1
inc bx
cmp bx,40
je c1                ; c for coloring
jne do1

c1:
inc y1
cmp y1,60
je rec2
jne r1



;--------------------

rec2:

r2:                  
mov x2,75
mov bx,0


do2:                 ; do the process
MOV AH, 0Ch
MOV AL, 02h          ; Color Number
MOV CX, x2           ; co-ordinates of X-axis 
MOV DX, y2           ; co-ordinates of Y-axis 
INT 10H


inc x2
inc bx
cmp bx,40
je c2
jne do2

c2:
inc y2
cmp y2,60
je rec3
jne r2

;--------------------

rec3:

r3:                   
mov x3,120
mov bx,0


do3:                 ; do the process
MOV AH, 0Ch
MOV AL, 05h          ; Color Number
MOV CX, x3           ; co-ordinates of X-axis 
MOV DX, y3           ; co-ordinates of Y-axis 
INT 10H


inc x3
inc bx
cmp bx,40
je c3
jne do3

c3:
inc y3
cmp y3,60
je rec4
jne r3

;----------------

rec4:

r4:                 
mov x4,165
mov bx,0


do4:                 ; do the process
MOV AH, 0Ch
MOV AL, 04h          ; Color Number
MOV CX, x4           ; co-ordinates of X-axis 
MOV DX, y4           ; co-ordinates of Y-axis 
INT 10H


inc x4
inc bx
cmp bx,40
je c4
jne do4

c4:
inc y4
cmp y4,60
je rec5
jne r4


;----------------

rec5:

r5:                 
mov x5,210
mov bx,0


do5:                 ; do the process
MOV AH, 0Ch
MOV AL, 0Eh          ; Color Number
MOV CX, x5           ; co-ordinates of X-axis 
MOV DX, y5           ; co-ordinates of Y-axis 
INT 10H


inc x5
inc bx
cmp bx,40
je c5
jne do5

c5:
inc y5
cmp y5,60
je rec6
jne r5


;----------------

rec6:

r6:                 
mov x6,260
mov bx,0


do6:                 ; do the process
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, x6           ; co-ordinates of X-axis 
MOV DX, y6           ; co-ordinates of Y-axis 
INT 10H


inc x6
inc bx
cmp bx,40
je c6
jne do6

c6:
inc y6
cmp y6,60
je brick1
jne r6

;----------------

; rec7:

; r7:               
; mov x7,260
; mov bx,0


; do7:                 ; do the process
; MOV AH, 0Ch
; MOV AL, 01h          ; Color Number
; MOV CX, x7           ; co-ordinates of X-axis 
; MOV DX, y7           ; co-ordinates of Y-axis 
; INT 10H


; inc x7
; inc bx
; cmp bx,40
; je c7
; jne do7

; c7:
; inc y7
; cmp y7,60
; je brick1
; jne r7


;-----------------------

brick1:                

rep1:                  
mov xcord1,30
mov bx,0


make1:                ; make the brick
MOV AH, 0Ch
MOV AL, 05h          ; Color Number
MOV CX, xcord1           ; co-ordinates of X-axis 
MOV DX, ycord1          ; co-ordinates of Y-axis 
INT 10H


inc xcord1
inc bx
cmp bx,40
je  clr1                ; colour the brick
jne make1

clr1:
inc ycord1
cmp ycord1,80
je  brick2
jne rep1

;-----------------------

brick2:                

rep2:                  
mov xcord2,75
mov bx,0


make2:                ; make the brick
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, xcord2           ; co-ordinates of X-axis 
MOV DX, ycord2          ; co-ordinates of Y-axis 
INT 10H


inc xcord2
inc bx
cmp bx,40
je  clr2                ; colour the brick
jne make2

clr2:
inc ycord2
cmp ycord2,80
je  brick3
jne rep2

;-----------------------

brick3:                

rep3:                  
mov xcord3, 120
mov bx,0


make3:                ; make the brick
MOV AH, 0Ch
MOV AL, 0Eh          ; Color Number
MOV CX, xcord3           ; co-ordinates of X-axis 
MOV DX, ycord3          ; co-ordinates of Y-axis 
INT 10H


inc xcord3
inc bx
cmp bx,40
je  clr3                ; colour the brick
jne make3

clr3:
inc ycord3
cmp ycord3,80
je brick4
jne rep3

;-----------------------

brick4:                

rep4:                  
mov xcord4,165
mov bx,0


make4:                ; make the brick
MOV AH, 0Ch
MOV AL, 0Bh          ; Color Number
MOV CX, xcord4           ; co-ordinates of X-axis 
MOV DX, ycord4          ; co-ordinates of Y-axis 
INT 10H


inc xcord4
inc bx
cmp bx,40
je  clr4                ; colour the brick
jne make4

clr4:
inc ycord4
cmp ycord4,80
je brick5
jne rep4


;-----------------------

brick5:                

rep5:                  
mov xcord5,210
mov bx,0


make5:                ; make the brick
MOV AH, 0Ch
MOV AL, 02h          ; Color Number
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
cmp ycord5,80
je box6
jne rep5


;-----------------------------------------

box6:

again6:
mov xaxis7,260
mov bx,0


L7:
MOV AH, 0Ch
MOV AL, 06h      ; Color Number
MOV CX, xaxis7      ; co-ordinates of X-axis 
MOV DX, yaxis7       ; co-ordinates of Y-axis 
INT 10H


inc xaxis7
inc bx
cmp bx,40
je color5
jne L7

color5:
inc yaxis7
cmp yaxis7,80
je br1
jne again6

;-----------------------

br1:                

repeat1:                  
mov xa, 30
mov bx,0


m1:                      ; make the brick
MOV AH, 0Ch
MOV AL, 04h              ; Color Number
MOV CX, xa               ; co-ordinates of X-axis 
MOV DX, ya               ; co-ordinates of Y-axis 
INT 10H


inc xa
inc bx
cmp bx,40
je  co1                ; colour the brick
jne m1

co1:
inc ya
cmp ya,103
je br2
jne repeat1

;-----------------------

br2:                

repeat2:                  
mov xb, 75
mov bx,0


m2:                      ; make the brick
MOV AH, 0Ch
MOV AL, 03h              ; Color Number
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
cmp yb,103
je br3
jne repeat2

;-----------------------

br3:                

repeat3:                  
mov xc, 120
mov bx,0


m3:                      ; make the brick
MOV AH, 0Ch
MOV AL, 0Dh              ; Color Number
MOV CX, xc               ; co-ordinates of X-axis 
MOV DX, yc               ; co-ordinates of Y-axis 
INT 10H


inc xc
inc bx
cmp bx,40
je  co3                ; colour the brick
jne m3

co3:
inc yc
cmp yc,103
je br4
jne repeat3


;-----------------------

br4:                

repeat4:                  
mov xd, 165
mov bx,0


m4:                      ; make the brick
MOV AH, 0Ch
MOV AL, 06h              ; Color Number
MOV CX, xd              ; co-ordinates of X-axis 
MOV DX, yd               ; co-ordinates of Y-axis 
INT 10H


inc xd
inc bx
cmp bx,40
je  co4                ; colour the brick
jne m4

co4:
inc yd
cmp yd,103
je brkA
jne repeat4


;-----------------------

brkA:                

repeatA:                  
mov xe, 210
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
cmp ye,103
je brkB
jne repeatA



brkB:                

repeatB:                  
mov xf, 260
mov bx,0


mB:                      ; make the brick
MOV AH, 0Ch
MOV AL, 01h              ; Color Number
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
cmp yf,103
;je ball1
jne repeatB

ret
createBricks endp

BALL_MOTION PROC
mov ax,x_ballspeed
add x_ball,ax

mov ax,bounds
cmp x_ball,ax
jl x_speed_neg

mov ax,boundry_width
cmp x_ball,ax
jg x_speed_neg

mov ax,y_ballspeed
add y_ball,ax

mov ax,bounds
cmp y_ball,ax
jl y_speed_neg

mov ax,boundry_height
cmp y_ball,ax
jg y_speed_neg

ret
x_speed_neg:
    neg x_ballspeed
    ret
y_speed_neg:
    neg y_ballspeed
    ret
BALL_MOTION ENDP

BALL PROC
mov cx,x_ball
mov dx,y_ball


mov ax, x_ball
mov new_x, ax


mov ax, y_ball
mov new_y, ax


x_axis:
mov ah,0ch
mov al,14
int 10h

inc cx
mov ax,cx
sub ax,x_ball
cmp ax,ball_size
jng x_axis

mov cx,x_ball
inc dx

mov ax,dx
sub ax,y_ball
cmp ax,ball_size
jng x_axis

ret
BALL ENDP

SHADOW_BALL PROC
mov cx,new_x
mov dx,new_y

x_axis:
mov ah,0ch
mov al,00h
int 10h

inc cx
mov ax,cx
sub ax,x_ball
cmp ax,ball_size
jng x_axis

mov cx,x_ball
inc dx

mov ax,dx
sub ax,y_ball
cmp ax,ball_size
jng x_axis

ret
SHADOW_BALL ENDP


createborders proc uses ax bx cx dx

    mov ah,0Ch
    mov al,02h

    mov bx,0
    label1:
        mov cx,bcordx
        mov dx,bcordy
        .while cx<bcordx1
            int 10h
            inc cx
        .endw

        .while dx<bcordy1
            int 10h
            inc dx
        .endw

        .while cx>bcordx

            int 10h
            dec cx
        .endw

        .while dx>bcordy
            int 10h
            dec dx
        .endw

        add bcordx,2
        add bcordy,2
        sub bcordx1,2
        sub bcordy1,2
        mov al, 05h
        inc bx
        cmp bx,9
        jne label1


    ret
createborders ENDP

end

