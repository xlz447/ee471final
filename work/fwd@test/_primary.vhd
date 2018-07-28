library verilog;
use verilog.vl_types.all;
entity fwdTest is
    port(
        regIn           : in     vl_logic_vector(4 downto 0);
        old1cc          : in     vl_logic_vector(4 downto 0);
        old2cc          : in     vl_logic_vector(4 downto 0);
        muxCtrl         : out    vl_logic_vector(1 downto 0)
    );
end fwdTest;
