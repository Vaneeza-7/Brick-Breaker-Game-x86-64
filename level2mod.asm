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
key2 db 0

; for line 1
xaxis1L2 dw 50
yaxis1L2 dw 20
xaxis2L2 dw 80
yaxis2L2 dw 20
xaxis3L2 dw 110
yaxis3L2 dw 20
xaxis4L2 dw 140
yaxis4L2 dw 20
xaxis5L2 dw 170
yaxis5L2 dw 20
xaxis6L2 dw 200
yaxis6L2 dw 20
xaxis7L2 dw 230
yaxis7L2 dw 20
xaxis8L2 dw 260
yaxis8L2 dw 20

; for line2
x1L2 dw 60          ; x for x axis
y1L2 dw 37          ; y for y axis
x2L2 dw 90
y2L2 dw 37
x3L2 dw 120
y3L2 dw 37
x4L2 dw 150
y4L2 dw 37
x5L2 dw 180
y5L2 dw 37
x6L2 dw 210
y6L2 dw 37
x7L2 dw 240
y7L2 dw 37

;for line 3

xcord1L2 dw 77    ; x coordinate
ycord1L2 dw 52    ; y coordinate
xcord2L2 dw 107   ; x coordinate
ycord2L2 dw 52    ; y coordinate
xcord3L2 dw 137   ; x coordinate
ycord3L2 dw 52    ; y coordinate
xcord4L2 dw 167   ; x coordinate
ycord4L2 dw 52    ; y coordinate
xcord5L2 dw 197   ; x coordinate
ycord5L2 dw 52    ; y coordinate 

;for line 4

xaL2 dw 98    ; xa for brick1 
yaL2 dw 68    ; ya for brick1
xbL2 dw 115
ybL2 dw 68
xcL2 dw 130
ycL2 dw 68
xdL2 dw 195
ydL2 dw 68

;line 5

xeL2 dw 105
yeL2 dw 84
xfL2 dw 200
yfL2 dw 84

;---paddle

pxl2 dw 10    ; paddle on x axis
pyl2  dw 180   ; paddle on y axis
templ2 dw 180
tempxl2 dw 90
tempyl2 dw 180
temp3 dw 185

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

score1 db "Score: $"
pname1 db "Name: $"
Level2 db "Level:2 $"

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
print score1

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

print Level2

mouse 1,28
print pname1

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
againl2:
mov xaxis1l2,50
mov bx,0


L1l2:
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, xaxis1l2       ; co-ordinates of X-axis 
MOV DX, yaxis1l2       ; co-ordinates of Y-axis 
INT 10H


inc xaxis1l2
inc bx
cmp bx,30
je filll2
jne L1l2

filll2:
inc yaxis1l2
cmp yaxis1l2,35
je box1l2
jne againl2


;-------------------------------------
box1l2:

again1l2:
mov xaxis2l2,80
mov bx,0


L2l2:
MOV AH, 0Ch
MOV AL, 04h      ; Color Number
MOV CX, xaxis2l2      ; co-ordinates of X-axis 
MOV DX, yaxis2l2       ; co-ordinates of Y-axis 
INT 10H


inc xaxis2l2
inc bx
cmp bx,30
je colorl2
jne L2l2

colorl2:
inc yaxis2l2
cmp yaxis2l2,35
je box2l2
jne again1l2


;-----------------------------

box2l2:

again2l2:
mov xaxis3l2,110
mov bx,0


L3l2:
MOV AH, 0Ch
MOV AL, 0Eh      ; Color Number
MOV CX, xaxis3l2      ; co-ordinates of X-axis 
MOV DX, yaxis3l2       ; co-ordinates of Y-axis 
INT 10H


inc xaxis3l2
inc bx
cmp bx,30
je color1l2
jne L3l2

color1l2:
inc yaxis3l2
cmp yaxis3l2,35
je box3l2
jne again2l2

;--------------------------------------------

box3l2:

again3l2:
mov xaxis4l2,140
mov bx,0


L4l2:
MOV AH, 0Ch
MOV AL, 01h         ; Color Number
MOV CX, xaxis4l2      ; co-ordinates of X-axis 
MOV DX, yaxis4l2      ; co-ordinates of Y-axis 
INT 10H


