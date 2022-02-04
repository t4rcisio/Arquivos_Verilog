
/* 
			****************************
			*  8bits nRisc processor   *
			*                          *
			*         Register         *
			*          Memory          *
			*                          *
			*    github.com/t4rcisio   *
			****************************
			
-> O banco de registardores fornece uma memoria de rapido acesso para a execucao de operacoes aritmeticas
na ULA.

-> Register memory module is a short, but fast memory to use on arithmetics operations on ALU module
			
*/




module registers(clock_read, clock_mem, clock_alu, instruction, reg_alpha, reg_beta, solution_alu, memory_data, imediate, op_type, reg_beq, data_alpha, data_beta, out_signal);

input clock_read;
input clock_mem;
input clock_alu;

input [2:0] instruction;
input [2:0] reg_alpha;
input [2:0] reg_beta;
input [7:0] solution_alu;
input [7:0] memory_data;
input [7:0] imediate;


output [7:0] data_alpha;
output [7:0] data_beta;
output [2:0] op_type;
output out_signal;
output [7:0] reg_beq;


reg [7:0]memory[7:0];
reg [2:0]temp_index;

reg [7:0] cache_a;
reg [7:0] cache_b;
reg [2:0] operation;
reg signal;
reg await_solutions;
reg [7:0]r_beq;

initial signal = 0;
initial await_solutions = 0;
initial memory[0] = 8'b00000000;

assign data_alpha = cache_a;
assign data_beta = cache_b;
assign op_type = operation;
assign out_signal = signal;
assign reg_beq = r_beq;

always @(clock_read or clock_mem or clock_alu) begin
	
	
	if(instruction == 3'b011 && await_solutions == 0) begin // LI
		memory[reg_alpha] = imediate;
	end
	else
	if(await_solutions == 1) begin // Store data from ALU or Memory
		memory[temp_index] =  solution_alu | memory_data;
		await_solutions = 0;
	end
	else
	if(instruction != 3'b011 && await_solutions == 0) begin 
		if(instruction == 3'b111) begin // BNZ defaul solution position from BEQ operation
			r_beq = memory[1];
		end
		if(instruction == 3'b110) // BEQ defaul store position  
			temp_index = 3'b001;
		else
			temp_index = reg_alpha;
		
		cache_a = memory[reg_alpha]; // Read first register
		cache_b = memory[reg_beta];  // Read second register
		operation = instruction;     // Transfer the operation 
		await_solutions = 1;         // Prepare circuit to recive a ALU solution or memory_module data
		signal = !signal;				  // Notify ALU and Memory 	
	end

end

	
	



endmodule