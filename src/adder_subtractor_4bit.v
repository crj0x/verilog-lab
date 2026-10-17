module adder_subtractor_4bit (cout, s, a, b, sel);
    output cout;
    output [3:0] s;
    input [3:0] a, b;
    input sel;

    wire c0, c1, c2;
    wire [3:0] bx;

    assign bx = b ^ {4{sel}};

    // in subtraction,
    // cout = 1 means no borrow, cout = 0 means borrow occurred
    full_adder_gl fa0 (c0, s[0], a[0], bx[0], sel);
    full_adder_gl fa1 (c1, s[1], a[1], bx[1], c0);
    full_adder_gl fa2 (c2, s[2], a[2], bx[2], c1);
    full_adder_gl fa3 (cout, s[3], a[3], bx[3], c2);
endmodule
