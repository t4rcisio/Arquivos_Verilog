
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


module program_counter(clock, jump, jump_data, jumped, pc);

input clock;
input jump;
input [7:0] jump_data;

output reg [7:0] pc;
output reg jumped;

reg starter;

initial jumped = 0;
initial starter = 0;

always @(negedge clock) begin
	
	if(starter == 0) begin    // Ensures pc start equal zero
		pc = 8'b00000000;
		starter = !starter;
	end
	else
	if(jump == 1)begin       // Jump operation
		if(jump_data >=0) begin
			pc = jump_data;
			jumped = 1;
		end
	end
	else begin
		pc = pc + 1; 			 // Normal counter
		jumped = 0;
	end

end



endmodule