library verilog;
use verilog.vl_types.all;
entity mux4_1 is
    port(
        \out\           : out    vl_logic;
        \in\            : in     vl_logic_vector(3 downto 0);
        s               : in     vl_logic_vector(1 downto 0)
    );
end mux4_1;
