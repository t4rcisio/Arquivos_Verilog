module clock_manager(clock, clock_00, clock_01, clock_02, clock_03);

input clock;

output clock_00;
output clock_01;
output clock_02;
output clock_03;

reg [2:0]counter_00;
reg [2:0]counter_01;
reg [2:0]counter_02;
reg [2:0]counter_03;

initial begin
	
counter_00 = 0;
counter_01 = 0;
counter_02 = 0;
counter_03 = 0;
end


always @(negedge clock) begin



end
	
	



endmodule