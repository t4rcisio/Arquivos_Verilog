

/* 
			****************************
			*  8bits nRisc processor   *
			*                          *
			*       Main module        *
			*                          *
			*    github.com/t4rcisio   *
			****************************
*/


module nRisc_core(clock);

input clock;

// PROGRAM COUNTER OUTPUT
wire [7:0]pc;
wire [7:0]pc_signal;


// INSTRUCTIONS MEMORY OUTPUT
wire [7:0]instruction;
wire im_signal;

// MUX ALPHA OUTPUT
wire [2:0] operation;
wire [2:0] reg_a;
wire [2:0] reg_b;
wire [7:0] data;
wire mx_signal;


// CONTROLER OUTPUT
wire [2:0] index_a;
wire [2:0] index_b;
wire [2:0] op_type;
wire [7:0] imediate;
wire ct_signal;
wire jump;

// MEMORY REGISTER OUTPUT
wire [2:0] sol_type;
wire [7:0] data_alpha;
wire [7:0] data_beta;
wire [7:0] reg_beq;
wire rt_signal;


// ALU OUTPUT
wire [7:0] solution;
wire [7:0]jump_data;
wire al_signal;
wire overflow_signal;

// MEMORY OUTPUT  
wire [7:0] disk_data;
wire me_signal;

program_counter       PC_MODULE(clock, jump_data, jump, pc, pc_signal);
instructions_memory   IM_MODULE(pc_signal, pc, instruction, im_signal);
mux_alpha             MX_MODULE(im_signal, instruction, operation, reg_a, reg_b, data, mx_signal);
controler             CT_MODULE(mx_signal, operation, reg_a, reg_b, data, index_a, index_b, op_type, imediate, jump, ct_signal);
registers             RT_MODULE(ct_signal, me_signal, al_signal, op_type, index_a, index_b, solution, disk_data , imediate, sol_type, reg_beq, data_alpha, data_beta, rt_signal);
alu                   AL_MODULE(rt_signal, sol_type, reg_beq, data_alpha, data_beta, solution, jump_data, al_signal, overflow_signal);
memory                ME_MODULE(rt_signal, sol_type, data_alpha, data_beta, disk_data, me_signal);



endmodule