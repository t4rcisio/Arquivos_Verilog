
/* 
			****************************
			*  8bits nRisc processor   *
			*         Pipeline         *
			*         Register         *
			*          Memory          *
			*                          *
			*    github.com/t4rcisio   *
			****************************
*/




module register_memory(clock, memory_data, alu_data, operation, reg_a, reg_b, data, op_type, data_0, data_1, r_beq );


input clock;
input [7:0] memory_data;
input [7:0] alu_data;

input [2:0] operation;
input [2:0] reg_a;
input [2:0] reg_b;
input [7:0] data;

output reg [7:0] data_0;
output reg [7:0] data_1;
output reg [2:0] op_type;
output reg [7:0] r_beq;

reg [7:0]regMemory[7:0];

reg [2:0]memory_alpha;
reg pipeline;
reg await_solution;

reg [7:0] register_debug;

reg [2:0]temp_a;
reg [2:0]temp_b;
reg [2:0]temp_o;
reg [2:0]solution_index;
reg [2:0] temp_operation;
reg [7:0] immediate;

initial pipeline = 0;
initial regMemory[0] = 0;
initial await_solution = 0;

always @(negedge clock) begin

	if(await_solution == 1) begin // Recebe as respostas da ULA e da Memoria
		regMemory[solution_index] = alu_data | memory_data;
		await_solution = 0;
	end
	if(operation == 3'b011) begin
		regMemory[reg_a] = data;
	end
	else begin
		if(pipeline == 1) begin
			data_0         = regMemory[temp_a];
			data_1         = regMemory[temp_b];
		   r_beq          = regMemory[01];
			op_type        = temp_o;
			
			if(temp_o == 3'b110)                     // BEQ
				solution_index = 3'b001;
			else
				solution_index = temp_a;
				
			if(temp_o == 3'b100 || temp_o == 3'b111) // SW e BNZ
				await_solution = 0;
			else
				await_solution = 1;
			
			pipeline       = 0;
		end
		if(operation != 3'b011 && pipeline == 0) begin // Memoria intermediaria
			register_debug = data;
			temp_a         = reg_a;
			temp_b         = reg_b;
			temp_o         = operation;
			pipeline       = 1;
		end
	end
end



endmodule