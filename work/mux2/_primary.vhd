library verilog;
use verilog.vl_types.all;
entity mux2 is
    port(
        S               : in     vl_logic;
        d0              : in     vl_logic;
        d1              : in     vl_logic;
        Y               : out    vl_logic
    );
end mux2;
