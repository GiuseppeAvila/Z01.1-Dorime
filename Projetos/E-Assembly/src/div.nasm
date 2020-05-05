; Arquivo: Div.nasm
; Curso: Elementos de Sistemas
; Criado por: Luciano Soares
; Data: 27/03/2017

; Divide R0 por R1 e armazena o resultado em R2.
; (R0, R1, R2 refer to RAM[0], RAM[1], and RAM[2], respectively.)
; divisao para numeros inteiros positivos

; DIVISAO POR SUBTRAÇÃO SUCESSIVA
; não importa o resto

; inicio primeira iteração
leaw $R1, %A
movw (%A), %D
leaw $R0, %A
subw (%A), %D, %D 
leaw $R3, %A
movw %D, (%A) ; <--- armazena valor em R3

; incremento
leaw $R4, %A
addw $1, (%A), %D ; <--- contador para o resultado
movw %D, (%A) ; <--- adiciona em R4

leaw $end, %A ; <--- se a divisao for concluida pula pro final
jl
nop 

while: ; <--- loop
leaw $R3, %A ; <--- resgata valor de R3 (última subtração)
movw (%A), %D 
leaw $R1, %A 
subw %D, (%A), %D
leaw $R3, %A
movw %D, (%A) ; <--- guarda novamente resultado em R3

; if 
leaw $end, %A ; <--- se o resultado é menor que 0, então a divisao foi concluída parcialmente
jl
nop

; else <--- se não, é adicionado +1 ao contador de resultado
leaw $R4, %A
addw $1, (%A), %D
movw %D, (%A) 
leaw $while, %A ; <--- se chegou a essa parte a divisão não foi concluída e volta para mais uma iteração
jmp 
nop

    
end: ; <--- se a divisão foi concluída o jl salta para essa linha
leaw $R4, %A
movw (%A), %D
leaw $R2, %A
movw %D, (%A) ; <--- valor do contador (resultado parcial em inteiro) é adicionado à R2





















































































