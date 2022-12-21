`timescale 1ns / 1ps
module up_or_down_counter_tb();
parameter N=16;
reg clk,reset,up_or_down;
wire [N-1:0] count;

up_or_down_counter #(.N(N))mut (clk,reset,up_or_down,count);

initial clk = 0;

always #10 clk = ~clk;

initial
    begin
        reset = 0;
        up_or_down = 0;
        #300;
        up_or_down = 1;
        #300;
        reset = 1;
        up_or_down = 0;
        #100;
        reset = 0;  
    end
    
always @(*)
begin
    $monitor("time=%d,reset=%d,up_or_down=%d,count=%d",$time,reset,up_or_down,count);
end    
endmodule
