# REPOSITÍRIO DE CÓDIGO EM VERILOG HDL




####  Repositório onde compartilho meus códigos em verilog HDL
#### Repository where I share my codes in verilog HDL
```
                *************************************************************** 
                *    * * * * *       * * * * *       * * * * *       * * *    *  
                *   *               *       *       *               *     *   *   
                *  * * * * *       * *  *  *       *    * * *      * * * * *  *   
                * *               *               *       *       *         * *   
                **               *               * * * * *       *           **   
                *************************************************************** 
```
    



Olá, meu nome é Tarcísio, e estou cursando engenharia de computação
No CEFET-mg.
Resolvi abrir esse espaço para compartilhar alguns 
Códigos em verilog que desenvolvi ao longo do curso de sistemas digitais.

Como sou um entusiasta da área de hardware, adquiri uma fpga, semelhante 
a que usamos nos laboratórios da universidade, para brincar e fazer alguns projetos.
no início do curso de sistemas digitais, achei a documentação, de verilog, em português, 
pouco intuitiva então comentei em todos os códigos o passo a passo do desenvolvimeto.

Algumas especificações da minha fpga:

Modelo: placa rz-easyfpga altera cyclone iv ep4ce6
Cristal oscilador: 50mhz
Memória: 64 Mbits 

* [AQUI](https://www.embarcados.com.br/placa-de-fpga-com-cyclone-iv/) Um link com mais detalhes sobre a placa. 
* [aqui](http://bit.ly/3rv8qjt) onde importei a peça.

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

**4 - assignments.txt**
*     ALGUMAS PINAGENS PARA O MODELO DA MINHA PLACA.