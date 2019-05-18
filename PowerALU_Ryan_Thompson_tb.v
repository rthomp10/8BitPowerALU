`timescale 1ps/1ps

module PowerALU_tb;
wire signed [7:0] b;
reg [3:0] opcode;
reg signed [7:0] a;
reg [32:0] i;
reg clk;

initial begin
for(i = 0; i < 40; i++) begin
	#25 clk = ~clk;
	end
$finish;
end

initial begin
	$dumpfile("PowerALU.vcd");
	$dumpvars(0,DUT);
	//$display("a  b cin   s cout");
	//$monitor("%b  %b  %b  | %b  %b", a, b, cin, s, cout);
	
	opcode <= 0;
	a      <= 0;
	i      <= 0;
	clk    <= 0;
	
	//Transfer A
	#13 opcode <= 4'b0000;	a <= 8'd10;
	#50 opcode <= 4'b0000;	a <= 8'd20;
	#50 opcode <= 4'b0000;	a <= -8'd15;
	
	//Increment A
	#50 opcode <= 4'b0001;	a <= -8'd15;
	#50 opcode <= 4'b0001;	a <= 8'd10;
	#50 opcode <= 4'b0001;	a <= 8'd20;
	#50 opcode <= 4'b0001;	a <= 8'd127;
	
	//A ADD B
	#50 opcode <= 4'b0010;	a <= -8'd15;
	#50 opcode <= 4'b0010;	a <= 8'd10;
	#50 opcode <= 4'b0010;	a <= 8'd20;
	#50 opcode <= 4'b0010;	a <= 8'd127;
	#50 opcode <= 4'b0010;	a <= -8'd5;
	
	//A SUB B
	#200 opcode <= 4'b0011;	a <= -8'd5;
	#50 opcode <= 4'b0011;	a <= 8'd10;
	#50 opcode <= 4'b0011;	a <= 8'd20;
	#50 opcode <= 4'b0011;	a <= 8'd127;
	#50 opcode <= 4'b0011;	a <= -8'd5;
end

PowerALU DUT(b, opcode, a, clk);

endmodule