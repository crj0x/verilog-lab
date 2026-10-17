module mag_comparator_4bit_gl (lt, gt, eq, a, b);
    output lt, gt, eq;
    input [3:0] a, b;

    wire [3:0] na, nb;

    not (na[3], a[3]);
    not (na[2], a[2]);
    not (na[1], a[1]);
    not (na[0], a[0]);

    not (nb[3], b[3]);
    not (nb[2], b[2]);
    not (nb[1], b[1]);
    not (nb[0], b[0]);

    wire [3:0] p, q;

    and (p[3], na[3], b[3]);
    and (p[2], na[2], b[2]);
    and (p[1], na[1], b[1]);
    and (p[0], na[0], b[0]);

    and (q[3], a[3], nb[3]);
    and (q[2], a[2], nb[2]);
    and (q[1], a[1], nb[1]);
    and (q[0], a[0], nb[0]);

    wire [3:0] x;

    nor (x[3], p[3], q[3]);
    nor (x[2], p[2], q[2]);
    nor (x[1], p[1], q[1]);
    nor (x[0], p[0], q[0]);

    wire w1, w2, w3, w4, w5, w6;

    and (w1, x[3], p[2]);
    and (w2, x[3], q[2]);
    and (w3, x[3], x[2], p[1]);
    and (w4, x[3], x[2], q[1]);
    and (w5, x[3], x[2], x[1], p[0]);
    and (w6, x[3], x[2], x[1], q[0]);

    or (lt, p[3], w1, w3, w5);
    or (gt, q[3], w2, w4, w6);
    and (eq, x[3], x[2], x[1], x[0]);
endmodule
