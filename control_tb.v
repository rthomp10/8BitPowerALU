module control_tb;

reg D;
reg clk;
wire Q;

initial begin
	D   = 0;
	clk = 0;
end
	
always begin
	#10 clk =! clk;
end
	
initial begin
	$monitor("%b, %b, %b", clk, Q, D);
	$dumpfile("control.vcd");
	$dumpvars;
	#5	D = 1'b0;
	#30 D = 1'b1;
	#40 D = 1'b0;
	#10 D = 1'b1;
	#20 D = 1'b0;
	#10 D = 1'b1;
	#10 D = 1'b0;
	#10 D = 1'b1;
	#10 $finish;
end
control DFF1( D, clk, Q );
endmodule