inc xaxis4l2
inc bx
cmp bx,30
je color2l2
jne L4l2

color2l2:
inc yaxis4l2
cmp yaxis4l2,35
je box4l2
jne again3l2



;---------------------------------------
box4l2:

again4l2:
mov xaxis5l2,170
mov bx,0


L5l2:
MOV AH, 0Ch
MOV AL, 02h      ; Color Number
MOV CX, xaxis5l2      ; co-ordinates of X-axis 
MOV DX, yaxis5l2       ; co-ordinates of Y-axis 
INT 10H


inc xaxis5l2
inc bx
cmp bx,30
je color3l2
jne L5l2

color3l2:
inc yaxis5l2
cmp yaxis5l2,35
je box5l2
jne again4l2

;--------------------------------------
box5l2:

again5l2:
mov xaxis6l2,200
mov bx,0


L6l2:
MOV AH, 0Ch
MOV AL, 05h      ; Color Number
MOV CX, xaxis6l2      ; co-ordinates of X-axis 
MOV DX, yaxis6l2       ; co-ordinates of Y-axis 
INT 10H


inc xaxis6l2
inc bx
cmp bx,30
je color4l2
jne L6l2

color4l2:
inc yaxis6l2
cmp yaxis6l2,35
je box6l2
jne again5l2

;-----------------------------------------

box6l2:

again6l2:
mov xaxis7l2,230
mov bx,0


L7l2:
MOV AH, 0Ch
MOV AL, 02h      ; Color Number
MOV CX, xaxis7l2      ; co-ordinates of X-axis 
MOV DX, yaxis7l2       ; co-ordinates of Y-axis 
INT 10H


inc xaxis7l2
inc bx
cmp bx,30
je color5l2
jne L7l2

color5l2:
inc yaxis7l2
cmp yaxis7l2,35
je box7l2
jne again6l2


;---------------------------------

box7l2:

again7l2:
mov xaxis8l2,260
mov bx,0


L8l2:
MOV AH, 0Ch
MOV AL, 0Eh          ; Color Number
MOV CX, xaxis8l2       ; co-ordinates of X-axis 
MOV DX, yaxis8l2       ; co-ordinates of Y-axis 
INT 10H


inc xaxis8l2
inc bx
cmp bx,30
je color6l2
jne L8l2

color6l2:
inc yaxis8l2
cmp yaxis8l2,35
je rec1l2
jne again7l2


;--------------------

rec1l2:

r1l2:                  ; r = repeat process  
mov x1l2,60
mov bx,0


do1l2:                 ; do the process
MOV AH, 0Ch
MOV AL, 0Eh          ; Color Number
MOV CX, x1l2           ; co-ordinates of X-axis 
MOV DX, y1l2           ; co-ordinates of Y-axis 
INT 10H


inc x1l2
inc bx
cmp bx,30
je c1l2                ; c for coloring
jne do1l2

c1l2:
inc y1l2
cmp y1l2,50
je rec2l2
jne r1l2



;--------------------

rec2l2:

r2l2:                  
mov x2l2,90
mov bx,0


do2l2:                 ; do the process
MOV AH, 0Ch
MOV AL, 02h          ; Color Number
MOV CX, x2l2           ; co-ordinates of X-axis 
MOV DX, y2l2           ; co-ordinates of Y-axis 
INT 10H


inc x2l2
inc bx
cmp bx,30
je c2l2
jne do2l2

c2l2:
inc y2l2
cmp y2l2,50
je rec3l2
jne r2l2

;--------------------

rec3l2:

r3l2:                   
mov x3l2,120
mov bx,0


do3l2:                 ; do the process
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, x3l2           ; co-ordinates of X-axis 
MOV DX, y3l2           ; co-ordinates of Y-axis 
INT 10H


inc x3l2
inc bx
cmp bx,30
je c3l2
jne do3l2

c3l2:
inc y3l2
cmp y3l2,50
je rec4l2
jne r3l2

;----------------

rec4l2:

r4l2:                 
mov x4l2,150
mov bx,0


