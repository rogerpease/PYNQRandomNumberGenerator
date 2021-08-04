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

module RouteRingOscillatorValue 
#( 
   parameter NUMBITS = 32
)
(
   output [NUMBITS-1:0] Y
);


  genvar RRONum; 
  generate
  for (RRONum = 0;  RRONum < NUMBITS; RRONum = RRONum + 1) 
    begin 
     RouteRingOscillator RouteRingOscillator_inst (.Y(Y[RRONum]));
    end 
  endgenerate 

endmodule 
