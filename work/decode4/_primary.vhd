library verilog;
use verilog.vl_types.all;
entity decode4 is
    port(
        L               : in     vl_logic_vector(0 to 1);
        E               : in     vl_logic;
        Y               : out    vl_logic_vector(0 to 3)
    );
end decode4;
