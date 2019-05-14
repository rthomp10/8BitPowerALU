`timescale 1ps/1ps

module andornot_tb;
reg signed [7:0] a;
reg signed [7:0] b;
reg [1:0] ctrl;
wire signed [7:0] s;

initial
	begin
		$dumpfile("andornot.vcd");
		$dumpvars(0,Johnson);
		$display("  a   b ctrl   s  overflow");
		$monitor("%d %d  %d  | %d  %d", a, b, ctrl, s, ctrl);
		
		//and
		#0  a = 8'b101	; b =  8'b000;  ctrl = 2'b00;
		#50 a = 8'b101	; b =  8'b001;  ctrl = 2'b00;
		#50 a = 8'b101	; b =  8'b010;  ctrl = 2'b00;
		#50 a = 8'b101	; b =  8'b100;  ctrl = 2'b00;
		#50 a = 8'b101	; b =  8'b100;  ctrl = 2'b00;
		#50 a = 8'b101	; b =  8'b101;  ctrl = 2'b00;
		#50 a = 8'b101	; b =  -8'b110;  ctrl = 2'b00;
		#50 a = 8'b101	; b =  -8'b111;  ctrl = 2'b00;
		
		//or
		#50  a = 8'b101	; b =  8'b000;   ctrl = 2'b01;
		#50 a = 8'b101	; b =  8'b001;   ctrl = 2'b01;
		#50 a = 8'b101	; b =  8'b010;   ctrl = 2'b01;
		#50 a = 8'b101	; b =  8'b100;   ctrl = 2'b01;
		#50 a = 8'b101	; b =  8'b100;   ctrl = 2'b01;
		#50 a = 8'b101	; b =  8'b101;   ctrl = 2'b01;
		#50 a = 8'b101	; b =  -8'b110;  ctrl = 2'b01;
		#50 a = 8'b101	; b =  -8'b111;  ctrl = 2'b01;
		
		//not
		#50  a = 8'b101	; b =  8'b000;   ctrl = 2'b10;
		#50 a = 8'b101	; b =  8'b001;   ctrl = 2'b10;
		#50 a = 8'b101	; b =  8'b010;   ctrl = 2'b10;
		#50 a = 8'b101	; b =  8'b100;   ctrl = 2'b10;
		#50 a = 8'b101	; b =  8'b100;   ctrl = 2'b10;
		#50 a = 8'b101	; b =  8'b101;   ctrl = 2'b10;
		#50 a = 8'b101	; b =  -8'b110;  ctrl = 2'b10;
		#50 a = 8'b101	; b =  -8'b111;  ctrl = 2'b10;
		
		#50 $finish;
	end

andornot Johnson( s, a, b, ctrl );

endmodule