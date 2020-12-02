;���� ��� ATmega128
;������

.DEVICE ATmega128		;8MHz
.include "m128def.inc"

;---------------------��������� ����� � ������ (����)
.dseg
.org 0x0100
;Snake:
;.byte 8			;8 ���� ��� �������� ��������� ������
;������ ����� ��������, �. �. ������ ������ �������� � 64 ������

Direction:
.byte 1			;1 ���� ��� ����������� ������

Coords:
.byte 64		;64 ����� ��� ������ ����� ����

Text:
.byte 80		;640 ����� ��� �����



;----------------------��� ���������
.cseg

;----------------------�������������� ����
ldi r16,high(RAMEND)
out sph,r16
ldi r16,low(RAMEND)
out spl,r16

;-----------------------�������������� �����

ldi r16,0xff		;��������� ���� � �� �����
out DDRA,r16 		

ldi r16,0xff		;��������� ���� C �� �����
out DDRC,r16

ldi r16,0x00		;��������� ���� D �� ����
out DDRD,r16

;-----------------------------������������� ��������
ldi r16,0x03		;������������ 4, ����� Normal
out TCCR0, r16   
;ldi r16, 0x01
;out TIMSK, r16   	;���������� �� ������������
;ldi r16, high(63)
;out OCR1AH, r16	
;ldi r16, low(63)
;out OCR1AL, r16

;---------------------------��������� �������
;����� ��� ���������
;0
ldi r16, 0b11100111
sts Text, r16			
ldi r16, 0b11111111	
sts Text+1, r16
ldi r16, 0b10000011
sts Text+2, r16
ldi r16, 0b10111010	
sts Text+3, r16
ldi r16, 0b10111010
sts Text+4, r16
ldi r16, 0b10000011	
sts Text+5, r16
ldi r16, 0b11111111
sts Text+6, r16
ldi r16, 0b11100111	
sts Text+7, r16
;1
ldi r16, 0b11100111
sts Text+8, r16			
ldi r16, 0b11111111	
sts Text+9, r16
ldi r16, 0b11101111
sts Text+10, r16
ldi r16, 0b11011110	
sts Text+11, r16
ldi r16, 0b10111110
sts Text+12, r16
ldi r16, 0b10000011	
sts Text+13, r16
ldi r16, 0b11111111
sts Text+14, r16
ldi r16, 0b11100111	
sts Text+15, r16
;2
ldi r16, 0b11100111
sts Text+16, r16			
ldi r16, 0b11111111	
sts Text+17, r16
ldi r16, 0b11011011
sts Text+18, r16
ldi r16, 0b10110010	
sts Text+19, r16
ldi r16, 0b10101010
sts Text+20, r16
ldi r16, 0b11011011	
sts Text+21, r16
ldi r16, 0b11111111
sts Text+22, r16
ldi r16, 0b11100111	
sts Text+23, r16
;3
ldi r16, 0b11100111
sts Text+24, r16			
ldi r16, 0b11111111	
sts Text+25, r16
ldi r16, 0b11111111
sts Text+26, r16
ldi r16, 0b10101010	
sts Text+27, r16
ldi r16, 0b10101010
sts Text+28, r16
ldi r16, 0b11000111	
sts Text+29, r16
ldi r16, 0b11111111
sts Text+30, r16
ldi r16, 0b11100111	
sts Text+31, r16
;4
ldi r16, 0b11100111
sts Text+32, r16			
ldi r16, 0b11111111	
sts Text+33, r16
ldi r16, 0b11101111
sts Text+34, r16
ldi r16, 0b11001110	
sts Text+35, r16
ldi r16, 0b10101110
sts Text+36, r16
ldi r16, 0b10000011	
sts Text+37, r16
ldi r16, 0b11111111
sts Text+38, r16
ldi r16, 0b11100111	
sts Text+39, r16
;5
ldi r16, 0b11100111
sts Text+40, r16			
ldi r16, 0b11111111	
sts Text+41, r16
ldi r16, 0b11111111
sts Text+42, r16
ldi r16, 0b10001010	
sts Text+43, r16
ldi r16, 0b10101010
sts Text+44, r16
ldi r16, 0b10110111	
sts Text+45, r16
ldi r16, 0b11111111
sts Text+46, r16
ldi r16, 0b11100111	
sts Text+47, r16
;6
ldi r16, 0b11100111
sts Text+48, r16			
ldi r16, 0b11111111	
sts Text+49, r16
ldi r16, 0b11000111
sts Text+50, r16
ldi r16, 0b10101010	
sts Text+51, r16
ldi r16, 0b10101010
sts Text+52, r16
ldi r16, 0b10110111	
sts Text+53, r16
ldi r16, 0b11111111
sts Text+54, r16
ldi r16, 0b11100111	
sts Text+55, r16
;7
ldi r16, 0b11100111
sts Text+56, r16			
ldi r16, 0b11111111	
sts Text+57, r16
ldi r16, 0b10111111
sts Text+58, r16
ldi r16, 0b10110010	
sts Text+59, r16
ldi r16, 0b10101110
sts Text+60, r16
ldi r16, 0b10011111	
sts Text+61, r16
ldi r16, 0b11111111
sts Text+62, r16
ldi r16, 0b11100111	
sts Text+63, r16
;8
ldi r16, 0b11100111
sts Text+64, r16			
ldi r16, 0b11111111	
sts Text+65, r16
ldi r16, 0b11010111
sts Text+66, r16
ldi r16, 0b10101010	
sts Text+67, r16
ldi r16, 0b10101010
sts Text+68, r16
ldi r16, 0b11010111	
sts Text+69, r16
ldi r16, 0b11111111
sts Text+70, r16
ldi r16, 0b11100111	
sts Text+71, r16
;9
ldi r16, 0b11100111
sts Text+72, r16			
ldi r16, 0b11111111	
sts Text+73, r16
ldi r16, 0b11011011
sts Text+74, r16
ldi r16, 0b10101010	
sts Text+75, r16
ldi r16, 0b10101010
sts Text+76, r16
ldi r16, 0b11000111	
sts Text+77, r16
ldi r16, 0b11111111
sts Text+78, r16
ldi r16, 0b11100111	
sts Text+79, r16

