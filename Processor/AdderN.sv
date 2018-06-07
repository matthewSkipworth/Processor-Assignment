module AdderN( carryin, X, Y, S, carryout, overflow );
	parameter n = 32;
	input carryin;
	input [n-1:0] X, Y;
	output reg[n-1:0] S;
	output reg carryout, overflow;

	always @(X, Y, carryin) begin
	{carryout, S} = X + Y + carryin;
	overflow = carryout ^ X[n -1] ^ Y[n-1] ^ S[n-1];
end


always @ ( A, B, S ) begin
Co = 0;  // default
case ( S )
//...
2: {
Co,Q
} = A 
-
B;    // SUB
3: Q = A;             // A
// ...
endcase
// calculate the flags
V = Co ^ A[15] ^ B[15] ^ Q[15];
N = Q[15];
Z = ~|Q;
end // always
// register the flags
always @( posedge Clk) begin
if ( En ) begin
F[0] = Z;
F[1] = N;
F[2] = V;
F[3] = Co;
F[15:4] = 0;
end // enabled
end // sequential loop
