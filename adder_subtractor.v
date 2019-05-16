//Module by Ryan Thompson
//https://tinyurl.com/y435nrgr
module adder_subtractor( s, overflow, a, b, op);
input [7:0] a; //var1
input [7:0] b; //var2
output[7:0] s; //output
output overflow; //indicates if there was an over flow
input op;      // 0 -> a+b, 1 -> a-b

//Carry and xor wires
wire [6:0] carry;
wire [7:0]  bxor;
wire last_cout;

//xor chain for subtraction (take a look at the diagram)
xor(bxor[0], b[0], op);
xor(bxor[1], b[1], op);
xor(bxor[2], b[2], op);
xor(bxor[3], b[3], op);
xor(bxor[4], b[4], op);
xor(bxor[5], b[5], op);
xor(bxor[6], b[6], op);
xor(bxor[7], b[7], op);

//The cascaded full adders
full_adder a0(s[0], carry[0], a[0], bxor[0], op);
full_adder a1(s[1], carry[1], a[1], bxor[1], carry[0]);
full_adder a2(s[2], carry[2], a[2], bxor[2], carry[1]);
full_adder a3(s[3], carry[3], a[3], bxor[3], carry[2]);
full_adder a4(s[4], carry[4], a[4], bxor[4], carry[3]);
full_adder a5(s[5], carry[5], a[5], bxor[5], carry[4]);
full_adder a6(s[6], carry[6], a[6], bxor[6], carry[5]);
full_adder a7(s[7], last_cout,a[7], bxor[7], carry[6]);

//xor that manages overflow
xor(overflow, carry[6], last_cout);

endmodule