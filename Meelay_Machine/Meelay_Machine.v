module Sequence_1010(
 input clk , rst , in ,
 output reg out 
);
    localparam s_0 = 2'b00;
    localparam s_1 = 2'b01;
    localparam s_2 = 2'b10;
    localparam s_3 = 2'b11;

    reg [1:0] c_s , n_s ;
  
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
         n_s = in ? s_1 : s_2 ;
         out = in ? 1'b0 : 1'b1 ;
         end
     default : begin 
         n_s = s_0 ;
         out = 1'b0 ;
         end
    endcase
  end
    
endmodule