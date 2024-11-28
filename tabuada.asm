.text
# Loop pro primeiro valor
main: addi $8, $0, 1
      addi $9, $0, 1
      addi $11, $0, 10
      addi $12, $0, 0
      addi $13, $0, 3

# $8 <- valor que está sendo multiplicado ; $9 <- valor que multiplicará
# $11 <- checa se os valores chegaram a 10
# $12 <- somador de qtd de linhas
# $10 <- resultado da multiplicação

checkMultiplicando: beq $8, $11, fimTabuada
checkMultiplicador: beq $9, $11, endActualNum
mul $10, $8, $9

add $4, $0, $8
addi $2, $0, 1
syscall
add $4, $0, 'x'
addi $2, $0, 11
syscall
add $4, $0, $9
addi $2, $0, 1
syscall
add $4, $0, '='
addi $2, $0, 11
syscall
add $4, $0, ' '
addi $2, $0, 11
syscall
add $4, $0, ' '
addi $2, $0, 11
syscall
add $4, $0, $10
addi $2, $0, 1
syscall
add $4, $0, ' '
addi $2, $0, 11
syscall

addi $12, $12, 1
checkRow: beq $12, $13, nextLine


addi $8, $8, 1

j checkMultiplicador

nextLine: add $4, $0, '\n'
	  addi $2, $0, 11
	  syscall
	  addi $12, $0, 0
	  # checa se $9 já chegou em 1
nineTest: beq $9, $11, regNineMax
	  addi $8, $0, -2
	  addi $9, $9, 1
          j checkRow

regNineMax: beq $8, $11, fimTabuada
            jal 

endActualNum: addi $9, $0, 1
              addi $8, $8, 1
              j checkMultiplicando

fimTabuada: addi $2, $0, 10
            syscall



# ======================
# func printar
# entrada: $5, $6, $7
# saida: void
