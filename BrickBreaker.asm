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
Level db "Level: $"

username db 5 dup('$') ,'$'
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;level 2 stuff
leveloption1 db "Press 1 if you want to play Level 1.",'$'
leveloption2 db "Press 1 for Level1 and 2 if you want to play Level2.",'$'
leveloption3 db "Your choice here: ",'$'
levelchoice db ?

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
;------------------sound variables-----------

    ; sound_index dw 0
	; sound_data:
	; incbin	"lonewolf.wav" ;1,063,432 bytes
	
;-------------score variables-----------
scoring1 db "ooooo",'$'
scoring2 db "o",'$'
scoring3 db "o                           ooooo",'$'  
scoring4 db "ooooo  oooooo  oooo  ooooo  o",'$'
scoring5 db "    o  o       o  o  o  o   ooooo",'$'
scoring6 db "    o  o       o  o  oooo   o",'$'
scoring7 db "ooooo  oooooo  oooo  o   o  ooooo",'$'

.code
main proc
mov ax, @data
mov ds,ax
firstScreen:
;-----------sound stuff starts here----------------
; myloop:
; mov dx, 22ch
; mov al, 10h
; out dx, al

; mov si, [sound_index]
; mov al, [sound_data+si]
; out dx, al

; mov cx, 10000
; adelay:
 ; nop
 ; loop adelay

; inc  [sound_index]
; cmp  [sound_index], 1063432
; jb myloop
;-----------sound stuff ends here----------------

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

cmp al, 112          ;if p is pressed go to level screen 
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
 mov ah, 02h
    mov bh, 0
    mov dh, 5 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h

    print scoring1

mov ah, 02h
    mov bh, 0
    mov dh, 6 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h

    print scoring2
mov ah, 02h
    mov bh, 0
    mov dh, 7 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h

    print scoring3
mov ah, 02h
    mov bh, 0
    mov dh, 8 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h

    print scoring4
mov ah, 02h
    mov bh, 0
    mov dh, 9 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h

    print scoring5
mov ah, 02h
    mov bh, 0
    mov dh, 10 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h

    print scoring6
mov ah, 02h
    mov bh, 0
    mov dh, 11 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h

    print scoring7
	
    mov ah, 02h
    mov bh, 0
    mov dh, 15 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h
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
call levelScreen


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

;closing file------
mov ah, 03eh
mov bx, handle
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

levelScreen proc uses ax bx cx dx
mov ah, 00h
mov al, 12h
int 10h
        mov bcordx,0
        mov bcordx1,640
        mov bcordy,0
        mov bcordy1,480
		
call createborders

    ; mov ah, 02h
    ; mov bh, 0
    ; mov dh, 5 ;Row Number 
    ; mov dl, 70 ;Column Number 
    ; int 10h

    ; print leveloption1
	
	mov ah, 02h
    mov bh, 0
    mov dh, 7 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h

    print leveloption2
	
	mov ah, 02h
    mov bh, 0
    mov dh, 9 ;Row Number 
    mov dl, 20 ;Column Number 
    int 10h

    print leveloption3
	
	mov ah, 01h
    int 21h
    sub al, 48
    mov levelchoice, al

	.if levelchoice == 2
	  call clearscreen
	  call leveltwo
	  jmp levelEnd
	.endif
	.if levelchoice == 1
       call clearscreen
	   call levelone
	   jmp levelEnd
	.endif  
levelEnd:	
ret	
levelScreen endp

leveltwo proc uses ax bx cx dx

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

 mouse 1, 24
 mov dl, levelchoice
 add dl, 48
 mov ah, 02h
 int 21h

mouse 1,28
print pname

mouse 1,33
mov si, offset username
mov cx, 7
hi:
mov ah, 02h
mov dl, [si]
inc si
int 21h
loop hi
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

 mouse 1, 24
 mov dl, levelchoice
 add dl, 48
 mov ah, 02h
 int 21h

mouse 1,28
print pname

