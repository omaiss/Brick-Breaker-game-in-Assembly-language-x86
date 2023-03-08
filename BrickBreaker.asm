.model small
.stack 100h

.data
;page variables
x_coordinate dw ?
y_coordinate dw ?
color_border db 0Eh
fname db 'Names.txt',0
fhandle dw ?
filepos dw 0
buffer db 100 dup('$') 
buffer1 db 100 dup ('$')
names dw 0
sizes dw 0

bool_tp db 0

New_Gamex dw 0
New_Gamey dw 0
Resume_Gamex dw 0
Resume_Gamey dw 0

temp db ?
temp2 db ?
colr db 1
tmp db 5
resume_var db 0

;level 1 variables
str1 db "Name: ","$"
str2 db "Score: ","$"
str3 db 20 dup(?)
str4 db "Lives: ","$"

window_width dw 0140h
window_heigt dw 0C8h  ;320*200

brikx dw 20
briky dw 30 
brickex dw 60
brickey dw 45
brik db 2

brik1x dw 65
brik1y dw 30 
brick1ex dw 105
brick1ey dw 45
brik1 db 2

brik2x dw 110
brik2y dw 30 
brick2ex dw 150
brick2ey dw 45
brik2 db 2

brik3x dw 155
brik3y dw 30 
brick3ex dw 195
brick3ey dw 45
brik3 db 2

brik4x dw 200
brik4y dw 30 
brick4ex dw 240
brick4ey dw 45
brik4 db 2

brik5x dw 245
brik5y dw 30 
brick5ex dw 285
brick5ey dw 45
brik5 db 2

brik6x dw 20
brik6y dw 50
brick6ex dw 60
brick6ey dw 65
brik6 db 2

brik7x dw 65
brik7y dw 50
brick7ex dw 105
brick7ey dw 65
brik7 db 2

brik8x dw 110
brik8y dw 50
brick8ex dw 150
brick8ey dw 65
brik8 db 2

brik9x dw 155
brik9y dw 50
brick9ex dw 195
brick9ey dw 65
brik9 db 2

brik10x dw 200
brik10y dw 50
brick10ex dw 240
brick10ey dw 65
brik10 db 2

brik11x dw 245
brik11y dw 50
brick11ex dw 285
brick11ey dw 65
brik11 db 2

brik12x dw 20
brik12y dw 70
brick12ex dw 60
brick12ey dw 85
brik12 db 2

brik13x dw 65
brik13y dw 70
brick13ex dw 105
brick13ey dw 85
brik13 db 2

brik14x dw 110
brik14y dw 70
brick14ex dw 150
brick14ey dw 85
brik14 db 2

brik15x dw 155
brik15y dw 70
brick15ex dw 195
brick15ey dw 85
brik15 db 2

brik16x dw 200
brik16y dw 70
brick16ex dw 240
brick16ey dw 85
brik16 db 2

brik17x dw 245
brik17y dw 70
brick17ex dw 285
brick17ey dw 85
brik17 db 2

brik18x dw 20
brik18y dw 90
brick18ex dw 60
brick18ey dw 105
brik18 db 2

brik19x dw 65
brik19y dw 90
brick19ex dw 105
brick19ey dw 105
brik19 db 2

brik20x dw 110
brik20y dw 90
brick20ex dw 150
brick20ey dw 105
brik20 db 2

brik21x dw 155
brik21y dw 90
brick21ex dw 195
brick21ey dw 105
brik21 db 2

brik22x dw 200
brik22y dw 90
brick22ex dw 240
brick22ey dw 105
brik22 db 2

brik23x dw 245
brik23y dw 90
brick23ex dw 285
brick23ey dw 105
brik23 db 2

brik24x dw 20
brik24y dw 110
brick24ex dw 60
brick24ey dw 125
brik24 db 2

brik25x dw 65
brik25y dw 110
brick25ex dw 105
brick25ey dw 125
brik25 db 2

brik26x dw 110
brik26y dw 110
brick26ex dw 150
brick26ey dw 125
brik26 db 2

brik27x dw 155
brik27y dw 110
brick27ex dw 195
brick27ey dw 125
brik27 db 2

brik28x dw 200
brik28y dw 110
brick28ex dw 240
brick28ey dw 125
brik28 db 2

brik29x dw 245
brik29y dw 110
brick29ex dw 285
brick29ey dw 125
brik29 db 2

color db 6
brick_count db 30

ballx dw 150
bally dw 150 
balex dw 157
baley dw 157
time_tmp db 0
ball_vel_x dw 02h
ball_vel_y dw 02h
ball_size dw 7
ball_colr db 0

paddlex dw 110
paddlnx dw 180
paddle_vel_x dw 15
paddley dw 185
paddleny dw 195

beep_Frequency dw 0 
hearts_cords db 0
hearts dw 3

hearts_temp dw 3
score_temp db 0
paus_temp db 0

score db 0
score1 db 0
score2 db 0
score_Inc db 1
call_levels db 1
brick_breaks db 1

seconds db 0
paddle_bool db 1

tmp1 dw 0
tmp2 dw 0
tmp3 db 1
tmp4 dw 0
tmp5 dw 0
tmp6 dw 0
tmp7 dw 0
tmp8 dw 0
temp_var db 1
temp5 db 1
level_temp db 0
pr_temp db 0 
pr_temp1 db 0 
pr_temp2 db 0
pr_temp3 db 20
menu_rows db 0

.code

Make_Brick macro x_valu, y_valu, xend_valu, yend_valu, colour       ;draw bricks procedure   

    mov cx,x_valu
    mov dx,y_valu
    mov bx,xend_valu
    mov tmp1,bx
    mov bx,yend_valu
    mov tmp2,bx
    mov bl,colour
    mov tmp3,bl
    mov bx,x_valu
    mov tmp4,bx
    call draw_Brick

ENDM

destroy_brik MACRO x_valu, y_valu, xend_valu, yend_valu, colour

	mov cx,x_valu
    mov dx,y_valu
    mov bx,xend_valu
    mov tmp1,bx
    mov bx,yend_valu
    mov tmp2,bx
    mov bl,colour
    mov tmp3,bl
    mov bx,x_valu
    mov tmp4,bx
    call draw_Brick

ENDM

end_brick MACRO x_valu, y_valu, xend_valu, yend_valu
	
	mov x_valu,0
	mov xend_valu,0
	mov y_valu,0
	mov yend_valu,0

ENDM

special_brick MACRO


ENDM

