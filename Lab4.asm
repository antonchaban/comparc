TITLE LAB_4 
;------------------------------------------------------------------------------
; ЛР  №4
;------------------------------------------------------------------------------
; Архітектура комп'ютера
; ВУЗ:          КНУУ "КПІ"
; Факультет:    ФІОТ
; Курс:         1
; Група:        ІТ-03
;------------------------------------------------------------------------------
; Автор:        Чабан Філянін Хамад
; Команда:      №6
; Дата:         31/03/2021
;---------------------------------
IDEAL			; Директива - тип Асемблера tasm 
MODEL small		; Директива - тип моделі пам’яті 
STACK 2048		; Директива - розмір стеку 


MACRO M_Increment ; Початок макросу
	mov [bp],ah ; заносимо в стек
    inc bp ; збільшуємо індекс стеку на 1
ENDM M_Increment ; Кінець макросу	

DATASEG ; наповнюємо масив псевдо-випадковими числами
array_stack  dw 7E7Eh, 4225 ,1734 ,1704, 5950, 9829, 8679, 9617, 8396, 4940, 5732, 6701 ,3166 ,2616, 6987, 8377
             dw 7688, 7111 ,1276 ,2132 ,7324, 2896 ,5471 ,9746 ,4446, 8631, 3823 ,4104, 1703, 5118, 8162 ,6956
             dw 5078, 8971, 4420, 2751, 2263, 4606, 5018, 4659, 9125, 5998, 4151, 1151, 3821, 4828, 7659, 7950
             dw 7775, 7780 ,5945 ,8680, 7858 ,9097 ,1380, 4009 ,4839 ,2852 ,9426, 3437 ,4798, 6011 ,3989 ,8238
             dw 2335, 6148, 5282, 9208, 9920, 9193, 1070, 3233, 6084, 3442, 3539, 9784, 3311, 6448, 6268, 3076
             dw 7425, 8226 ,4648, 1585 ,6491 ,1032 ,7524 ,6707 ,7598 ,3981, 4432 ,2127 ,7683 ,4272 ,1919 ,8056
             dw 6988, 4592, 4203, 6912, 4949, 4763, 5163, 3761, 4098, 6591, 6327, 3811, 6427, 7300, 2349 ,7645
             dw 1514, 1055, 8644 ,9563, 2705, 8004, 4173, 7621, 1481 ,7822, 6364, 1598, 8556, 1438, 5523, 7E7Eh
            

CODESEG
Start:
    mov ax, @data  ; ax <- @data
    mov ds, ax	   ; ds <- ax	
    mov es, ax	   ; es <- ax	
    mov cx, 128    ; розміщуємо кількість операцій
    mov si, 0      ; обнуляємо si
     loop1:
        mov ax, [ds:si]
        mov [ds:[si+256]],ax ; занесення значення до датасегменту
        mov [ds:[si+512]],ax
        mov [ds:[si+768]],ax
        mov [ds:[si+1024]],ax
        mov [ds:[si+1280]],ax
        add si,2  ; збільшуємо по 2 вайти так як використовуємо слово
        loop loop1 ; перевірка циклу

    ; заносимо одразу по 2 байта, тому пробігаємо лише 128 разів
    mov cx, 128 ; розміщуємо кількість операцій
    mov si, 0   ; обнуляємо si
    loop2:
        mov ax,[ds:[si]] ; занесення значення з ділянки в ds до ax
        push ax          ; занесення значення з ax до стеку
        add si, 2        ; збільшення значення в регістрі si на 2, оскільки записано 2 байти 
        loop loop2       ; перевірка циклу

    ; 23.11.2002, 6 рядок
    mov bp, 0750h
    
    mov ah,"2"  ; Записуємо значення в стек 
    M_Increment ; Використовуємо макрос
    mov ah, "3" 
    M_Increment 
    mov ah, "." 
    M_Increment 
    mov ah, "1"
    M_Increment
    mov ah, "1"
    M_Increment
    mov ah, "." 
    M_Increment 
    mov ah, "2"
    M_Increment
    mov ah, "0" 
    M_Increment 
    mov ah, "0" 
    M_Increment 
    mov ah, "2" 
    mov [bp],ah ; Заносимо в стек

    ; 15.11.2003, 7 рядок
    mov bp, 0760h

    mov ah,"1"  ; Записуємо значення в стек 
    M_Increment ; Використовуємо макрос
    mov ah, "5"
    M_Increment 
    mov ah, "."
    M_Increment 
    mov ah, "1" 
    M_Increment 
    mov ah, "1"
    M_Increment 
    mov ah, "."
    M_Increment
    mov ah, "2"
    M_Increment
    mov ah, "0"
    M_Increment 
    mov ah, "0"
    M_Increment 
    mov ah, "3"
    mov [bp],ah ; Заносимо в стек

    ; 25.08.2002, 8 рядок
    mov bp, 0770h
    
    mov ah,"2"  ; Записуємо значення в стек 
    M_Increment ; Використовуємо макрос
    mov ah, "5"
    M_Increment 
    mov ah, "."
    M_Increment
    mov ah, "0"
    M_Increment 
    mov ah, "8"
    M_Increment 
    mov ah, "."
    M_Increment 
    mov ah, "2"
    M_Increment 
    mov ah, "0"
    M_Increment 
    mov ah, "0"
    M_Increment 
    mov ah, "2"
    mov [bp],ah ; Заносимо в стек

    mov ah, 4ch 
    int 21h ; виклик функції DOS 4ch
end Start