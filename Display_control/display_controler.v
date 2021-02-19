/*

ESTE MÓDULO PODE SER USADO PARA CONTROLAR A EXIBIÇÃO 
DE NÚMEROS NOS 4 DISPLAYS DE 7 SEGMENTOS.

@t4rcisio
2021
BR

*/


module display_controler(CLOCK_50MHZ, DIG, SEG);

input  CLOCK_50MHZ;
output [3:0] DIG;
output [6:0] SEG;

wire NEW_CLOCK;
reg [3:0] CONTROLER;
integer COUNTER;

initial CONTROLER = 4'b1111;
initial COUNTER = 0;

display_clock exec (CLOCK_50MHZ, NEW_CLOCK);

assign DIG = CONTROLER;
assign SEG = 7'b0010010; //CHANGE HERE

always @(negedge NEW_CLOCK)
	begin
		if(CONTROLER == 4'b0111)
			begin
				COUNTER = 0;
			end

		CONTROLER = 4'b1111;
		CONTROLER[COUNTER] = 0;
		COUNTER = COUNTER+1;
	end

endmodule