library verilog;
use verilog.vl_types.all;
entity adder30 is
    port(
        BF              : in     vl_logic;
        A               : in     vl_logic_vector(29 downto 0);
        B               : in     vl_logic_vector(29 downto 0);
        Y               : out    vl_logic_vector(29 downto 0)
    );
end adder30;
