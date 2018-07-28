library verilog;
use verilog.vl_types.all;
entity decoder5_32 is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        \in\            : in     vl_logic_vector(4 downto 0);
        en              : in     vl_logic
    );
end decoder5_32;
