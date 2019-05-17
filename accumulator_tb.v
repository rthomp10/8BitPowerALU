`timescale 1ps/1ps

module accumulator_tb;
reg signed [7:0] in;
reg unsigned clk;
wire signed [7:0] s;

initial
	begin
		$dumpfile("accumulator.vcd");
		$dumpvars(0,DUT);
		$display("  in   clk    s");
		$monitor("%d %d | %d", in, clk, s);
		clk <= 0;
		in  <= 0;
		
		#0  in = 8'd10;  #50 clk = 1; #50 clk = 0;
		#50 in = 8'd20;  #50 clk = 1; #50 clk = 0;
		#50 in = 8'd127; #50 clk = 1; #50 clk = 0;
		#50 in = -8'd50; #50 clk = 1; #50 clk = 0;
		
		#50 $finish;
	end

accumulator DUT( s, clk, in);

endmodule