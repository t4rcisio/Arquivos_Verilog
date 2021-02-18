/*
*************************************
* DIVISOR DE CLOCK || CLOCK DIVIDER *
*************************************

ENTRADA: 50MHz -> SAÍDA: 1Hz
INPUT: 50MHz -> OUTPUT: 1Hz

@ TARCÍSIO PRATES
CENTRO FEDERAL DE EDUCAÇÃO TECNOLÓGICA DE MINAS GERAIS
2021, JAN

*/

module divClock(clock_50MHZ,newClock);

//ENTRADAS E SAÍDAS
input clock_50MHZ;
output newClock;

//VARIÁVEIS AUXILIARES
reg [25:0]clock_time;
reg [25:0] counter;  
reg newClock_aux; 

//INICIALIZAÇÃO DAS VARIÁVEIS
initial counter = 0;
initial newClock_aux = 0;
initial clock_time = 26'h2FAF080; 

//SAÍDA
assign newClock = newClock_aux;


always @(negedge clock_50MHZ )
	begin
		if(counter == clock_time) 
			begin
				counter = 0; 
				newClock_aux = !newClock_aux;
			end
		else
			begin
				counter = counter+1; 
			end
	end
endmodule

/*

*************************************
* 				FUNCIONAMENTO           *
*************************************

O MÓDULO RECEBE UM CLOCK DE 50MHZ E FORNECE UMA SAÍDA A 1HZ

PARA FAZER ISSO, É PRECISO CRIAR UM MECANISMO QUE CRIE UM CICLO 
DE 50MHZ, E UMA DAS MANEIRAS DE FAZER ISSO, É FAZER UM CONTADOR
QUE REINICIA TODA VEZ QUE ATINGE O VALOR DO CLOCK. 
SENDO ASSIM, TODA VEZ QUE O CLOCK OCILA, É INCREMENTADO 1 UNIDADE 
NO MEU CONTADOR, ATÉ QUE ELE ATINJA O VALOR DE 50 MILHÕES, QUANDO 
ESSE VALOR É ATINGIDO, O MÓDULO INVERTE A SAÍDA, CRIANDO UM CLOCK
DE 1HZ.

VEJA ABAIXO A "TRADUÇÃO" DO FUNCIONAMENTO DO MÓDULO:

module divClock(clock_50MHZ,newClock);

//ENTRADAS E SAÍDAS
input clock_50MHZ;
output newClock;

//VARIÁVEIS AUXILIARES
reg [25:0]clock_time;                           // ESSA VARIÁVEL INFORMARÁ QUANDO O CONTADOR SERÁ REINICIADO.
reg [25:0] counter;                             // AQUI ARMAZENA A CONTAGEM
reg newClock_aux;                               // A VARIÁVEL QUE RECEBERÁ O NOVO CLOCK

//INICIALIZAÇÃO DAS VARIÁVEIS
initial counter = 0;                            // A CONTAGEM COMEÇA NO ZERO *_*
initial newClock_aux = 0;                       // O ESTADO INICAL DO NOVO CLOCK É BAIXO
initial clock_time = 26'h2FAF080;               // AQUI EU INFORMO, EM EXADECIMAL, O LIMITE DA MINHA CONTAGEM

//SAÍDA
assign newClock = newClock_aux;                 // DEFINO A SAÍDA PARA RECEBER O NOVO CLOCK

// FUNCIONA DE FORMA NÃO PARALELA
always @(negedge clock_50MHZ )						// A FUNÇÃO ALWAYS É ACIONADA SEMPRE QUE DETECTAR UMA MUDANÇA
	begin														// NA VARIÁVEL CLOCK_50MHZ, MAIS PRECISAMENTE, NA BORDA DE DESCIDA
		if(counter == clock_time) 						// SE O CONTADOR FOR IGUAL AO VALOR MAXIMO DEFINIDO
			begin
				counter = 0; 								// O CONTADOR É REINICIADO
				newClock_aux = !newClock_aux;			// NEWClock_aux INVERTE SEU VALOR
			end
		else													// SE O CONTADOR AINDA NÃO TIVER ATINGIDO SEU LIMITE
			begin
				counter = counter+1;						// SOME MAIS 1 NO SEU VALOR 
			end
	end
endmodule




*/

