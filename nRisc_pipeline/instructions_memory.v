
/* 
			****************************
			*  8bits nRisc processor   *
			*         Pipeline         *
			*       Instruction        *
			*          Memory          *
			*                          *
			*    github.com/t4rcisio   *
			****************************
		
-> Memoria que alimenta o circuito com as instrucoes a serem executadas


-> Instructions Memory module provide all instructions be executed by processor 
			
*/

module instructions_memory(clock, jump, pc, instruction);

input [7:0] pc;
input clock;
input jump;

output reg [7:0] instruction;

reg [7:0] memory [255:0];

initial begin
	// Load instructions here 
	//memory[0] = 8'bb10011100
	//memory[1] = 8'bb10111100
	//...
	// Program test: fat(5)
	memory[00] = 8'b01111100;
	memory[01] = 8'b00000101;
	memory[02] = 8'b01101000;
	memory[03] = 8'b00000001;
	memory[04] = 8'b01110000;
	memory[05] = 8'b00000101;
	memory[06] = 8'b01101100;
	memory[07] = 8'b00000001;
	memory[08] = 8'b01111000;
	memory[09] = 8'b00001100;
	memory[10] = 8'b01100000;
	memory[11] = 8'b00010000;
	memory[12] = 8'b01011110;
	memory[13] = 8'b00001011;
	memory[14] = 8'b11010010;
	memory[15] = 8'b11111000;
	memory[16] = 8'b01100000;
	memory[17] = 8'b00000000;
	memory[18] = 8'b10011100;
	
end



always @(negedge clock) begin
	
	if(jump == 0)
		instruction = memory[pc];
	else
		instruction = 8'b1xxxxxxx;

end


endmodule