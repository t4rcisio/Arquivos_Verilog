



module jump_control(clock, jump, jump_data, jump_signal, data_jump, jumped, stoped);

input clock;
input jump;
input [7:0]jump_data;

output reg jump_signal;
output reg [7:0]data_jump;
output reg jumped;
output reg stoped;

initial jump_signal = 0;
initial jumped = 0;
initial data_jump = 8'b1xxxxxxx;
initial stoped = 0;

always @(negedge clock) begin

	if(jump == 1)
		stoped = 1;
	if(jump == 1 && jump_data >=0) begin
		jump_signal = 1;
		data_jump = jump_data;
		jumped = 1;
		stoped = 0;
	end 
	else begin
		jump_signal = 0;
		data_jump = 8'b1xxxxxxx;
		jumped = 0;
		stoped = 0;
	end


end




endmodule