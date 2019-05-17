//Accumulator by Ryan Thompson

module accumulator(s, ctrl, in);

output reg [7:0] s;
input ctrl;
input [7:0] in;

initial begin
	s = 0;
end

always @( posedge ctrl ) begin
	if(ctrl == 1)
		s <= in;
		
end

endmodule