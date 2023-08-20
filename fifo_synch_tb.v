`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 20.08.2023 17:02:52
// Design Name: 
// Module Name: fifo_synch_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fifo_synch_tb();
 reg rst,clk,wr_en,rd_en;
 reg[7:0]buf_in;
 wire[7:0] buf_out;
 wire buf_empty,buf_full;
 wire[7:0]fifo_counter;
 fifo_synch dut(.clk(clk),.rst(rst),.wr_en(wr_en),.rd_en(rd_en),.buf_in(buf_in),.buf_out(buf_out),.buf_empty(buf_empty),.buf_full(buf_full),.fifo_counter(fifo_counter));

// clock generation
 initial
  begin
   clk=1'b0;
   repeat(100)
    #5 clk=~clk;
  end
 initial
  begin
//   $monitor($time,"clk=%b rst=%b wr_en=%b rd_en=%b buf_empty=%b buf_full=%b 
   rst=1;
   #8 rst=0;
   #13 wr_en=1;buf_in=8'h3a;
   #10 buf_in=8'h2a;
   #10 buf_in=8'h48;
   #10 wr_en=0;
   #10 rd_en=1;
   #20 $finish;
   
  end
endmodule
