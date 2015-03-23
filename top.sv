/**
 * Authors: Josh Sanz and Eli Gadd
 * Emails: jsanz@hmc.edu and egadd@hmc.edu
 * Date: 3/22/15
 * 
 * Verilog implementation of a Tic-Tac-Toe game with AI
 */

// top level module containing the entire logic of the chip
 module tictactoe(input logic [1:0] clk,
                  input logic reset,
                  input logic [1:0] xoroin, rowin, colin,
                  input logic ai_en,
                  output logic err,
                  output logic [1:0] xoroout, rowout, colout, win);

    logic write_error;
    logic [17:0] registers;

    // input controller
    inputController incon (clk, reset, xoroin, rowin, colin, win, ai_en,
                            write_error, err);

    // board state registers
    board b (clk, reset, error, xoroin, rowin, colin, registers, write_error);

    // output controller
    outputController outcon (clk, reset, registers, xoroout, rowout, colout);

    // win checker


    // AI logic

endmodule

// The input controller checks for input signal errors and tracks turns
module inputController(input logic [1:0] clk,
                        input logic reset,
                        input logic [1:0] xoro, row, col, win
                        input logic ai_en, write_error
                        output logic error);
    // define states for X, O, and AI turns
    typedef enum logic [1:0] {X, O, AI} statetype;
    statetype [1:0] state, nextstate;

    // internal signals
    logic gameover_err, parse_err, turn_err;

    // turn tracking FSM state register
    always_ff @(posedge clk)
        if (reset) state <= X;
        else       state <= nextstate;

    // error checking logic
    always_comb
        begin
            assign gameover_err = (win[1] | win[0]) & (xoro[1] | xoro[0]);
            assign parse_err = (row[1] & row[0]) | (col[1] & col[0]) | 
                                (xoro[1] & xoro[0]);
            assign turn_err = ((state == X) & xoro[1]) | ((state == O) & xoro[0]) | 
                                ((state == AI) & (xoro[1] | xoro[0]));
            // error goes high when any of these errors are present
            assign error = gameover_err | parse_err | turn_err | write_error;
        end

    // next state logic
    always_comb
        case (state)
            X:          nextstate <= error ? state : ai_en ? AI : O;
            O:          nextstate <= error ? state : X;
            AI:         nextstate <= X;
            default:    nextstate <= X;
        endcase

endmodule

// The output controller contantly cycles through the cells and sends them to
// the output pins
module outputController (
    input logic [1:0] clk,    // two-phase clock
    input logic reset,  
    input logic [17:0] registers,
    output logic [1:0] xoro, row, col
);

    typedef enum logic [3:0] {S0,S1,S2,S3,S4,S5,S6,S7,S8} statetype;
    statetype [3:0] state, nextstate;
    
    // FSM to rotate through cells
    always_ff @(posedge clk)
        if (reset) state <= S0;
        else        state <= nextstate;

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
                    assign row = 2'b00;
                    assign col = 2'b00;
                    assign xoro = registers{1:0};
                end
            S1: begin // row 0 col 1
                    assign row = 2'b00;
                    assign col = 2'b01;
                    assign xoro = registers{3:2};
                end
            S2: begin // row 0 col 2
                    assign row = 2'b00;
                    assign col = 2'b10;
                    assign xoro = registers{5:4};
                end
            S3: begin // row 1 col 0
                    assign row = 2'b01;
                    assign col = 2'b00;
                    assign xoro = registers{7:6};
                end
            S4: begin // row 1 col 1
                    assign row = 2'b01;
                    assign col = 2'b01;
                    assign xoro = registers{9:8};
                end
            S5: begin // row 1 col 2
                    assign row = 2'b01;
                    assign col = 2'b10;
                    assign xoro = registers{11:10};
                end
            S6: begin // row 2 col 0
                    assign row = 2'b10;
                    assign col = 2'b00;
                    assign xoro = registers{13:12};
                end
            S7: begin // row 2 col 1
                    assign row = 2'b10;
                    assign col = 2'b01;
                    assign xoro = registers{15:14};
                end
            S8: begin // row 2 col 2
                    assign row = 2'b10;
                    assign col = 2'b10;
                    assign xoro = registers{17:16};
                end
            default: begin
                    assign row = 2'b00;
                    assign col = 2'b00;
                    assign xoro = registers{1:0};
        endcase