Brick_Collisions MACRO x_valu, y_valu, xend_valu, yend_valu, level
;macro that will chek for the collision of the ball with the bricks for every indiviudal brick
local check_brick_collision
local dont_remove

	mov ax, ballx
    add ax, ball_size
    cmp ax, x_valu
    jng check_brick_collision

    mov ax, xend_valu  ;calculating the brick width and comparing with ballx
    mov bx, x_valu
    sub ax, bx
    add ax, x_valu
    cmp ballx, ax
    jnl check_brick_collision

    mov ax, bally
    add ax, ball_size
    cmp ax, y_valu
    jng check_brick_collision

    mov ax, yend_valu
    mov bx, y_valu
    sub ax,bx
    add ax, y_valu
    cmp bally, ax
    jnl check_brick_collision
	
	
	mov beep_Frequency, 500
	call beep
	
	.if call_levels == 1 || level == 1 
	destroy_brik x_valu, y_valu, xend_valu, yend_valu, 0
	mov al, score_Inc
	add score, al
	dec brick_count
	NEG ball_vel_y
	mov x_valu,0
	mov xend_valu,0
	mov y_valu,0
	mov yend_valu,0
	jmp check_brick_collision
	.endif
	
	.if call_levels == 2 || level == 2  
	NEG ball_vel_y
	destroy_brik x_valu, y_valu, xend_valu, yend_valu, 09H
	mov level, 1
	jmp check_brick_collision
	.endif
	
	.if call_levels == 3
	;for the hard bricks that do not break on collision
	mov ax, brik3x
	mov bx, brik3y 
		.if x_valu == ax && y_valu == bx
		
		mov cx, ball_size
		add cx, ballx
		mov bx, balex
		sub bx, ball_size						
		.if cx > xend_valu || bx < x_valu
		NEG ball_vel_x
		.else
		NEG ball_vel_y					
		.endif
						
		jmp check_brick_collision
		.endif
	mov ax, brik10x
	mov bx, brik10y 	
			.if x_valu == ax && y_valu == bx
			mov cx, ball_size
			add cx, ballx						
			mov bx, balex
			sub bx, ball_size						
			.if cx > xend_valu || bx < x_valu
			NEG ball_vel_x
			.else
			NEG ball_vel_y					
			.endif
						
			jmp check_brick_collision
			.endif
	mov ax, brik13x
	mov bx, brik13y 	
				.if x_valu == ax && y_valu == bx
				mov cx, ball_size
				add cx, ballx						
				mov bx, balex
				sub bx, ball_size		
				.if cx > xend_valu || bx < x_valu
				NEG ball_vel_x
				.else
				NEG ball_vel_y					
				.endif
						
				jmp check_brick_collision
				.endif
	mov ax, brik22x
	mov bx, brik22y 
					.if x_valu == ax && y_valu == bx
					mov cx, ball_size
					add cx, ballx						
					mov bx, balex
					sub bx, ball_size						
					.if cx > xend_valu || bx < x_valu
					NEG ball_vel_x
					.else
					NEG ball_vel_y					
					.endif
						
					jmp check_brick_collision			
					.endif	
					
	
	;for the special brick that will break 5 other bricks
	mov ax, brik29x
	mov bx, brik29y
			
			.if x_valu == ax && y_valu == bx && brick_count >= 15 
			destroy_brik brik1x, brik1y, brick1ex, brick1ey, 0
			end_brick brik1x, brik1y, brick1ex, brick1ey
			
			destroy_brik brik9x, brik9y, brick9ex, brick9ey, 0
			end_brick brik9x, brik9y, brick9ex, brick9ey 
			
			destroy_brik brik12x, brik12y, brick12ex, brick12ey, 0
			end_brick brik12x, brik12y, brick12ex, brick12ey
			
			destroy_brik brik16x, brik16y, brick16ex, brick16ey, 0
			end_brick brik16x, brik16y, brick16ex, brick16ey
			
			destroy_brik brik20x, brik20y, brick20ex, brick20ey, 0
			end_brick brik20x, brik20y, brick20ex, brick20ey
			
			sub brick_count, 5
			
			.endif
			
	destroy_brik x_valu, y_valu, xend_valu, yend_valu, 0EH
	NEG ball_vel_y
	mov level, 2
	jmp check_brick_collision
	
	.endif	
	
	check_brick_collision:
	;ending if no brick collisions
	
ENDM

BorderMaking macro x_coordinate,y_coordinate,color_border
		push cx

		mov ah,0ch
		mov al,color_border
		mov bh,0
		mov cx,x_coordinate
		mov dx,y_coordinate
		int 10h

		pop cx
ENDM

jmp start


BorderPrinting proc
		; for displaying the borders on the name input screen
		mov x_coordinate, 1
		mov x_coordinate, 1
		mov cx,317
		L1:
			BorderMaking x_coordinate,y_coordinate,color_border
			inc x_coordinate
		loop L1

		mov cx,200
		mov x_coordinate,1
		L2:
			BorderMaking x_coordinate,y_coordinate,color_border
			inc y_coordinate
		loop L2

		mov cx,200
		mov x_coordinate,318
		mov y_coordinate,1
		L3:
			BorderMaking x_coordinate,y_coordinate,color_border
			inc y_coordinate
		loop L3

		mov cx,317
		mov y_coordinate,404
		mov x_coordinate,-62
		L4:
			BorderMaking x_coordinate,y_coordinate,14
			inc x_coordinate
		loop L4

		ret
	BorderPrinting endp

display proc
	
	call Clear_Screen
	
	MOV AH, 06h		;changing the background
	MOV AL, 0
	MOV CX, 0
	MOV DH, 80
	MOV DL, 80
	MOV BH, 07H
	INT 10h

call BorderPrinting

    ; Six
    mov al, 1
	mov bh, 0
	mov bl, 0Eh
	mov cx, M8end - offset M8 ; calculate message size. 
	mov dl, 46 ;column
	mov dh, 4  ;row
	push cs
	pop es
	mov bp, offset M8
	mov ah, 13h
	int 10h
	jmp M8end
    M8 DB " Welcome To Brick-Breaker"
	M8end:

	;Seven
    mov al, 1
	mov bh, 0
	mov bl, 0Eh
	mov cx, M6end - offset M6 ; calculate message size. 
	mov dl, 42  ;column
	mov dh, 6  ;row
	push cs
	pop es
	mov bp, offset M6
	mov ah, 13h
	int 10h
	jmp M6end
    M6 DB " Enter Your Name : "
	M6end:

	mov si,0
	mov cx,0

	again:
	mov ah,01h
	int 21h
	cmp al, 13
	je exiting
	mov buffer[si], al
	inc si
	inc cx
	jmp again

	exiting:
	mov names, cx


ret
display endp

