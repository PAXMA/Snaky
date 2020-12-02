;Игра для ATmega128
;Змейка

.DEVICE ATmega128		;8MHz
.include "m128def.inc"

;---------------------Рервируем место в памяти (СОЗУ)
.dseg
.org 0x0100
;Snake:
;.byte 8			;8 байт для хранения положения змейки
;скорее всего рудимент, т. к. теперь змейка хранится в 64 байтах

Direction:
.byte 1			;1 байт под направление змейки

Coords:
.byte 64		;64 байта под каждый кусок змеи

Text:
.byte 80		;640 битов под текст



;----------------------Код программы
.cseg

;----------------------Инициализируем стек
ldi r16,high(RAMEND)
out sph,r16
ldi r16,low(RAMEND)
out spl,r16

;-----------------------Инициализируем порты

ldi r16,0xff		;Переводим порт А на вывод
out DDRA,r16 		

ldi r16,0xff		;Переводим порт C на вывод
out DDRC,r16

ldi r16,0x00		;Переводим порт D на ввод
out DDRD,r16

;-----------------------------Инициализация счётчика
ldi r16,0x03		;Предделитеть 4, режим Normal
out TCCR0, r16   
;ldi r16, 0x01
;out TIMSK, r16   	;прерывание по переполнению
;ldi r16, high(63)
;out OCR1AH, r16	
;ldi r16, low(63)
;out OCR1AL, r16

;---------------------------Начальные условия
;Числа для сложности
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
ldi r16, 0b000000001		;направление вверх
;первый бит - вверх
;второй - влево
;третий - вправо
;четвёртый - вниз
sts Direction, r16

;затираем память со змейкой (взводя байты)
ldi r31, 0x01		;старший байт
ldi r30, 0x01		;младший байт
ldi r16, $FF
Set_Next_Bite:
st Z+, r16
cpi r30, $41
brlo Set_Next_Bite

;змейка в байтах (не заданные байты взведены)
ldi r16, 0		;голова
sts Coords+18, r16
ldi r16, 1		;позвонок№1
sts Coords+19, r16
ldi r16, 2		;позвонок№2
sts Coords+20, r16
ldi r16, 3		;позвонок№3
sts Coords+21, r16

clr r16
clr r28
;---------------------------Начальное меню

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

;---------------------------Игровой цикл программы

main:

inc r16
rcall Refresh
rcall GetButton
cp r16, r29			;скорость игры
brlo Skip_Move
rcall Move
Skip_Move:
sbrc r16, 7
rcall Random64

rjmp main

;---------------------------Конец игры

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


;----------------------Битовое обновление дисплея

RefreshBit:

push r16
push r17

ldi r31, 0x01		;старший байт
ldi r30, 0x41		;младший байт
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
ldi r17,0b10000000		;пишем бит для стобца
Next_Byte:
out PORTA,r17			;запитываем столбец
ld r16, Z+				;берём байт из памяти
out PORTC,r16			;подаём его на выход
rcall wait1				;задержка
sbrc r17, 0
rjmp RefreshBit_Exit
lsr r17					;след столбец
rjmp Next_Byte
RefreshBit_Exit:
pop r17
pop r16
ret

;----------------------Байтное Обновление дисплея
;Справка
;выбрать столбцы: горит - 1, не горит - 0
;выбирать строки: горит - 0, не горит - 1
Refresh:

push r16
push r17
push r18
push r19

;счётчик адресса Z из двух регистров
ldi r31, 0x01		;старший байт
ldi r30, 0x01		;младший байт

ldi r16,0b10000000	;запитываем первый столбец

Next_Column:
clr r18				;очищаем регистр под диодный столбец
ldi r19, 0b10000000	;выбираем первый диод
Next_bit:
ld r17, Z+			;берём байт из памяти и увеличиваем адрес
sbrc r17, 7			;проверяем, хранится ли в байте часть змейки
add r18, r19		;если "нет", возводим бит на текущем месте, чтобы потушить диод
cpi r19, 0b00000001	;проверяем на каком светодиоде мы сейчас и не дошли ли до 8-го
breq Done			;выводим столбец, выбираем след стобец и возвращаемся в Start
lsr r19 			;сдвигаем бит в след разряд влево
rjmp Next_bit

