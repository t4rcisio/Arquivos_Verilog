library verilog;
use verilog.vl_types.all;
entity controler is
    port(
        clock           : in     vl_logic;
        instruction     : in     vl_logic_vector(2 downto 0);
        reg_alpha       : in     vl_logic_vector(2 downto 0);
        reg_beta        : in     vl_logic_vector(2 downto 0);
        data            : in     vl_logic_vector(7 downto 0);
        index_a         : out    vl_logic_vector(2 downto 0);
        index_b         : out    vl_logic_vector(2 downto 0);
        op              : out    vl_logic_vector(2 downto 0);
        data_out        : out    vl_logic_vector(7 downto 0);
        jump            : out    vl_logic;
        out_signal      : out    vl_logic
    );
end controler;
