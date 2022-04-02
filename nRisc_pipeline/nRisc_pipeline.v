

/* 
			****************************
			*  8bits nRisc processor   *
			*         Pipeline         *
			*           Main           *
			*          module          *
			*                          *
			*    github.com/t4rcisio   *
			****************************
			

			
*/


module nRisc_pipeline(clock);

input clock;


//pc module
wire [7:0]pc;
wire jumped;


//momory instruction
wire [7:0] instruction;


// mux_alpha
wire [2:0] reg_a;
wire [1:0] reg_b;
wire [2:0] operation;
wire [7:0] immediate;

//signal extensor
wire [2:0]ex_op;
wire [2:0]ex_a;
wire [2:0]ex_b;
wire [7:0]ex_im;

// controler
wire [2:0]signal_control;
wire [2:0] index_alpha;
wire [2:0] index_beta;
wire [7:0] solution_c;
wire       jump;
wire [7:0] data_imm; 

//register_memory
wire [7:0] data_0;
wire [7:0] data_1;
wire [2:0] op_type;
wire [7:0] r_beq;

// alu
wire [7:0] alu_solution;
wire [7:0] jump_data;

//memory
wire [7:0] memory_solution;


//jump_control        JC_MODULE(clock, jump, jump_data, jc_signal, jc_data, jumped, stoped);
program_counter     PC_MODULE(clock, jump, jump_data, jumped, pc);
instructions_memory IM_MODULE(clock, jump, pc, instruction);
mux_alpha           MA_MODULE(clock, jump, instruction, operation, reg_a, reg_b, immediate);
signal_extensor     SE_MODULE(clock, operation, reg_a, reg_b, immediate, ex_op, ex_a, ex_b, ex_im);
controler           CT_MODULE(clock, ex_op, ex_a, ex_b, ex_im, index_alpha, index_beta, solution_c, signal_control, jump, jumped);
register_memory     RM_MODULE(clock, memory_solution, alu_solution, signal_control, index_alpha, index_beta, solution_c ,op_type, data_0, data_1, r_beq);
alu                 AU_MODULE(clock, op_type, data_0, data_1, r_beq, jump_data, alu_solution);
memory              ME_MODULE(clock, op_type, data_0, data_1, memory_solution);


endmodule