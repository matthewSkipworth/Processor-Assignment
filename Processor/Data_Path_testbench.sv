//Datapath testbench
//Matthew Skipworth and Bruce Baker

`timescale 1ps/1ps

module Data_Path_testbench;
	logic [7:0] D_addr;
	logic Clk, Rst, D_wr, MuxSel, RFWen;
	logic [15:0] ALU_Out, ALU_A, ALU_B;
	logic [3:0] RF_A_Addr, RF_B_Addr, RFWAddr;
	logic [2:0] ALU_s;
	
	
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
		D_addr = 6;
		Rst = 0;
		D_wr = 0;
		MuxSel = 0;
		ALU_s = 0; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110; //register 6 from the mif selected.
		RFWen = 1;           
		RFWAddr = 4'b1100; 
		
		// two clock cycles for load.
		Clk = 0;
		#10;
		Clk = 1; //1
		#10;
		Clk = 0;
		#10;
		Clk = 1; //2
		#10;
	
		
		D_addr = 11;
		Rst = 0;
		D_wr = 0;
		MuxSel = 0;
		ALU_s = 7; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110; //loads contents of register 6 from mif into 
		RFWen = 1;           //register 6 in register file.
		RFWAddr = 4'b1100; 
		
		//two clock cycles for load.
		Clk = 0;
		#10;
		Clk = 1; //3
		#10;
		Clk = 0; 
		#10;
		Clk = 1; //4
		#10;
		
		//Clk = 1; 
		//#10;
		//Clk = 0;
		//#10;
		
		D_addr = 11;
		Rst = 0;
		D_wr = 0;
		MuxSel = 0;
		ALU_s = 2; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110; //get contents of register 11 from the mif
		RFWen = 1;
		RFWAddr = 4'b0110; 
		
		Clk = 0;
		#10;
		Clk = 1; //5
		#10;
		Clk = 0;
		#10;
		Clk = 1; //6
		#10;
		
		
		D_addr = 11;
		Rst = 0;
		D_wr = 0;
		MuxSel = 0;
		ALU_s = 1; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110; //load it into register 6 in the register file
		RFWen = 1;
		RFWAddr = 4'b0110; 
		
		Clk = 0;
		#10;
		Clk = 1; //7
		#10;
		Clk = 0;
		#10;
		Clk = 1; //8
		#10;
		
		
		D_addr = 13;
		Rst = 0;
		D_wr = 1;
		MuxSel = 1;
		ALU_s = 3; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110; //load it into register 12 in the register file
		RFWen = 1;
		RFWAddr = 4'b0110; 
		
		Clk = 0;
		#10;
		Clk = 1; //9
		#10;
		Clk = 0; 
		#10;
		Clk = 1; //10
		#10;
		Clk = 0;
		#10;
		Clk = 1; //11
		#10;
		
		/*
		D_addr = 6;
		Rst = 0;
		D_wr = 0;
		MuxSel = 1;
		ALU_s = 0; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110; //then load it into register 6 in the register file and add them
		RFWen = 1;
		RFWAddr = 4'b1100; 
		
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		
		D_addr = 11;
		Rst = 0;
		D_wr = 0;
		MuxSel = 1;
		ALU_s = 3; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110; //load 11s contents into 6
		RFWen = 1;
		RFWAddr = 4'b0110; 
		
			
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		
		D_addr = 5;
		Rst = 0;
		D_wr = 0;
		MuxSel = 0;
		ALU_s = 3; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110;
		RFWen = 1;
		RFWAddr = 4'b0011; 
		
			
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		
		D_addr = 5;
		Rst = 0;
		D_wr = 0;
		MuxSel = 1;
		ALU_s = 3; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110;
		RFWen = 1;
		RFWAddr = 4'b0110; 
		
			
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		D_addr = 5;
		Rst = 0;
		D_wr = 0;
		MuxSel = 0;
		ALU_s = 3; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0110;
		RFWen = 1;
		RFWAddr = 4'b0011; 
		
			
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		Clk = 1; 
		#10;
		Clk = 0;
		#10;*/
		/*
		$display(RF_A_Addr, RF_B_Addr);
		for (int i = 0; i < 16; i++) begin
			for (int j = 0; j < 16; j++) begin
				
				Clk = 1; 
				#10;
				Clk = 0;
				#10;
				Clk = 1; 
				#10;
				Clk = 0;
				#10;
				$display(ALU_Out, ALU_A, ALU_B);
			end
		end
		D_addr = 8'b00110011;
		Rst = 0;
		D_wr = 1;
		MuxSel = 0;
		ALU_s = 0; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0101;
		RFWen = 0;
		RFWAddr = 4'b0110; 
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		
		for (int i = 0; i < 8; i++) begin
			ALU_s = i;
			Clk = 1;
			#10;
			Clk = 0;
			#10;
			$display(ALU_Out, ALU_A, ALU_B);
		
		end
		D_addr = 8'b00110011;
		Rst = 0;
		D_wr = 1;
		MuxSel = 1;
		ALU_s = 0; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0101;
		RFWen = 0;
		RFWAddr = 4'b0110; 
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		
		for (int i = 0; i < 8; i++) begin
			ALU_s = i;
			Clk = 1;
			#10;
			Clk = 0;
			#10;
			$display(ALU_Out, ALU_A, ALU_B);
		
		end
		D_addr = 8'b00110011;
		Rst = 0;
		D_wr = 1;
		MuxSel = 1;
		ALU_s = 0; 
		RF_A_Addr = 4'b1100;
		RF_B_Addr = 4'b0101;
		RFWen = 0;
		RFWAddr = 4'b0110; 
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		Clk = 1; 
		#10;
		Clk = 0;
		#10;
		
		for (int i = 0; i < 8; i++) begin
			ALU_s = i;
			Clk = 1;
			#10;
			Clk = 0;
			#10;
			$display(ALU_Out, ALU_A, ALU_B);
		
		end*/
		
	end
				
endmodule			