do4l2:                 ; do the process
MOV AH, 0Ch
MOV AL, 05h          ; Color Number
MOV CX, x4l2           ; co-ordinates of X-axis 
MOV DX, y4l2           ; co-ordinates of Y-axis 
INT 10H


inc x4l2
inc bx
cmp bx,30
je c4l2
jne do4l2

c4l2:
inc y4l2
cmp y4l2,50
je rec5l2
jne r4l2


;----------------

rec5l2:

r5l2:                 
mov x5l2,180
mov bx,0


do5l2:                 ; do the process
MOV AH, 0Ch
MOV AL, 0Eh          ; Color Number
MOV CX, x5l2           ; co-ordinates of X-axis 
MOV DX, y5l2           ; co-ordinates of Y-axis 
INT 10H


inc x5l2
inc bx
cmp bx,30
je c5l2
jne do5l2

c5l2:
inc y5l2
cmp y5l2,50
je rec6l2
jne r5l2


;----------------

rec6l2:

r6l2:                 
mov x6l2,210
mov bx,0


do6l2:                 ; do the process
MOV AH, 0Ch
MOV AL, 02h          ; Color Number
MOV CX, x6l2           ; co-ordinates of X-axis 
MOV DX, y6l2           ; co-ordinates of Y-axis 
INT 10H


inc x6l2
inc bx
cmp bx,30
je c6l2
jne do6l2

c6l2:
inc y6l2
cmp y6l2,50
je rec7l2
jne r6l2

;----------------

rec7l2:

r7l2:               
mov x7l2,240
mov bx,0


do7l2:                 ; do the process
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, x7l2           ; co-ordinates of X-axis 
MOV DX, y7l2           ; co-ordinates of Y-axis 
INT 10H


inc x7l2
inc bx
cmp bx,30
je c7l2
jne do7l2

c7l2:
inc y7l2
cmp y7l2,50
je brick1l2
jne r7l2


;-----------------------

brick1l2:                

rep1l2:                  
mov xcord1l2,77
mov bx,0


make1l2:                ; make the brick
MOV AH, 0Ch
MOV AL, 02h          ; Color Number
MOV CX, xcord1l2           ; co-ordinates of X-axis 
MOV DX, ycord1l2          ; co-ordinates of Y-axis 
INT 10H


inc xcord1l2
inc bx
cmp bx,30
je  clr1l2                ; colour the brick
jne make1l2

clr1l2:
inc ycord1l2
cmp ycord1l2,65
je  brick2l2
jne rep1l2

;-----------------------

brick2l2:                

rep2l2:                  
mov xcord2l2,107
mov bx,0


make2l2:                ; make the brick
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, xcord2l2           ; co-ordinates of X-axis 
MOV DX, ycord2l2          ; co-ordinates of Y-axis 
INT 10H


inc xcord2l2
inc bx
cmp bx,30
je  clr2l2                ; colour the brick
jne make2l2

clr2l2:
inc ycord2l2
cmp ycord2l2,65
je  brick3l2
jne rep2l2

;-----------------------

brick3l2:                

rep3l2:                  
mov xcord3l2, 137
mov bx,0


make3l2:                ; make the brick
MOV AH, 0Ch
MOV AL, 05h          ; Color Number
MOV CX, xcord3l2           ; co-ordinates of X-axis 
MOV DX, ycord3l2          ; co-ordinates of Y-axis 
INT 10H


inc xcord3l2
inc bx
cmp bx,30
je  clr3l2; colour the brick
jne make3l2

clr3l2:
inc ycord3l2
cmp ycord3l2,65
je brick4l2
jne rep3l2

;-----------------------

brick4l2:                

rep4l2:                  
mov xcord4l2,167
mov bx,0


make4l2:                ; make the brick
MOV AH, 0Ch
MOV AL, 04h          ; Color Number
MOV CX, xcord4l2           ; co-ordinates of X-axis 
MOV DX, ycord4l2          ; co-ordinates of Y-axis 
INT 10H


inc xcord4l2
inc bx
cmp bx,30
je  clr4l2                ; colour the brick
jne make4l2

clr4l2:
inc ycord4l2
cmp ycord4l2,65
je brick5l2
jne rep4l2


;-----------------------

brick5l2:                

rep5l2:                  
mov xcord5l2,197
mov bx,0


