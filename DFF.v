module dff ( D, clk, Q );

input D, clk;
output Q;
reg Q;

initial begin
	Q = 0;
	end

always @( posedge clk ) begin
	Q <= D;
	end
endmodule