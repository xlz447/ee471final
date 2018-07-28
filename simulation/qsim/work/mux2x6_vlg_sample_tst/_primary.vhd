library verilog;
use verilog.vl_types.all;
entity mux2x6_vlg_sample_tst is
    port(
        A               : in     vl_logic_vector(5 downto 0);
        B               : in     vl_logic_vector(5 downto 0);
        S               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mux2x6_vlg_sample_tst;
