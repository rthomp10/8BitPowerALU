`timescale 1ps/1ps

module adder_subtractor_tb;
reg signed [7:0] a;
reg signed [7:0] b;
reg op;
wire signed [7:0] s;
wire overflow;

initial
	begin
		$dumpfile("adder_subtractor.vcd");
		$dumpvars(0,Johnson);
		$display("  a   b op     s overflow");
		$monitor("%d %d  %d  | %d  %d", a, b, op, s, overflow);
		
		//edge cases around 0
		#0  a = 8'b1; 	b =  8'd1; 	op = 1'b0;
		#50 a = 8'd1;  	b =  8'd1; 	op = 1'b1;
		#50 a = 8'd1;  	b = -8'd1; 	op = 1'b0;
		#50 a = 8'd1;  	b = -8'd1; 	op = 1'b1;
		#50 a = -8'd1; 	b =  8'd1; 	op = 1'b0;
		#50 a = -8'd1; 	b =  8'd1; 	op = 1'b1;
		#50 a = -8'd1; 	b = -8'd1; 	op = 1'b0;
		#50 a = -8'd1; 	b = -8'd1; 	op = 1'b1;
		
		//edge cases around 128
		#50 a =  8'd127;	b =  8'd1; 	op = 1'b0;
		#50 a =  8'd127;	b =  8'd1; 	op = 1'b1;
		#50 a =  8'd127;	b = -8'd1; 	op = 1'b0;
		#50 a =  8'd127;	b = -8'd1;  op = 1'b1;
		#50 a = -8'd127;	b =  8'd1; 	op = 1'b0;
		#50 a = -8'd127;	b =  8'd1; 	op = 1'b1;
		#50 a = -8'd127;	b = -8'd1; 	op = 1'b0;
		#50 a = -8'd127;	b = -8'd1; 	op = 1'b1;
		#50 $finish;
	end

adder_subtractor Johnson(s,overflow,a,b,op);

endmodule