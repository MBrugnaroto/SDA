library verilog;
use verilog.vl_types.all;
entity macrofunction_vlg_sample_tst is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        clock           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end macrofunction_vlg_sample_tst;
