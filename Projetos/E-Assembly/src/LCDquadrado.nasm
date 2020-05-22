; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadrado no LCD

; Estipulando a RAM do LCD a ser desenhada e salvando ela na RAM[0], valor completamente arbitrário
leaw $18634, %A 
movw %A, %D
leaw $R0, %A
movw %D, (%A)

; Salvando 20 na RAM[1]. Este valor é específico pois a cada 20 valores no índice da RAM no LCD pula-se uma linha.
leaw $20, %A
movw %A, %D
leaw $R1, %A
movw %D, (%A)

; Salvando 16 na RAM[2]. Será utilizado para a contagem da altura do quadrado.
leaw $16, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; LOOP de desenho do quadrado.
LOOP:

; Lendo o valor salvo na RAM[0] e atribuindo -1 (1111111111111111) à RAM[valor].
leaw $R0, %A
movw (%A), %A
movw $-1, (%A)

; Somando 20 ao valor da RAM[0], efetivamente mudando o valor para referenciar a RAM exatamente abaixo no LCD.
leaw $R0, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R0, %A
movw %D, (%A)

; Subtraindo 1 do número de linhas a serem desenhadas.
leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

; Se ainda há linhas a serem desenhadas, pule para LOOP.
leaw $LOOP, %A
jne
nop
