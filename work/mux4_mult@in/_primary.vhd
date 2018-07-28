library verilog;
use verilog.vl_types.all;
entity mux4_multIn is
    port(
        S               : in     vl_logic_vector(1 downto 0);
        A               : in     vl_logic;
        B               : in     vl_logic;
        C               : in     vl_logic;
        D               : in     vl_logic;
        Y               : out    vl_logic
    );
end mux4_multIn;
