library verilog;
use verilog.vl_types.all;
entity register_1bit is
    port(
        \out\           : out    vl_logic;
        newdata         : in     vl_logic;
        en              : in     vl_logic;
        clk             : in     vl_logic
    );
end register_1bit;
