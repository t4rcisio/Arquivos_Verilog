

/* 
			****************************
			*  8bits nRisc processor   *
			*                          *
			*     Arithmetic logic     *
         *          unity           *
			*                          *
			*    github.com/t4rcisio   *
			****************************
			
			
-> O modulo realiza operacoes aritmeticas e logicas

-> ALU module does arithmetic and logical operations   

*/


module alu(clock, instruction, r_beq, reg_a, reg_b, solution, jump_data, out_signal, overflow_signal);

input clock;
input [2:0] instruction;
input [7:0] reg_a;
input [7:0] reg_b;
input [7:0] r_beq;


output out_signal;
output [7:0]jump_data;
output [7:0] solution;
output overflow_signal;


reg [15:0] internal_solution;
reg overflow;
reg signal;

// Jump operation
reg [7:0] reg_jump_data;
reg reg_jump;

initial overflow = 0;
initial signal = 0;


assign solution = internal_solution[7:0];
assign out_signal = signal;
assign jump_data = reg_jump_data;
assign overflow_signal = overflow;

always @(clock) begin 

	
	internal_solution = 8'b00000000;
	
	if(instruction == 3'b000) begin // ADD
		internal_solution = reg_a + reg_b;
		signal = !signal;
	end
	else
	if(instruction == 3'b001) begin // SUB
		internal_solution = reg_a - reg_b;
		signal = !signal;
	end
	else
	if(instruction == 3'b010) begin // MUL
		internal_solution = reg_a * reg_b;
		signal = !signal;
	end
	else
	if(instruction == 3'b110) begin // BEQ   
		if(reg_a == reg_b)                 //-> You can modify to [a less than b], [a greater than b]...
			internal_solution = 8'b00000001;
		else
			internal_solution = 8'b00000000;
			
		signal = !signal;
	end
	if(instruction == 3'b111) begin // BNZ
		if(r_beq == 8'b00000000)
			reg_jump_data = reg_a;
		else
		if(r_beq == 8'b00000001)
			reg_jump_data = reg_b;
		
		internal_solution = reg_a;
		signal = !signal;
	end
	if(internal_solution > 16'd255 || internal_solution < -16'd255) // Overflow detect
		overflow = 1;
	else
		overflow = 0;

end



endmodule