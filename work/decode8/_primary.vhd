library verilog;
use verilog.vl_types.all;
entity decode8 is
    port(
        L               : in     vl_logic_vector(0 to 2);
        E               : in     vl_logic;
        Y               : out    vl_logic_vector(0 to 7)
    );
end decode8;
