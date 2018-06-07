// TCES 330 - spring, 2013
// Robert Gutmann
//
// Dual Output Register:
//  1) the register is 16 bits wide
//  2) there are two independently enabled outputs
//  3) there is one unswitched output 

module RegisterDualOE( Clk, Rst, Ld, I, Oae, Obe, Qa, Qb );
  input Clk;       // input clock
  input Rst;       // synchronous reset signal  
  input Ld;        // register load (write) enable
  input [15:0] I;  // input data  
  input Oae;       // channel a output enable
  input Obe;       // channel b output enable
  
  output [15:0]Qa; // channel a output
  output [15:0]Qb; // channel b output
  
  reg [15:0] Q; // the unswitched register output
   
 // register procedure
  always @( posedge Clk ) begin
    if ( Rst == 1 ) begin
      Q <= 0;
    end
    else if ( Ld == 1 ) begin
      Q <= I;
    end
  end // always
  
  // switching outputs on and off
  assign Qa = Oae ? Q : 16'hZZZZ;
  assign Qb = Obe ? Q : 16'hZZZZ;
  
endmodule
