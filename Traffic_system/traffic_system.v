module traffic_system(
 input  clk , rst , in ,
 output reg [1:0] M_H , L_R
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
          M_H = 2'b11;
          L_R = 2'b00;
         end
      s_1 : begin
         n_s = in ? s_2 : s_0 ;
         M_H = 2'b00;
         L_R = 2'b10;
         end
      s_2 : begin
         n_s = in ? s_2 : s_3 ;
         M_H = 2'b00;
         L_R = 2'b11;
         end
      s_3 : begin
         n_s = in ? s_2 : s_0 ;
         M_H = 2'b10;
         L_R = 2'b00;
         end
     default : begin  // 
         n_s = s_0 ;
         M_H = 2'b01;
         L_R = 2'b01; 
         end
    endcase
  end
    
endmodule