`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 16:43:00
// Design Name: 
// Module Name: XOR
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


module XOR(
    input wire [5:0] a,
    input wire [5:0] b,
    input wire [5:0] out
    );
    
     // bitwise xor of 6-bit inputs using 1-bit xor modules
    XOR_1 xor_bit0 (.i0(a[0]), .i1(b[0]), .out(out[0])); 
    XOR_1 xor_bit1 (.i0(a[1]), .i1(b[1]), .out(out[1])); 
    XOR_1 xor_bit2 (.i0(a[2]), .i1(b[2]), .out(out[2])); 
    XOR_1 xor_bit3 (.i0(a[3]), .i1(b[3]), .out(out[3])); 
    XOR_1 xor_bit4 (.i0(a[4]), .i1(b[4]), .out(out[4])); 
    XOR_1 xor_bit5 (.i0(a[5]), .i1(b[5]), .out(out[5])); 
    
endmodule
