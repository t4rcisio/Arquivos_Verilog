


module conf_7seg_out(clock_1hz,val,display);

input clock_1hz;
input [3:0]val;
output [6:0]display;

reg [6:0] def;

initial def = 7'b11111111;

assign display = def;

always @(negedge clock_1hz)
	begin
			
		case(val)          //  6543210
			4'b0000 : def =  7'b1000000; //0
			4'b0001 : def =  7'b1111001; //1
			4'b0010 : def =  7'b0100100; //2
			4'b0011 : def =  7'b0110000; //3
			4'b0100 : def =  7'b0011001; //4
			4'b0101 : def =  7'b0010010; //5
			4'b0110 : def =  7'b0000010; //6
			4'b0111 : def =  7'b1011000; //7
			4'b1000 : def =  7'b0000000; //8
			4'b1001 : def =  7'b0011000; //9
			default : def =  7'b1000000; //0
			
		endcase
	end
/*
--         0
	--     ---  
	--  5 |   | 1
	--     ---   <- 6
	--  4 |   | 2
	--     ---
	--      3

*/


endmodule