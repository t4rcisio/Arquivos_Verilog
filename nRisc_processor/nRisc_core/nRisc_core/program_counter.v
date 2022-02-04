
/* 
			****************************
			*  8bits nRisc processor   *
			*                          *
			*     Program counter		*    
			*                          *
			*    github.com/t4rcisio   *
			****************************

-> Program counter fornece ao circuito valores sequeciais que servem como indice de busca na memoria de istrucoes,
naturalmente de forma sequecial, mas tambem e' possivel modificar o valor atraves da operacao de jump 
			
-> Program counter is a module to provide values to get instructions sequentially on memory instructions module,
however, you can jump to specific instruction using a jump operation.
			
*/


module program_counter(clock, jump_data, jump, pc, out_signal, jumped);

input clock;
input jump;
input [7:0] jump_data;

output [7:0] pc;
output out_signal;
output jumped;

reg [7:0] counter; // Store couter value

reg starter;
reg signal;


initial starter = 0;
initial signal = 0;

assign pc = counter;
assign out_signal = signal;

always @(negedge clock) begin
	
	if(starter == 0) begin    // Ensures pc start equal zero
		counter = 8'b00000000;
		signal = !signal;
		starter = !starter;   // Signal to notify next module
	end
	else
	if(jump == 1)begin       // Jump operation
		counter = jump_data;
		signal = !signal;
	end
	else begin
		counter = counter + 1; // Normal counter
		signal = !signal;
	end

end



endmodule