//Module by Ryan Thompson
module PowerALU( b, opcode, a, clk);

//input/output variables
output [7:0] b;
input  [3:0] opcode;
input  [7:0] a;
input clk;

//internal registers and wires
wire [3:0] compare_ctrl;
wire [1:0] andornot_ctrl;
wire       addsub_ctrl;
wire [1:0] mux_ctrl;

//math components to mux wires
wire [7:0] compare2mux;
wire [7:0] andornot2mux;
wire [7:0] addsub2mux;
wire overflow;
wire [7:0] mux2accu;


//Math modules
compare alu_compare( compare2mux, a, b, compare_ctrl );
andornot alu_andornot( andornot2mux, a, b, andornot_ctrl );
adder_subtractor alu_addsub( addsub2mux, overflow, a, b, addsub_ctrl );

control alu_control( opcode, compare_ctrl, andornot_ctrl, addsub_ctrl, mux_ctrl, clk);
mux alu_mux( mux2accu, mux_ctrl, compare2mux, andornot2mux, addsub2mux, overflow );
accumulator alu_accu(b, mux2accu, clk);
endmodule