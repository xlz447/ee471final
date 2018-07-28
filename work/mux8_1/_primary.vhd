library verilog;
use verilog.vl_types.all;
entity mux8_1 is
    port(
        \out\           : out    vl_logic;
        \in\            : in     vl_logic_vector(7 downto 0);
        s               : in     vl_logic_vector(2 downto 0)
    );
end mux8_1;