endmodule

// registers with set & error logic
module board (
    input logic [1:0] clk,
    input logic reset, error, 
    input logic [1:0] xoro, row, col, 
    output logic [17:0] registers, 
    output logic write_error
);

    logic [17:0] regset; 
    logic addr00, addr01, addr02, addr10, addr11, addr12, addr20, addr21, addr22;

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
            (addr00 & (registers[1] | registers[0])) | 
            (addr01 & (registers[3] | registers[2])) | 
            (addr02 & (registers[5] | registers[4])) | 
            (addr10 & (registers[7] | registers[6])) | 
            (addr11 & (registers[9] | registers[8])) | 
            (addr12 & (registers[11] | registers[10])) | 
            (addr20 & (registers[13] | registers[12])) | 
            (addr21 & (registers[15] | registers[14])) | 
            (addr22 & (registers[17] | registers[16]));

    // only assign to a register if no errors and it is the addressed pair and it is
    // the appropriate register for x or o
    assign regset[1:0] = addr00 & ~error & ~write_error & xoro;
    assign regset[3:2] = addr01 & ~error & ~write_error & xoro;
    assign regset[5:4] = addr02 & ~error & ~write_error & xoro;
    assign regset[7:6] = addr10 & ~error & ~write_error & xoro;
    assign regset[9:8] = addr11 & ~error & ~write_error & xoro;
    assign regset[11:10] = addr12 & ~error & ~write_error & xoro;
    assign regset[13:12] = addr20 & ~error & ~write_error & xoro;
    assign regset[15:14] = addr21 & ~error & ~write_error & xoro;
    assign regset[17:16] = addr22 & ~error & ~write_error & xoro;
     
    // synchronous reset of registers, or with regset signal for board control
    always_ff @(posedge clk)
        if (reset) registers <= 17'b0;
        else registers <= registers | regset;
endmodule

// sets win output to x or o based if one has won
// assumes only one player will win, otherwise could output either
module winChecker(
    input logic [1:0] clk, 
    input logic [17:0] registers, 
    output logic [1:0] winstate
);

    logic [1:0] vertical, horizontal, diagonal;
    
    // vertical wins
    assign vertical = ((((registers[1:0] == registers[7:6]) & 
                         (registers[7:6] == registers[13:12])) & registers[1:0]) |
                       (((registers[3:2] == registers[9:8]) & 
                         (registers[9:8] == registers[15:14])) & registers[3:2]) |
                       (((registers[5:4] == registers[11:10]) & 
                         (registers[11:10] == registers[17:16])) & registers[5:4]));

    // horizontal wins
    assign horizontal = 
                      ((((registers[1:0] == registers[3:2]) & 
                         (registers[3:2] == registers[5:4])) & registers[1:0]) |
                       (((registers[7:6] == registers[9:8]) & 
                         (registers[9:8] == registers[11:10])) & registers[7:6]) |
                       (((registers[13:12] == registers[15:14]) & 
                         (registers[15:14] == registers[17:16])) & registers[13:12]));

    // diagonal wins
    assign diagonal = ((((registers[1:0] == registers[9:8]) & 
                         (registers[9:8] == registers[17:16])) & registers[1:0]) |
                       (((registers[5:4] == registers[9:8]) & 
                         (registers[9:8] == registers[13:12])) & registers[5:4]));

    // or them together to get win condition
    assign winstate = vertical | horizontal | diagonal;
endmodule