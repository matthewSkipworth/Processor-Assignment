module ALU(A, B, Sel, Q);

	input [2:0] Sel;
	input [15:0] A, B;
	
	output logic [15:0] Q;
	
	always_comb begin
	
	case(Sel) 
		
		0: Q = 0;
		1: Q = A + B;
		2: Q = A - B;
		3: Q = A;
		4: Q = A ^ B;
		5: Q = A | B;
		6: Q = A & B;
		7: Q = A + 1'b1;
		
		default: Q = 0;
	endcase
	
	end
	
endmodule	

module ALU_testbench;

	logic [2:0] Sel;
	logic [15:0] A, B, Q = 0;
	integer i;
	
	ALU dut(A, B, Sel, Q);
	
	assign A = 15;
	assign B = 16;
	
	initial begin
	
		for (i = 0; i < 8; i++) begin
			Sel = i;
			$display("A: %16b,  B: %16b, Q: %16b", A, B, Q);
			#10;
		end
	
	end
endmodule	