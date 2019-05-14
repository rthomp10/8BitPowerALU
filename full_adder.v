module full_adder(s, cout, a, b, cin);

input a,b,cin;
output s,cout;
wire w1, w2, w3;

//Both Circuits
xor(w1, a, b);

// Summation circuit
xor(s, w1, cin);

// carry-out circuit
or(cout, w2, w3);
and(w2, w1, cin);
and(w3, a, b);

endmodule