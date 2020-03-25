`timescale 1 ns / 100 ps
module problem_3_tb();
  /* your code */
  reg clk;
  reg [3:0] x;
  wire [3:0] y;
  integer ii;

  problem_3 #(3) UUT (.clk(clk), .x(x), .y(y));

  reg [20*8-1:0] str;

  always begin
    #5 clk = ~clk;
  end

  initial begin
    if ($value$plusargs("DUMPFILE=%s", str)) begin
      $dumpfile(str);
      $dumpvars(0, UUT);
    end
    clk = 0;

    for (ii=0; ii<2*3; ii=ii+1) begin
      x = (ii + 1); #10;
      $display("x=%b, y=%b,\n", x, y);
    end

    $display("Test done.\n");
    $finish(1);
  end
endmodule
