module task_2_controller(
 input  clk , rst , Zero, 
 input  [2:0] opcode ,
 output reg  mem_rd , load_ir , halt , inc_pc , load_ac , load_pc , mem_wr
);
    localparam INST_ADDR  = 3'b000;
    localparam INST_FETCH = 3'b001;
    localparam INST_LOAD  = 3'b010;
    localparam IDLE       = 3'b011;
    localparam OP_ADDR    = 3'b100;
    localparam OP_FETCH   = 3'b101;
    localparam ALU_OP     = 3'b110;
    localparam STORE      = 3'b111;

    reg [2:0] c_s , n_s;
  
    always @(posedge clk or negedge rst) begin
        if (!rst) c_s <= INST_ADDR ;
        else c_s <= n_s ;
    end
        
  
  always @(*) begin
       begin 
         n_s <= INST_ADDR ;
            mem_rd  =  1'b0;
            load_ir =  1'b0;
            halt    =  1'b0; 
            inc_pc  =  1'b0;
            load_ac =  1'b0; 
            load_pc =  1'b0;
            mem_wr  =  1'b0;
    end


    case(c_s)
      INST_ADDR : begin 
         n_s <= INST_FETCH;
             end
      INST_FETCH : begin
         n_s <= INST_LOAD;
            mem_rd = 1'b1; 
             end
      INST_LOAD : begin
         n_s <= IDLE ;
            mem_rd = 1'b1; load_ir = 1'b1;
         end
      IDLE: begin
         n_s <= OP_ADDR;
            mem_rd = 1'b1; load_ir = 1'b1;
         end
      OP_ADDR : begin
         n_s <= OP_FETCH;
         if(opcode == INST_ADDR)
         begin
           halt = 1'b1; inc_pc = 1'b1;
         end
         end
      OP_FETCH: begin
         n_s <= ALU_OP;
         if(opcode == 3'b010 || opcode == 3'b011 || opcode == 3'b100 || opcode == 3'b101)
         begin
         mem_rd = 1'b1; load_ir = 1'b0;  halt = 1'b0; inc_pc = 1'b0;
         load_ac = 1'b0; load_pc = 1'b0; mem_wr = 1'b0;
         end
         else
         begin
          mem_rd = 1'b0; load_ir = 1'b0;  halt = 1'b0; inc_pc = 1'b0;
         load_ac = 1'b0; load_pc = 1'b0; mem_wr = 1'b0;
         end
         end
      ALU_OP: begin
         n_s <= STORE;
          if(opcode == 3'b010 || opcode == 3'b011 || opcode == 3'b100 || opcode == 3'b101)
         begin
         mem_rd = 1'b1; 
         load_ac = 1'b1;
         end
         if(opcode == 3'b001 && Zero == 1)
            begin
         inc_pc = 1'b1;
         end
         if (opcode == 3'b111)
         begin
         load_pc = 1'b1;
         end
         end
         STORE : begin
         n_s <= INST_ADDR;
         if(opcode == 3'b010 || opcode == 3'b011 || opcode == 3'b100 || opcode == 3'b101)
         begin
         mem_rd = 1'b1; 
         load_ac = 1'b1;
         end
          if (opcode == 3'b111)
         begin
         load_pc = 1'b1;
         inc_pc = 1'b1;
         end
         if (opcode == 3'b110)
         begin
         mem_wr = 1'b1;
         end
         end
     default : begin  
         n_s <= INST_ADDR ;
          end
    endcase
  end
endmodule