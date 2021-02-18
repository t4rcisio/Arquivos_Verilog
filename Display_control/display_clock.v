


module display_clock(CLOCK_50MHZ, NEW_CLOCK);

input CLOCK_50MHZ;
output NEW_CLOCK;

reg [32:0] COUNTER;
reg WAVE;
reg [32:0] MAX_COUNTER;


initial COUNTER = 0;
initial WAVE = 0;
initial MAX_COUNTER = 32'h2FAF080;

/*
SET MAX_COUNTER TO CHANGE OUTPUT CLOCK 

32'h2FAF080 - TO 01HZ CLOCK
32'h989680  - TO 05HZ CLOCK
32'h4C4B40  - TO 10HZ CLOCK

*/

assign NEW_CLOCK = WAVE;


always @(negedge CLOCK_50MHZ)
	begin
		
		if(COUNTER == MAX_COUNTER)
			begin
				COUNTER = 0;
				WAVE = !WAVE;
			end
		else
			begin
				COUNTER = COUNTER+1;
			end
		
	end
endmodule	