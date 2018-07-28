library verilog;
use verilog.vl_types.all;
entity DFF2 is
    port(
        Din             : in     vl_logic_vector(1 downto 0);
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        Dout            : out    vl_logic_vector(1 downto 0)
    );
end DFF2;
