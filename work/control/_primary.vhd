library verilog;
use verilog.vl_types.all;
entity control is
    port(
        Instructions    : in     vl_logic_vector(31 downto 0);
        RegDst          : out    vl_logic;
        ALUSrc          : out    vl_logic;
        MemToReg        : out    vl_logic;
        RegWr           : out    vl_logic;
        MemWr           : out    vl_logic;
        Jump            : out    vl_logic;
        JumpRs          : out    vl_logic;
        ALUcntrl        : out    vl_logic_vector(1 downto 0);
        Rs              : out    vl_logic_vector(4 downto 0);
        Rt              : out    vl_logic_vector(4 downto 0);
        Rd              : out    vl_logic_vector(4 downto 0);
        imm16           : out    vl_logic_vector(15 downto 0);
        targetInst      : out    vl_logic_vector(25 downto 0);
        noRs            : out    vl_logic;
        noRt            : out    vl_logic
    );
end control;
