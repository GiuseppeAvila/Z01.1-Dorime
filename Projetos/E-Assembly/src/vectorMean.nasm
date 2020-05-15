; ------------------------------------
; Calcule a média dos valores de um vetor
; que possui inicio em RAM[5] e tamanho
; defindo em RAM[4],
;
; 1. Salve a soma em RAM[1]
; 2. Salve a média em RAM[0]
; 
; ------------------------------------
; antes       | depois
;             |
; RAM[0]:     | RAM[0]:  2  : média 
; RAM[1]:     | RAM[1]:  8  : soma
; RAM[2]:     | RAM[2]:  
; RAM[3]:     | RAM[3]:  
; RAM[4]:  4  | RAM[4]:  4 
; RAM[5]:  1  | RAM[5]:  1 - 
; RAM[6]:  2  | RAM[6]:  2 | vetor
; RAM[7]:  1  | RAM[7]:  1 |
; RAM[8]:  4  | RAM[8]:  4 -
; ------------------------------------

; guardando tamanho do vetor em r3
leaw $4, %A
movw (%A), %D
leaw $3, %A
movw %D, (%A)
leaw $end0, %A
je 
nop

; guardando posição inicial em r2
leaw $5, %A
movw %A, %D
leaw $2, %A
movw %D, (%A)

; iteração
loop:
leaw $2, %A
movw (%A), %D
addw $1, %D, (%A)
movw %D, %A
movw (%A), %D
leaw $1, %A
addw (%A), %D, %D
movw %D, (%A)
leaw $4, %A
subw (%A), $1, %D
movw %D, (%A)
leaw $loop, %A
jg
nop

; inicio primeira iteração de subtração
leaw $3, %A
movw (%A), %D
leaw $1, %A
subw (%A), %D, %D
leaw $2, %A 
movw %D, (%A)

; incremento
leaw $0, %A
addw $1, (%A), %D 
movw %D, (%A) 

leaw $end, %A 
jl
nop 

while: 
leaw $3, %A
movw (%A), %D
leaw $2, %A
subw (%A), %D, %D 
movw %D, (%A) 

; if 
leaw $end, %A 
jl
nop

; else 
leaw $0, %A
addw $1, (%A), %D
movw %D, (%A) 
leaw $while, %A 
jmp 
nop

end0:
leaw $0, %A
movw $0, (%A)
leaw $1, %A
movw $0, (%A)

    
end: 