Menu_and_Init:
ldi r16, 0b000000001		;����������� �����
;������ ��� - �����
;������ - �����
;������ - ������
;�������� - ����
sts Direction, r16

;�������� ������ �� ������� (������ �����)
ldi r31, 0x01		;������� ����
ldi r30, 0x01		;������� ����
ldi r16, $FF
Set_Next_Bite:
st Z+, r16
cpi r30, $41
brlo Set_Next_Bite

;������ � ������ (�� �������� ����� ��������)
ldi r16, 0		;������
sts Coords+18, r16
ldi r16, 1		;��������1
sts Coords+19, r16
ldi r16, 2		;��������2
sts Coords+20, r16
ldi r16, 3		;��������3
sts Coords+21, r16

clr r16
clr r28
;---------------------------��������� ����

Menu:
;brtc Button_act
;clr r18
;clt
;Button_act:
cpi r28, 20
brlo Too_many
ldi r28, 18
Too_many:
ldi r16, 1
sts Direction, r16
rcall RefreshBit
rcall GetMenuButton

inc r18
sbrc r18, 4
clt
sbrc r18, 4
clr r18

lds r16, Direction
sbrc r16, 1
subi r28, 2
sbrc r16, 2
inc r28
sbrc r16, 2
inc r28
sbrc r16, 3
rjmp Menu_Exit
rjmp Menu

Menu_Exit:
ldi r29, 20
sub r29, r28
ldi r16, 1
sts Direction, r16 
rcall Random64
clr r16

;---------------------------������� ���� ���������

main:

inc r16
rcall Refresh
rcall GetButton
cp r16, r29			;�������� ����
brlo Skip_Move
rcall Move
Skip_Move:
sbrc r16, 7
rcall Random64

rjmp main

;---------------------------����� ����

Game_Over:

sbrc r16, 3
rjmp Menu_and_Init
rcall Refresh
rcall Refresh
rcall Refresh
rcall Refresh
rcall wait2
inc r16
rjmp Game_Over


;----------------------������� ���������� �������

RefreshBit:

push r16
push r17

ldi r31, 0x01		;������� ����
ldi r30, 0x41		;������� ����
mov r17, r28
Check_if_0:
cpi r17, 0
breq Skip_adding
dec r17
dec r17
ldi r16, 8
add r30, r16
rjmp Check_if_0

