library verilog;
use verilog.vl_types.all;
entity addsub1 is
    port(
        A               : in     vl_logic;
        B               : in     vl_logic;
        Ci              : in     vl_logic;
        Co              : out    vl_logic;
        Y               : out    vl_logic
    );
end addsub1;
