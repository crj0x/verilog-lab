module adder_4bit (cout, s, a, b);
    output cout;
    output [3:0] s;
    input [3:0] a, b;

    wire c0, c1, c2;

    full_adder_gl fa0 (c0, s[0], a[0], b[0], 1'b0);
    full_adder_gl fa1 (c1, s[1], a[1], b[1], c0);
    full_adder_gl fa2 (c2, s[2], a[2], b[2], c1);
    full_adder_gl fa3 (cout, s[3], a[3], b[3], c2);
endmodule
