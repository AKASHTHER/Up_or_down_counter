`timescale 1ns / 1ps
module up_or_down_counter
    #(parameter N=8)
    (
    input clk,reset,up_or_down,
    output reg [N-1:0] count
    );
    
initial
    count = 0;
always @(posedge clk)
    if (reset)
        count <= 0;
    else
        begin
                count <= (up_or_down) ? ((count == (2**N)-1) ? 0 : count + 1) : ((count == 0) ? (2**N)-1: count-1);  
        end
endmodule
// up_or_down = 1 --> up counter ; if count = 255 it should start from 0 otherwise simple increment
// up_or_down = 0 --> down counter ; if count = 0 its net state should be 255 and then 254 otherwise simple decrement     
