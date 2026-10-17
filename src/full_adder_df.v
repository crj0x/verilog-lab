module full_adder_df (cout, s, a, b, cin);
    output cout, s;
    input a, b, cin;

    assign {cout, s} = a + b + cin;
endmodule
