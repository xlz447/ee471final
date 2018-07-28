library verilog;
use verilog.vl_types.all;
entity register32x32 is
    port(
        D               : in     vl_logic_vector(0 to 31);
        E               : in     vl_logic_vector(0 to 31);
        clk             : in     vl_logic;
        Y               : out    vl_logic_vector(0 to 31)
    );
end register32x32;