Skip_adding:
ldi r17,0b10000000		;����� ��� ��� ������
Next_Byte:
out PORTA,r17			;���������� �������
ld r16, Z+				;���� ���� �� ������
out PORTC,r16			;����� ��� �� �����
rcall wait1				;��������
sbrc r17, 0
rjmp RefreshBit_Exit
lsr r17					;���� �������
rjmp Next_Byte
RefreshBit_Exit:
pop r17
pop r16
ret

;----------------------������� ���������� �������
;�������
;������� �������: ����� - 1, �� ����� - 0
;�������� ������: ����� - 0, �� ����� - 1
Refresh:

push r16
push r17
push r18
push r19

;������� ������� Z �� ���� ���������
ldi r31, 0x01		;������� ����
ldi r30, 0x01		;������� ����

ldi r16,0b10000000	;���������� ������ �������

Next_Column:
clr r18				;������� ������� ��� ������� �������
ldi r19, 0b10000000	;�������� ������ ����
Next_bit:
ld r17, Z+			;���� ���� �� ������ � ����������� �����
sbrc r17, 7			;���������, �������� �� � ����� ����� ������
add r18, r19		;���� "���", �������� ��� �� ������� �����, ����� �������� ����
cpi r19, 0b00000001	;��������� �� ����� ���������� �� ������ � �� ����� �� �� 8-��
breq Done			;������� �������, �������� ���� ������ � ������������ � Start
lsr r19 			;�������� ��� � ���� ������ �����
rjmp Next_bit

Done:
out PORTA,r16 		;����� ������ �� ������� ��� ������
out PORTC,r18		;���������� ���� � �������
rcall wait1			;��������
sbrc r16, 0			;������� �� ����� �� �������
rjmp Exit_Refresh	;���� ��� ������� ��������, ���������
lsr r16				;�������� ���� ������
rjmp Next_Column			;������������ ������ �������, ���� ��� �� ��� ��������

Exit_Refresh:
pop r19
pop r18
pop r17
pop r16
ret

;----------------�������� ��� �������

wait1:

push r17
push r18

ldi r18, 0 ;�������������� �������
loop22:
ldi r17, 0 ;�������������� �������
loop11:
inc r17 ;���������� ���� � r17
cpi r17, 0xff ; Compare r17 to $f8
brne loop11 ; Branch if not equal

inc r18 ;������� ���� � r18
cpi r18, 0x05
brne loop22

pop r18
pop r17

ret

;-----------------------�������� ��� ����� ����

wait2:

push r17
push r18

ldi r18, 0 ;�������������� �������
loop222:
ldi r17, 0 ;�������������� �������
loop111:
inc r17 ;���������� ���� � r17
cpi r17, 0xff ; Compare r17 to $f8
brne loop111 ; Branch if not equal

inc r18 ;������� ���� � r18
cpi r18, 0xff
brne loop222

pop r18
pop r17

ret


;-----------------------����� ������ ��� ����

GetButton:
push r16
push r17

brts Exit_GetButton

lds r16, Direction		;��������� ����������� ������
in r17, PIND
cp r16, r17
breq Exit_GetButton
cpi r16, 0b00000001
breq Up_Down		;���������, ���� �������� ����� ��� ����
cpi r16, 0b00001000
breq Up_Down		;���������, ���� �������� ����� ��� ����
cpi r16, 0b00000010
breq Left_Right		;���������, ���� �������� ����� ��� ������
cpi r16, 0b00000100
breq Left_Right		;���������, ���� �������� ����� ��� ������
rjmp Exit_GetButton

Up_Down:
sbrs r17,5			;������ ����� ������
rjmp Button_Left
sbrs r17,6			;������ ������ ������
rjmp Button_Right
rjmp Exit_GetButton

Left_Right:
sbrs r17,4			;������ ����� ������
rjmp Button_Up
sbrs r17,7			;������ ���� ������
rjmp Button_Down
rjmp Exit_GetButton

Button_Up:
ldi r16, 0b00000001
sts	Direction, r16
rjmp Set_Exit_GetButton

Button_Left:
ldi r16, 0b00000010
sts	Direction, r16
rjmp Set_Exit_GetButton

