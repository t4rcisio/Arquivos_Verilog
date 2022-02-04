
/* 
			****************************
			*  8bits nRisc processor   *
			*                          *
			*          Memory          *
			*                          *
			*    github.com/t4rcisio   *
			****************************
			
-> O modulo Memory tem funcionamento semelhante a um SSD em um sistema, no qual tem uma capacidade maior 
armazenamento, mas o custo de leitura e consideravelmente alto.

-> Memory work as SSD on circuit, large capacity to store data, but it's slow to read and send data to registers.  
			
*/




module memory(clock, instruction, reg_alpha, reg_beta, data_out, out_signal);

input clock;
input [2:0] instruction;
input [7:0] reg_alpha;
input [7:0] reg_beta;

output [7:0]data_out;
output out_signal;

reg [7:0] memory [255:0];
reg [7:0]solution;
reg signal;


initial signal = 0;

assign data_out = solution;
assign out_signal = signal;

always @(clock) begin
	
	solution = 8'b00000000;
	
	if(instruction == 3'b100 ) begin // store word
		memory[reg_beta] = reg_alpha;
		signal = !signal;
	end
	else
	if(instruction == 3'b101)begin // load word
		solution = memory[reg_beta];
		signal = !signal;
	end

end


endmodule