library verilog;
use verilog.vl_types.all;
entity DFF5 is
    port(
        Din             : in     vl_logic_vector(4 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Dout            : out    vl_logic_vector(4 downto 0)
    );
end DFF5;