Done:
out PORTA,r16 		;подаём сигнал на столбец для записи
out PORTC,r18		;записываем биты в столбец
rcall wait1			;задержка
sbrc r16, 0			;смотрим на каком мы столбце
rjmp Exit_Refresh	;если все столбцы выведены, сваливаем
lsr r16				;выбираем след стобец
rjmp Next_Column			;возвращаемся добить столбцы, если ещё не все выведены

Exit_Refresh:
pop r19
pop r18
pop r17
pop r16
ret

;----------------Задержка для дисплея

wait1:

push r17
push r18

ldi r18, 0 ;инициализируем регистр
loop22:
ldi r17, 0 ;инициализируем регистр
loop11:
inc r17 ;Внутренний цикл с r17
cpi r17, 0xff ; Compare r17 to $f8
brne loop11 ; Branch if not equal

inc r18 ;Внешний цикл с r18
cpi r18, 0x05
brne loop22

pop r18
pop r17

ret

;-----------------------Задержка для конца игры

wait2:

push r17
push r18

ldi r18, 0 ;инициализируем регистр
loop222:
ldi r17, 0 ;инициализируем регистр
loop111:
inc r17 ;Внутренний цикл с r17
cpi r17, 0xff ; Compare r17 to $f8
brne loop111 ; Branch if not equal

inc r18 ;Внешний цикл с r18
cpi r18, 0xff
brne loop222

pop r18
pop r17

ret


;-----------------------Опрос кнопок для ИГРЫ

GetButton:
push r16
push r17

brts Exit_GetButton

lds r16, Direction		;загружаем направление змейки
in r17, PIND
cp r16, r17
breq Exit_GetButton
cpi r16, 0b00000001
breq Up_Down		;переходим, если движемся вврех или вниз
cpi r16, 0b00001000
breq Up_Down		;переходим, если движемся вврех или вниз
cpi r16, 0b00000010
breq Left_Right		;переходим, если движемся влево или вправо
cpi r16, 0b00000100
breq Left_Right		;переходим, если движемся влево или вправо
rjmp Exit_GetButton

Up_Down:
sbrs r17,5			;кнопка влево нажата
rjmp Button_Left
sbrs r17,6			;кнопка вправо нажата
rjmp Button_Right
rjmp Exit_GetButton

Left_Right:
sbrs r17,4			;кнопка вверх нажата
rjmp Button_Up
sbrs r17,7			;кнопка вниз нажата
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

;---------------------------Опрос кнопок для МЕНЮ

GetMenuButton:
push r16
push r17

brts Exit_GetMenuButton

lds r16, Direction		;загружаем направление змейки
in r17, PIND
cp r16, r17
breq Exit_GetMenuButton

sbrs r17,5			;кнопка влево нажата
rjmp MenuButton_Left
sbrs r17,6			;кнопка вправо нажата
rjmp MenuButton_Right
sbrs r17,4			;кнопка вверх нажата
rjmp MenuButton_Up
sbrs r17,7			;кнопка вниз нажата
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

;---------------------Рандом до 64 и размещение еды в оперативной памяти (Функция Random64)

Random64:
;счётчик адресса Z из двух регистров
ldi r31, 0x01		;старший байт
ldi r30, 0x01		;младший байт
Try_more:
in r30,TCNT0		;пишем случайное число из таймера как адрес
inc r30				;инкрементируем, так как счётчик считает от нуля, а адресация у нас с еденицы
Check:				
cpi r30, 64			;полученое из таймера число, не должно быть больше 64
brlo Number_is_OK
subi r30,64			;полгоняем (уменьшаем) число, полученное из счётчика, на 64
rjmp Check
Number_is_OK:
ld r16,Z			;загружаем содержимое ячейки памяти
sbrs r16, 7			;проверяем пустое ли место
rjmp Try_more		;если здесь лежит кусок змейки, пробуем с новым случайным числом 
ldi r16, 64			;пишем 64 в регистр
st Z,r16			;число 64 больше максимального размера змейки и будет означать еду
;вроде всё, обработка еды реализована в функции Move
clr r16				;обнуляем счётно-сигнальный регистр для функций Move и Random64
ret

