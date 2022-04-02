

/* 
			****************************
			*  8bits nRisc processor   *
			*         Pipeline         *
			*          Signal          *
			*         Extensor         *
			*                          *
			*    github.com/t4rcisio   *
			****************************
*/





module signal_extensor(clock, operation, reg_a, reg_b, immediate, ex_op, ex_a, ex_b, ex_im);

input clock;
input [2:0] operation;
input [2:0] reg_a;
input [1:0] reg_b;
input [7:0] immediate;

output reg [2:0]ex_op;
output reg [2:0]ex_a;
output reg [2:0]ex_b;
output reg [7:0]ex_im;


always @(negedge clock) begin
	
		ex_op = operation;
		ex_a  = reg_a;
		ex_b  = 3'b000 | reg_b;
		ex_im = immediate;
	
end




endmodule