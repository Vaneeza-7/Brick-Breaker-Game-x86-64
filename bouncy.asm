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
.stack 100h
.data
fn db "scores.txt", 0
handle dw ?
userScore db "0",'$'
space db "------------",'$'
read db 15 dup('$'),'$'
username db "vaneeza   ", '$'
bcordx dw 0
bcordx1 dw 0
bcordy dw 0
bcordy1 dw 0
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
mov ds, ax

mov ah, 00h
mov al, 12h
int 10h
        mov bcordx,0
        mov bcordx1,640
        mov bcordy,0
        mov bcordy1,480
		
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
call writeScore	
call readScore

mov ah, 4ch
int 21h
main endp

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
; ;opening file--------
; mov ah,3dh
; mov al,2
; mov dx,offset fn
; int 21h
; mov handle,ax

; ;writing in file------------

; mov cx,0
; mov dx,0
; mov ah,42h
; mov al,2
; int 21h

; mov ah,40h
; mov bx,handle
; mov cx,15
; mov dx,offset userScore
; int 21h

; ;closing file------
; mov ah, 03eh
; mov bx, handle
; int 21h

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

end

