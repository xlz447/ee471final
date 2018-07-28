library verilog;
use verilog.vl_types.all;
entity mux8 is
    port(
        d               : in     vl_logic_vector(0 to 7);
        L               : in     vl_logic_vector(0 to 2);
        Y               : out    vl_logic
    );
end mux8;
