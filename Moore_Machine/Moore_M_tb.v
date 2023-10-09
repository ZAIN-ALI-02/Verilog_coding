`timescale 1ns/1ns
`include "Moore_M.v"

module sequence_tb;
    initial begin
        $dumpfile("Moore_M_tb.vcd");
        $dumpvars(0,sequence_tb); 
    end

    reg clk_tb , rst_tb , in_tb;
    wire out_tb;

    Sequence_10110 uut(
      .clk(clk_tb),
      .rst(rst_tb),
      .in(in_tb),
      .out(out_tb)
    );

    initial begin
      $monitor (clk_tb , rst_tb , in_tb ,out_tb);
    end

    initial clk_tb = 1;
    always #10 clk_tb = ~clk_tb;

   initial begin
    rst_tb = 1;
     in_tb = 0 ;
     #20
     in_tb = 0 ; 
     #20
     in_tb = 1 ;
     #20
     in_tb = 0 ;
     #20
     in_tb = 1 ;
     #20
     in_tb = 1 ;
     #15
     in_tb = 0 ;
     #15
     in_tb = 1 ;
     #20
     in_tb = 1 ;
     #20
     in_tb = 0 ; 
     #1000
    $finish;
    end
endmodule