

/* 
			****************************
			*  8bits nRisc processor   *
			*                          *
			*        Controler         *
			*                          *
			*    github.com/t4rcisio   *
			****************************
			
			
-> O modulo controler, envia sinais de controle para os demais modulos a fim de organizar e garantiir 
a correta execucao das operacoes.


-> Controler module is the maester of circuit, sending signals to the others modules to control instruction 
execution   

*/


module controler(clock, instruction, reg_alpha, reg_beta, data, index_a, index_b, op, data_out, jump, out_signal);

input [2:0] instruction;
input [2:0] reg_beta;
input [2:0] reg_alpha;
input [7:0] data;
input clock;

output [2:0]index_a;
output [2:0]index_b;
output [2:0]op;
output [7:0] data_out;
output out_signal;
output reg jump;



reg li_instruction;
reg [2:0] index_alpha;
reg [2:0] index_beta;
reg [2:0] operation;
reg [7:0] data_in;
reg signal;


initial li_instruction = 0;
initial signal = 0;

assign index_a     = index_alpha;
assign index_b     = index_beta;
assign op          = operation;
assign data_out    = data_in;
assign out_signal  = signal;


always @(clock) begin

	jump = 0;
	
	if(li_instruction == 1) begin // load imediate - multicycle
		data_in = data;     // get imediate value
		li_instruction = 0; // unable signal control
		signal = !signal;   // send all information to register memory 
	end
	else
	if(instruction == 3'b011 && li_instruction == 0) begin // load imediate
		li_instruction = 1;
		operation = instruction; // Store signal instruction
		index_alpha = reg_alpha; // store register address 
	end
	else
	if(instruction != 3'b011 && li_instruction == 0) begin // ADD, SUB, MUL, SW, LW, BEQ, BNZ
	
	  if(instruction == 3'b111) begin // Enable jump solution 
			jump = 1;
		end
		
		index_alpha = reg_alpha;
		index_beta = reg_beta;
		operation = instruction;
		signal = !signal;
	end
end




endmodule