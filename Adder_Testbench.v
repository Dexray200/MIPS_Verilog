module Adder_Testbench();
    reg a;
    reg b;
    reg carryin;
    wire sum;
    wire carry;
    

    adder add(
        .a(a),
        .b(b),
        .CarryIn(carryin),
        .Sum(sum),
        .CarryOut(carry)
    );

	initial begin
        //$dumpvars;
        a = 0;
        b = 0;
        carryin = 0;
        #5
        a = 0;
        b = 0;
        carryin = 1;
        #5
        a = 0;
        b = 1;
        carryin = 0;
        #5
        a = 0;
        b = 1;
        carryin = 1;
        #5
        a = 1;
        b = 0;
        carryin = 0;
        #5
        a = 1;
        b = 0;
        carryin = 1;
        #5
        a = 1;
        b = 1;
        carryin = 0;
        #5
        a = 1;
        b = 1;
        carryin = 1;
        #5
        $finish;
    end
endmodule