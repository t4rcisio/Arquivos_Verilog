

/* 
			****************************
			*  8bits nRisc processor   *
			*         Pipeline         *
			*       Demultiplexer      *
			*                          *
			*    github.com/t4rcisio   *
			****************************
*/


module mux_alpha(clock, jump, instruction, operation, reg_a, reg_b, immediate);

input clock;
input [7:0] instruction;
input jump;

output reg [2:0] reg_a;
output reg [1:0] reg_b;
output reg [2:0] operation;
output reg [7:0] immediate;

reg [7:0] memory;
reg pipeline;
reg [7:0] mux_debug;

initial pipeline = 0;

always @(negedge clock) begin
	
	
	if(pipeline == 1 && jump == 0) begin
		operation   = memory[7:5];
		reg_a       = memory[4:2];
		reg_b       = memory[1:0];
		immediate   = memory; 
		pipeline = 0;
	end
	if(pipeline == 0 && jump == 0) begin
		memory = instruction;
		mux_debug = instruction;
		pipeline =  1 ;
	end
	if(jump == 1) begin
		memory      = 8'b1xxxxxxx;
		operation   = 3'b1xx;
		reg_a       = 3'b1xx;
		reg_b       = 3'b1xx;
		immediate   = 8'b1xx; 
	end

end



endmodule