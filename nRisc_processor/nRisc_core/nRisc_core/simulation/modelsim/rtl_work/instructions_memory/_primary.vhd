library verilog;
use verilog.vl_types.all;
entity instructions_memory is
    port(
        clock           : in     vl_logic;
        pc              : in     vl_logic_vector(7 downto 0);
        instruction     : out    vl_logic_vector(7 downto 0);
        out_signal      : out    vl_logic
    );
end instructions_memory;
