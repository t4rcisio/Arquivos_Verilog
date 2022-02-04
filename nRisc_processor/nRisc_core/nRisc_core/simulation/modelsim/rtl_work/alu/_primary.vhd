library verilog;
use verilog.vl_types.all;
entity alu is
    port(
        clock           : in     vl_logic;
        instruction     : in     vl_logic_vector(2 downto 0);
        r_beq           : in     vl_logic_vector(7 downto 0);
        reg_a           : in     vl_logic_vector(7 downto 0);
        reg_b           : in     vl_logic_vector(7 downto 0);
        solution        : out    vl_logic_vector(7 downto 0);
        jump_data       : out    vl_logic_vector(7 downto 0);
        out_signal      : out    vl_logic;
        overflow_signal : out    vl_logic
    );
end alu;
