library verilog;
use verilog.vl_types.all;
entity \register\ is
    port(
        D               : in     vl_logic;
        E               : in     vl_logic;
        reset           : in     vl_logic;
        clk             : in     vl_logic;
        Y               : out    vl_logic
    );
end \register\;
