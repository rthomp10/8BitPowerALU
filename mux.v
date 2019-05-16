//Module by Ryan Thompson
//Muliplexer for the 8bit Power ALU

/*
ctrl operations for this mux
00	compare
01	andornot
10	addsub
*/

module alumux( s, ctrl, compare_in, andornot_in, addsub_in);

output reg [7:0] s; //output
input [1:0] ctrl;	//picks which module's output to pass
input [7:0] compare_in; 	//
input [7:0] andornot_in;	//Outputs of ALU modules -> mux
input [7:0] addsub_in;		//

always @( ctrl or compare_in or andornot_in or addsub_in) begin
	case(ctrl) 
	2'b00:   s = compare_in;
	2'b01:   s = andornot_in;
	2'b10:   s = addsub_in;
	default: s = 0;
	endcase
end

endmodule