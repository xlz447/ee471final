library verilog;
use verilog.vl_types.all;
entity ifu_tb is
    generic(
        ClockDelay      : integer := 20000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ClockDelay : constant is 1;
end ifu_tb;
