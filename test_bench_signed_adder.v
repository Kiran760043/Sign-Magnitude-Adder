//////////////////////////////////////////////////////////////////////////////////
// Design Name: Signed Magnitude 8-bit Adder 
// Engineer: kiran
// Reference: FPGA Protoyping by Verilog Examples by Pong P. Chu (pg 71 - pg 72)
// NOTE: Can represent numbers from -(2^7)-1 to (2^7)
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns / 1ps


module test_bench_signed_adder();

        parameter N = 8;
    //inputs to the DUT
        reg [N-1:0] A;
        reg [N-1:0] B;
    //outputs from DUT
        wire [N-1:0] S;

        
        signed_adder DUT ( .A(A), .B(B), .S(S));
        
        initial 
            begin
                $display($time, " << Simulation Results >> ");
                $monitor($time, " A = %b, B = %b, S = %b", A, B, S);
            end
            
        initial
            begin
                A = 8'b11000110; // A = -70
                B = 8'b10011110; // B = -30
                #5;              // S = -100 
                A = 8'b01101101; // A =  109 
                B = 8'b11001011; // B = -75
                #5;              // R =  34 
                A = 8'b10111000; // A = -56
                B = 8'b00001101; // B =  13
                #5;              // R = -43 
                A = 8'b00010100; // A =  20 
                B = 8'b00101111; // B =  47
                #5;              // R =  67  
                $finish;
            end
endmodule
