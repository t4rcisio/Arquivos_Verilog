# MY_FPGA_VERILOG
 Repositório onde compartilho meus códigos em verilog HDL

*************************************************************** 
*    * * * * *       * * * * *       * * * * *       * * *    *  
*   *               *       *       *               *     *   *   
*  * * * * *       * *  *  *       *    * * *      * * * * *  *   
* *               *               *       *       *         * *   
**               *               * * * * *       *           **   
*************************************************************** 

ESSE CONJUNTO DE ARQUIVOS GERA UM CONTADOR DE 0 ATÉ 15.
A CONTAGEM É EXIBIDA NO DISPLAY E NOS LEDS DA PLACA;

O ARQUIVO PRINCIPAL É O contador_7seg.V, LOGO O PROJETO DEVE POSSUIR O MESMO NOME
PARA O QUARTUS CONSEGUIR COMPILÁ-LO.

NA PLACA ONDE FOI IMPLEMENTADO O PROJETO, O DISPLAY ESTÁ LIGADO A UM TUBO LCD, OU SEJA, SÓ É POSSÍVEL
LIGAR UM POR VEZ. DESSA FORMA FOI NECESSÁRIO MONTAR O CLOCK PARA O DISPLAY, DE FORMA QUE A ELE 
ALTERNASSE MUITO RÁPIDO ENTRE A EXIBIÇÃO DOS NÚMEROS DANDO A IMPRESSÃO DE QUE AMBOS ESTÃO LIGADOS.



*****************
*   ARQUIVOS    *
*****************

1 - contador_7seg 
    * ARQUIVO PRINCIPAL.

2 - divClock.v
    * DIVISOR DE CLOCK, RECEBE 50MHZ E RETORNA 1HZ. É O CLOCK DO CONTADOR.

3 - display_Clock.v
    * GERA UM CLOCK PARA ALTERNAR OS DISPLAYS DE FORMA QUE APARENTA QUE AMBOS ESTÃO LIGADOS.

4 - divisor.v
    * CASO O CONTADOR SEJA MAIOR OU IGUAL A 10, O NUMERO É DIVIDIDO PARA SER EXIBIDO EM CADA DISPLAY.

5 - conf_7seg_out.v
    * RETORNA A CONFIGURAÇÃO PARA ACENDER OS SEGMENTOS DOS DISPLAY DE 7 SEGMENTOS.