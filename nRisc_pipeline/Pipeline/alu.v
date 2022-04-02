

/* 
			****************************
			*  8bits nRisc processor   *
			*         Pipeline         *
			*       Arithmetic         *
			*          logic           *
			*          unity           *
			*                          *
			*    github.com/t4rcisio   *
			****************************
*/




module alu(clock, operation, data_0, data_1, r_beq, jump_data, solution);

input clock;
input [2:0] operation;
input [7:0] data_0;
input [7:0] data_1;
input [7:0] r_beq;


output reg [7:0] jump_data;
output reg [7:0] solution;


reg [7:0] temp_solution;
reg pipeline;

initial pipeline = 0;

always @(posedge clock) begin

	if(operation == 3'b000 && pipeline == 0) begin // SUM
		solution = data_0 + data_1;
	end
	else
	if(operation == 3'b001 && pipeline == 0) begin // SUB
		solution = data_0 - data_1;
	end
	else
	if(operation == 3'b010 && pipeline == 0) begin // MUL
		solution = data_0 * data_1;
	end
	else
	if(operation == 3'b110 && pipeline == 0) begin // BEQ
		solution = data_0 == data_1;
	end
	else
	if(operation == 3'b111 && pipeline == 0) begin // BNZ
		if(r_beq == 0)
			jump_data = data_0;
		else
			jump_data = data_1;
		
		solution = data_0;
	end
	else begin
		solution  = 8'b00000000;
		jump_data = 8'b1xxxxxxx;
	end
end

endmodule