`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 16:43:00
// Design Name: 
// Module Name: XOR_1
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


module XOR_1(
    input wire i0,
    input wire i1,
    output wire out
    );
    
    // bitwise xor of two input bits
    assign out = i0 ^ i1;
    
endmodule
