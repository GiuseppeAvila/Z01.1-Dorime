; Arquivo: multi.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Multiplica o valor de RAM[1] com RAM[0] salvando em RAM[3]

leaw $R1, %A
movw (%A), %D
leaw $R5, %A
movw %D, (%A)

leaw $R0, %A
movw (%A), %D
leaw $R4, %A
movw %D, (%A)

definido:
leaw $R5, %A
movw (%A), %D
leaw $R3, %A
addw (%A), %D, %D
movw %D, (%A)

leaw $R4, %A
movw (%A), %D
decw %D
movw %D, (%A)

leaw $R4, %A
leaw $definido, %A
jne
nop