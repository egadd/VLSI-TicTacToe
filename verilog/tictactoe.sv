/**
 * Authors: Josh Sanz and Eli Gadd
 * Emails: jsanz@hmc.edu and egadd@hmc.edu
 * Date: 3/22/15
 * 
 * Verilog implementation of a Tic-Tac-Toe game with AI
 */

// top level module containing the entire logic of the chip
 module tictactoe(input logic ph1, ph2,
                  input logic reset,
                  input logic [1:0] xoro_in, row_in, col_in,
                  input logic ai_en,
                  output logic err,
                  output logic [1:0] xoro_out, row_out, col_out, win);

    // 2 registers per board space, one for X high, one for O high
    logic [17:0] registers;

    // the AI's next move based on the current board state
    // calculate regardless of whether the AI is making a move or not
    logic [1:0] row_ai, col_ai;

    // the values to write to the registers
    // if ai_en and X's turn, equal to *_ai
    // else equal to *_in
    logic [1:0] xoro_write, row_write, col_write;

    // error if the input is invalid
    //  * ai_en high when not X's turn
    //  * move out of turn
    //  * invalid row, col, or player (11)
    //  * move when game over
    logic input_error;

    // error if trying to write to a space that already has an X or O
    logic write_error;


    // input controller
    inputController incon (ph1, ph2, reset,
                            xoro_in, row_in, col_in, win, ai_en, 
                            write_error,
                            row_ai, col_ai,
                            xoro_write, row_write, col_write,
                            input_error, err);

    // board state registers
    board b (ph1, ph2, reset, input_error,
              xoro_write, row_write, col_write,
              registers, write_error);

    // output controller
    outputController outcon (ph1, ph2, reset, registers, xoro_out, row_out, col_out);

    // win checker
    winChecker wc (reset, registers, win);

    // AI logic
    ai genius (registers, row_ai, col_ai);


endmodule

// The input controller checks for input signal errors and tracks turns
module inputController(input logic ph1, ph2,        // two phase clock
                        input logic reset,
                        input logic [1:0] xoro_in, row_in, col_in, win,
                        input logic ai_en, write_err, 
                        input logic [1:0] row_ai, col_ai, 
                        output logic [1:0] xoro_write, row_write, col_write, 
                        output logic input_err, err);
    // store the current turn, the next turn
    // turn == 0 => X's turn
    // turn == 1 => O's turn
    logic turn;

    logic gameover_err;        // writing when the game is over
    logic parse_err;           // invalid xoro, row, col input (11)
    logic turn_err;            // move out of turn
    logic ai_err;              // ai move out of turn
    logic full_err;            // OR of all above errors + write_err (passed in)
    logic write_att;           // high if attempting to make a manual move
    logic write_enable;

    // turn tracking FSM state register
    flopenr #1 statereg(ph1, ph2, reset, write_enable, ~turn, turn);

    // error checking logic
    // some errors only happen if we are trying to write
    assign write_att = xoro_in[1] | xoro_in[0];

    // Check inputs for validity, correct turn, and not a completed game
    assign gameover_err = (win[1] | win[0]) & (write_att | ai_en);
    assign parse_err = (row_in[1] & row_in[0]) | (col_in[1] & col_in[0]) | 
                        (xoro_in[1] & xoro_in[0]);
    assign turn_err = (~turn & xoro_in[0]) | (turn & xoro_in[1]);
    assign ai_err = turn & ai_en;
    
    // input_error goes high when any of these errors are present
    assign input_err = gameover_err | parse_err | turn_err | ai_err;
    
    // if there are any errors including write, must block writes
    assign err = input_err | write_err;

    // only enable the register if no error & write to save power
    assign write_enable = (write_att | (ai_en & ~turn)) & ~err;

    // write source selection
    assign xoro_write = ai_en ? 2'b10: xoro_in;
    assign row_write = ai_en ? row_ai : row_in;
    assign col_write = ai_en ? col_ai : col_in;

endmodule

