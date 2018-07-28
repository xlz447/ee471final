library verilog;
use verilog.vl_types.all;
entity comparator6 is
    port(
        A               : in     vl_logic_vector(5 downto 0);
        B               : in     vl_logic_vector(5 downto 0);
        Y               : out    vl_logic
    );
end comparator6;
