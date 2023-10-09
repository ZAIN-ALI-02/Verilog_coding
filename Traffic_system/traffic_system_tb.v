`timescale 1ns/1ns
`include "traffic_system.v"

module traffic_system_tb;
    initial begin
        $dumpfile("traffic_system_tb.vcd");
        $dumpvars(0,traffic_system_tb); 
    end

    reg clk_tb , rst_tb , in_tb;
    wire [1:0] M_H_tb , L_R_tb;

 traffic_system uut(
      .clk(clk_tb),
      .rst(rst_tb),
      .in(in_tb),
      .M_H(M_H_tb),
      .L_R(L_R_tb)
    );

    initial begin
      $monitor (clk_tb , rst_tb , in_tb , M_H_tb , L_R_tb);
    end

    initial clk_tb = 1;
    always #10 clk_tb = ~clk_tb;
    initial begin
       rst_tb = 0;
    #10
     rst_tb = 1;
     end

   initial begin
     in_tb = 0 ;
     #20
     in_tb = 0 ; 
     #20
     in_tb = 1 ;
     #20
     in_tb = 1 ;
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