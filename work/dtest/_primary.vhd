library verilog;
use verilog.vl_types.all;
entity dtest is
    generic(
        ClockDelay      : integer := 5000
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of ClockDelay : constant is 1;
end dtest;
