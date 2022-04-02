
/* 
			****************************
			*  8bits nRisc processor   *
			*         Pipeline         *
			*         Controler        *
			*                          *
			*    github.com/t4rcisio   *
			****************************
*/





module controler(clock, operation, reg_a, reg_b, data, index_alpha, index_beta, solution_c, signal_control, jump, jumped);

input clock;
input [2:0] operation;
input [2:0] reg_a;
input [2:0] reg_b;
input [7:0] data;
input jumped;

output reg [2:0]signal_control;
output reg [2:0] index_alpha;
output reg [2:0] index_beta;
output reg [7:0] solution_c;

output reg jump;
reg [2:0] op_control;
reg [2:0] index_a;
reg [2:0] index_b;
reg [7:0] immediate;
reg [7:0] control_debug;
reg pipeline;
reg li_await;
reg data_await;

initial li_await = 0;
initial data_await = 0;
initial jump = 0;
initial pipeline = 0;

always @(negedge clock) begin
	
	if(data_await == 1 && li_await == 0) begin
		signal_control = op_control;
		index_alpha = index_a;
		solution_c = immediate;
		data_await = 0;
	end
	if(operation == 3'b011 && li_await == 0 && data_await == 0 && jump == 0) begin
		op_control = operation;
		index_a = reg_a;
		li_await = 1;
	end
	else
	if(li_await == 1 && data_await == 0) begin
		immediate = data;
		data_await = 1;
		li_await = 0;
	end
	else begin
		if(pipeline == 1) begin
			signal_control = op_control;
			index_alpha    =  index_a;
			index_beta     = index_b;
			pipeline       = 0;
			solution_c     = immediate;
			li_await = 0;
		end
		if(pipeline == 0 && jump == 0 && li_await == 0) begin
			control_debug = data;
			op_control     = operation;
			index_a        = reg_a;
			index_b        = reg_b;
			immediate      = data;
			if(operation == 3'b111)
				jump = 1;
			else
				jump = 0;
				
			pipeline       = 1;
		end
	end
	if(jumped == 1) begin 
		jump = 0;
	end

end



endmodule