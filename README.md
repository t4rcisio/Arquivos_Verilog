# REPOSITÍRIO DE CÓDIGOS EM VERILOG HDL

####  Processador nano-Risck, controlaor de display, e muito mais...

```
                *************************************************************** 
                *    * * * * *       * * * * *       * * * * *       * * *    *  
                *   *               *       *       *               *     *   *   
                *  * * * * *       * *  *  *       *    * * *      * * * * *  *   
                * *               *               *       *       *         * *   
                **               *               * * * * *       *           **   
                *************************************************************** 
```
    

Algumas especificações da minha fpga:

* Modelo: placa rz-easyfpga altera cyclone iv ep4ce6
* Cristal oscilador: 50mhz
* Memória: 64 Mbits 

* [AQUI](https://www.embarcados.com.br/placa-de-fpga-com-cyclone-iv/) - Um link com mais detalhes sobre a placa. 
* [AQUI](http://bit.ly/3rv8qjt) - Onde importei a peça.

***
![](https://github.com/tarcisio01/Tutorial_Verilog/blob/main/imagens/Minha_FPGA.jpg)

********************
#####    ARQUIVOS   
********************

**1 - Clock_50MHZ_to_1HZ**
*     DIVISOR DE CLOCK( CLOCK DIVIDER). RECEBE UM CLOCK DE 50MHZ E GERA UMA SAÍDA DE 1HZ.

**2 - Contador_com_led**
*     CONTADOR DE 0 ATÉ 15 EM BINÁRIO. A CONTAGEM É EXIBIDA NOS LEDS.

**3 - Contador_com_display**
*     CONTADOR DE 0 ATÉ 15 EM BINÁRIO. A CONTAGEM É EXIBIDA NOS LEDS e no LCD.

**4 - Controlador_do_Display**
*     CONTROLA A EXIBIÇÃO NO DISPLAY.

**4 - Pinagem**
*     ALGUMAS PINAGENS PARA O MODELO DA MINHA PLACA.
