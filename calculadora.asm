# Calculadora 
.data
    menu:   .asciiz  "********** MENU ************\n1 - Somar\n2 - Subtrair\n3 - Multiplicar\n4 - Dividir\n0 -Sair\nOPÇÃO: " 
    n1:     .asciiz  "Entre com o primeiro número: "
    n2:     .asciiz "Entre com o segundo número: "
    r:      .asciiz "Resultado: "
    pula:   .asciiz "\n\n"

.macro pula_linha 