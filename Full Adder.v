//////////////////////////////////////////////////////////////////////////////////
// Design Name: Full Adder
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module full_adder(
    input  wire A,
    input  wire B,
    input  wire Ci,
    output wire S,
    output wire Co
    );
    
    assign S  = A ^ B ^ Ci;
    assign Co = ( A & B ) |  ( Ci & ( A ^ B) );
    
endmodule
