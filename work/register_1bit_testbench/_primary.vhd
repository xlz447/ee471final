library verilog;
use verilog.vl_types.all;
entity register_1bit_testbench is
    generic(
        period          : integer := 100
    );
    attribute mti_svvh_generic_type : integer;
    attribute mti_svvh_generic_type of period : constant is 1;
end register_1bit_testbench;
