
/*

@t4rcisio
2021
BR

*/

module clock_divider(CLOCK_50MHZ, NEW_CLOCK);

input CLOCK_50MHZ;
output NEW_CLOCK;

reg [32:0] COUNTER;
reg WAVE;
reg [32:0] MAX_COUNTER;


initial COUNTER = 0;
initial WAVE = 0;
initial MAX_COUNTER = 32'h196E6A;

/*
SET MAX_COUNTER TO CHANGE OUTPUT CLOCK 

32'h2FAF080 - TO 01HZ  CLOCK
32'h989680  - TO 05HZ  CLOCK
32'h4C4B40  - TO 10HZ  CLOCK
32'h2625A0  - TO 20HZ  CLOCK
32'h196E6A  - TO 30HZ  CLOCK
32'hCB735   - TO 60HZ  CLOCK
32'h7A120   - TO 100HZ CLOCK
32'C350     - TO 50KHZ CLOCK 
.
.
.
MAKE YOURSELF...

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