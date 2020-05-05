; Arquivo: Mod.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017
;
; Calcula o resto da divisão (modulus) entre RAM[0] por RAM[1]
; e armazena o resultado na RAM[2].
;
; 4  % 3 = 1
; 10 % 7 = 3
 
while:
 
leaw $R2, %A
movw %D, (%A) ; <--- joga o valor que estava em %D (será o resto/resultado da última subtração) para a RAM[2]
 
leaw $R1, %A
movw (%A), %D ; <--- copia o valor que está na RAM[1] e armazena em %D
 
leaw $R0, %A
subw (%A), %D, %D ; <--- subtrai o que está na RAM[0] pelo que está em %D (RAM[1]) e armazena em %D
 
leaw $R0, %A
movw %D, (%A) ; <--- pega o resultado da subtração e armazena na RAM[0]
 
leaw $end, %A
je %D ; <--- se o resultado em %D for zero significa que acabou
nop
leaw $endneg, %A
jl %D ; <--- se o resultado em %D for menor que zero significa que acabou
nop
 
leaw $while, %A
jmp ; <--- else, a iteração é feita novamente
nop
 
end:
leaw $R2, %A
movw %D, (%A) ; <--- atualiza o resto para RAM[2]

endneg:
; resto não é atualizado e o programa finaliza
