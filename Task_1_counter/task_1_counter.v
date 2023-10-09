module task_1_counter(
 input  clk , rst , load , enab , 
 input  [3:0] cnt_in ,
 output reg  [3:0] cnt_out
);
   always@(posedge clk) 
  begin
    if(rst)    //Set Counter to Zero
      cnt_out <= 4'b0000;
    else if(load)    //load the counter with data value
      cnt_out <= cnt_in;
    else if(enab)        //count
      cnt_out <= cnt_out + 1;
  end   
endmodule