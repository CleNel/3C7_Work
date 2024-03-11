`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11.03.2024 15:21:23
// Design Name: 
// Module Name: ALU
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


module ALU(
    input wire [5:0] A,
    input wire [5:0] B,
    input wire [2:0] fxn,
    output reg [5:0] led,
    output reg output_lt
    );
    
    wire [5:0] invA, invB, AxorB, AplusB, AminusB;
    wire AgreqB;
    
    six_bit_ripple_adder inv_A (.x(0), .y(A), .sel(1), .sum(invA));    
    six_bit_ripple_adder inv_B (.x(0), .y(B), .sel(1), .sum(invB));
    greater_or_eq g_or_eq (.a(A), .b(B), .alsb(AgreqB));  
    XOR A_XOR_B (A, B, AxorB);
    six_bit_ripple_adder A_plus_B (.x(A), .y(B), .sel(0), .sum(AplusB));
    six_bit_ripple_adder A_minus_B (.x(A), .y(B), .sel(1), .sum(AminusB));
    
//    assign led[0] = X[0];
//    assign led[1] = X[1];
//    assign led[2] = X[2];
//    assign led[3] = X[3];
//    assign led[4] = X[4];
//    assign led[5] = X[5];
    
    always @(*)
    begin
    output_lt = 0;
        if(fxn == 3'b000) {led} = {A}; // X = A
        if(fxn == 3'b001) {led} = {B}; // X = B
        if(fxn == 3'b010) {led} = {invA}; // X = -A
        if(fxn == 3'b011) {led} = {invB}; // X = -B
        if(fxn == 3'b100) {output_lt} = {AgreqB}; // X = A < B
        if(fxn == 3'b101) {led} = {AxorB}; // X = A ^ B
        if(fxn == 3'b110) {led} = {AplusB}; // X = A + B
        if(fxn == 3'b111) {led} = {AminusB}; // X = A - B
    end
    
endmodule


