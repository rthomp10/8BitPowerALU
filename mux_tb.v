`timescale 1ps/1ps

module mux_tb;
reg signed [7:0] a;
reg signed [7:0] b;
reg signed [7:0] c;
reg unsigned [1:0] ctrl;
wire signed [7:0] s;

initial
	begin
		$dumpfile("mux.vcd");
		$dumpvars(0,DUT);
		$display("   a    b   c  ctrl   s");
		$monitor("%d %d %d %d | %d", a, b, c, ctrl, s);
		
		#0  a = 8'b101; b = 8'd10;  c = 8'd15; ctrl = 2'b00;
		#50 a = 8'b101; b = 8'd10;  c = 8'd15; ctrl = 2'b01;
		#50 a = 8'b101; b = 8'd10;  c = 8'd15; ctrl = 2'b10;
		#50 a = 8'b101; b = 8'd10;  c = 8'd15; ctrl = 2'b11;
		
		#50 $finish;
	end

mux DUT( s, ctrl, a, b, c );

endmodule