; Arquivo: Factorial.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Calcula o fatorial do número em R0 e armazena o valor em R1.

leaw $0, %A
movw (%A), %D
leaw $ELSE, %A
je %D
nop
leaw $5, %A
movw %D, (%A)
leaw $10, %A
movw %D, (%A)
leaw $4, %A
movw %D, (%A)
decw %D
movw %D, (%A)
leaw $10, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $0, %A
movw %A, %D
leaw $1, %A
movw %D, (%A)
LOOP:
leaw $1, %A
movw (%A), %D
leaw $5, %A
addw (%A), %D, %D
leaw $1, %A
movw %D, (%A)
leaw $4, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $LOOP, %A
jne %D
nop
leaw $10, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $1, %A
movw (%A), %D
leaw $5, %A
movw %D, (%A)
leaw $10, %A
movw (%A), %D
leaw $4, %A
decw %D
movw %D, (%A)
leaw $10, %A
movw (%A), %D
leaw $1, %A
subw %D, %A, %D
leaw $LOOP, %A
jg %D
nop
leaw $END, %A
jmp
nop
ELSE:
leaw $1, %A
movw %A, %D
movw %D, (%A)
END: