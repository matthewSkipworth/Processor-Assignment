module Data_Path(input [7:0] D_addr,
				input Clk,
				input D_wr,
				input MuxSel,
				input [2:0] ALU_s,
				input [3:0] RF_A_addr,
				input [3:0] RF_B_addr,
				input RFWen,
				input [3:0] RFWAddr,
				output [15:0] ALU_Out,
				output [15:0] ALU_A,
				output [15:0] ALU_B);
				
	logic [15:0] data;
	logic [15:0] q;
	logic [15:0] Q;
	logic [15:0] Mux_result;
	logic [15:0] Ra_Data;
	logic [15:0] Rb_Data;

	 Data_Memory DM(D_addr, Clk, data, D_wr, q);
	
	 Mux_16_Bit_2_to_1 MUX(q, Q, MuxSel, Mux_result);
	
	 ALU ALU(Ra_Data, Rb_Data, Sel, Q);
	
	RegisterFile RF(  Clk, /*Rst,*/ RFWen, RFWAddr, Mux_result, RF_A_addr, RF_B_addr, /*Ra_en, Rb_en,*/ Ra_Data, Rb_Data );

	assign ALU_Out = Q;
	assign ALU_A = Ra_Data;
	assign ALU_B = Rb_Data;
endmodule