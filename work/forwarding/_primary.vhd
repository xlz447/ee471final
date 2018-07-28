library verilog;
use verilog.vl_types.all;
entity forwarding is
    port(
        DataA           : in     vl_logic_vector(31 downto 0);
        DataB           : in     vl_logic_vector(31 downto 0);
        ALUOut          : in     vl_logic_vector(31 downto 0);
        dataWrite       : in     vl_logic_vector(31 downto 0);
        Rs              : in     vl_logic_vector(4 downto 0);
        Rt              : in     vl_logic_vector(4 downto 0);
        Dst1cc          : in     vl_logic_vector(4 downto 0);
        Dst2cc          : in     vl_logic_vector(4 downto 0);
        noRs            : in     vl_logic;
        noRt            : in     vl_logic;
        fwdedDataA      : out    vl_logic_vector(31 downto 0);
        fwdedDataB      : out    vl_logic_vector(31 downto 0)
    );
end forwarding;
