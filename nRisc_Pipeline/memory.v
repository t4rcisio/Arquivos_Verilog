/* 
			****************************
			*  8bits nRisc processor   *
			*         Pipeline         *
			*          Memory          *
			*                          *
			*    github.com/t4rcisio   *
			****************************
*/




module memory(clock, instruction, index_a, index_b, solution);

input clock;
input [2:0]instruction;
input [7:0] index_a;
input [7:0] index_b;

reg [7:0]memoryData[255:0];

output reg [7:0] solution;

always @( posedge clock ) begin

	if(instruction == 3'b100) begin
		memoryData[index_b] = index_a;
	end
	else
	if(instruction == 3'b101) begin
		solution = memoryData[index_b];
	end
	else
		solution = 8'b00000000;

end


endmodule