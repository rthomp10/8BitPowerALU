//Control module for the 8bitPowerALU by Ryan Thompson
module control(compare_ctrl, andornot_ctrl, addsub_ctrl, mux_ctrl, accumulator_ctrl, opcode, clk);

output reg [3:0] compare_ctrl;
output reg [1:0] andornot_ctrl;
output reg       addsub_ctrl;
output reg [1:0] mux_ctrl;
output reg accumulator_ctrl;
input clk;
input [3:0] opcode;

//No-op codes for the respective modules
//That being said, it doesn't really matter;
// The multiplexer will assign the appropriate output
initial begin
	compare_ctrl  = 0;
	andornot_ctrl = 2'b11;
	addsub_ctrl   = 0;
	mux_ctrl      = 0;
end

//opcode -> operation
always @( posedge clk ) begin
	case(opcode)
	4'b0000: compare_ctrl = 4'b0010; 
	4'b0001: compare_ctrl = 4'b0011;  
	4'b0010:  addsub_ctrl = 0;        
	4'b0011:  addsub_ctrl = 1;        
	4'b0100: compare_ctrl = 4'b0100;  
	4'b0101: compare_ctrl = 4'b0101;  
	4'b0110: andornot_ctrl = 2'b00;   
	4'b0111: andornot_ctrl = 2'b11;   
	4'b1000: andornot_ctrl = 2'b01;   
	4'b1001: compare_ctrl = 4'b0110;  
	4'b1010: compare_ctrl = 4'b0111;  
	4'b1011: compare_ctrl = 4'b1100;  
	4'b1100: compare_ctrl = 4'b1101;  
	4'b1101: compare_ctrl = 4'b1110;  
	4'b1110: compare_ctrl = 4'b1111;  
	4'b1111: andornot_ctrl = 2'b10;   
	endcase
	
	case(opcode)
	4'b0000: mux_ctrl = 2'b00;
	4'b0001: mux_ctrl = 2'b00;
	4'b0010: mux_ctrl = 2'b10;
	4'b0011: mux_ctrl = 2'b10;
	4'b0100: mux_ctrl = 2'b00;
	4'b0101: mux_ctrl = 2'b00;
	4'b0110: mux_ctrl = 2'b01;
	4'b0111: mux_ctrl = 2'b01;
	4'b1000: mux_ctrl = 2'b01;
	4'b1001: mux_ctrl = 2'b00;
	4'b1010: mux_ctrl = 2'b00;
	4'b1011: mux_ctrl = 2'b00;
	4'b1100: mux_ctrl = 2'b00;
	4'b1101: mux_ctrl = 2'b00;
	4'b1110: mux_ctrl = 2'b00;
	4'b1111: mux_ctrl = 2'b01;
	endcase
end

endmodule