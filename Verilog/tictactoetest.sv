`timescale 1ns / 100ps 
`include "tictactoe.sv"
module tictactoetest();
  logic ph1, ph2;
  logic reset, ai_en, errEx;
  logic err;
  logic [1:0] xoroin, rowin, colin, xoroEx, rowEx, colEx, winEx;
  logic [1:0] xoroout, rowout, colout, win;

  logic [31:0] vectornum, errors;
  logic [16:0] testvectors[1000:0];

  // instantiate Device Under Test (DUT)
  tictactoe dut(.ph1, .ph2, .reset, .xoroin, .rowin, .colin, .ai_en,
                .err, .xoroout, .rowout, .colout, .win);

  // generate clock
  always begin
    ph1 = 0; ph2 = 0; #1;
    ph1 = 1; #4;
    ph1 = 0; #1;
    ph2 = 1; #4;
  end

  // load vectors at start
  initial begin
    $dumpfile("tictactoe.vcd"); // where to dump the results
    $dumpvars(1, ph1, ph2, reset, rowin, colin, xoroin, rowout, colout, xoroout);
    $readmemb("tictactoe.tv", testvectors); // load test vectors
    vectornum = 0; errors = 0;
    // reset = 1; #17; reset = 0; // come out of reset before cycle 2
  end

  // apply test vectors on rising edge of clk
  always @(posedge ph1) begin
    #1; 
    {reset, xoroin, rowin, colin, ai_en, errEx, xoroEx, rowEx, colEx, winEx} = 
                                                     testvectors[vectornum];
    $display("Test #, Vector: %h, %b", vectornum, testvectors[vectornum]);
  end

  // check results on falling edge of clk
  always @(negedge ph2)
    begin // skip during reset
      if (xoroout !== xoroEx) begin
        $display("Error: row = %h, col = %h, xoro = %h (expected %h)",
	        rowout, colout, xoroout, xoroEx);
	errors = errors + 1;
      end
      
      if (win !== winEx) begin
        $display("Error: win = %h (expected %h)", win, winEx);
	errors = errors + 1;
      end
      
      if (rowout !== rowEx) begin
        $display("Error: row = %h (expected %h), col = %h", 
            rowout, rowEx, colout);
	errors = errors + 1;
      end

      if (colout !== colEx) begin
        $display("Error: row = %h, col = %h (expected %h)",
            rowout, colout, colEx);
	errors = errors + 1;
      end

      if (err !== errEx) begin
        $display("Error: row = %h col = %h xoro = %h, err = %h (expected %h)", 
            rowin, colin, xoroin, err, errEx);
  errors = errors + 1;
      end

    vectornum = vectornum + 1;
    if (testvectors[vectornum] === 17'bx) begin
      $display("%d tests completed with %d errors", 
        vectornum, errors);
      $dumpflush;
      $finish;
    end
  end
endmodule
