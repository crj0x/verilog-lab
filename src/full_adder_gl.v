module full_adder_gl (cout, s, a, b, cin);
    output cout, s;
    input a, b, cin;

    wire w1, w2, w3;

    xor (w1, a, b);
    and (w2, cin, w1);
    and (w3, a, b);

    or (cout, w3, w2);
    xor (s, a, b, cin);
endmodule
