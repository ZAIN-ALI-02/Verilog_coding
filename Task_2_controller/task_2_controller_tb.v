`timescale 1ns/1ns
`include "task_2_controller.v"

module task_2_controller_tb;
    initial begin
        $dumpfile(" task_2_controller_tb.vcd");
        $dumpvars(0, task_2_controller_tb); 
    end

    reg clk_tb , rst_tb , Zero_tb;
    reg [2:0] opcode_tb;
    wire  mem_rd_tb , load_ir_tb , halt_tb , inc_pc_tb , load_ac_tb , load_pc_tb , mem_wr_tb;

 task_2_controller uut(
      .clk(clk_tb),
      .rst(rst_tb),
      .Zero(Zero_tb),
      .opcode(opcode_tb),
      .mem_rd(mem_rd_tb),
      .load_ir(load_ir_tb),
      .halt(halt_tb),
      .inc_pc(inc_pc_tb),
      .load_ac(load_ac_tb),
      .load_pc(load_pc_tb),
      .mem_wr(mem_wr_tb)
    );

initial begin 
    $monitor("time=%0d,clock=%b,reset=%b,Zero=%b,opcode=%b,mem_rd_tb=%b , load_ir_tb=%b , halt_tb=%b , inc_pc_tb=%b , load_ac_tb=%b , load_pc_tb=%b , mem_wr_tb=%b",
    $time,clk_tb , rst_tb , Zero_tb,opcode_tb , mem_rd_tb , load_ir_tb , halt_tb , inc_pc_tb , load_ac_tb , load_pc_tb , mem_wr_tb);
    end

    initial 
    clk_tb = 1'b1;
    always #20 clk_tb = ~clk_tb;
    

    initial 
            begin
    Zero_tb = 1'b0;
    rst_tb = 0;
    #10
    Zero_tb = 1'b1;
    rst_tb = 1;
     #10
    Zero_tb = 1'b0;
    rst_tb = 0;
    #10
    Zero_tb = 1'b1;
    rst_tb = 1;
     end
initial begin
    
     opcode_tb = 3'b000;
  #5 opcode_tb = 3'b001;
  #5 opcode_tb = 3'b110; 
  #5 opcode_tb = 3'b011;
  #5 opcode_tb = 3'b100;
  #5 opcode_tb = 3'b101; 
  #5 opcode_tb = 3'b110;
  #5 opcode_tb = 3'b111;
  #5 opcode_tb = 3'b000;
  #5 opcode_tb = 3'b001;
  #5 opcode_tb = 3'b110; 
  #5 opcode_tb = 3'b011;
  #5 opcode_tb = 3'b100;
  #5 opcode_tb = 3'b101; 
  #5 opcode_tb = 3'b110;
  #5 opcode_tb = 3'b111;
  #5 opcode_tb = 3'b000;
  #5 opcode_tb = 3'b001;
  #5 opcode_tb = 3'b110; 
  #5 opcode_tb = 3'b011;
  #5 opcode_tb = 3'b100;
  #5 opcode_tb = 3'b101; 
  #5 opcode_tb = 3'b110;
  #5 opcode_tb = 3'b111;
  #5   opcode_tb = 3'b000;
  #5 opcode_tb = 3'b001;
  #5 opcode_tb = 3'b110; 
  #5 opcode_tb = 3'b011;
  #5 opcode_tb = 3'b100;
  #5 opcode_tb = 3'b101; 
  #5 opcode_tb = 3'b110;
  #5 opcode_tb = 3'b111;
  #5 opcode_tb = 3'b000;
  #5 opcode_tb = 3'b001;
  #5 opcode_tb = 3'b110; 
  #5 opcode_tb = 3'b011;
  #5 opcode_tb = 3'b100;
  #5 opcode_tb = 3'b101; 
  #5 opcode_tb = 3'b110;
  #5 opcode_tb = 3'b111;
  #5 opcode_tb = 3'b000;
  #5 opcode_tb = 3'b001;
  #5 opcode_tb = 3'b110; 
  #5 opcode_tb = 3'b011;
  #5 opcode_tb = 3'b100;
  #5 opcode_tb = 3'b101; 
  #5 opcode_tb = 3'b110;
  #5 opcode_tb = 3'b111;
   #5   opcode_tb = 3'b000;
  #5 opcode_tb = 3'b001;
  #5 opcode_tb = 3'b110; 
  #5 opcode_tb = 3'b011;
  #5 opcode_tb = 3'b100;
  #5 opcode_tb = 3'b101; 
  #5 opcode_tb = 3'b110;
  #5 opcode_tb = 3'b111;
  #5 opcode_tb = 3'b000;
  #5 opcode_tb = 3'b001;
  #5 opcode_tb = 3'b110; 
  #5 opcode_tb = 3'b011;
  #5 opcode_tb = 3'b100;
  #5 opcode_tb = 3'b101; 
  #5 opcode_tb = 3'b110;
  #5 opcode_tb = 3'b111;
  #5 opcode_tb = 3'b000;
  #5 opcode_tb = 3'b001;
  #5 opcode_tb = 3'b110; 
  #5 opcode_tb = 3'b011;
  #5 opcode_tb = 3'b100;
  #5 opcode_tb = 3'b101; 
  #5 opcode_tb = 3'b110;
  #5 opcode_tb = 3'b111;

    #1000
    $finish;    
end
endmodule