// The output controller contantly cycles through the cells and sends them to
// the output pins
module outputController (
    input logic ph1, ph2,    // two-phase clock
    input logic reset,  
    input logic [17:0] registers,
    output logic [1:0] xoro, row, col
);

    // List states
    parameter S0 = 4'b0000;
    parameter S1 = 4'b0001;
    parameter S2 = 4'b0010;
    parameter S3 = 4'b0011;
    parameter S4 = 4'b0100;
    parameter S5 = 4'b0101;
    parameter S6 = 4'b0110;
    parameter S7 = 4'b0111;
    parameter S8 = 4'b1000;
    logic [3:0] state, nextstate;

    // Register to hold the state for the FSM
    flopenr #4 statereg(ph1, ph2, reset, 1'b1, nextstate, state);

    // next state logic
    always_comb
        case (state)
            S0:     nextstate <= S1;
            S1:     nextstate <= S2;
            S2:     nextstate <= S3;
            S3:     nextstate <= S4;
            S4:     nextstate <= S5;
            S5:     nextstate <= S6;
            S6:     nextstate <= S7;
            S7:     nextstate <= S8;
            S8:     nextstate <= S0;
            default: nextstate <= S0;
        endcase

    // set output vectors based on current state
    always_comb
        case (state)
            S0: begin // row 0 col 0
                    row = 2'b00;
                    col = 2'b00;
                    xoro = registers[1:0];
                end
            S1: begin // r 0 c 1
                    row = 2'b00;
                    col = 2'b01;
                    xoro = registers[3:2];
                end
            S2: begin // r 0 c 2
                    row = 2'b00;
                    col = 2'b10;
                    xoro = registers[5:4];
                end
            S3: begin // r 1 c 0
                    row = 2'b01;
                    col = 2'b00;
                    xoro = registers[7:6];
                end
            S4: begin // r 1 c 1
                    row = 2'b01;
                    col = 2'b01;
                    xoro = registers[9:8];
                end
            S5: begin // r 1 c 2
                    row = 2'b01;
                    col = 2'b10;
                    xoro = registers[11:10];
                end
            S6: begin // r 2 c 0
                    row = 2'b10;
                    col = 2'b00;
                    xoro = registers[13:12];
                end
            S7: begin // r 2 c 1
                    row = 2'b10;
                    col = 2'b01;
                    xoro = registers[15:14];
                end
            S8: begin // r 2 c 2
                    row = 2'b10;
                    col = 2'b10;
                    xoro = registers[17:16];
                end
            default: begin
                    row = 2'b00;
                    col = 2'b00;
                    xoro = registers[1:0];
            end
        endcase
endmodule

// registers with set & error logic
module board (
    input logic ph1, ph2,              // two phase clock
    input logic reset, input_error, 
    input logic [1:0] xoro, row, col, 
    output logic [17:0] registers, 
    output logic write_error
);

    // logic [17:0] regset; 
    logic addr00, addr01, addr02, addr10, addr11, addr12, addr20, addr21, addr22;
    logic en00, en01, en02, en10, en11, en12, en20, en21, en22;
    logic do_write;

    // Only calculate many of the below signals if trying to make a turn
    // (write to the board)
    assign do_write = xoro[1] | xoro[0];

    // calculate address enable bits for each pair of registers
    assign addr00 = (row == 2'b00) & (col == 2'b00);
    assign addr01 = (row == 2'b00) & (col == 2'b01);
    assign addr02 = (row == 2'b00) & (col == 2'b10);
    assign addr10 = (row == 2'b01) & (col == 2'b00);
    assign addr11 = (row == 2'b01) & (col == 2'b01);
    assign addr12 = (row == 2'b01) & (col == 2'b10);
    assign addr20 = (row == 2'b10) & (col == 2'b00);
    assign addr21 = (row == 2'b10) & (col == 2'b01);
    assign addr22 = (row == 2'b10) & (col == 2'b10);

    // if a register is being written to but it already holds X or O, bad news bears
    assign write_error = 
          (((addr00 & (registers[1] | registers[0])) | 
            (addr01 & (registers[3] | registers[2])) | 
            (addr02 & (registers[5] | registers[4])) | 
            (addr10 & (registers[7] | registers[6])) | 
            (addr11 & (registers[9] | registers[8])) | 
            (addr12 & (registers[11] | registers[10])) | 
            (addr20 & (registers[13] | registers[12])) | 
            (addr21 & (registers[15] | registers[14])) | 
            (addr22 & (registers[17] | registers[16]))) & do_write);

    assign en00 = addr00 & ~input_error & ~write_error & do_write;
    assign en01 = addr01 & ~input_error & ~write_error & do_write;
    assign en02 = addr02 & ~input_error & ~write_error & do_write;
    assign en10 = addr10 & ~input_error & ~write_error & do_write;
    assign en11 = addr11 & ~input_error & ~write_error & do_write;
    assign en12 = addr12 & ~input_error & ~write_error & do_write;
    assign en20 = addr20 & ~input_error & ~write_error & do_write;
    assign en21 = addr21 & ~input_error & ~write_error & do_write;
    assign en22 = addr22 & ~input_error & ~write_error & do_write;
     
    // Registers only enabled when a write is valid, then they take on the xoro 
    // signal that is being written.
    flopenr #2 boardmem0 (ph1, ph2, reset, en00, xoro, registers[1:0]);
    flopenr #2 boardmem1 (ph1, ph2, reset, en01, xoro, registers[3:2]);
    flopenr #2 boardmem2 (ph1, ph2, reset, en02, xoro, registers[5:4]);
    flopenr #2 boardmem3 (ph1, ph2, reset, en10, xoro, registers[7:6]);
    flopenr #2 boardmem4 (ph1, ph2, reset, en11, xoro, registers[9:8]);
    flopenr #2 boardmem5 (ph1, ph2, reset, en12, xoro, registers[11:10]);
    flopenr #2 boardmem6 (ph1, ph2, reset, en20, xoro, registers[13:12]);
    flopenr #2 boardmem7 (ph1, ph2, reset, en21, xoro, registers[15:14]);
    flopenr #2 boardmem8 (ph1, ph2, reset, en22, xoro, registers[17:16]);

