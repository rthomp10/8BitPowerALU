//Accumulator by Ryan Thompson

module accumulator(s, a, clk);

input clk;
input [7:0] a;
output reg [7:0] s;

always @( negedge clk ) begin
		s <= a;
end

endmodule