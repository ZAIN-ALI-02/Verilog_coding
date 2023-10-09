`timescale 1ns/1ns
`include "task_1_counter.v"

module task_1_counter_tb;
    initial begin
        $dumpfile("task_1_counter_tb.vcd");
        $dumpvars(0,task_1_counter_tb); 
    end

    reg clk_tb , rst_tb ,enab_tb , load_tb;
    reg [3:0] cnt_in_tb;
    wire [3:0] cnt_out_tb;

 task_1_counter uut(
      .clk(clk_tb),
      .rst(rst_tb),
      .load(load_tb),
      .enab(enab_tb),
      .cnt_in(cnt_in_tb),
      .cnt_out(cnt_out_tb)
    );

initial begin 
    $monitor("time=%0d,reset=%b,load=%b,enable=%b,cnt_in=%d,cnt_out=%d",
    $time,rst_tb,load_tb,enab_tb,cnt_in_tb,cnt_out_tb);
    end

    initial 
    clk_tb = 1'b1;
    always #5 clk_tb = ~clk_tb;
    

    initial begin
     rst_tb = 1;
    #5
     rst_tb = 0;
     #50
     rst_tb = 1;
      #10
     rst_tb = 0;
     end

  initial begin #18 load_tb = 1'b1; #5 load_tb = 1'b0; #5 load_tb = 1'b1;end
  initial begin #5 enab_tb = 1'b1; #27 enab_tb = 1'b0;end
  initial begin cnt_in_tb = 4'b1000; #15 cnt_in_tb = 4'b1101; #25 cnt_in_tb = 4'b1111;
    #1000
    $finish;
    end
endmodule