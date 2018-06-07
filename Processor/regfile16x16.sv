module regfile16x16(logic clk,  			//system clock
					logic write,			//write enable
					logic [2:0] wrAddr,		//write address
					logic [15:0] wrData,	//write data
					logic [2:0] rdAddrA, 	//A-side read address
					logic [15:0] rdDataA, 	//A-side read data
					logic [2:0] rdAddrB, 	//B-side read address
					logic [15:0] rdDataB);	//B-side read data
					
	logic[15:0] regfile [0:15]; //the registers

	//read the registers
	assign rdDataA = regfile[rdAddrA];
	assign rdDataB = regfile[rdAddrB];
	
	always @(posedge clk) begin
		if (write) regfile[wrAddr] <= wrData;
	end
	
	
	
endmodule

