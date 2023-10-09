module Sequence_10110(
 input clk , rst , in ,
 output reg out 
);
    localparam s_0 = 3'b000;
    localparam s_1 = 3'b001;
    localparam s_2 = 3'b010;
    localparam s_3 = 3'b011;
    localparam s_4 = 3'b101;
    localparam s_5 = 3'b100;

    reg [2:0] c_s , n_s ;
  
    always @(posedge clk or negedge rst) begin
        if (!rst) c_s <= s_0 ;
        else c_s <= n_s ;
    end
        
  
  always @(*) begin
    case(c_s)
      s_0 : begin 
         n_s = in ? s_1 : s_0 ;
         out = 1'b0;
         end
      s_1 : begin
         n_s = in ? s_1 : s_2 ;
         out = 1'b0;
         end
      s_2 : begin
         n_s = in ? s_3 : s_0 ;
         out = 1'b0;
         end
      s_3 : begin
         n_s = in ? s_4 : s_2 ;
         out = 1'b0;
         end
      s_4 : begin
         n_s = in ? s_1 : s_5 ;
         out = 1'b0;
         end
      s_5 : begin
         n_s = in ? s_4 : s_0 ;
         out = 1'b1 ;
         end
     default : begin 
         n_s = s_0 ;
         out = 1'b0 ;
         end
    endcase
  end
    
endmodule