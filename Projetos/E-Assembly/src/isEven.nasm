; Arquivo: isEven.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2019
;
; Verifica se o valor salvo no endereço RAM[5] é
; par. Se for verdadeiro, salva 1
; em RAM[0] e 0 caso contrário.

; Passando o valor da RAM[5] para o Registrador D.
leaw $5, %A     
movw (%A), %D

; Invertendo o valor do Registrador D. 
; (Não seria necessário se as condições de saída fossem invertidas)
notw %D

; Comparando o Valor do Registrador D com 1 e salvando o resultado no Registrador D.
; Se RAM[5] for par o bit menos significativo será 1 por causa da inversão feita anteriormente
; e a comparação resultará em 1 (verdadeiro de acordo com o parâmetros do programa).
leaw $1, %A
andw %A, %D, %D

; Passa o valor do Registrador D para RAM[0].
leaw $0, %A
movw %D, (%A)