endmodule


// sets win output to x or o based if one has won
// assumes only one player will win, otherwise could output either
module winChecker(
    input logic reset,
    input logic [17:0] registers, 
    output logic [1:0] winstate
);

    logic [1:0] vertical, horizontal, diagonal, win, tie;
    
    // vertical wins - if all three cells in a column match then set the win logic
    //                 to the value in the registers. If they are empty, this still
    //                 works since the condition will be low.
    assign vertical = ((((registers[1:0] == registers[7:6]) & 
                         (registers[7:6] == registers[13:12])) ? registers[1:0] : 2'b00) |
                       (((registers[3:2] == registers[9:8]) & 
                         (registers[9:8] == registers[15:14])) ? registers[3:2] : 2'b00) |
                       (((registers[5:4] == registers[11:10]) & 
                         (registers[11:10] == registers[17:16])) ? registers[5:4] : 2'b00));

    // horizontal wins - all three cells in a row are equal.
    assign horizontal = 
                      ((((registers[1:0] == registers[3:2]) & 
                         (registers[3:2] == registers[5:4])) ? registers[1:0] : 2'b00) |
                       (((registers[7:6] == registers[9:8]) & 
                         (registers[9:8] == registers[11:10])) ? registers[7:6] : 2'b00) |
                       (((registers[13:12] == registers[15:14]) & 
                         (registers[15:14] == registers[17:16])) ? registers[13:12] : 2'b00));

    // diagonal wins - all three cells on a diagonal are equal.
    assign diagonal = ((((registers[1:0] == registers[9:8]) & 
                         (registers[9:8] == registers[17:16])) ? registers[1:0] : 2'b00) |
                       (((registers[5:4] == registers[9:8]) & 
                         (registers[9:8] == registers[13:12])) ? registers[5:4] : 2'b00));

    // or them together to get win condition
    assign win = vertical | horizontal | diagonal;

    // tie if all full
    always_comb
        // If the game hasn't been won, check if every cell is occupied
        if (~(win[1] | win[0])) begin
            if ((registers[1] | registers[0]) & (registers[3] | registers[2]) &
                (registers[5] | registers[4]) & (registers[7] | registers[6]) &
                (registers[9] | registers[8]) & (registers[11] | registers[10]) &
                (registers[13] | registers[12]) & (registers[15] | registers[14]) &
                (registers[17] | registers[16]))   
                 tie = 2'b11; // If all are occupied, the game was a draw.
            else tie = 2'b00; // Else the game can continue.
        end

    // We want to pull the win state low on reset without waiting for the board
    // registers to update on the next clock cycle.
    assign winstate = tie | win;
endmodule

// The ai module outputs a suggested move based on the current state of the board
// The ai's first move is always to the top left corner
module ai ( input logic [17:0] registers, 
            output logic [1:0] row, col);

    logic [3:0] cellnum;

    logic [8:0] notoccupied;
    // notoccupied is low when the board has a move (X or O) in the corresponding cell
    // used to determine move sequences for AI
    assign notoccupied = ~{
        (registers[17] | registers[16]), (registers[15] | registers[14]), 
        (registers[13] | registers[12]), (registers[11] | registers[10]), 
        (registers[9] | registers[8]), (registers[7] | registers[6]), 
        (registers[5] | registers[4]), (registers[3] | registers[2]), 
        (registers[1] | registers[0]) 
    };

    always_comb
        begin
            if (registers[10]) // O in cell 6, single case
                casex (notoccupied)
                    9'bxxxxxxxx1: begin row <= 2'b00; col <= 2'b00; end
                    // second move bottom left
                    9'bxx1xxxxx0: begin row <= 2'b10; col <= 2'b00; end
                    // third move middle for the fork
                    9'bxx0x1xxx0: begin row <= 2'b01; col <= 2'b01; end
                    // next moves remaining corners for the win
                    9'bxx0x0x1x0: begin row <= 2'b00; col <= 2'b10; end
                    9'b1x0x0x0x0: begin row <= 2'b10; col <= 2'b10; end
                    // remaining moves just in case AI called while game in progress
                    9'b0x0x0x000: begin row <= 2'b00; col <= 2'b01; end
                    9'b0x0x01010: begin row <= 2'b01; col <= 2'b00; end
                    9'b010x00010: begin row <= 2'b10; col <= 2'b01; end
                    9'b000000010: begin row <= 2'b01; col <= 2'b10; end
                    default: begin row <= 2'b11; col <= 2'b11; end
                endcase
            else if (registers[12] | (registers[6] & ~registers[13])) 
                // two part case - O moves to cells 4 or 7
                casex (notoccupied)
                    9'bxxxxxxxx1: begin row <= 2'b00; col <= 2'b00; end
                    // second move top right
                    9'bxxxxxx1x0: begin row <= 2'b00; col <= 2'b10; end
                    // third move middle right
                    9'bxxx1xx0x0: begin row <= 2'b01; col <= 2'b10; end
                    // then take lower two-thirds of middle column
                    9'bx1x0xx0x0: begin row <= 2'b10; col <= 2'b01; end
                    9'bx0x01x0x0: begin row <= 2'b01; col <= 2'b01; end
                    // rest of moves already have tie guaranteed
                    9'bx0x0010x0: begin row <= 2'b01; col <= 2'b00; end
                    9'bx010000x0: begin row <= 2'b10; col <= 2'b00; end
                    9'bx00000010: begin row <= 2'b00; col <= 2'b01; end
                    9'b100000000: begin row <= 2'b10; col <= 2'b10; end
                    default: begin row <= 2'b01; col <= 2'b00; end
                endcase
            else
                // default case, no special changes due to O's first move
                casex (notoccupied)
                    9'bxxxxxxxx1: begin row <= 2'b00; col <= 2'b00; end
                    // second move to bottom left corner
                    9'bxx1xxxxx0: begin row <= 2'b10; col <= 2'b00; end
                    // then the middle right edge - can now always tie
                    9'bxx01xxxx0: begin row <= 2'b01; col <= 2'b10; end
                    // make sure to grab one cell in the center column
                    9'bxx001xxx0: begin row <= 2'b01; col <= 2'b01; end
                    9'bxx000xx10: begin row <= 2'b00; col <= 2'b01; end
                    9'bx1000xx00: begin row <= 2'b10; col <= 2'b01; end
                    // rest of moves don't matter, tie is guaranteed
                    9'bx0000x100: begin row <= 2'b00; col <= 2'b10; end
                    9'b10000x000: begin row <= 2'b10; col <= 2'b10; end
                    9'b000001000: begin row <= 2'b01; col <= 2'b00; end
                    default: begin row <= 2'b10; col <= 2'b00; end
                endcase
        end

endmodule

// Modules provided by Prof Harris
module flop #(parameter WIDTH = 8)
        (input ph1, ph2,
         input [WIDTH-1:0] d,
         output [WIDTH-1:0] q);

    wire [WIDTH-1:0] mid;
    latch #(WIDTH) master(ph2, d, mid);
    latch #(WIDTH) slave(ph1, mid, q);
endmodule

module flopen #(parameter WIDTH = 8)
         (input ph1, ph2, en,
         input [WIDTH-1:0] d,
         output [WIDTH-1:0] q);

    wire [WIDTH-1:0] d2;
    mux2 #(WIDTH) enmux(q, d, en, d2);
    flop #(WIDTH) f(ph1, ph2, d2, q);
endmodule

module flopenr #(parameter WIDTH = 8)
        (input ph1, ph2, reset, en,
        input [WIDTH-1:0] d,
        output [WIDTH-1:0] q);

    wire [WIDTH-1:0] d2, resetval;
    assign resetval = 0;
    mux3 #(WIDTH) enrmux(q, d, resetval, {reset, en}, d2);
    flop #(WIDTH) f(ph1, ph2, d2, q);
endmodule

module flopenrval #(parameter WIDTH = 8)
        (input ph1, ph2, reset, en,
        input [WIDTH-1:0] resetval,
        input [WIDTH-1:0] d,
        output [WIDTH-1:0] q);

    wire [WIDTH-1:0] d2;
    mux3 #(WIDTH) enrmux(q, d, resetval, {reset, en}, d2);
    flop #(WIDTH) f(ph1, ph2, d2, q);
endmodule

module latch #(parameter WIDTH = 8)
        (input ph,
        input [WIDTH-1:0] d,
        output reg [WIDTH-1:0] q);

    always@(*) 
        if (ph) q <= d;
endmodule

module mux2 #(parameter WIDTH = 8)
        (input [WIDTH-1:0] d0, d1,
         input s,
         output [WIDTH-1:0] y);

    assign y = s ? d1 : d0;
endmodule

module mux3 #(parameter WIDTH = 8)
    (input [WIDTH-1:0] d0, d1, d2,
     input [1:0] s,
     output reg [WIDTH-1:0] y);

    always@(*)
        casez (s)
            2'b00: y = d0;
            2'b01: y = d1;
            2'b1?: y = d2;
        endcase
endmodule
