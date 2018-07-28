library verilog;
use verilog.vl_types.all;
entity RegFile is
    port(
        ReadRegister1   : in     vl_logic_vector(0 to 4);
        ReadRegister2   : in     vl_logic_vector(0 to 4);
        WriteRegister   : in     vl_logic_vector(0 to 4);
        WriteData       : in     vl_logic_vector(0 to 31);
        RegWrite        : in     vl_logic;
        ReadData1       : out    vl_logic_vector(0 to 31);
        ReadData2       : out    vl_logic_vector(0 to 31);
        clk             : in     vl_logic
    );
end RegFile;
