library verilog;
use verilog.vl_types.all;
entity mux4 is
    port(
        d               : in     vl_logic_vector(0 to 3);
        L               : in     vl_logic_vector(0 to 1);
        Y               : out    vl_logic
    );
end mux4;