mouse 1,33
mov si, offset username
mov cx, 7
printing:
mov ah, 02h
mov dl, [si]
inc si
int 21h
loop printing

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


cmp ah,4Bh
je left2

cmp ah,4Dh
je rightl2

cmp al,13
je retStatement
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
sub tempxl2, 7 
.if px<=15
add px,7
.else  
sub pxl2, 7      ; orignal coordinates
.endif

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
.if px>=250
sub px,7
.else
add pxl2,7
.endif
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

retStatement:
ret
leveltwo endp
	

levelone proc uses ax bx cx dx
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

 mouse 1, 24
 mov dl, levelchoice
 add dl, 48
 mov ah, 02h
 int 21h


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
; ;---------------create BALL--------------
; mov squarex, 90
; mov bx, squarey
; mov bally, bx
; ball1:

; againBall:
; mov bx, squarex
; mov ballx, bx
; mov bx,0

; makeBall:
; MOV AH, 0Ch
; MOV AL, 04h         ; Color Number
; MOV CX, ballx      ; co-ordinates of X-axis 
; MOV DX, bally       ; co-ordinates of Y-axis 
; INT 10H

; inc ballx
; inc bx
; cmp bx,10
; je ball2
; jne makeBall

; ball2:
; inc bally
; cmp bally,170
; ;je moveBall
; jne againBall
; ;======================move the ball=========================

 ; moveBall:
 ; call delay 
; cmp squarex, 1
; jg ballleft
; jng makepaddle
 
; ballleft:
                              ; ;squarex and squarey are original coordinates of ball
							  ; ;ballx and bally are changing temporary coordinates for ball
; mov bx, squarex 
; mov ballx, bx   
; mov bx, squarey      
; mov bally, bx   
 
; makeball1:   

; mov bx, squarex      
; mov ballx, bx  
; mov bx,0

; blackBall:
; MOV AH, 0Ch
; MOV AL, 00h          ; Color black(disappear ball)
; MOV CX, ballx        ; co-ordinates of X-axis 
; MOV DX, bally        ; co-ordinates of Y-axis 
; INT 10H


; inc ballx
; inc bx
; cmp bx, 10
; je black1
; jne blackBall

; black1:
; inc bally
; cmp bally, 170        
; je  disBall
; jne makeball1      ;PADDLE1


; disBall:
; mov bx, squarex     ; 90
; mov ballx, bx  ;90
; sub ballx, 5   ; 90-5 = 85
; sub squarex, 5     

; mov bx, squarey    ; 180
; mov bally, bx ; 180

; ; finally moving left 
; makeBall2:
; mov bx, squarex
; mov ballx, bx
; mov bx,0

; newBall:
; MOV AH, 0Ch
; MOV AL, 04h      ; Color Number
; MOV CX, ballx        ; co-ordinates of X-axis 
; MOV DX, bally       ; co-ordinates of Y-axis 
; INT 10H

; inc ballx
; inc bx
; cmp bx, 10        ;68
; je newBall2
; jne newBall

; newBall2:
; inc bally 
; cmp bally, 170
; je  moveBall                ;changeCoordinates;
; jne makeBall2                   ;moveleft 

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
je return1

cmp al, 32
je balling

.if al==49
  call pause_screen
.endif

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
.if px<=10
add px,5
.else
sub px, 5      ; orignal coordinates
.endif
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
.if px>=250
sub px,5
.else
add px, 5
.endif
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
 balling:
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

return1:
ret
levelone endp      

delay proc uses cx
mov cx, 0FFFFFFFFh
mydelay:
   
loop mydelay
ret
delay endp

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


pause_screen proc uses ax bx cx dx
mov cx, 0FFFFFFFFh
vaneeza:
   check:
    mov ah,1 ; key pressed
    int 16h

    mov ah,00h  ; which key pressed
    int 16h

   .if al==27
    ret
    .endif
     jmp check
loop vaneeza


pause_screen endp

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

