library verilog;
use verilog.vl_types.all;
entity comparator32_vlg_sample_tst is
    port(
        D1              : in     vl_logic_vector(31 downto 0);
        D2              : in     vl_logic_vector(31 downto 0);
        sampler_tx      : out    vl_logic
    );
end comparator32_vlg_sample_tst;