Button_Right:
ldi r16, 0b00000100
sts	Direction, r16
rjmp Set_Exit_GetButton

Button_Down:
ldi r16, 0b00001000
sts	Direction, r16

Set_Exit_GetButton:
set
Exit_GetButton:
pop r17
pop r16
ret

;---------------------------����� ������ ��� ����

GetMenuButton:
push r16
push r17

brts Exit_GetMenuButton

lds r16, Direction		;��������� ����������� ������
in r17, PIND
cp r16, r17
breq Exit_GetMenuButton

sbrs r17,5			;������ ����� ������
rjmp MenuButton_Left
sbrs r17,6			;������ ������ ������
rjmp MenuButton_Right
sbrs r17,4			;������ ����� ������
rjmp MenuButton_Up
sbrs r17,7			;������ ���� ������
rjmp MenuButton_Down
rjmp Exit_GetMenuButton

MenuButton_Up:
ldi r16, 0b00000001
sts	Direction, r16
rjmp Exit_Set_GetMenuButton

MenuButton_Left:
ldi r16, 0b00000010
sts	Direction, r16
rjmp Exit_Set_GetMenuButton

MenuButton_Right:
ldi r16, 0b00000100
sts	Direction, r16
rjmp Exit_Set_GetMenuButton

MenuButton_Down:
ldi r16, 0b00001000
sts	Direction, r16

Exit_Set_GetMenuButton:
set
Exit_GetMenuButton:
pop r17
pop r16
ret

;---------------------������ �� 64 � ���������� ��� � ����������� ������ (������� Random64)

Random64:
;������� ������� Z �� ���� ���������
ldi r31, 0x01		;������� ����
ldi r30, 0x01		;������� ����
Try_more:
in r30,TCNT0		;����� ��������� ����� �� ������� ��� �����
inc r30				;��������������, ��� ��� ������� ������� �� ����, � ��������� � ��� � �������
Check:				
cpi r30, 64			;��������� �� ������� �����, �� ������ ���� ������ 64
brlo Number_is_OK
subi r30,64			;��������� (���������) �����, ���������� �� ��������, �� 64
rjmp Check
Number_is_OK:
ld r16,Z			;��������� ���������� ������ ������
sbrs r16, 7			;��������� ������ �� �����
rjmp Try_more		;���� ����� ����� ����� ������, ������� � ����� ��������� ������ 
ldi r16, 64			;����� 64 � �������
st Z,r16			;����� 64 ������ ������������� ������� ������ � ����� �������� ���
;����� ��, ��������� ��� ����������� � ������� Move
clr r16				;�������� ������-���������� ������� ��� ������� Move � Random64
ret

;--------------------�������� ������ (������� Move)

Move:
clr r16
push r20
push r19
push r18
push r17

;���� ���-�� �����������
;����� ���-�� ������� ��� ������
;��������� ������ ������, ������� ������ � ���������� � ������� �����������
;����� ���� ����� ������ (���� ������ �� ���-�� ��������) � ������� ���
;������������ ������� ������ ���������� ������ ������

;����� ��������� ���������� ������ � dseg'�: 0000 - ���������� �, 0000 - ���������� Y
;��� ��� ����� � ������
;����� �������� � ���, ����� ������ ��� ��������� ���������� ��� ����� ������
;������� �� �������� ��� ������� ���������� ��������
;���� ������� �� � ����� � dseg'e

;������ �������: ������� � 64 ������ �������������� ����� ������� ����� �������� ������
;�� ������, Coords � 0000 0000 - ����� ������� ��� ������, ������ ������� ������ (������)
;�� ������, Coords+1 � 0000 0001 - ����� ���� ������� ��� ������, ������ ������� ������

;������� ������� Z �� ���� ���������
ldi r31, 0x01		;������� ����
ldi r30, 0x01		;������� ����

clr r17				;������� ��� ��������� ���������� �������
clr r18				;������� ��� ������ � ������������ ��������� ������� (������� ������)
clr r19				;������� ��� ������ ���������� �������
clr r20				;������� ��� ������ ���
clt					;������� ���� � ��� �������� �������� ������

Mass_analyze:			;������ ������� ������ Coords
ld r16, Z+		 		;���� ���� �� ������ � ����������� �����
cpi r30, 0x42
breq End_of_mass
sbrc r16, 7				;���������, ���� �� � ����������� ����� ���� ���-��
rjmp Mass_analyze		;���� ���, ����� ���������� ����
cpi r16, 64				;����� �� � ����������� ����� ���
brne No_food			;���� ��� ���, ����������� ���� ������
mov r20,r30				;���������� ��� ���
dec r20					;������� ����-�������������
rjmp Mass_analyze		;������������ � ������� �������
No_food:
cp r16, r17				;���������� ������� � ������������ ���������� ������� � �������
brlo Skip_mov			;���� ������� ����� ������, ���������� �����������
mov r17, r16			;���� ������� ����� ������, ����� ��� ��������
mov r18, r30			;���������� ����� ����������� ����������� ������
dec r18					;�������������� ����-�������������
Skip_mov:
inc r16					;�������������� ����, ����� ��������� ���������� ����� ����� ������
dec r30					;������������ �� ���������� �����
st Z+, r16				;����� �� ����� ������ ����� ���������� �����
cpi r16, 0b00000001		;���������, ���� �� ��� ������ �����
brne Mass_analyze		;��� �� ��������� �����
mov r19, r30			;�������� ����� ������ ������
dec r19					;�������������� ����-�������������
rjmp Mass_analyze

End_of_mass:
mov r30, r18	;���� ����� � ������������ ���������� ������� (�������)
ldi r16, 0xff
st Z, r16		;�������� �����, ������ ��� ������ ������������
mov r30, r19			;����� ������ ������
lds r16, Direction		;���� ���� �����������
sbrc r16, 0				;��������� ������ 4 ����
rjmp Move_Up			;����� ���������� ���� ������ ��������� ������
sbrc r16, 1
rjmp Move_Left
sbrc r16, 2
rjmp Move_Right
sbrc r16, 3
rjmp Move_Down