make5l2:                ; make the brick
MOV AH, 0Ch
MOV AL, 01h          ; Color Number
MOV CX, xcord5l2           ; co-ordinates of X-axis 
MOV DX, ycord5l2          ; co-ordinates of Y-axis 
INT 10H


inc xcord5l2
inc bx
cmp bx,40
je  clr5l2                ; colour the brick
jne make5l2

clr5l2:
inc ycord5l2
cmp ycord5l2,65
je br1l2
jne rep5l2


;-----------------------

br1l2:                

repeat1l2:                  
mov xal2, 98
mov bx,0


m1l2:                      ; make the brick
MOV AH, 0Ch
MOV AL, 04h              ; Color Number
MOV CX, xal2               ; co-ordinates of X-axis 
MOV DX, yal2               ; co-ordinates of Y-axis 
INT 10H


inc xal2
inc bx
cmp bx,45
je  co1l2                ; colour the brick
jne m1l2

co1l2:
inc yal2
cmp yal2,80
je br2l2
jne repeat1l2

;-----------------------

br2l2:                

repeat2l2:                  
mov xbl2, 115
mov bx,0


m2l2:                      ; make the brick
MOV AH, 0Ch
MOV AL, 01h              ; Color Number
MOV CX, xbl2               ; co-ordinates of X-axis 
MOV DX, ybl2               ; co-ordinates of Y-axis 
INT 10H


inc xbl2
inc bx
cmp bx,40
je  co2l2                ; colour the brick
jne m2l2

co2l2:
inc ybl2
cmp ybl2,80
je br3l2
jne repeat2l2

;-----------------------

br3l2:                

repeat3l2:                  
mov xcl2, 130
mov bx,0


m3l2:                      ; make the brick
MOV AH, 0Ch
MOV AL, 05h              ; Color Number
MOV CX, xcl2               ; co-ordinates of X-axis 
MOV DX, ycl2               ; co-ordinates of Y-axis 
INT 10H


inc xcl2
inc bx
cmp bx,28
je  co3l2                ; colour the brick
jne m3l2

co3l2:
inc ycl2
cmp ycl2,80
je br4l2
jne repeat3l2


;-----------------------

br4l2:                

repeat4l2:                  
mov xdl2, 195
mov bx,0


m4l2:                      ; make the brick
MOV AH, 0Ch
MOV AL, 02h              ; Color Number
MOV CX, xdl2              ; co-ordinates of X-axis 
MOV DX, ydl2               ; co-ordinates of Y-axis 
INT 10H


inc xdl2
inc bx
cmp bx,30
je  co4l2                ; colour the brick
jne m4l2

co4l2:
inc ydl2
cmp ydl2,80
je brkAl2
jne repeat4l2


;-----------------------

brkAl2:                

repeatAl2:                  
mov xel2, 105
mov bx,0


mAl2:                      ; make the brick
MOV AH, 0Ch
MOV AL, 0Eh              ; Color Number
MOV CX, xel2               ; co-ordinates of X-axis 
MOV DX, yel2               ; co-ordinates of Y-axis 
INT 10H


inc xel2
inc bx
cmp bx,40
je  coAl2                 ; colour the brick
jne mAl2

coAl2:
inc yel2
cmp yel2,95
je brkBl2
jne repeatAl2



brkBl2:                

repeatBl2:                  
mov xfl2, 200
mov bx,0


mBl2:                      ; make the brick
MOV AH, 0Ch
MOV AL, 05h              ; Color Number
MOV CX, xfl2               ; co-ordinates of X-axis 
MOV DX, yfl2               ; co-ordinates of Y-axis 
INT 10H


inc xfl2
inc bx
cmp bx,40
je  coBl2                 ; colour the brick
jne mBl2

coBl2:
inc yfl2
cmp yfl2,95
je makepaddlel2
jne repeatBl2
;------------------------------------------

makepaddlel2:
mov pxl2,90
mov bx,0


PADDLEl2:
MOV AH, 0Ch
MOV AL, 0Ch      ; Color Number
MOV CX, pxl2        ; co-ordinates of X-axis 
MOV DX, pyl2       ; co-ordinates of Y-axis 
INT 10H