File_Writing proc

	mov ax,0
	mov bx,0
	mov cx,0
	mov dx,0

	;file existance check
    mov cx, 3fh
    mov dx, offset fname
    mov ah, 4eh
    int 21h
    jc errorr
	jnc already_exists
	;Create a new file
	mov ah,3ch
	lea dx,fname
	mov cx,0
	int 21h
	mov fhandle,ax

	already_exists:
	; Open a file
	mov ah, 3dh
	lea dx,fname
	mov al, 2
	int 21h
	mov fhandle, ax

	;Writing and Appending File	
	mov bx, fhandle
	mov ah, 42h  ; "lseek"
	mov al, 2    ; position relative to end of file
	mov cx, 0    ; offset MSW
	mov dx, 0    ; offset LSW
	int 21h

	MOV BX, fhandle
	MOV AH, 40H                   ; SERVICE TO WRITE TO A FILE			MOV BX, fhandle
	MOV CX, names                     ;STRING LENGTH.		
	mov dx, OFFSET buffer
	INT 21H
	
	MOV BX, fhandle
	MOV AH, 40H                   ; SERVICE TO WRITE TO A FILE			MOV BX, fhandle
	MOV CX, sizeof score                     ;STRING LENGTH.		
	mov dx, OFFSET score
	INT 21H

	;Close a file
	mov ah,3EH
	mov bx,fhandle
	int 21h

errorr:
ret
File_Writing endp

disp_name proc
	
	mov dx, 0
	lop:
	mov dl,[si]
	mov ah, 02h
	int 21h
	inc si
	loop lop

ret
disp_name endp

File_Reading proc
	mov ah, 3dh ; 3dh of dos services opens a file.
	mov al, 0 ; 0 - for reading. 1 - for writing. 2 - both
	lea dx, fname ; make a pointer to the filename
	int 21h ; call dos
	
	mov fhandle, ax
	
	;Read a data from a file 
	mov ah,3fh
	lea dx,buffer1
	mov cx,lengthof buffer1
	mov bx,fhandle
	int 21h
	
	mov pr_temp, 4
	mov pr_temp1, 20
	
	mov ah,02h
    mov bh,00h
    mov dh, pr_temp           ;for rows
    mov dl, 5             ;for columns
    int 10H
	
	mov dx, 0
	mov cx,lengthof buffer1
	mov si,offset buffer1
	lop:
	mov dl,[si]
	inc sizes
	
	.if sizes >= 9
	add pr_temp, 2
	mov ah,02h
    mov bh,00h
    mov dh, pr_temp           ;for rows
    mov dl, 5             ;for columns
    int 10H
	mov sizes, 0
	mov pr_temp1, 20
	.endif
	
	.if dl >= 41h && dl <= 5Ah 
	mov ah, 02h
	int 21h
	.endif

	.if dl >= 61h && dl <= 7Ah
	mov ah, 02h
	int 21h
	.endif
	
	.if dl >= "0" && dl <= "9"
	inc pr_temp1
	mov ah,02h
    mov bh,00h
    mov dh, pr_temp           ;for rows
    mov dl, pr_temp1             ;for columns
    int 10H
	
	mov dl,[si]
	mov ah, 02h
	int 21h
	.endif
	
	looping:
	inc si
	dec cx
	cmp cx, 0
	jne lop
	
	; To close a file
	mov ah, 3eh ;service to close file.
	mov bx, fhandle
	int 21h
	jmp ok
	
	errr:
	mov ah,02h
	mov dl,"E"
	int 21h
	ok:
ret
File_Reading endp


Main_Menu proc 
	
	cmp bool_tp, 0
	jne starat
	call display
	inc bool_tp
	starat:
	call Clear_Screen

;One
	mov ah,02h
    mov bh,00h
    mov dh,4
    mov dl,20
    int 10H
	
	lea dx, str1
	mov ah, 09H
	int 21h
	
	mov ah,02h
    mov bh,00h
    mov dh,4
    mov dl, 26
    int 10H	

	mov cx, names
	mov si,OFFSET buffer
	call disp_name
;Two
    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, M1end - offset M1 	; calculate message size. 
	mov dl, 7   ;column
	mov dh, 8  ;row
	push cs
	pop es
	mov bp, offset M1
	mov ah, 13h
	int 10h
	jmp M1end
    M1 DB " **** Brick_Breaker ****" 
	M1end:

	mov menu_rows, 10
;Four
    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, M3end - offset M3 ; calculate message size. 
	mov dl, 52  ;column
	mov dh, menu_rows  ;row
	push cs
	pop es
	mov bp, offset M3
	mov ah, 13h
	int 10h
	jmp M3end
    M3 DB " N|n-> NEW GAME"
	M3end:
	
	cmp resume_var, 1
	jne nxt
	add menu_rows, 2
;FIve
    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, M4end - offset M4 ; calculate message size. 
	mov dl, 52  ;column
	mov dh, menu_rows  ;row
	push cs
	pop es
	mov bp, offset M4
	mov ah, 13h
	int 10h
	jmp M4end
    M4 DB " R|r-> RESUME"
	M4end:
	
	nxt:
;Six
	add menu_rows, 2
    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, M5end - offset M5 ; calculate message size. 
	mov dl, 52  ;column
	mov dh, menu_rows  ;row
	push cs
	pop es
	mov bp, offset M5
	mov ah, 13h
	int 10h
	jmp M5end
    M5 DB " I|i-> INSTRUCTIONS"
	M5end:

;Seven
	add menu_rows, 2
    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, M6end - offset M66 ; calculate message size. 
	mov dl, 52  ;column
	mov dh, menu_rows  ;row
	push cs
	pop es
	mov bp, offset M66
	mov ah, 13h
	int 10h
	jmp M6end
    M66 DB " H|h-> HIGH SCORE"
	M6end:

; Eigth
	add menu_rows, 2
    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, M7end - offset M7 ; calculate message size. 
	mov dl, 52  ;column
	mov dh, menu_rows  ;row
	push cs
	pop es
	mov bp, offset M7
	mov ah, 13h
	int 10h
	jmp M7end
    M7 DB " ESC-> EXIT"
	M7end:
	
	
	;Keyboard Cheking
	again:
	mov ah,1
    int 16h
    jz again
    mov ah,0
    int 16h
	
	.if al == 04EH || al == 06EH  ;for N OR n
	jmp NewGame
	.else 
		.if al == 052H || al == 072H  ;for R or r
		.if resume_var == 1
			jmp Resume
		.endif
		.else
			.if al == 049H || al == 069H  ;for I or i
			jmp InstructionPage
			.else
				.if al == 048H || al == 068H  ;for H or h
				jmp HighScorePage
				.else
					.if al == 01BH  ;for ESCAPE key
					jmp Finish
					.else
					jmp again
					.endif
				.endif
			.endif
		.endif
    .endif
	
	NewGame:
	;mov call_levels, 2
	cmp brick_count, 0
	jne nope
	
	inc call_levels
	jmp reset
	
	nope:	
	mov call_levels, 1
	jmp reset
	
	reset:
	call Reset_Values
	
	.if call_levels == 2
	jmp nocall
	.endif 
	
	.if call_levels == 3
	jmp nocalll
	.endif 
	
	mov ah, 2CH
	int 21h
	mov seconds, dh
	add seconds, 3
	
	call Clear_Screen
	
	mov al, 1
	mov bh, 0
	mov bl, 0CH
	mov cx, l1end - offset l1 ; calculate message size. 
	mov dl, 15   ;column
	mov dh, 11  ;row
	push cs
	pop es
	mov bp, offset l1
	mov ah, 13h
	int 10h
	jmp l1end
    l1 DB "LeveL-1"
	l1end:
	
	lop1:
	mov ah, 2CH
	int 21H
	cmp dh, seconds
	jne lop1
	
	call Clear_Screen
	call display_bricks
	call Game_Boundaries	
	call hearts_disp
    call display_score
	call LeveL_1
	jmp exit
	
	nocall:
	cmp call_levels, 2
	jne nocalll
	
	mov ah, 2CH
	int 21h
	mov seconds, dh
	add seconds, 2
	
	call Clear_Screen
	
	mov al, 1
	mov bh, 0
	mov bl, 0CH
	mov cx, l2end - offset l2 ; calculate message size. 
	mov dl, 15   ;column
	mov dh, 11  ;row
	push cs
	pop es
	mov bp, offset l2
	mov ah, 13h
	int 10h
	jmp l2end
    l2 DB "LeveL-2"
	l2end:
	
	lop2:
	mov ah, 2CH
	int 21H
	cmp dh, seconds
	jne lop2
	
	mov ball_vel_x, 03h
	mov ball_vel_y, 03h
	mov paddlex, 125 
	inc score_Inc
	
	call Clear_Screen	
	call display_bricks
	call Game_Boundaries	
	call hearts_disp
    call display_score
	call Level_2
	
	jmp exit
	
	nocalll:
	cmp call_levels, 3
	jne noocall

	mov ah, 2CH
	int 21h
	mov seconds, dh
	add seconds, 2
	
	call Clear_Screen
	
	mov al, 1
	mov bh, 0
	mov bl, 0CH
	mov cx, l3end - offset l3 ; calculate message size. 
	mov dl, 15   ;column
	mov dh, 11  ;row
	push cs
	pop es
	mov bp, offset l3
	mov ah, 13h
	int 10h
	jmp l3end
    l3 DB "LeveL-3"
	l3end:
	
	lop3:
	mov ah, 2CH
	int 21H
	cmp dh, seconds
	jne lop3
	
	mov ball_vel_x, 4
	mov ball_vel_y, 4
	mov brick_count, 25
	mov ball_vel_x, 03h
	mov ball_vel_y, 03h
	mov paddlex, 130
	mov score_Inc, 3
	mov brik, 3
	mov brik1, 3
	mov brik2, 3
	mov brik3, 3
	mov brik4, 3
	mov brik5, 3
	mov brik6, 3
	mov brik7, 3
	mov brik8, 3
	mov brik9, 3
	mov brik10, 3
	mov brik11, 3
	mov brik12, 3
	mov brik13, 3
	mov brik14, 3
	mov brik15, 3
	mov brik16, 3
	mov brik17, 3
	mov brik18, 3
	mov brik19, 3
	mov brik20, 3
	mov brik21, 3
	mov brik22, 3
	mov brik23, 3
	mov brik24, 3
	mov brik25, 3
	mov brik26, 3
	mov brik27, 3
	mov brik28, 3
	mov brik29, 3
	
	
	call Clear_Screen	
	call display_bricks
	call Game_Boundaries	
	call hearts_disp
    call display_score
	call LeveL_3
	
	noocall:
	ret
	
	jmp starat	
	
	;Resume	
	Resume:
	ret
	
	jmp starat

	;Exit
	Finish:
	mov tmp,0
	Mov ah,00h ;set video mode
	Mov al,13h ;choose mode 13
	Int 10h
	cmp tmp,0
	
	je exit


;Instruction Page
InstructionPage:
	
	call Clear_Screen
; Printing 1

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, A1end - offset A1 ; calculate message size. 
	mov dl, 8   ;column
	mov dh, 4    ;row
	push cs
	pop es
	mov bp, offset A1
	mov ah, 13h
	int 10h
	jmp A1end
    A1 DB " **** INSTRUCTIONS **** " 
	A1end:

; Printing 2

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, A2end - offset A2 ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 7  ;row
	push cs
	pop es
	mov bp, offset A2
	mov ah, 13h
	int 10h
	jmp A2end
    A2 DB "->Break all Bricks until the time ends"
	A2end:

 ; Printing 3

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, A3end - offset A3 ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 9  ;row
	push cs
	pop es
	mov bp, offset A3
	mov ah, 13h
	int 10h
	jmp A3end
    A3 DB "->Use Arrow keys to move left and right"
	A3end:

; Printing 4

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, A4end - offset A4 ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 11  ;row
	push cs
	pop es
	mov bp, offset A4
	mov ah, 13h
	int 10h
	jmp A4end
    A4 DB "->Use A and D to move left and right"
	A4end:

; Printing 5

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, A5end - offset A5 ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 13  ;row
	push cs
	pop es
	mov bp, offset A5
	mov ah, 13h
	int 10h
	jmp A5end
    A5 DB "->You have only 3 lives"
	A5end:

; Printing 6

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, A6end - offset A6 ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 15  ;row
	push cs
	pop es
	mov bp, offset A6
	mov ah, 13h
	int 10h
	jmp A6end
    A6 DB "->Difficulty increases with every level"
	A6end:

; Printing 7

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, A7end - offset A7 ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 17  ;row
	push cs
	pop es
	mov bp, offset A7
	mov ah, 13h
	int 10h
	jmp A7end
    A7 DB "->Score per ball increases with every  level"
	A7end:
	
	mov al, 1
	mov bh, 0
	mov bl, 04h
	mov cx, A8end - offset A8 ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 20  ;row
	push cs
	pop es
	mov bp, offset A8
	mov ah, 13h
	int 10h
	jmp A8end
    A8 DB "$$ Press spacebar to go to Main Menu $$"
	A8end:
	
	again1:
	mov ah,1
    int 16h
    jz again1
    mov ah,0
    int 16h
	cmp al, 020H
	je starat
	jmp again1

