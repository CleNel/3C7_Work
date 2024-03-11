`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.02.2024 10:27:14
// Design Name: 
// Module Name: 6bit_ripple_adder
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


module six_bit_ripple_adder(
    input wire [5:0] x, 
    input wire [5:0] y, 
    input wire sel, 
    output wire overflow, 
    output wire c_out, 
    output wire [5:0] sum);
    
    wire c1, c2, c3, c4, c5, c6;
    wire x1, x2, x3, x4, x5, x6;
    
    xor b1(x1, y[0], sel);
    xor b2(x2, y[1], sel);
    xor b3(x3, y[2], sel);
    xor b4(x4, y[3], sel);
    xor b5(x5, y[4], sel);
    xor b6(x6, y[5], sel);
    
    FullAdder bit0 (x[0], x1, sel, c1, sum[0]); 
    FullAdder bit1 (x[1], x2, c1, c2, sum[1]); 
    FullAdder bit2 (x[2], x3, c2, c3, sum[2]); 
    FullAdder bit3 (x[3], x4, c3, c4, sum[3]); 
    FullAdder bit4 (x[4], x5, c4, c5, sum[4]); 
    FullAdder bit5 (x[5], x6, c5, c6, sum[5]);
    
    xor g0 (overflow, c5, c6); 
    assign c_out = c6;
    
    
endmodule
