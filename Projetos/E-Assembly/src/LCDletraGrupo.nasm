; Arquivo: LCDletraGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD a letra do grupo de vocês
;  - Valide no hardawre
;  - Bata uma foto!

; linha 1 (linha vertical da lateral esquerda)
leaw $17589, %A
movw %A, %D 
leaw $R0, %A
movw %D, (%A) 

linha1:
leaw $R0, %A
movw (%A), %D
movw %D, %A
movw $-1, (%A)
leaw $20, %A
addw %A, %D, %D
leaw $R0, %A
movw %D, (%A) 
leaw $19989, %A
subw %A, %D, %D
leaw $linha1, %A
jg
nop

; linha 2 (linha horizontal da parte de cima)
; primeiro endereço
leaw $17588, %A
movw %A, %D 
leaw $R1, %A
movw %D, (%A)

; contador = 6-1 till equals to 0
; número do contador diz respeito ao tamanho da linha
leaw $6, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; contador da segunda parte do processo de desenhar linhas
; número do contador diz respeito à grossura da linha
leaw $14, %A
movw %A, %D
leaw $R3, %A
movw %D, (%A)

linha2:
leaw $R1, %A
movw (%A), %D
addw $1, %D, (%A)
movw %D, %A
movw $-1, (%A)
leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $linha2, %A
jg
nop

; reinicia o contador da linha
leaw $6, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; adiciona 15 ao valor anterior para equivaler o salto de 20 linhas do primeiro endereço
leaw $14, %A
movw %A, %D
leaw $R1, %A
addw (%A), %D, %D
movw %D, (%A)

; volta para o loop de desenhar a linha
; com o contador -1/ realiza o processo 10 vezes ou seja, desenha 10 linhas
leaw $R3, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $linha2, %A
jg
nop


; linha 3 (linha horizontal da parte de baixo)
; primeiro endereço
leaw $19988, %A
movw %A, %D 
leaw $R1, %A
movw %D, (%A)

; contador = 6-1 till equals to 0
; número do contador diz respeito ao tamanho da linha
leaw $6, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; contador da segunda parte do processo de desenhar linhas
; número do contador diz respeito à grossura da linha
leaw $14, %A
movw %A, %D
leaw $R3, %A
movw %D, (%A)

linha3:
leaw $R1, %A
movw (%A), %D
addw $1, %D, (%A)
movw %D, %A
movw $-1, (%A)
leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $linha3, %A
jg
nop

; reinicia o contador da linha
leaw $6, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; adiciona 15 ao valor anterior para equivaler o salto de 20 linhas do primeiro endereço
leaw $14, %A
movw %A, %D
leaw $R1, %A
addw (%A), %D, %D
movw %D, (%A)

; volta para o loop de desenhar a linha
; com o contador -1/ realiza o processo 10 vezes ou seja, desenha 10 linhas
leaw $R3, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $linha3, %A
jg
nop


; linha 4 (quadrado superior)
leaw $17874, %A
movw %A, %D 
leaw $R0, %A
movw %D, (%A) 

linha4:
leaw $R0, %A
movw (%A), %D
movw %D, %A
movw $-1, (%A)
leaw $20, %A
addw %A, %D, %D
leaw $R0, %A
movw %D, (%A) 
leaw $18194, %A
subw %A, %D, %D
leaw $linha4, %A
jg
nop


; linha 5 (quadrado inferior)
leaw $19674, %A
movw %A, %D 
leaw $R0, %A
movw %D, (%A) 

linha5:
leaw $R0, %A
movw (%A), %D
movw %D, %A
movw $-1, (%A)
leaw $20, %A
addw %A, %D, %D
leaw $R0, %A
movw %D, (%A) 
leaw $19994, %A
subw %A, %D, %D
leaw $linha5, %A
jg
nop


; linha 6 (linha lateral direita)
leaw $18195, %A
movw %A, %D 
leaw $R0, %A
movw %D, (%A) 

linha6:
leaw $R0, %A
movw (%A), %D
movw %D, %A
movw $-1, (%A)
leaw $20, %A
addw %A, %D, %D
leaw $R0, %A
movw %D, (%A) 
leaw $19675, %A
subw %A, %D, %D
leaw $linha6, %A
jg
nop