;--------------------Движение змейки (Функция Move)

Move:
clr r16
push r20
push r19
push r18
push r17

;надо как-то реализовать
;нужно как-то указать где голова
;сканируем массив змейки, находим голову и прибавляем в текущем направлении
;далее ищем конец змейки (тоже хороши бы как-то пометить) и удаляем его
;препоследний элемент змейки становится концом змейки

;можно указывать координаты байтом в dseg'е: 0000 - координаты Х, 0000 - координаты Y
;так для конца и начала
;тогда проблема в том, чтобы каждый раз правильно определять где конец змейки
;нарисую на листочке для большей понятности проблемы
;буду хранить всё в байта в dseg'e

;другой вариант: хранить в 64 байтах соответсвующих битам дисплея номер сегмента змейки
;на пример, Coords и 0000 0000 - левый верхний бит дислея, первый сегмент змейки (голова)
;на пример, Coords+1 и 0000 0001 - левый пред верхний бит дислея, второй сегмент змейки

;счётчик адресса Z из двух регистров
ldi r31, 0x01		;старший байт
ldi r30, 0x01		;младший байт

clr r17				;регистр для сравнения порядковых номеров
clr r18				;регистр для адреса с максимальным порядкомы номером (хвостом змейки)
clr r19				;регистр для адреса предыдущей головый
clr r20				;регистр для адреса еды
clt					;очищаем флаг Т для принятия значения кнопок

Mass_analyze:			;анализ массива данных Coords
ld r16, Z+		 		;берём байт по адресу и увеличиваем адрес
cpi r30, 0x42
breq End_of_mass
sbrc r16, 7				;проверяем, есть ли в загруженном байте хоть что-то
rjmp Mass_analyze		;если нет, сразу пропускаем байт
cpi r16, 64				;лежит ли в загруженном байте еда
brne No_food			;если еды нет, анализируем байт дальше
mov r20,r30				;запоминаем где еда
dec r20					;удаляем пост-инкрементацию
rjmp Mass_analyze		;возвращаемся к анализу массива
No_food:
cp r16, r17				;сравниваем регистр с максимальным порядковым номером и текущий
brlo Skip_mov			;если текущий номер меньше, пропускаем копирование
mov r17, r16			;если текущий номер больше, пишем его значение
mov r18, r30			;запоминаем адрес наибольшего порядкового номера
dec r18					;декрементируем пост-инкрементацию
Skip_mov:
inc r16					;инкрементируем байт, чтобы увеличить порядковый номер куска змейки
dec r30					;возвращаемся на предыдущий адрес
st Z+, r16				;пишем по этому адресу новый порядковый номер
cpi r16, 0b00000001		;проверяем, была ли это голова змеки
brne Mass_analyze		;идём за следующим батом
mov r19, r30			;копируем адрес головы змейки
dec r19					;декрементируем пост-инкрементацию
rjmp Mass_analyze

End_of_mass:
mov r30, r18	;берём адрес с максимальным порядковым номером (хвостом)
ldi r16, 0xff
st Z, r16		;затираем хвост, потому что змейка продвинулась
mov r30, r19			;пишем адресс головы
lds r16, Direction		;берём байт направления
sbrc r16, 0				;проверяем первые 4 бита
rjmp Move_Up			;чтобы определить куда должна двинуться змейка
sbrc r16, 1
rjmp Move_Left
sbrc r16, 2
rjmp Move_Right
sbrc r16, 3
rjmp Move_Down

