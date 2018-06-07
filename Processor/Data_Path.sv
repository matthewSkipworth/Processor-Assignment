//Bruce Baker & Matthew Skipworth
//Datapath supermodule

//module signature
module Data_Path(input [7:0] D_addr,
				input Clk,
				input Rst,
				input D_wr,
				input MuxSel,
				input [2:0] ALU_s,
				input [3:0] RF_A_Addr,
				input [3:0] RF_B_Addr,
				input RFWen,
				input [3:0] RFWAddr,
				output [15:0] ALU_Out,
				output [15:0] ALU_A,
				output [15:0] ALU_B);
				
//input/output assignments		
	logic [15:0] q;
	logic [15:0] Q;
	logic [15:0] Mux_result;
	logic [15:0] Ra_Data;
	logic [15:0] Rb_Data;

//Data Memory instantiation
	 Data_Memory DM(D_addr, Clk, Ra_Data, D_wr, q);
	
//2 to 1 mux instantiation	
	 Mux_16_Bit_2_to_1 MUX(q, Q, MuxSel, Mux_result);
	
//ALU instantiation	
	 ALU ALU(Ra_Data, Rb_Data, ALU_s, Q);

//Register File instantiation	 
	RegisterFile RF(  Clk, Rst, RFWen, RFWAddr, Mux_result, RF_A_Addr, RF_B_Addr, 1'b1, 1'b1, Ra_Data, Rb_Data );

	assign ALU_Out = Q;
	assign ALU_A = Ra_Data;
	assign ALU_B = Rb_Data;
endmodule
