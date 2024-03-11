`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 16:09:09
// Design Name: 
// Module Name: greater_or_eq
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


module greater_or_eq(
    input  wire[5:0] a, b,	// a adn b are the two 2-bit numbers to compare 
    output alsb		       // single bit output. Should be high if a adn b the same
   );
   
   // internal signal declaration, used to wire outpus of the 1 bit comparators
   wire e0, e1, e2, e3, e4, e5, e6, e7;
   wire [2:0] agtb, agtbm;
   wire aeqb, agtb_total, aeq_lt_total;
   
   // body
   // instantiate two 1-bit comparators that we already know are tested and work
   // named instantiation allows us to change order of ports.
   eq1 eq_bit0_unit (.i0(a[0]), .i1(b[0]), .eq(e0));
   eq1 eq_bit1_unit (.i0(a[1]), .i1(b[1]), .eq(e1));
   eq1 eq_bit2_unit (.i0(a[2]), .i1(b[2]), .eq(e2));
   eq1 eq_bit3_unit (.i0(a[3]), .i1(b[3]), .eq(e3));
   eq1 eq_bit4_unit (.i0(a[4]), .i1(b[4]), .eq(e4));
   eq1 eq_bit5_unit (.i0(a[5]), .i1(b[5]), .eq(e5));


   // a and b are equal if individual bits are equal, which comes from the 1-bit comparators
   assign aeqb = ~(e0 ^ e1) & ~(e2 ^ e3) & ~(e4 ^ e5);

   // checking if a > b 
   assign agtb[2] = (a[5] & ~ b[5]) | (a[4] & ~b[4] & ~b[5]) | (a[5] & ~b[4] & a[4]);    
   assign agtb[1] = (a[3] & ~ b[3]) | (a[2] & ~b[2] & ~b[3]) | (a[3] & ~b[2] & a[2]);           
   assign agtb[0] = (a[1] & ~ b[1]) | (a[0] & ~b[0] & ~b[1]) | (a[1] & ~b[0] & a[0]);
    
   assign agtbm[2] = ~(e5 ^ e4) | agtb[2];    
   assign agtbm[1] = ~(e3 ^ e2) | agtb[1]; 
   assign agtbm[0] = ~(e1 ^ e0) | agtb[0];    
        
   assign agtb_total = agtb[2] | (agtbm[2] & agtb[1]) |  (agtbm[2] & agtbm[1] & agtb[0]);
   assign aeq_lt_total = agtb_total | aeqb; 
   assign alsb = (~aeq_lt_total & a[5]) | (a[5] & ~b[5]) | (~b[5] & ~aeq_lt_total);

    
    //TEMPORARY WIRES FOR USING 6-BIT INPUTS TO ALU AS 8-BIT INPUTS TO THE >= CIRCUIT
    //wire [7:0] A8, B8;
    //TEMPORARY VARIABLES FOR STORING THE MSB OF EACH 6-BIT INPUT FOR USE IN 2'S COMPLEMENT COMPARISON, ALONG WITH THE 1-BIT COMPARATOR RESULT
//    wire msbA, msbB, out; 
//    assign msbA = i0[5];
//    assign msbB = i1[5];  
      
    //FOR EACH 8-BIT INPUT FOR THE >= CIRCUIT, LET BITS 0->5 = THE 6-BIT INPUT TO THE ALU AND LET THE OTHER BITS =0
//    assign A8[7:6] = 0;
//    assign A8[5:0] = i0; 
//    assign B8[7:6] = 0;
//    assign B8[5:0] = i1;
    
    //PASS THESE CREATED 8-BIT NUMBERS TO THE 8-BIT >= CIRCUIT
//    eq8 A_GREQ_B (.a(A8), .b(B8), .greq(out));
          
    //USING THE MSB OF EACH INPUT TO THE ALU AND THE RESULT OF THE >= CIRCUIT, THIS NOW WORKS AS A 2'S COMPLEMENT COMPARATOR
//    assign two_comp = ~msbA & out | ~msbA & msbB | msbB & out;

endmodule