Move_Up:					; ^ Движение вверх
;brts Move_Up
;нашли голову
;set						;возводим флаг Т, чтобы не наткнуться на голову второй раз
;из-за этого змейка съедается... :(
;dec r30					;декрементируем пост-инкрементацию
cpi r30, 0x01				;выполняем проверки, не пересекает ли змейка верхнюю границу поля
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
;если змейка не пересекает верхнюю границу, просто уменьшаем адрес и пишем 0
dec r30					;уменьшаем адрес байта на один (поскольку змейка идёт вверх)
ldi r16, 0				;берём 0
ld r19, Z				;запоминаем, что было на месте будущей головы
st Z, r16				;записываем по новому адресу 0 (теперь голова тут)
rjmp Exit_Move			;возвращаемся добить оставшиеся байты
CrossBoard_Up:			;змейка пересекает верхнюю границу поля
ldi r16, 7				
add r30, r16			;увеличиваем адрес на 7, змейка вылазит снизу
ldi r16, 0
ld r19, Z				;запоминаем, что было на месте будущей головы
st Z, r16				;записываем в новый адрес 0 (голову)
rjmp Exit_Move			;возвращаемся добить оставшиеся байты


Move_Left:				; < Движение влево
cpi r30, 0x01			;выполняем проверки, не пересекает ли змейка левую границу поля
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
;если змейка не пересекает левую границу, просто уменьшаем адрес на 8 и пишем 0
ldi r16, 8				;берём 8
sub r30, r16			;уменьшаем адрес на 8
ldi r16, 0				;берём 0
ld r19, Z				;запоминаем, что было на месте будущей головы
st Z, r16				;записываем по новому адресу 0 (теперь голова тут)
;add r30, r16			;не забываем увеличить адрес обратно
rjmp Exit_Move			;возвращаемся добить оставшиеся байты
CrossBoard_Left:		;змейка пересекает левую границу поля
ldi r16, 56				
add r30, r16			;увеличиваем адрес на 56, змейка вылазит справа
ldi r16, 0
ld r19, Z				;запоминаем, что было на месте будущей головы
st Z, r16				;записываем в новый адрес 0 (голову)
rjmp Exit_Move			;возвращаемся добить оставшиеся байты


Move_Right:				; > Движение вправо
cpi r30, 0x39			;выполняем проверки, не пересекает ли змейка правую границу поля
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
;если змейка не пересекает правую границу, просто увеличиваем адрес на 8 и пишем 0
ldi r16, 8				;берём 8
add r30, r16			;увеличиваем адрес на 8
ldi r16, 0				;берём 0
ld r19, Z				;запоминаем, что было на месте будущей головы
st Z, r16				;записываем по новому адресу 0 (теперь голова тут)
;subi r30, 8				;не забываем уменьшить адрес обратно
rjmp Exit_Move			;возвращаемся добить оставшиеся байты
CrossBoard_Right:		;змейка пересекает правую границу поля				
subi r30, 56			;уменьшаем адрес на 56, змейка вылазит слева
ldi r16, 0
ld r19, Z				;запоминаем, что было на месте будущей головы
st Z, r16				;записываем в новый адрес 0 (голову)
rjmp Exit_Move			;возвращаемся добить оставшиеся байты


Move_Down:				; v Движение вниз
cpi r30, 0x08			;выполняем проверки, не пересекает ли змейка нижнюю границу поля
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
;если змейка не пересекает нижнюю границу, просто увеличиваем адрес и пишем 0
inc r30					;увеличиваем адрес байта на один (поскольку змейка идёт вниз)
ldi r16, 0				;берём 0
ld r19, Z				;запоминаем, что было на месте будущей головы
st Z, r16				;записываем по новому адресу 0 (теперь голова тут)
rjmp Exit_Move			;возвращаемся добить оставшиеся байты
CrossBoard_Down:		;змейка пересекает нижнюю границу поля
subi r30, 7				;уменьшаем адрес на 7, змейка вылазит сверху
ldi r16, 0
ld r19, Z				;запоминаем, что было на месте будущей головы
st Z, r16				;записываем в новый адрес 0 (голову)
rjmp Exit_Move			;возвращаемся добить оставшиеся байты


Exit_Move:		;выходим из функции Move
clr r16
sbrs r19, 6		;проверяем, не напоролись ли мы на себя
rjmp Game_Over	;если напоролись, то проиграли

cp r20, r30		;сравниваем текущее положение головы с положением еды
brne No_growth	;если не совпадают, пропускаем восстановление хвоста
mov r30, r18	;берём адрес с максимальным порядковым номером (хвостом)
inc r17			;инкрементируем хвост змейки (поскольку все остальные части змейки уже инкрементированы)
st Z, r17		;возвращаем хвост
ldi r16, 0b10000000		;помечаем, что еда съедена
No_growth:
;возвращаем значения использованых регистров из стека
pop r17
pop r18
pop r19
pop r20
ret				;возвращаемся в main



