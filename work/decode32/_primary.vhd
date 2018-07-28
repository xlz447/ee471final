library verilog;
use verilog.vl_types.all;
entity decode32 is
    port(
        L               : in     vl_logic_vector(0 to 4);
        E               : in     vl_logic;
        Y               : out    vl_logic_vector(0 to 31)
    );
end decode32;
