// TCES 330, Spring 2013
// 16 X 16 Dual Output Register File module
// Robert Gutmann
//
// This is a 16 X 16 dual out register file
//   1) there are 16 16-bit registers
//   2) there are two independent output ports
//

module RegisterFile(  Clk, Rst, W_en, W_Addr, W_Data, Ra_Addr, Rb_Addr, Ra_en, Rb_en, Ra_Data, Rb_Data );
  input Clk;                     // system clock
  input Rst;                     // system reset
  input W_en;                    // write enable
  input [3:0] W_Addr;            // write address 
  input [15:0] W_Data;           // data to write
  input [3:0] Ra_Addr, Rb_Addr;  // A side and B side read addresses
  input Ra_en, Rb_en;            // A side and B side read enables
  
  output [15:0] Ra_Data, Rb_Data;   // A side and B side outputs
         
  wire [15:0] Ra_d , Rb_d; // read enables (decoder outputs)
  wire [15:0] W_d ;        // write enable (decoder output)
  
  genvar I;  // we are going to generate the registers
  
  // instantiate two read decoders and a write decoder
  GenericDecoder #(.M(4)) WriteDecoder( W_Addr, W_en, W_d );    // write decoder   
  GenericDecoder #(.M(4)) ReadADecoder( Ra_Addr, Ra_en, Ra_d ); // A side read decoder
  GenericDecoder #(.M(4)) ReadBDecoder( Rb_Addr, Rb_en, Rb_d ); // B side read decoder
  
  // instantiate the 16 dual-output registers
  generate
    for ( I=0; I<16; I=I+1 ) begin:rgen
      RegisterDualOE U( Clk, Rst, W_d[I], W_Data, Ra_d[I], Rb_d[I], Ra_Data, Rb_Data );
    end
  endgenerate
  
  
endmodule
