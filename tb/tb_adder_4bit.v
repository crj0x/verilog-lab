module tb_adder_4bit;
    reg [3:0] a, b;
    wire cout;
    wire [3:0] s;

    reg expected_cout;
    reg [3:0] expected_s;

    adder_4bit dut (cout, s, a, b);

    integer i, j;

    initial begin
        for (i = 0; i < 16; i++) begin
            for (j = 0; j < 16; j++) begin
                a = i;
                b = j;
                {expected_cout, expected_s} = a + b;

                #5;

                if ({expected_cout, expected_s} !== {cout, s})
                    $display("FAIL: a=%b, b=%b, cout=%b, s=%b", a, b, cout, s);
                else
                    $display("PASS: a=%b, b=%b, cout=%b, s=%b", a, b, cout, s);
            end
        end
        $finish;
    end

    initial begin
        $dumpfile("tb_adder_4bit.vcd");
        $dumpvars;
    end
endmodule
