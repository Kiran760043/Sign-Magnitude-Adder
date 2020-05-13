//////////////////////////////////////////////////////////////////////////////////
// Design Name: Ripple Carry Adder
// Engineer: kiran
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module rca(A,B,Ci,S,Co);

    parameter N = 7; // Change according to design
    input [N-1:0] A;
    input [N-1:0] B;
    input Ci;
    output [N-1:0] S;
    output Co;

    
    wire [N:0] C;
    
    assign C[0] = Ci;
    
    genvar i; 
    generate     
       for (i=0; i < N; i=i+1) 
        begin : Build_adders
           full_adder COMP(.A(A[i]), .B(B[i]), .Ci(C[i]), .S(S[i]), .Co(C[i+1]));
        end
     endgenerate

    assign Co = C[N];
    
endmodule
