`timescale 1ps/1ps

module compare_tb;
reg signed [7:0] a;
reg signed [7:0] b;
reg unsigned [3:0] ctrl;
wire signed [7:0] s;

initial
	begin
		$dumpfile("compare.vcd");
		$dumpvars(0,Johnson);
		$display("   a    b  ctrl     s");
		$monitor("%d %d   %d | %d", a, b, ctrl, s);
		
		//transfer A
		#0  a = 8'b101	; b =  8'b000;  ctrl = 4'd2;
		#50 a = -8'b101	; b =  8'b001;  ctrl = 4'd2;
		#50 a = 8'b0	; b =  8'b010;  ctrl = 4'd2;
		#50 a = 8'd127	; b =  -8'b01;  ctrl = 4'd2;
		
		//increment A
		#50  a = 8'b101	; b =  8'b000;  ctrl = 4'd3;
		#50 a = -8'b101	; b =  8'b001;  ctrl = 4'd3;
		#50 a = 8'b0	; b =  8'b010;  ctrl = 4'd3;
		#50 a = 8'd127	; b =  -8'b01;  ctrl = 4'd3;
		
		//decrement A
		#50 a = 8'b101	; b =  8'b000;  ctrl = 4'd4;
		#50 a = -8'b101	; b =  8'b001;  ctrl = 4'd4;
		#50 a = 8'b0	; b =  8'b010;  ctrl = 4'd4;
		#50 a = 8'd127	; b =  -8'b01;  ctrl = 4'd4;
		
		//1's Compliment on A
		#50 a = 8'd5	; b =  8'b000;  ctrl = 4'd5;
		#50 a = -8'd5	; b =  8'b001;  ctrl = 4'd5;
		#50 a = 8'd127	; b =  8'b000;  ctrl = 4'd5;
		#50 a = -8'd128	; b =  8'b001;  ctrl = 4'd5;
		
		//A NOR B
		#50 a = 8'b101	; b =  8'b000;  ctrl = 4'd6;
		#50 a = -8'b101	; b =  8'b001;  ctrl = 4'd6;
		#50 a = 8'b0	; b =  8'b010;  ctrl = 4'd6;
		#50 a = 8'd127	; b =  -8'b01;  ctrl = 4'd6;
		
		//A XOR B
		#50 a = 8'b101	; b =  8'b000;  ctrl = 4'd7;
		#50 a = -8'b101	; b =  8'b001;  ctrl = 4'd7;
		#50 a = 8'b0	; b =  8'b010;  ctrl = 4'd7;
		#50 a = 8'd127	; b =  -8'b01;  ctrl = 4'd7;
		
		//A XNOR B
		#50 a = 8'b101	; b =  8'b000;  ctrl = 4'd8;
		#50 a = -8'b101	; b =  8'b001;  ctrl = 4'd8;
		#50 a = 8'b0	; b =  8'b010;  ctrl = 4'd8;
		#50 a = 8'd127	; b =  -8'b01;  ctrl = 4'd8;
		
		//A GT B
		#50 a = 8'b101	; b =  8'b000;  ctrl = 4'd9;
		#50 a = -8'b101	; b =  8'b001;  ctrl = 4'd9;
		#50 a = 8'b0	; b =  8'b010;  ctrl = 4'd9;
		#50 a = 8'd127	; b =  -8'b01;  ctrl = 4'd9;
		
		//A LT B
		#50 a = 8'b101	; b =  8'b000;  ctrl = 4'd10;
		#50 a = -8'b101	; b =  8'b001;  ctrl = 4'd10;
		#50 a = 8'b0	; b =  8'b010;  ctrl = 4'd10;
		#50 a = 8'd127	; b =  -8'b01;  ctrl = 4'd10;
		
		//A EQ B
		#50 a = 8'b101	; b =  8'b101;  ctrl = 4'd11;
		#50 a = -8'b101	; b =  -8'b101;  ctrl = 4'd11;
		#50 a = 8'b0	; b =  8'b010;  ctrl = 4'd11;
		#50 a = 8'd127	; b =  -8'b01;  ctrl = 4'd11;
		
		#50 $finish;
	end

compare Johnson( s, a, b, ctrl );

endmodule