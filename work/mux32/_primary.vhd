library verilog;
use verilog.vl_types.all;
entity mux32 is
    port(
        d               : in     vl_logic_vector(0 to 31);
        L               : in     vl_logic_vector(0 to 4);
        Y               : out    vl_logic
    );
end mux32;
