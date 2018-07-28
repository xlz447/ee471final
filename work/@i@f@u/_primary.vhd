library verilog;
use verilog.vl_types.all;
entity IFU is
    port(
        JumpAddr        : in     vl_logic_vector(29 downto 0);
        targetInst      : in     vl_logic_vector(25 downto 0);
        imm16           : in     vl_logic_vector(15 downto 0);
        Branch          : in     vl_logic;
        Jump            : in     vl_logic;
        JumpRs          : in     vl_logic;
        Zero            : in     vl_logic;
        rst             : in     vl_logic;
        clk             : in     vl_logic;
        Instructions    : out    vl_logic_vector(31 downto 0)
    );
end IFU;
