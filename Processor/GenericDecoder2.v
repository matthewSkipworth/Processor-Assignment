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
/*
module GenericDecoder_testbench;
	//parameter M = 3;
	//localparam N = 2**M;

	logic [2:0] Sel;
	logic Ena;
	logic [7:0] X;
	integer i;
	
	GenericDecoder dut(Sel, Ena, X);
	
	initial begin
		Ena = 1;
		for(int i = 0; i < M; i++) begin
			Sel = i;
			#10;
			$monitor(X);
		end
	end
	
	
endmodule	*/