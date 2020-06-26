library verilog;
use verilog.vl_types.all;
entity Lookahead_vlg_check_tst is
    port(
        cout            : in     vl_logic;
        s               : in     vl_logic_vector(31 downto 0);
        sampler_rx      : in     vl_logic
    );
end Lookahead_vlg_check_tst;
