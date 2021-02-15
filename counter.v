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


module counter(CLOCK_50, LED);

input CLOCK_50;
output [3:0]LED;

wire clock_1;
reg [3:0]counter;

divClock cloc1MHz(CLOCK_50,clock_1); // RECEBE O NOVO CLOCK DE 1HZ

initial counter = 4'b1111; //OS LEDS SAO LIGADOS QUANDO ESTAO EM 
//NIVEL LOGICO IGUAL A ZERO, PORTATO, DEVE-SE ZERAR TUDO NO INICIO
// JA QUE A CONTAGEM COMECA NO ZERO *_*

assign LED[0] = !counter[0];
assign LED[1] = !counter[1];
assign LED[2] = !counter[2];
assign LED[3] = !counter[3];

/*
AQUI EXECUTA A CONTAGEM, TODA VEZ QUE O SINAL DO CLOCK MUDA, O CONTADOR SOMA UM
ASSIM, A CADA SEGUNDO O CONTADOR AUMENTA UMA UNIDADE.
*/
always @(negedge clock_1)
	begin
		if(&counter)
		begin
			counter = 0;
		end
		else
		begin
			counter = counter+1;
		end
	end



endmodule