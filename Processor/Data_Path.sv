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
				
	//logic [15:0] data;
	logic [15:0] q;
	logic [15:0] Q;
	logic [15:0] Mux_result;
	logic [15:0] Ra_Data;
	logic [15:0] Rb_Data;

	 Data_Memory DM(D_addr, Clk, Ra_Data, D_wr, q);
	
	 Mux_16_Bit_2_to_1 MUX(q, Q, MuxSel, Mux_result);
	
	 ALU ALU(Ra_Data, Rb_Data, ALU_s, Q);
	
	RegisterFile RF(  Clk, Rst, RFWen, RFWAddr, Mux_result, RF_A_Addr, RF_B_Addr, 1'b1, 1'b1, Ra_Data, Rb_Data );

	assign ALU_Out = Q;
	assign ALU_A = Ra_Data;
	assign ALU_B = Rb_Data;
endmodule
/*
module Data_Path_testbench;


	logic [7:0] D_addr;
	logic Clk, Rst, D_wr, MuxSel, RFWen;
	logic [15:0] ALU_Out, ALU_A, ALU_B;
	logic [3:0] RF_A_Addr, RF_B_Addr, RFWAddr;
	logic [2:0] ALU_s;
	
	integer i;
	
	Data_Path dut(D_addr,
				 Clk,
				 Rst,
				 D_wr,
				 MuxSel,
				 ALU_s,
				 RF_A_Addr,
				 RF_B_Addr,
				 RFWen,
				 RFWAddr,
				 ALU_Out,
				 ALU_A,
				 ALU_B);
				 
				 
	initial begin
		D_addr = 8'b00110011;
		Rst = 0;
		D_wr = 1;
		MuxSel = 0;
		ALU_s = 3'b000; 
		RF_A_Addr = 4'b0000;
		RF_B_Addr = 4'b0001;
		RFWen = 0;
		RFWAddr = 4'b0000; 
		#10;
		
		for (int i = 0; i < 8; i++) begin
		ALU_s = i;
			$display(ALU_Out, ALU_A, ALU_B);
		end
		
	end
				
endmodule		*/	