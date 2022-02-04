library verilog;
use verilog.vl_types.all;
entity mux_alpha is
    port(
        clock           : in     vl_logic;
        instruction     : in     vl_logic_vector(7 downto 0);
        operation       : out    vl_logic_vector(2 downto 0);
        reg_a           : out    vl_logic_vector(2 downto 0);
        reg_b           : out    vl_logic_vector(2 downto 0);
        data            : out    vl_logic_vector(7 downto 0);
        out_signal      : out    vl_logic
    );
end mux_alpha;
