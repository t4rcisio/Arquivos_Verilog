

/* 
			****************************
			*  8bits nRisc processor   *
			*                          *
			*           MUX            *
			*                          *
			*    github.com/t4rcisio   *
			****************************
			
-> o Modulo mux recebe a word da memoria de instrucoes e a divide conforme a estrutura da instrucao do projeto

-> Mux module receive instruction from instruction memory module, split it according struture project instruction   
*/

module mux_alpha(clock, instruction, operation, reg_a, reg_b, data, out_signal);

input [7:0] instruction;
input clock;

output [2:0] operation;
output [2:0] reg_a;
output [2:0] reg_b;
output [7:0] data;
output out_signal;

reg [2:0] reg_alpha;
reg [2:0] reg_beta;
reg [2:0] reg_operation;
reg [7:0] reg_data;
reg signal;


initial signal = 0;

assign reg_a      = reg_alpha;
assign reg_b      = reg_beta;
assign operation  = reg_operation;
assign data       = reg_data;
assign out_signal = signal;



always @(clock) begin
															
	reg_operation = instruction[7:5];           // Opereation type
	reg_alpha     = instruction[4:2];           // first register
	reg_beta      = 3'b000 | instruction[1:0];  // second register with signal extensor
	reg_data      = instruction;                // full instruction -> Imediate to li instruction
	signal        = !signal;                    // Signal to notify next module

end



endmodule