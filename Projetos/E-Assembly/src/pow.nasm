leaw $1, %A
movw (%A), %D
leaw $0, %A
movw %D, (%A)
subw %D, $1, %D
leaw $2, %A
movw %D, (%A)
LOOP:
leaw $1, %A
movw (%A), %D
leaw $0, %A
addw (%A), %D, %D
movw %D, (%A)
leaw $1, %A
movw %A, %D
leaw $2, %A
subw (%A), %D, %D
leaw $2, %A
movw %D, (%A)
leaw $LOOP, %A
jne
nop