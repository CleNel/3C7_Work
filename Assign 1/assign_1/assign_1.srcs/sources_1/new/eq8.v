`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 16:03:27
// Design Name: 
// Module Name: eq8
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


module eq8(
    input wire [7:0] a,
    input wire [7:0] b,
    output wire greq
    );
    
    wire e0, e1, e2, e3, g0, g1, g2, g3;
         
   // body
   //2-bit equal to blocks
   eq2 eq_bit0_unit (.a(a[1:0]), .b(b[1:0]), .aeqb(e0));
   eq2 eq_bit1_unit (.aeqb(e1), .a(a[3:2]), .b(b[3:2]));
   eq2 eq_bit2_unit (.aeqb(e2), .a(a[5:4]), .b(b[5:4])); 
   eq2 eq_bit3_unit (.aeqb(e3), .a(a[7:6]), .b(b[7:6]));
   //2-bit greater than blocks
   geq2 gr_bit0_unit (.a(a[1:0]), .b(b[1:0]), .agrthb(g0));
   geq2 gr_bit1_unit (.agrthb(g1), .a(a[3:2]), .b(b[3:2])); 
   geq2 gr_bit2_unit (.agrthb(g2), .a(a[5:4]), .b(b[5:4])); 
   geq2 gr_bit3_unit (.agrthb(g3), .a(a[7:6]), .b(b[7:6]));

   //output is high if a is greater than or equal to b
   //Sum of Products expression: GR3 + EQ3.GR2 + EQ3.EQ2.GR1 + EQ3.EQ2.EQ1.GR0 + EQ3.EQ2.EQ1.EQ0
   assign greq = g3 | e3 & g2 | e3 & e2 & g1 | e3 & e2 & e1 & g0 | e3 & e2 & e1 & e0;  
   
endmodule