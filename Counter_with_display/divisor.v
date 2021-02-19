
/*

@t4rcisio
2021
BR

*/


module divisor(clock_50H, num, new_num, tube);

input clock_50H;
input [3:0]num;
output [3:0]new_num;
output [3:0]tube;

reg [3:0]aux;
reg enable;
reg [3:0]tb;
initial tb = 4'b1110;
assign new_num = aux;
assign tube = tb;

always @(negedge clock_50H)
	begin
	tb = 4'b1110;
		aux = num;
		if((aux>=10)&enable)
		begin
			aux = aux%10;
			enable = !enable;
			tb = 4'b1101;
		end
		if(aux>=10)
			begin
			aux = aux/10;
			enable = !enable;
			tb = 4'b1110;
			end
	end
endmodule