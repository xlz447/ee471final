library verilog;
use verilog.vl_types.all;
entity cpu_tb is
    generic(
        ClockDelay      : integer := 1000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ClockDelay : constant is 1;
end cpu_tb;
