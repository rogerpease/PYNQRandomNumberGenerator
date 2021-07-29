module inverter (input A, output Y);

    assign #1 Y = ~A;

endmodule


module RouteRingOscillator 
#(
  parameter NUMCELLS=5   // Must be an odd number > 3 
)
(
   input enable,
   output Y 
);
 
  wire InvOutput[NUMCELLS-1:0];  
  wire Inv0Input; 

  genvar InvNum; 
  generate
    for (InvNum = 1;  InvNum < NUMCELLS; InvNum = InvNum+1) 
    begin 
      inverter inverter_inst (InvOutput[InvNum-1], InvOutput[InvNum]);
    end 
  endgenerate 


  assign Inv0Input = InvOutput[NUMCELLS-1] & enable;

  inverter(Inv0Input, InvOutput[0]);

  assign Y = InvOutput[0];  


endmodule 

module RNGCore
#( 
   parameter NUMBITS = 32
)
(
   input enable, 
   input clk, 
   output reg [NUMBITS-1:0] Y
);

  wire [NUMBITS-1:0] RNG_out;
  reg [NUMBITS-1:0] RNG_q;

  genvar RRONum; 
  generate
  for (RRONum = 0;  RRONum < NUMBITS; RRONum = RRONum + 1) 
    begin 
     RouteRingOscillator RouteRingOscillator_inst (.enable(enable),.Y(RNG_out[RRONum]));
    end 
  endgenerate 

  // 
  // Register the random value through a dual-ff stabilizer. 
  // 

  always @(clk) 
  begin
    RNG_q  <= RNG_out;
    Y      <= RNG_q;
  end

endmodule 