inc pxl2
inc bx
cmp bx,40              ;length
je fillpaddlel2
jne PADDLEl2

fillpaddlel2:
inc pyl2
cmp pyl2,185
je  resetCoordinatesl2               ;paddlemovement
jne makepaddlel2

resetCoordinatesl2:
mov pxl2, 90
mov pyl2, 180

paddlemovementl2:

mov pyl2, 180

mov ah,1 ; key pressed
int 16h

jz paddlemovementl2


mov ah,00h  ; which key pressed
int 16h

mov key2,ah


cmp ah,4Bh
je left2

cmp ah,4Dh
je rightl2

cmp al,13
je Exit
JNE paddlemovementl2


left2:
mov bx, pxl2 ;90
mov tempxl2, bx   ; tempx = 90
mov bx, pyl2      ;180
mov tempyl2, bx   ; tempy = 180
mov templ2,40; length saved

makepaddle1l2:    ; black paddle
mov bx, pxl2      ;90
mov tempxl2, bx  ;tempx = 90
mov bx,0

PADDLE1l2:
MOV AH, 0Ch
MOV AL, 00h          ; Color black(disappear paddle)
MOV CX, tempxl2        ; co-ordinates of X-axis 
MOV DX, tempyl2        ; co-ordinates of Y-axis 
INT 10H


inc tempxl2
inc bx
cmp bx, templ2 ; 
je fillpaddle1l2
jne PADDLE1l2

fillpaddle1l2:
inc tempyl2
cmp tempyl2,185        
je  moveleftl2
jne makepaddle1l2      ;PADDLE1



moveleftl2:
mov bx, pxl2     ; 90
mov tempxl2, bx  ;90
sub tempxl2, 7   ; 
sub pxl2, 7      ; orignal coordinates

; subtracting for left moving
mov templ2,40 ; length of paddle

mov bx, pyl2    ; 180
mov tempyl2, bx ; 180

; finally moving left 
makepaddle2l2:
mov bx, pxl2
mov tempxl2, bx
mov bx,0

PADDLE2l2:
MOV AH, 0Ch
MOV AL, 0Ch      ; Color Number
MOV CX, tempxl2        ; co-ordinates of X-axis 
MOV DX, tempyl2       ; co-ordinates of Y-axis 
INT 10H

inc tempxl2
inc bx
cmp bx, templ2        ;68
je fillpaddle2l2
jne PADDLE2l2

fillpaddle2l2:
inc tempyl2 
cmp tempyl2, 185
je  paddlemovementl2                ;changeCoordinates;
jne makepaddle2l2                   ;moveleft 



rightl2:
mov bx, pxl2
mov tempxl2, bx
mov bx, pyl2
mov tempyl2, bx
mov templ2, 40; length saved

makepaddle3l2:
mov bx, pxl2
mov tempxl2, bx
mov bx,0

PADDLE3l2:
MOV AH, 0Ch
MOV AL, 00h      ; Color (disappear paddle)
MOV CX, tempxl2        ; co-ordinates of X-axis 
MOV DX, tempyl2       ; co-ordinates of Y-axis 
INT 10H


inc tempxl2
inc bx
cmp bx, templ2       ;68
je fillpaddle3l2
jne PADDLE3l2

fillpaddle3l2:
inc tempyl2
cmp tempyl2,185        ; width
je  moverightl2
jne makepaddle3l2


moverightl2:
mov bx, pxl2
mov tempxl2, bx
add tempxl2, 7
add pxl2, 7
mov templ2,40      ;length

mov bx, pyl2
mov tempyl2, bx

makepaddle4l2:
mov bx, pxl2
mov tempxl2, bx
mov bx,0

PADDLE4l2:
MOV AH, 0Ch
MOV AL, 0Ch      ; Color Number
MOV CX, tempxl2        ; co-ordinates of X-axis 
MOV DX, tempyl2       ; co-ordinates of Y-axis 
INT 10H

inc tempxl2
inc bx
cmp bx, templ2        
je fillpaddle4l2
jne PADDLE4l2

fillpaddle4l2:
inc tempyl2  
cmp tempyl2, 185
je  paddlemovementl2
jne makepaddle4l2
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
