`timescale 1ns/1ps
module testbench;
 localparam PERIOD = 2;
 parameter add_size = 11;
 parameter data_size = 32;

 reg clk = 0;
 reg rst;
 
//write interface on port 1
 reg write_en;
 reg [add_size-1:0] write_address;
 reg [data_size-1:0] data_in;

//read interface on port 2
 reg read_en;
 reg [add_size-1:0] read_address;
 wire [data_size-1:0] data_out;


 ram DUT (
	.clk(clk),
	.rst(rst),
	.write_en(write_en),
	.write_address(write_address),
	.data_in(data_in),
	.read_en(read_en),
	.read_address(read_address),
        .data_out(data_out)
  );

always #(PERIOD/2) clk = ~clk;

initial begin
 #2 rst = 1;
 #2 rst = 0;

 #4 write_en = 1;
 #4 data_in = 244;
 #4  write_address = 11'b1010;

 #4 write_en = 0;

 #12 read_en = 1;
 #12 read_address = 11'b1010;

 #14 read_en = 0;
end 

initial begin
$monitor($time,"write_en=%0d ---- read_en=%0d ---- data_in=%0d ---- data_out=%0d", write_en, read_en, data_in, data_out);
#300 $finish;
end

endmodule
