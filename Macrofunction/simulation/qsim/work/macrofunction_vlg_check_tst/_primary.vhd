library verilog;
use verilog.vl_types.all;
entity macrofunction_vlg_check_tst is
    port(
        s               : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end macrofunction_vlg_check_tst;