HighScorePage:
	
	call Clear_Screen
	
; Printing 1

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, B1end - offset B1 ; calculate message size. 
	mov dl, 48   ;column
	mov dh, 2   ;row
	push cs
	pop es
	mov bp, offset B1
	mov ah, 13h
	int 10h
	jmp B1end
    B1 DB " **** High-Score **** " 
	B1end:
	
	call File_Reading

	mov al, 1
	mov bh, 0
	mov bl, 04h
	mov cx, B7end - offset B7 ; calculate message size. 
	mov dl, 0   ;column
	mov dh, 18  ;row
	push cs
	pop es
	mov bp, offset B7
	mov ah, 13h
	int 10h
	jmp B7end
    B7 DB "$$ Press spacebar to go to Main Menu  $$"
	B7end:
	
	again2:
	mov ah,1
    int 16h
    jz again2
    mov ah,0
    int 16h
	cmp al, 020H
	je starat
	jmp again2
   
Main_Menu endp

Back_Ball proc

	;covering the tracks of the ball as it moves
	mov cx, ballx
	mov dx, bally
	
	mov ah, 0ch
    cal:
	mov al, 0 ;color
    inc cx
    int 10h
    cmp cx, balex
    jne cal

	mov cx, ballx
    inc dx
    cmp dx, baley
    jne cal

ret
Back_Ball endp

Back_Paddle proc
	
	mov cx, paddlex
	mov dx, paddley

	mov ah, 0ch
    cal:
	mov al, 0 ;color
    inc cx
    int 10h
    cmp cx, paddlnx
    jne cal

	mov cx, paddlex
    inc dx
    cmp dx, paddleny
    jne cal
	
ret
Back_Paddle endp

draw_Brick proc

    mov ah,0Ch
    mov bl,0
    cal:
    mov al,tmp3
    inc cx
    int 10h
    cmp cx, tmp1
    jne cal

    mov cx, tmp4
    inc dx
    cmp dx, tmp2
    jne cal

ret
draw_Brick endp


makeBall proc   ;draw ball procedure

    mov cx,ballx
    mov dx,bally
    mov ah,0Ch
    cal:
    mov al, 5
    inc cx
    int 10h
    cmp cx, balex
    jne cal

    mov cx, ballx
    inc dx
    cmp dx, baley
    jne cal

ret
makeBall endp

Reset_Ball proc
    mov ballx,150
    mov bally,150
    mov balex,157
    mov baley,157
    ret
Reset_Ball endp

mov_ball proc   ;move ball procedure
	
    mov bx, ball_vel_x
    add ballx,bx
    add balex,bx
    mov bx,ball_vel_y
    sub bally,bx
    sub baley,bx

    mov ax,window_width   ;for right side of the screen
    sub ax, 20
    cmp balex,ax
    jge neg_val_x

    cmp balex, 14   ;for left side of the screen
    jle neg_val_x

    cmp baley, 24   ;for top of the screen 
    jle neg_val_y

    mov ax,window_heigt   ;for bottom of the screen
    cmp baley,ax
    jge reset_position
						;for paddle collisions
    mov ax, ballx
    add ax, ball_size
    cmp ax, paddlex
    jng check_brick_collisions

    mov ax, paddlnx  ;calculating the paddle width and comparing with ballx
    mov bx, paddlex
    sub ax, bx
    add ax, paddlex
    cmp ballx,ax
    jnl check_brick_collisions

    mov ax, bally
    add ax, ball_size
    cmp ax, paddley
    jng check_brick_collisions

    mov ax, paddleny
    mov bx, paddley
    sub ax, bx
    add ax, paddley
    cmp bally, ax
    jnl check_brick_collisions
	
	mov cx, ball_size
	add cx, ballx						
	mov bx, balex
	sub bx, ball_size
	
	mov beep_Frequency, 1
	call beep
    neg ball_vel_y
    ret	
  
	check_brick_collisions:
	
    ;for collisions of the ball with the bricks
	Brick_Collisions brikx,briky,brickex,brickey, brik
	Brick_Collisions brik1x,brik1y,brick1ex,brick1ey, brik1
	Brick_Collisions brik2x,brik2y,brick2ex,brick2ey, brik2
	Brick_Collisions brik3x,brik3y,brick3ex,brick3ey, brik3
	Brick_Collisions brik4x,brik4y,brick4ex,brick4ey, brik4
	Brick_Collisions brik5x,brik5y,brick5ex,brick5ey, brik5
	Brick_Collisions brik6x,brik6y,brick6ex,brick6ey, brik6
	Brick_Collisions brik7x,brik7y,brick7ex,brick7ey, brik7
	Brick_Collisions brik8x,brik8y,brick8ex,brick8ey, brik8
	Brick_Collisions brik9x,brik9y,brick9ex,brick9ey, brik9
	Brick_Collisions brik10x,brik10y,brick10ex,brick10ey, brik10
	Brick_Collisions brik11x,brik11y,brick11ex,brick11ey, brik11
	Brick_Collisions brik12x,brik12y,brick12ex,brick12ey, brik12
	Brick_Collisions brik13x,brik13y,brick13ex,brick13ey, brik13
	Brick_Collisions brik14x,brik14y,brick14ex,brick14ey, brik14
	Brick_Collisions brik15x,brik15y,brick15ex,brick15ey, brik15
	Brick_Collisions brik16x,brik16y,brick16ex,brick16ey, brik16
	Brick_Collisions brik17x,brik17y,brick17ex,brick17ey, brik17
	Brick_Collisions brik18x,brik18y,brick18ex,brick18ey, brik18
	Brick_Collisions brik19x,brik19y,brick19ex,brick19ey, brik19
	Brick_Collisions brik20x,brik20y,brick20ex,brick20ey, brik20
	Brick_Collisions brik21x,brik21y,brick21ex,brick21ey, brik21
	Brick_Collisions brik22x,brik22y,brick22ex,brick22ey, brik22
	Brick_Collisions brik23x,brik23y,brick23ex,brick23ey, brik23
	Brick_Collisions brik24x,brik24y,brick24ex,brick24ey, brik24
	Brick_Collisions brik25x,brik25y,brick25ex,brick25ey, brik25
	Brick_Collisions brik26x,brik26y,brick26ex,brick26ey, brik26
	Brick_Collisions brik27x,brik27y,brick27ex,brick27ey, brik27
	Brick_Collisions brik28x,brik28y,brick28ex,brick28ey, brik28
	Brick_Collisions brik29x,brik29y,brick29ex,brick29ey, brik29
	

	ret
	
    neg_val_x:
	mov beep_Frequency, 200
    call beep
    NEG ball_vel_x
    ret

    neg_val_y:
    mov beep_Frequency, 200
	call beep
    NEG ball_vel_y
    ret

    reset_position:
	mov beep_Frequency, 800
    call beep
	dec hearts
    call Reset_Ball
    ret

