`timescale 1ns/1ns
`include "Meelay_Machine.v"

module sequenc_tb;
    initial begin
        $dumpfile("Meelay_Machine_tb.vcd");
        $dumpvars(0,sequenc_tb); 
    end

    reg clk_tb , rst_tb , in_tb;
    wire out_tb;

    Sequence_1010 uut(
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
     in_tb = 1 ;
     #20
     in_tb = 0 ; 
     #20
     in_tb = 1 ;
     #20
     in_tb = 0 ;
     #20
     in_tb = 0 ;
     #20
     in_tb = 0 ;
     #20
     in_tb = 1 ;
     #20
     in_tb = 0 ;
     #20
     in_tb = 1 ;
     #18
     in_tb = 0 ; 
     #1000
    $finish;
    end  
endmodule