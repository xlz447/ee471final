library verilog;
use verilog.vl_types.all;
entity register_32_32bit is
    port(
        \out\           : out    vl_logic;
        newdata         : in     vl_logic_vector(31 downto 0);
        en              : in     vl_logic_vector(31 downto 0);
        clk             : in     vl_logic
    );
end register_32_32bit;
