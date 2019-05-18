//*******************************//
//Performs AND, OR, and NOT operations on
//two 8bit inputs
//by Ryan Thompson
// Operations: and, or, not
// Op codes
// op == 00 -> and
// op == 01 -> or
// op == 10 -> not a
// op == 11 -> nand
//*******************************//

module andornot( s, a, b, ctrl);
input [7:0] a; 		//Input1
input [7:0] b; 		//Input2
input [1:0] ctrl; 	//operation choice
output reg [7:0] s; //output

initial begin
	s = 0;
end

always @( ctrl or a or b ) begin
	case (ctrl)
		2'b00: s = a & b;
		2'b01: s = a | b;
		2'b10: s = ~a;
		2'b11: s = (a & b);
		default: s = 0;
	endcase
end

endmodule