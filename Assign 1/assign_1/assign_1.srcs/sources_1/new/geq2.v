`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 16:14:29
// Design Name: 
// Module Name: geq2
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


module geq2(
    input wire [1:0] a,
    input wire [1:0] b,
    output wire agrthb
    );
    
    // signal declaration
   wire p0, p1, p2;

   // sum of two product terms
   assign agrb = p0 | p1 | p2;
   // product terms
   assign p0 = a[1] & ~b[1];
   assign p1 = a[0] & ~b[1] & ~b[0];
   assign p2 = a[1] & a[0] & ~b[0];
    
endmodule