mov_ball endp


draw_paddle proc

    mov cx,paddlex
    mov dx,paddley
    mov ah,0ch
    cal:
    mov al, 03h
    inc cx
    int 10h
    cmp cx,paddlnx
    jne cal

    mov cx,paddlex
    inc dx
    cmp dx,paddleny
    jne cal
	
ret
draw_paddle endp

mov_paddle proc ;keyboard input to move paddle horizontally

	mov ah,1
    int 16h
    jz ending
    mov ah,0
    int 16h

    cmp ah, 4BH 
    je left 
	
	cmp al, 061h
	je left
	
	cmp al, 041h
	je left
	
    cmp ah, 4DH
    je right

	cmp al, 064h
	je right
	
	cmp al, 044h
	je right
	
	cmp al, 050H
	je paus
	
	cmp al, 070H
	je paus
	
	cmp al,27D
    je exit
	
	jne ending
    
	left:
	call Back_Paddle
    cmp paddlex, 12
    jle ending
    mov bx,paddle_vel_x
    sub paddlex,bx
    sub paddlnx,bx

	call draw_paddle
	ret
    
    right:
    call Back_Paddle
	
	mov bx,window_width
    sub bx, 20
    cmp paddlnx, bx
    jge ending
	
    mov bx,paddle_vel_x
    add paddlex,bx
    add paddlnx,bx
	
	call draw_paddle
	ret
	
	paus:
	mov ax, 0
	mov ah, 01
	int 16h
	jz paus
	mov ah, 00
	int 16h
	
	.if al == 070H || al == 050H
	jmp ending
	.endif
	jmp paus
	ending:

ret
mov_paddle endp

beep proc

    mov     al, 182         ; Prepare the speaker for the
    out     43h, al         ;  note.
    mov     ax, beep_Frequency  ; Frequency number (in decimal) for middle C.
    out     42h, al         ; Output low byte.
    mov     al, ah          ; Output high byte.
    out     42h, al 
    in      al, 61h         ; Turn on note (get value from port 61h).
    or      al, 00000011b   ; Set bits 1 and 0.
    out     61h, al         ; Send new value.
    mov     bx, 2          ; Pause for duration of note.
	pause1:
    mov     cx, 65535
	pause2:
    dec     cx
    jne     pause2
    dec     bx
    jne     pause1
    in      al, 61h         ; Turn off note (get value from port 61h).
    and     al, 11111100b   ; Reset bits 1 and 0.
    out     61h, al         ; Send new value.

ret
beep endp

Clear_Screen proc
    
    mov ah,00h
    mov al,13   ;set video mode
    int 10h  
ret
Clear_Screen endp


Background proc

	MOV AH, 06h
    MOV AL, 0
    MOV CX, 0
    MOV DH, 80
    MOV DL, 80
    MOV BH, 0h
    INT 10h

ret
Background endp


Game_Boundaries proc

    mov cx, 0     ; for the top boundary
    mov dx, 14
    mov ah, 0ch
    cal:
    mov al, 04h
    inc cx 
    int 10h
    cmp cx, 320
    jne cal

    mov cx, 4    ;for the left boundary
    mov dx, 0
    mov ah, 0ch
    cal1:
    mov al, 04h
    inc dx
    int 10H
    cmp dx, 200
    jne cal1

    mov cx, 311  ;for the right boundary
    mov dx, 0
    mov ah, 0ch
    cal2:
    mov al, 04h
    inc dx
    int 10H
    cmp dx, 200
    jne cal2

ret
Game_Boundaries  endp

hearts_disp proc
    
	MOV AH, 06h
    MOV AL, 0
    MOV CH, 0
	MOV CL, 0
    MOV DH, 0
	MOV DL, 200
    MOV BH, 00H
    INT 10h
	
	cmp hearts, 0
	je GameOverPAge
    mov bx, hearts
	mov tmp8, bx
    mov hearts_cords,7
    lop:
    ;for displaying 3 hearts
    inc hearts_cords    
	mov ah,02h
    mov bh,00h
    mov dh,0
    mov dl,1 
    int 10H
	
	lea dx,str4
	mov ah,09h
	int 21h

    mov ah,02h
    mov bh,00h
    mov dh,0
    mov dl, hearts_cords
    int 10H

    mov ah,02h
    mov dl, 3
    int 21h
    
    dec tmp8
    cmp tmp8, 0
    jne lop
	
	ret 
	;call the game_over screen
	GameOverPAge:
	call Clear_Screen

    mov al, 1
	mov bh, 0
	mov bl, 0Dh
	mov cx, M1end - offset M10 ; calculate message size. 
	mov dl, 10   ;column
	mov dh, 10    ;row
	push cs
	pop es
	mov bp, offset M10
	mov ah, 13h
	int 10h
	jmp M1end
    M10 DB " ** Game-Over ** " 
	M1end:
	
	mov al, 1
	mov bh, 0
	mov bl, 0Dh
	mov cx, Mend - offset MO ; calculate message size. 
	mov dl, 10   ;column
	mov dh, 12    ;row
	push cs
	pop es
	mov bp, offset MO
	mov ah, 13h
	int 10h
	jmp Mend
    MO DB " You Lost :( " 
	Mend:	
	
	mov al, 1
	mov bh, 0
	mov bl, 04h
	mov cx, Aend - offset A ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 20  ;row
	push cs
	pop es
	mov bp, offset A
	mov ah, 13h
	int 10h
	jmp Aend
    A DB "$$ Press spacebar to go to Main Menu $$"
	Aend:
	
	mov al, 1
	mov bh, 0
	mov bl, 04h
	mov cx, Adend - offset Ad ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 22  ;row
	push cs
	pop es
	mov bp, offset Ad
	mov ah, 13h
	int 10h
	jmp Adend
    Ad DB "$$ Press ESC key to Exit $$"
	Adend:
	
	again:
	mov ah, 01	
	int 16H
	jz again
	mov ah,00
	int 16H
	CMP AL, 020H
	JE start
	cmp al, 01BH
	JE exit
	jne again
	
ret
hearts_disp endp

