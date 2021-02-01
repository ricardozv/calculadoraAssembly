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
    beq $t0, 3, multiplicar 
    beq $t0, 4, dividir 
    beq $t0, 0, sair 

    somar:
    li $v0, 4     # Imprimir uma string 
    la $a0, n1    # Carrega n1 no registrador $a0
    syscall
    li $v0, 5     # Lê um número inteiro 
    syscall
    move $t1, $v0

# Pede o segundo número 
    li $v0, 4     # imprimi uma string 
    la $a0, n2    # Carrega n2
    syscall
    li $v0, 5 
    syscall
    move $t2, $v0      # Salva o número digitado em T2
    add $t3, $t1, $t2  # SOMA: $t3 = $t1 + $t2

# Mostra o resultado 

    li $v0, 4       # Imprimir uma string 
    la $a0, r 
    syscall
    li $v0, 1
    la $a0, ($t3)
    syscall
    pula_linha
    j principal 


    subtrair:       # Bloco Subtrair 
    # Pede o primeiro número.
    li $v0, 4 
    la $a0, n1
    syscall
    li $v0, 5
    syscall
    move $t1,$v0

    # Pede segundo número 
    li $v0, 4 
    la $a0, n2
    syscall
    li $v0, 5 
    syscall
    move $t2, $v0
    sub $t3,$t1,$t2     #SUBTRAI: $t3 = $t1 - $t2

    # Mostra o resultado na tela 
    li $v0, 4
    la $a0, r
    syscall
    li $v0, 1
    la $a0, ($t3)
    syscall
    pula_linha 
    j principal

    # Bloco Multiplicar 
    multiplicar:
    li $v0, 4
    la $a0, n1
    syscall
    li $v0, 5 
    syscall
    move $t1, $v0

    # Pede o segundo número 

    li $v0, 4
    la $a0, n2
    syscall
    li $v0, 5
    syscall
    move $t2, $v0
    mul $t3, $t1, $t2

    # Mostra o resultado na tela 
    li $v0, 4
    la $a0, r
    syscall
    li $v0, 1
    la $a0, ($t3)
    syscall
    pula_linha 
    j principal 

    dividir:
    # Pede o primeiro  número 
    li $v0, 4
    la $a0, n1
    syscall
    li $v0, 5
    syscall
    move $t2, $v0
    div $t3, $t1, $t2

    # Mostra o resultado na tela 
    li $v0, 4
    la $a0, r
    syscall
    li $v0, 1
    la $a0, ($t3)
    syscall
    pula_linha 
    j principal

    sair:
    li $v0, 10 
    syscall
    


