module control ( out, clk, in );

input clk, in;
output out;
reg Q;

initial begin
	Q = 0;
	end

always @( posedge clk ) begin
	Q <= D;
	end
endmodule