library verilog;
use verilog.vl_types.all;
entity mux2x6 is
    port(
        A               : in     vl_logic_vector(5 downto 0);
        B               : in     vl_logic_vector(5 downto 0);
        S               : in     vl_logic;
        Y               : out    vl_logic_vector(5 downto 0)
    );
end mux2x6;
