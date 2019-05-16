module control(compare_ctrl, andornot_ctrl, addsub_ctrl, clk, opcode, accum_in);

output [3:0] compare_ctrl;
output [1:0] andornot_ctrl;
output addsub_ctrl;
input accum_in; //accumulator feedback
input clk;
input [3:0] opcode;

always @( posedge clk ) begin
	Q <= D;
end
endmodule