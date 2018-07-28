library verilog;
use verilog.vl_types.all;
entity PC is
    port(
        newPC           : out    vl_logic_vector(29 downto 0);
        oldPC           : in     vl_logic_vector(29 downto 0);
        rst             : in     vl_logic;
        clk             : in     vl_logic
    );
end PC;
