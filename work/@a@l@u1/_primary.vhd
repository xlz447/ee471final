library verilog;
use verilog.vl_types.all;
entity ALU1 is
    port(
        S               : in     vl_logic_vector(1 downto 0);
        A               : in     vl_logic;
        B               : in     vl_logic;
        Ci              : in     vl_logic;
        Co              : out    vl_logic;
        Y               : out    vl_logic
    );
end ALU1;
