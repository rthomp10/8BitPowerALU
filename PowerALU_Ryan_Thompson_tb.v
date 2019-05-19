`timescale 1ps/1ps

module PowerALU_tb;
wire signed [7:0] b;
reg [3:0] opcode;
reg signed [7:0] a;
reg [32:0] i;
reg clk;

initial begin
for(i = 0; i < 270; i++) begin
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
	
	//Decrement A
	#200 opcode<= 4'b0100;	a <= -8'd5;
	#50 opcode <= 4'b0100;	a <= 8'd10;
	#50 opcode <= 4'b0100;	a <= 8'd20;
	#50 opcode <= 4'b0100;	a <= 8'd127;
	#50 opcode <= 4'b0100;	a <= -8'd5;
	
	//1'Compliment
	#200 opcode <= 4'b0101;	a <= -8'd5;
	#50 opcode <= 4'b0101;	a <= 8'd10;
	#50 opcode <= 4'b0101;	a <= 8'd20;
	#50 opcode <= 4'b0101;	a <= 8'd127;
    #50 opcode <= 4'b0101;	a <= -8'd128;
	#50 opcode <= 4'b0101;	a <= -8'd1;
	#50 opcode <= 4'b0101;	a <= 8'd1;
	
	//pre-loads 8'b11111111 for bit-wise comparisons
	#50 opcode <= 4'b0000;	a <= -8'd1;
	
	//A AND B which selectively removes bits
	#50 opcode <= 4'b0110;	a <= -8'd2;
	#50 opcode <= 4'b0110;	a <= -8'd4;
	#50 opcode <= 4'b0110;	a <= -8'd8;
	#50 opcode <= 4'b0110;	a <= -8'd16;
	#50 opcode <= 4'b0110;	a <= -8'd32;
	
	#50 opcode <= 4'b0000;	a <= -8'd1; //pre-load
	
	//A NAND B
	#200 opcode <= 4'b0111;	a <= -8'd5;
	#50 opcode <= 4'b0111;	a <= 8'd10;
	#50 opcode <= 4'b0111;	a <= 8'd20;
	#50 opcode <= 4'b0111;	a <= 8'd127;
	#50 opcode <= 4'b0111;	a <= -8'd5;
	
	#50 opcode <= 4'b0000;	a <= 8'b00010000; //pre-load
	
	//A OR B
	#200 opcode <= 4'b1000;	a <= -8'd5;
	#50 opcode <= 4'b1000;	a <= 8'd10;
	#50 opcode <= 4'b1000;	a <= 8'd20;
	#50 opcode <= 4'b1000;	a <= 8'd127;
	#50 opcode <= 4'b1000;	a <= -8'd5;
	
	#50 opcode <= 4'b0000;	a <= -8'd1; //pre-load
	
	//A NOR B
	#200 opcode <= 4'b1001;	a <= 8'b00010000;
	#50 opcode <= 4'b1001;	a <= 8'b10010000;
	#50 opcode <= 4'b1001;	a <= 8'b00000010;
	#50 opcode <= 4'b1001;	a <= 8'b01010101;
	#50 opcode <= 4'b1001;	a <= 8'b11110000;
	
	#50 opcode <= 4'b0000;	a <= -8'd1; //pre-load
	
	//A XOR B
	#200 opcode <= 4'b1010;	a <= -8'd5;
	#50 opcode <= 4'b1010;	a <= 8'd10;
	#50 opcode <= 4'b1010;	a <= 8'd20;
	#50 opcode <= 4'b1010;	a <= 8'd127;
	#50 opcode <= 4'b1010;	a <= -8'd5;
	
	#50 opcode <= 4'b0000;	a <= -8'd1; //pre-load
	
	//A XNOR B
	#200 opcode <= 4'b1011;	a <= -8'd5;
	#50 opcode <= 4'b1011;	a <= 8'd10;
	#50 opcode <= 4'b1011;	a <= 8'd20;
	#50 opcode <= 4'b1011;	a <= 8'd127;
	#50 opcode <= 4'b1011;	a <= -8'd5;
	
	//A GT B
	#200 opcode <= 4'b1100;	a <= -8'd5;
	#50 opcode <= 4'b1100;	a <= 8'd10;
	#50 opcode <= 4'b1100;	a <= 8'd20;
	#50 opcode <= 4'b1100;	a <= 8'd127;
	#50 opcode <= 4'b1100;	a <= -8'd5;
	
	//A LT B
	#200 opcode <= 4'b1101;	a <= -8'd5;
	#50 opcode <= 4'b1101;	a <= 8'd10;
	#50 opcode <= 4'b1101;	a <= 8'd20;
	#50 opcode <= 4'b1101;	a <= 8'd127;
	#50 opcode <= 4'b1101;	a <= -8'd5;
	
	#50 opcode <= 4'b0000;	a <= -8'd13; //pre-load
	
	//A EQ B
	#200 opcode <= 4'b1110;	a <= -8'd13;
	#50 opcode <= 4'b1110;	a <= 8'd1;
	#50 opcode <= 4'b1110;	a <= 8'd0;
	#50 opcode <= 4'b1110;	a <= 8'd0;
	#50 opcode <= 4'b1110;	a <= 8'd1;
	
	//NOT A
	#200 opcode <= 4'b1111;	a <= -8'd5;
	#50 opcode <= 4'b1111;	a <= 8'd10;
	#50 opcode <= 4'b1111;	a <= 8'd20;
	#50 opcode <= 4'b1111;	a <= 8'd127;
	#50 opcode <= 4'b1111;	a <= -8'd5;
	
end

PowerALU DUT(b, opcode, a, clk);

endmodule