display_score proc
	;for displaying name
	mov ah,02h
    mov bh,00h
    mov dh,0                ;for rows
    mov dl,29              ;for columns
    int 10H

    lea dx,str1
    mov ah,09h
    int 21h

	mov ah,02h
    mov bh,00h
    mov dh,0                ;for rows
    mov dl,34              ;for columns
    int 10H
	
	mov cx, names
	mov si,OFFSET buffer
	call disp_name
	
	;for displaying the score
    mov ah,02h
    mov bh,00h
    mov dh,0                ;for rows
    mov dl,15              ;for columns
    int 10H

    lea dx,str2
    mov ah,09h
    int 21h
	
	cmp score, 9
	jle print
	mov ah, 0
	mov al, score
	mov bl, 10
	div bl
	mov score1, al
	mov score2, ah
	
	jmp print1
	print:
	mov ah, 02h
    mov bh, 00h
    mov dh, 0                ;for rows
    mov dl, 22              ;for columns
    int 10H 
	
	mov dl, score
	add dl,"0"
	mov ah,02h
	int 21h

	jmp return
	print1:
	mov ah, 02h
    mov bh, 00h
    mov dh, 0                ;for rows
    mov dl, 22              ;for columns
    int 10H 
	
	mov dl, score1
	add dl,"0"
	mov ah,02h
	int 21h
	
	mov ah, 02h
    mov bh, 00h
    mov dh, 0                ;for rows
    mov dl, 23             ;for columns
    int 10H 
	
	mov dl, score2
	add dl,"0"
	mov ah,02h
	int 21h
	
	
return:
ret
display_score endp

display_bricks proc

	;brick formation
	Make_Brick brikx,briky,brickex,brickey,2
	Make_Brick brik1x,brik1y,brick1ex,brick1ey,4
    Make_Brick brik2x,brik2y,brick2ex,brick2ey,2
    Make_Brick brik3x,brik3y,brick3ex,brick3ey,4
    Make_Brick brik4x,brik4y,brick4ex,brick4ey,2
    Make_Brick brik5x,brik5y,brick5ex,brick5ey,4
    Make_Brick brik6x,brik6y,brick6ex,brick6ey,4
    Make_Brick brik7x,brik7y,brick7ex,brick7ey,2
    Make_Brick brik8x,brik8y,brick8ex,brick8ey,4
    Make_Brick brik9x,brik9y,brick9ex,brick9ey,2
    Make_Brick brik10x,brik10y,brick10ex,brick10ey,4
    Make_Brick brik11x,brik11y,brick11ex,brick11ey,2
	Make_Brick brik12x,brik12y,brick12ex,brick12ey,2
	Make_Brick brik13x,brik13y,brick13ex,brick13ey,4
	Make_Brick brik14x,brik14y,brick14ex,brick14ey,2
	Make_Brick brik15x,brik15y,brick15ex,brick15ey,4
	Make_Brick brik16x,brik16y,brick16ex,brick16ey,2
	Make_Brick brik17x,brik17y,brick17ex,brick17ey,4
	Make_Brick brik18x,brik18y,brick18ex,brick18ey,4
	Make_Brick brik19x,brik19y,brick19ex,brick19ey,2
	Make_Brick brik20x,brik20y,brick20ex,brick20ey,4
	Make_Brick brik21x,brik21y,brick21ex,brick21ey,2
	Make_Brick brik22x,brik22y,brick22ex,brick22ey,4
	Make_Brick brik23x,brik23y,brick23ex,brick23ey,2
	Make_Brick brik24x,brik24y,brick24ex,brick24ey,2	
	Make_Brick brik25x,brik25y,brick25ex,brick25ey,4	
	Make_Brick brik26x,brik26y,brick26ex,brick26ey,2
	Make_Brick brik27x,brik27y,brick27ex,brick27ey,4
	Make_Brick brik28x,brik28y,brick28ex,brick28ey,2
	Make_Brick brik29x,brik29y,brick29ex,brick29ey,4
	
ret
display_bricks endp

Win_Game_Mesg proc

	call Clear_Screen

; Printing 1

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, M1end - offset M11 ; calculate message size. 
	mov dl, 10   ;column
	mov dh, 12    ;row
	push cs
	pop es
	mov bp, offset M11
	mov ah, 13h
	int 10h
	jmp M1end
    M11 DB " ** Congratulations ** " 
	M1end:

; Printing 2

    mov al, 1
	mov bh, 0
	mov bl, 0Ah
	mov cx, M2end - offset M2 ; calculate message size. 
	mov dl, 10   ;column
	mov dh, 14    ;row
	push cs
	pop es
	mov bp, offset M2
	mov ah, 13h
	int 10h
	jmp M2end
    M2 DB "You Won! :)" 
	M2end:

	mov al, 1
	mov bh, 0
	mov bl, 04h
	mov cx, Aeend - offset A21 ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 20  ;row
	push cs
	pop es
	mov bp, offset A21
	mov ah, 13h
	int 10h
	jmp Aeend
    A21 DB "$$ Press spacebar to go to Main Menu $$"
	Aeend:
	
	mov al, 1
	mov bh, 0
	mov bl, 04h
	mov cx, Adendd - offset Ad2 ; calculate message size. 
	mov dl, 1   ;column
	mov dh, 22  ;row
	push cs
	pop es
	mov bp, offset Ad2
	mov ah, 13h
	int 10h
	jmp Adendd
    Ad2 DB "$$ Press ESC key to Exit $$"
	Adendd:

ret
Win_Game_Mesg endp

Reset_Values proc

