library verilog;
use verilog.vl_types.all;
entity zero is
    port(
        A               : in     vl_logic_vector(0 to 31);
        Z               : out    vl_logic
    );
end zero;
