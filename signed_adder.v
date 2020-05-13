//////////////////////////////////////////////////////////////////////////////////
// Design Name: Signed Magnitude 8-bit Adder 
// Engineer: kiran
// Reference: FPGA Protoyping by Verilog Examples by Pong P. Chu (pg 71 - pg 72)
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module signed_adder( A, B, S);
    parameter N = 8;
    input  wire [N-1:0] A;
    input  wire [N-1:0] B;
    output wire [N-1:0] S;

    
    reg R_mag;
    reg [N-1:0]greater;
    reg [N-1:0]smaller;
    
    reg zero = 1'b0;
    wire tempCo, tempCo1;
    
    always@(*)
        begin
            if (A[N-1] == B[N-1]) begin         // check for sign
                R_mag <= A[N-1];
                greater <=  A[N-2:0];
                smaller <=  B[N-2:0];
            end else begin
                if(A[N-2:0] > B[N-2:0]) begin    // check for magnitude
                    R_mag   <= A[N-1];
                    greater <=  A[N-2:0];
                    smaller <= ~B[N-2:0] + 1;
                end else begin
                    R_mag   <= B[N-1];                   
                    greater <=  B[N-2:0];
                    smaller <= ~A[N-2:0] + 1; 
                end
            end
        end
        
    assign S[N-1] = R_mag; 
       
    rca ADDER (.A(greater) ,.B(smaller),.Ci(zero),.S(S[N-2:0]),.Co(tempCo));
    

       
endmodule
