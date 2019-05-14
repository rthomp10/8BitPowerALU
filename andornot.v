//*******************************//
// Operations: and, or, not
// Op codes
// op == 00 -> and
// op == 01 -> or
// op == 10 -> not a
//*******************************//

module andornot( s, a, b, ctrl);
input [7:0] a; //var1
input [7:0] b; //var2
output reg [7:0] s;
output overflow; //indicates if there was an over flow
input [1:0] ctrl; //operation choice

always @(ctrl or a or b) begin
	case (ctrl)
		2'b00: s = a & b;
		2'b01: s = a | b;
		2'b10: s = ~a;
	endcase
end

endmodule