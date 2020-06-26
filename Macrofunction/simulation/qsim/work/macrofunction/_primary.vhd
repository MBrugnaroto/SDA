library verilog;
use verilog.vl_types.all;
entity macrofunction is
    port(
        a               : in     vl_logic_vector(31 downto 0);
        b               : in     vl_logic_vector(31 downto 0);
        s               : out    vl_logic_vector(31 downto 0);
        clock           : in     vl_logic
    );
end macrofunction;
