`timescale 1ps/1ps

module full_adder_tb;
reg  a,b,cin;
wire s,cout;

initial
	begin
		$dumpfile("FullAdder.vcd");
		$dumpvars(0,Jacub);
		$display("a  b cin   s cout");
		$monitor("%b  %b  %b  | %b  %b", a, b, cin, s, cout);
		#0  a = 1'b0; b = 1'b0; cin = 1'b0;
		#50 a = 1'b0; b = 1'b0; cin = 1'b1;
		#50 a = 1'b0; b = 1'b1; cin = 1'b0;
		#50 a = 1'b0; b = 1'b1; cin = 1'b1;
		#50 a = 1'b1; b = 1'b0; cin = 1'b0;
		#50 a = 1'b1; b = 1'b0; cin = 1'b1;
		#50 a = 1'b1; b = 1'b1; cin = 1'b0;
		#50 a = 1'b1; b = 1'b1; cin = 1'b1;
		#50 $finish;
	end

full_adder Jacub(s,cout,a,b,cin);

endmodule