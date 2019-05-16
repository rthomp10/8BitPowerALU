//*******************************//
// Operations: and, or, not
// Op codes
// op == 00 -> and
// op == 01 -> or
// op == 10 -> not a
//*******************************//

module andornot( s, a, b, ctrl);
input [7:0] a; 		//Input1
input [7:0] b; 		//Input2
output reg [7:0] s; //output
output overflow; 	//indicates if there was an over flow
input [1:0] ctrl; 	//operation choice

always @(posedge ctrl or a or b) begin
	case (ctrl)
		2'b00: s = a & b;
		2'b01: s = a | b;
		2'b10: s = ~a;
		default: s = 0;
	endcase
end

endmodule