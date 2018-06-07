// Robert Gutmann
// 3/16/2008
// Generic Decoder
// Parameter 'M' is the number of address lines

module GenericDecoder( Sel, Ena, X );
  parameter M = 3;
  localparam N = 2**M;
  
  input [M-1:0]Sel;     // the 'address' lines
  input Ena;            // chip enable
  output reg [N-1:0]X;  // the output lines
  
  always @ ( Sel, Ena ) begin
    X = 0;
    if ( Ena ) begin
      X[Sel] = 1'b1;    // treat Sel as an index
    end
  end
  
endmodule
