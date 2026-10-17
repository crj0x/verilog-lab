module full_adder_df (cout, s, a, b, cin);
    output cout, s;
    input a, b, cin;

    assign {cout, s} = {1'b0, a} + {1'b0, b} + {1'b0, cin};
endmodule
