//*******************************// 
// Ctrl codes
// ctrl == 0000 -> N/A
// ctrl == 0001 -> N/A
// ctrl == 0010 -> transfer A
// ctrl == 0011 -> increment A
// ctrl == 0100 -> Decrement A
// ctrl == 0101 -> 1's compliment
// ctrl == 0110 -> A NOR B
// ctrl == 0111 -> A XOR B
// ctrl == 1000 -> A XNOR B
// ctrl == 1001 -> A GT B (greater than)
// ctrl == 1010 -> A LT B (less than)
// ctrl == 1011 -> A EQ B (equal)
//*******************************//

module compare( s, a, b, ctrl );
input signed [7:0] a; //var1
input signed [7:0] b; //var2
output reg   [7:0] s;
output overflow; //indicates if there was an over flow
input [3:0] ctrl; //operation choice

always @( ctrl or a or b) begin
	case (ctrl)
		4'd2:  s = a;
		4'd3:  s = a + 1;
		4'd4:  s = a - 1;
		4'd5:
		begin
			if(a < 0)
				s = a + 1;
			else
				s = a;
		end
		4'd6:  s = ~(a | b);
		4'd7:  s = a^b;
		4'd8:  s = a^~b;
		4'd9:  s = (a > b);
		4'd10: s = (a < b);
		4'd11: s = (a == b);
		default: s = 0;
	endcase
end

endmodule