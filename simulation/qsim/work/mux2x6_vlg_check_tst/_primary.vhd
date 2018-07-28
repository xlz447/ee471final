library verilog;
use verilog.vl_types.all;
entity mux2x6_vlg_check_tst is
    port(
        Y               : in     vl_logic_vector(5 downto 0);
        sampler_rx      : in     vl_logic
    );
end mux2x6_vlg_check_tst;
