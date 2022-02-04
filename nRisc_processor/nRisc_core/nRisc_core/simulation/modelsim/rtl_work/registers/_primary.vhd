library verilog;
use verilog.vl_types.all;
entity registers is
    port(
        clock_read      : in     vl_logic;
        clock_mem       : in     vl_logic;
        clock_alu       : in     vl_logic;
        instruction     : in     vl_logic_vector(2 downto 0);
        reg_alpha       : in     vl_logic_vector(2 downto 0);
        reg_beta        : in     vl_logic_vector(2 downto 0);
        solution_alu    : in     vl_logic_vector(7 downto 0);
        memory_data     : in     vl_logic_vector(7 downto 0);
        imediate        : in     vl_logic_vector(7 downto 0);
        op_type         : out    vl_logic_vector(2 downto 0);
        reg_beq         : out    vl_logic_vector(7 downto 0);
        data_alpha      : out    vl_logic_vector(7 downto 0);
        data_beta       : out    vl_logic_vector(7 downto 0);
        out_signal      : out    vl_logic
    );
end registers;
