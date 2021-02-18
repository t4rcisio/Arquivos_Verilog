# CONTADOR COM DISPLAY DE 7 SEGMENTOS

Esse conjunto de arquivos gera um contador de 0 até 15.
a contagem é exibida no display e nos leds da placa;

O arquivo principal é o contador_7seg.v, logo o projeto deve possuir o mesmo nome
para o quartus conseguir compilá-lo.

Na placa onde foi implementado o projeto, o display está ligado a um controlador lcd, ou seja, só é possível ligar um por vez. Dessa forma foi necessário montar o clock para o display, de forma que a ele alternasse muito rápido entre a exibição dos números dando a impressão de que ambos estão ligados.

Na configuração atual, a taxa de atualização do display é de 50khz. 




*****************
####   ARQUIVOS    
*****************

**1 - contador_7seg.v** 
*    ARQUIVO PRINCIPAL.

**2 - divClock.v**
*    DIVISOR DE CLOCK, RECEBE 50MHZ E RETORNA 1HZ. É O CLOCK DO CONTADOR.

**3 - display_Clock.v**
*    GERA UM CLOCK PARA ALTERNAR OS DISPLAYS DE FORMA QUE APARENTA QUE AMBOS ESTÃO LIGADOS.

**4 - divisor.v**
*    CASO O CONTADOR SEJA MAIOR OU IGUAL A 10, O NUMERO É DIVIDIDO PARA SER EXIBIDO EM CADA DISPLAY.

**5 - conf_7seg_out.v**
*    RETORNA A CONFIGURAÇÃO PARA ACENDER OS SEGMENTOS DOS DISPLAY DE 7 SEGMENTOS.