Move_Up:					; ^ �������� �����
;brts Move_Up
;����� ������
;set						;�������� ���� �, ����� �� ���������� �� ������ ������ ���
;��-�� ����� ������ ���������... :(
;dec r30					;�������������� ����-�������������
cpi r30, 0x01				;��������� ��������, �� ���������� �� ������ ������� ������� ����
breq CrossBoard_Up
cpi r30, 0x09			
breq CrossBoard_Up
cpi r30, 0x11
breq CrossBoard_Up
cpi r30, 0x19
breq CrossBoard_Up
cpi r30, 0x21
breq CrossBoard_Up
cpi r30, 0x29
breq CrossBoard_Up
cpi r30, 0x31
breq CrossBoard_Up
cpi r30, 0x39
breq CrossBoard_Up
;���� ������ �� ���������� ������� �������, ������ ��������� ����� � ����� 0
dec r30					;��������� ����� ����� �� ���� (��������� ������ ��� �����)
ldi r16, 0				;���� 0
ld r19, Z				;����������, ��� ���� �� ����� ������� ������
st Z, r16				;���������� �� ������ ������ 0 (������ ������ ���)
rjmp Exit_Move			;������������ ������ ���������� �����
CrossBoard_Up:			;������ ���������� ������� ������� ����
ldi r16, 7				
add r30, r16			;����������� ����� �� 7, ������ ������� �����
ldi r16, 0
ld r19, Z				;����������, ��� ���� �� ����� ������� ������
st Z, r16				;���������� � ����� ����� 0 (������)
rjmp Exit_Move			;������������ ������ ���������� �����


Move_Left:				; < �������� �����
cpi r30, 0x01			;��������� ��������, �� ���������� �� ������ ����� ������� ����
breq CrossBoard_Left
cpi r30, 0x02
breq CrossBoard_Left
cpi r30, 0x03
breq CrossBoard_Left
cpi r30, 0x04
breq CrossBoard_Left
cpi r30, 0x05
breq CrossBoard_Left
cpi r30, 0x06
breq CrossBoard_Left
cpi r30, 0x07
breq CrossBoard_Left
cpi r30, 0x08
breq CrossBoard_Left
;���� ������ �� ���������� ����� �������, ������ ��������� ����� �� 8 � ����� 0
ldi r16, 8				;���� 8
sub r30, r16			;��������� ����� �� 8
ldi r16, 0				;���� 0
ld r19, Z				;����������, ��� ���� �� ����� ������� ������
st Z, r16				;���������� �� ������ ������ 0 (������ ������ ���)
;add r30, r16			;�� �������� ��������� ����� �������
rjmp Exit_Move			;������������ ������ ���������� �����
CrossBoard_Left:		;������ ���������� ����� ������� ����
ldi r16, 56				
add r30, r16			;����������� ����� �� 56, ������ ������� ������
ldi r16, 0
ld r19, Z				;����������, ��� ���� �� ����� ������� ������
st Z, r16				;���������� � ����� ����� 0 (������)
rjmp Exit_Move			;������������ ������ ���������� �����


Move_Right:				; > �������� ������
cpi r30, 0x39			;��������� ��������, �� ���������� �� ������ ������ ������� ����
breq CrossBoard_Right
cpi r30, 0x3a
breq CrossBoard_Right
cpi r30, 0x3b
breq CrossBoard_Right
cpi r30, 0x3c
breq CrossBoard_Right
cpi r30, 0x3d
breq CrossBoard_Right
cpi r30, 0x3e
breq CrossBoard_Right
cpi r30, 0x4f
breq CrossBoard_Right
cpi r30, 0x40
breq CrossBoard_Right
;���� ������ �� ���������� ������ �������, ������ ����������� ����� �� 8 � ����� 0
ldi r16, 8				;���� 8
add r30, r16			;����������� ����� �� 8
ldi r16, 0				;���� 0
ld r19, Z				;����������, ��� ���� �� ����� ������� ������
st Z, r16				;���������� �� ������ ������ 0 (������ ������ ���)
;subi r30, 8				;�� �������� ��������� ����� �������
rjmp Exit_Move			;������������ ������ ���������� �����
CrossBoard_Right:		;������ ���������� ������ ������� ����				
subi r30, 56			;��������� ����� �� 56, ������ ������� �����
ldi r16, 0
ld r19, Z				;����������, ��� ���� �� ����� ������� ������
st Z, r16				;���������� � ����� ����� 0 (������)
rjmp Exit_Move			;������������ ������ ���������� �����


Move_Down:				; v �������� ����
cpi r30, 0x08			;��������� ��������, �� ���������� �� ������ ������ ������� ����
breq CrossBoard_Down
cpi r30, 0x10			
breq CrossBoard_Down
cpi r30, 0x18
breq CrossBoard_Down
cpi r30, 0x20
breq CrossBoard_Down
cpi r30, 0x28
breq CrossBoard_Down
cpi r30, 0x30
breq CrossBoard_Down
cpi r30, 0x38
breq CrossBoard_Down
cpi r30, 0x40
breq CrossBoard_Down
;���� ������ �� ���������� ������ �������, ������ ����������� ����� � ����� 0
inc r30					;����������� ����� ����� �� ���� (��������� ������ ��� ����)
ldi r16, 0				;���� 0
ld r19, Z				;����������, ��� ���� �� ����� ������� ������
st Z, r16				;���������� �� ������ ������ 0 (������ ������ ���)
rjmp Exit_Move			;������������ ������ ���������� �����
CrossBoard_Down:		;������ ���������� ������ ������� ����
subi r30, 7				;��������� ����� �� 7, ������ ������� ������
ldi r16, 0
ld r19, Z				;����������, ��� ���� �� ����� ������� ������
st Z, r16				;���������� � ����� ����� 0 (������)
rjmp Exit_Move			;������������ ������ ���������� �����


Exit_Move:		;������� �� ������� Move
clr r16
sbrs r19, 6		;���������, �� ���������� �� �� �� ����
rjmp Game_Over	;���� ����������, �� ���������

cp r20, r30		;���������� ������� ��������� ������ � ���������� ���
brne No_growth	;���� �� ���������, ���������� �������������� ������
mov r30, r18	;���� ����� � ������������ ���������� ������� (�������)
inc r17			;�������������� ����� ������ (��������� ��� ��������� ����� ������ ��� ����������������)
st Z, r17		;���������� �����
ldi r16, 0b10000000		;��������, ��� ��� �������
No_growth:
;���������� �������� ������������� ��������� �� �����
pop r17
pop r18
pop r19
pop r20
ret				;������������ � main



