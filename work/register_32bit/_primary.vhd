library verilog;
use verilog.vl_types.all;
entity register_32bit is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        newdata         : in     vl_logic_vector(31 downto 0);
        en              : in     vl_logic;
        clk             : in     vl_logic
    );
end register_32bit;
