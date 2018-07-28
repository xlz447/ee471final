library verilog;
use verilog.vl_types.all;
entity mux32x32_32 is
    port(
        \out\           : out    vl_logic_vector(31 downto 0);
        \in\            : in     vl_logic;
        s               : in     vl_logic_vector(4 downto 0)
    );
end mux32x32_32;
