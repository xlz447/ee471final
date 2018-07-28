library verilog;
use verilog.vl_types.all;
entity SignExtend30 is
    port(
        imm16           : in     vl_logic_vector(15 downto 0);
        SEimm16         : out    vl_logic_vector(29 downto 0)
    );
end SignExtend30;
