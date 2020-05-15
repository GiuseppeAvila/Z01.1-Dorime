; Arquivo: SWeLED2.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
;
; Faça os LEDs exibirem 
; LED = SW[8] !SW[7] OFF ON ON RAM[5][3] ON SW[0] OFF
;
;                                ^            ^
;                                | TRUQUE!    | TRUQUE!

; adicionado sw[8] e sw[0]
leaw $256, %A
movw %A, %D
leaw $21185, %A
andw (%A), %D, %D
leaw $21184, %A
addw %D, (%A), %D
movw %D, (%A)

; adicionando o !sw[7]
leaw $128, %A
movw %A, %D
leaw $21185, %A
andw (%A), %D, %D
notw %D
leaw $128, %A
andw %A, %D, %D
leaw $21184, %A
addw %D, (%A), %D
movw %D, (%A)

; adicionando o ram[5][3]
leaw $8, %A
movw %A, %D
leaw $5, %A
andw (%A), %D, %D
leaw $21184, %A
addw %D, (%A), %D
movw %D, (%A)

; adicionando os ONs
leaw $52, %A
movw %A, %D
leaw $21184, %A
addw %D, (%A), %D
movw %D, (%A)

; adicionando switch[0]
movw $1, %D
leaw $21185, %A
andw (%A), %D, %D
leaw $end, %A
je
nop

leaw $2, %A
movw %A, %D
leaw $21184, %A
addw %D, (%A), %D
movw %D, (%A)

end:
