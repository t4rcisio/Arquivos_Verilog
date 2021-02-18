/*
**************************************
* CONTADOR DE 4Bits || 4Bits COUNTER *
**************************************

ENTRADA: 50MHz CLOCK -> SAIDA: LED DE 4 Bits 
INPUT: 50MHz CLOCK -> OUTPUT: 4Bits LED


O PROGRMAMA CONTA, EM BINARIO, DE 0 ATE 15,
DE UM EM UM A CADA SEGUNDO.

THE PROGRAM COUNTS, IN BINARY, FROM 0 TO 15,
ONE BY ONE EACH SECOND.


@ TARCISIO PRATES
CENTRO FEDERAL DE EDUCACAO TECNOLOGICA DE MINAS GERAIS
2021, JAN

*/

module contador_7seg(CLOCK_50, LED, DIG, SEG);

input CLOCK_50;   // Clock 50MHZ
output [3:0]LED;  // Saida para os leds
output [6:0]SEG;  // Saida para o display
output [3:0]DIG;  // Saida para o tubo

wire clock_1;         // Clock contador Principal
wire clock_2;         // Clock display
wire [3:0]enable;     // Seleciona qual display vai ligar
reg  [3:0]counter;     // Armazena a contagem
reg  [3:0]inverter;    // Inverte a contagem para enciar aos leds
reg  [3:0]dis_signal;  // Armazena o valor do display 
wire [6:0] display_h; // fio entre o modulo que gera a isntrucao para o display e a saida
wire [3:0] sin_conv;  // fio entre o divisor e o modulo gerador de sinal para o display

initial counter    = 4'b0000;    // contador
initial inverter   = 4'b1111;   // inversor para os leds
initial dis_signal = 4'b1111; // sinal para o display

divClock       cloc1MHz    (CLOCK_50, clock_1);                   // Clock Principal 1HZ
display_Clock  clock_7seg  (CLOCK_50, clock_2);                   // Clock Display 50kHz
divisor        convert     (clock_2,  counter,  sin_conv, enable);  // Faz a divisao caso contador >=10
conf_7seg_out  dispaly_gen (clock_2,  sin_conv, display_h);        // Recebe as instrucoes para o display

assign LED = inverter;
assign SEG = display_h;
assign DIG = enable;



always @(negedge clock_1)
	begin
		if(&counter)
		begin
			counter = 0;
			inverter = 0;
			dis_signal = 0;
		end
		else
		begin
			counter = counter+1;
			inverter = {!counter[3],!counter[2],!counter[1],!counter[0]};
		end
	end

endmodule