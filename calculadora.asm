# Calculadora 
.data
    menu:   .asciiz  "********** MENU ************\n1 - Somar\n2 - Subtrair\n3 - Multiplicar\n4 - Dividir\n0 -Sair\nOPÇÃO: " 
    n1:     .asciiz  "Entre com o primeiro número: "
    n2:     .asciiz "Entre com o segundo número: "
    r:      .asciiz "Resultado: "
    pula:   .asciiz "\n\n"

.macro pula_linha   # Macro pula linha 
    li $v0, 4       # Imprimir uma string 
    la $a0, pula    # Carrega uma string e pula em $a0
    syscall         # Executa 
    .end_macro      # Fim Macro 

.macro menu 
    li $v0, 4           # Imprimir uma string 
    la $a0, menu        # Imprimi menu na tela 
    syscall
    li $v0, 5           # Prepara para ler um número inteiro 
    syscall
    move $t0, $v0       # Salva o numero digitado em $t0
    .end_macro 

.text
.global principal 

    principal:  # Funão principal 
    menu        # Chama macro menu 

# Condições 
    beq $t0, 1, somar 
    beq $t0, 2, subtrair 
    beq $t0, 3, mulplicar 