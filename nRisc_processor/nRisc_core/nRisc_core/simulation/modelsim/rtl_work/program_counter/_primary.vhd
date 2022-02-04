library verilog;
use verilog.vl_types.all;
entity program_counter is
    port(
        clock           : in     vl_logic;
        jump_data       : in     vl_logic_vector(7 downto 0);
        jump            : in     vl_logic;
        pc              : out    vl_logic_vector(7 downto 0);
        out_signal      : out    vl_logic;
        jumped          : out    vl_logic
    );
end program_counter;
