`timescale 1ns / 100ps 
`include "tictactoe.sv"
module tictactoetest();
  logic ph1, ph2;
  // Signals from test vectors
  logic reset, ai_en, errEx;
  logic err;
  logic [1:0] xoro_in, row_in, col_in, xoroEx, rowEx, colEx, winEx;
  logic [1:0] xoro_out, row_out, col_out, win;

  // testbench signals
  logic [31:0] vectornum, errors;
  logic [16:0] testvectors[1000:0];

  // instantiate Device Under Test (DUT)
  tictactoe dut(.ph1, .ph2, .reset, .xoro_in, .row_in, .col_in, .ai_en,
                .err, .xoro_out, .row_out, .col_out, .win);

  // generate two-phase clock
  always begin
    ph1 = 0; ph2 = 0; #1;
    ph1 = 1; #4;
    ph1 = 0; #1;
    ph2 = 1; #4;
  end

  // load vectors at start
  initial begin
    $dumpfile("tictactoe.vcd"); // where to dump the results
    $dumpvars(1, ph1, ph2, reset, row_in, col_in, xoro_in, row_out, col_out, xoro_out);
    $readmemb("tictactoe.tv", testvectors); // load test vectors
    vectornum = 0; errors = 0;
    // reset = 1; #17; reset = 0; // come out of reset before cycle 2
  end

  // apply test vectors on rising edge of clk
  always @(posedge ph1) begin
    #1; 
    {reset, xoro_in, row_in, col_in, ai_en, errEx, xoroEx, rowEx, colEx, winEx} = 
                                                     testvectors[vectornum];
    // Display the vector and its number for debugging purposes
    // $display("Test #, Vector: %d, %b", vectornum, testvectors[vectornum]);
  end

  // check results on falling edge of clk
  always @(negedge ph2)
    begin
      if (xoro_out !== xoroEx) begin // registers hold correct values
        $display("Error (vector %3d): row = %h, col = %h, xoro = %h (expected %h)",
	        vectornum, row_out, col_out, xoro_out, xoroEx);
	errors = errors + 1;
      end
      
      if (win !== winEx) begin // win detection
        $display("Error (vector %3d): win = %h (expected %h)", vectornum, win, winEx);
	errors = errors + 1;
      end
      
      if (row_out !== rowEx) begin // output state machine 
        $display("Error (vector %3d): row = %h (expected %h), col = %h", 
            vectornum, row_out, rowEx, col_out);
	errors = errors + 1;
      end

      if (col_out !== colEx) begin // output state machine
        $display("Error (vector %3d): row = %h, col = %h (expected %h)",
            vectornum, row_out, col_out, colEx);
	errors = errors + 1;
      end

      if (err !== errEx) begin // error detection - turn, ai, invalid input, invalid write
        $display("Error (vector %3d): row = %h col = %h xoro = %h, err = %h (expected %h)", 
            vectornum, row_in, col_in, xoro_in, err, errEx);
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
