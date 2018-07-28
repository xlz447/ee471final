library verilog;
use verilog.vl_types.all;
entity ALU32 is
    port(
        S               : in     vl_logic_vector(1 downto 0);
        A               : in     vl_logic_vector(31 downto 0);
        B               : in     vl_logic_vector(31 downto 0);
        Z               : out    vl_logic;
        NG              : out    vl_logic;
        \OF\            : out    vl_logic;
        C               : out    vl_logic;
        Y               : out    vl_logic_vector(31 downto 0)
    );
end ALU32;