mov brikx , 20
mov briky , 30 
mov brickex , 60
mov brickey , 45
mov brik1x , 65
mov brik1y , 30 
mov brick1ex , 105
mov brick1ey , 45
mov brik2x , 110
mov brik2y , 30 
mov brick2ex , 150
mov brick2ey , 45
mov brik3x , 155
mov brik3y , 30 
mov brick3ex , 195
mov brick3ey , 45
mov brik4x , 200
mov brik4y , 30 
mov brick4ex , 240
mov brick4ey , 45
mov brik5x , 245
mov brik5y , 30 
mov brick5ex , 285
mov brick5ey , 45
mov brik6x , 20
mov brik6y , 50
mov brick6ex , 60
mov brick6ey , 65
mov brik7x , 65
mov brik7y , 50
mov brick7ex , 105
mov brick7ey , 65
mov brik8x , 110
mov brik8y , 50
mov brick8ex , 150
mov brick8ey , 65
mov brik9x , 155
mov brik9y , 50
mov brick9ex , 195
mov brick9ey , 65
mov brik10x , 200
mov brik10y , 50
mov brick10ex , 240
mov brick10ey , 65
mov brik11x , 245
mov brik11y , 50
mov brick11ex , 285
mov brick11ey , 65
mov brik12x , 20
mov brik12y , 70
mov brick12ex , 60
mov brick12ey , 85
mov brik13x , 65
mov brik13y , 70
mov brick13ex , 105
mov brick13ey , 85
mov brik14x , 110
mov brik14y , 70
mov brick14ex , 150
mov brick14ey , 85
mov brik15x , 155
mov brik15y , 70
mov brick15ex , 195
mov brick15ey , 85
mov brik16x , 200
mov brik16y , 70
mov brick16ex , 240
mov brick16ey , 85
mov brik17x , 245
mov brik17y , 70
mov brick17ex , 285
mov brick17ey , 85
mov brik18x , 20
mov brik18y , 90
mov brick18ex , 60
mov brick18ey , 105
mov brik19x , 65
mov brik19y , 90
mov brick19ex , 105
mov brick19ey , 105
mov brik20x , 110
mov brik20y , 90
mov brick20ex , 150
mov brick20ey , 105
mov brik21x , 155
mov brik21y , 90
mov brick21ex , 195
mov brick21ey , 105
mov brik22x , 200
mov brik22y , 90
mov brick22ex , 240
mov brick22ey , 105
mov brik23x , 245
mov brik23y , 90
mov brick23ex , 285
mov brick23ey , 105
mov brik24x , 20
mov brik24y , 110
mov brick24ex , 60
mov brick24ey , 125
mov brik25x , 65
mov brik25y , 110
mov brick25ex , 105
mov brick25ey , 125
mov brik26x , 110
mov brik26y , 110
mov brick26ex , 150
mov brick26ey , 125
mov brik27x , 155
mov brik27y , 110
mov brick27ex , 195
mov brick27ey , 125
mov brik28x , 200
mov brik28y , 110
mov brick28ex , 240
mov brick28ey , 125
mov brik29x , 245
mov brik29y , 110
mov brick29ex , 285
mov brick29ey , 125
mov brick_count , 30
mov ballx , 150
mov bally , 150 
mov balex , 157
mov baley , 157
mov paddlex , 110
mov paddlnx , 180
mov paddle_vel_x , 15
mov paddley , 185
mov paddleny , 195
mov hearts_cords , 0
mov hearts , 3
mov hearts_temp , 3
mov score_temp , 0
mov score , 0

ret
Reset_Values endp


LeveL_1 proc
	
	mov time_tmp, 100
next_time:
	mov ah, 2CH
	int 21h
	cmp dl, time_tmp
	je next_time
	mov time_tmp, dl
	
	mov ax, hearts_temp
	cmp ax, hearts
	je dont_update 
	call hearts_disp
	call display_score
	mov ax, hearts
	mov hearts_temp, ax
	
	dont_update:
	mov al, score_temp
	cmp al, score
	jge dont_update1
	call display_score
	mov al, score
	mov score_temp, al
	
	
	dont_update1:
	call mov_paddle


	call Back_Ball		;removes the trace of the ball from the previous position
	call mov_ball       ;moves the ball    
    call makeBall       ;makes a new ball
	
	
	cmp brick_count, 0
	je win_game
	
	cmp temp5, 0
	je next_time
	again:        ;for starting the game using spacebar 
	mov ah, 01	 ;and for ending the game with exit
	int 16H
	jz again
	mov ah,00
	int 16H
	
	mov temp5, 0   
	cmp ax, 3920H  ;for spacebar
	je next_time
	cmp al, 27D
	je exit
	jne again
	
	
	jmp next_time
win_game:
	call Win_Game_Mesg
	
	lopp:
	mov ah,01
	int 16h
	jz lopp
	mov ah,00
	int 16h
	
	cmp al, 020H
	je start
	cmp al, 01BH
	je exit
	jne lopp
	
ret
LeveL_1 endp


Level_2 proc
	
	mov time_tmp, 100
next_time:
	mov ah, 2CH
	int 21h
	cmp dl, time_tmp
	je next_time
	mov time_tmp, dl
	
	mov ax, hearts_temp
	cmp ax, hearts
	je dont_update 
	call hearts_disp
	call display_score
	mov ax, hearts
	mov hearts_temp, ax
	
	dont_update:
	mov al, score_temp
	cmp al, score
	jge dont_update1
	call display_score
	mov al, score
	mov score_temp, al
	
	dont_update1:
	call mov_paddle		;moves the paddle using the arrow keys or A and D keys
    
	call Back_Ball		;removes the trace of the ball from the previous position
	call mov_ball       ;moves the ball    
    call makeBall       ;makes a new ball
	
	
	cmp brick_count, 0
	je win_game
	
	cmp temp5, 0
	je next_time
	again:        ;for starting the game using spacebar 
	mov ah, 01	 ;and for ending the game with exit
	int 16H
	jz again
	mov ah,00
	int 16H
	
	mov temp5, 0   
	cmp ax, 3920H  ;for spacebar
	je next_time
	cmp al, 27D
	je exit
	jne again

    jmp next_time

win_game:
	call Win_Game_Mesg
	
	lopp:
	mov ah,01
	int 16h
	jz lopp
	mov ah,00
	int 16h
	
	cmp al, 020H
	je start
	cmp al, 01BH
	je exit
	jne lopp
	
ret
Level_2 endp

Level_3 proc
	
	mov time_tmp, 100
next_time:
	mov ah, 2CH
	int 21h
	cmp dl, time_tmp
	je next_time
	mov time_tmp, dl
	
	mov ax, hearts_temp
	cmp ax, hearts
	je dont_update 
	call hearts_disp
	call display_score
	mov ax, hearts
	mov hearts_temp, ax
	
	dont_update:
	mov al, score_temp
	cmp al, score
	jge dont_update1
	call display_score
	mov al, score
	mov score_temp, al
	
	dont_update1:
	call mov_paddle		;moves the paddle using the arrow keys or A and D keys
    
	call Back_Ball		;removes the trace of the ball from the previous position
	call mov_ball       ;moves the ball    
    call makeBall       ;makes a new ball
	
	
	cmp brick_count, 0
	je win_game
	
	cmp temp5, 0
	je next_time
	again:        ;for starting the game using spacebar 
	mov ah, 01	 ;and for ending the game with exit
	int 16H
	jz again
	mov ah,00
	int 16H
	
	mov temp5, 0   
	cmp ax, 3920H  ;for spacebar
	je next_time
	cmp al, 27D
	je exit
	jne again

    jmp next_time

win_game:
	call Win_Game_Mesg
	
	lopp:
	mov ah,01
	int 16h
	jz lopp
	mov ah,00
	int 16h
	
	cmp al, 020H
	je start
	cmp al, 01BH
	je exit
	jne lopp
	

ret
Level_3 endp


start:
main proc
    mov ax,@data
    mov ds,ax
    mov ax,0
	
	call Main_Menu	

main endp

exit:
call File_Writing

mov ah, 4ch
int 21h
end

;;
