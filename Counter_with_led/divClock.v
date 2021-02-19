
/*

@t4rcisio
2021
BR

*/

module divClock(clock_50MHZ,newClock);

//ENTRADAS E SAIDAS
input clock_50MHZ;
output newClock;


//VARIAVEIS AUXILIARES
reg [30:0]clock_time;
reg [30:0] counter;  
reg newClock_aux; 

//INICIALIZARAO DAS VARIAVEIS
initial counter = 0;
initial newClock_aux = 0;
initial clock_time = 26'h2FAF080; 

//SAIDA
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