module ram
#
(
 parameter add_size = 11,
 parameter data_size = 32
)
(
 input clk,
 input rst,

 // write interface on port 1
 input write_en,
 input [add_size-1:0]write_address,
 input [data_size-1:0]data_in,

 // read interface on port 2
 input read_en,
 input [add_size-1:0]read_address,
 output reg [data_size-1:0] data_out
);

//memomery declaration
reg [data_size-1:0] ram[0:4095];

always@(posedge clk)
begin
 if(rst)
  ram[write_address]<= 'bz;
 else
   begin
    if(write_en)
     ram[write_address]<= data_in;
    if(read_en)
     data_out<=ram[read_address];
   end
end
endmodule
