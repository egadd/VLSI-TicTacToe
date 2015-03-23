/**
 * Authors: Josh Sanz and Eli Gadd
 * Emails: jsanz@hmc.edu and egadd@hmc.edu
 * Date: 3/22/15
 * 
 * Verilog implementation of a Tic-Tac-Toe game with AI
 */

// top level module containing the entire logic of the chip
 module tictactoe(input [1:0] clk,
                  input reset,
                  input [1:0] xoroin, rowin, colin,
                  input ai_en,
                  output err,
                  output [1:0] xoroout, rowout, colout, win);

    wire write_error;
    wire [17:0] registers;

    // input controller
    inputController incon (clk, reset, xoroin, rowin, colin, win, ai_en,
                            write_error, err);

    // board state registers
    board b (clk, reset, error, xoroin, rowin, colin, registers, write_error);

    // output controller
    outputController outcon (clk, reset, registers, xoroout, rowout, colout);

    // win checker
    winChecker wc (clk, registers, win);

    // AI logic

endmodule

// The input controller checks for input signal errors and tracks turns
module inputController(input [1:0] clk,
                        input reset,
                        input [1:0] xoro, row, col, win,
                        input ai_en, write_error,
                        output error);
    // define states for X, O, and AI turns
    // typedef enum wire [1:0] {X, O, AI} statetype;
    // statetype [1:0] state, nextstate;
    // List states
    parameter X = 2'b00;
    parameter O = 2'b01;
    parameter AI = 2'b10;
    wire [1:0] state, nextstate;

    // internal signals
    wire gameover_err, parse_err, turn_err;

    // turn tracking FSM state register
    always @(posedge clk)
        if (reset) state <= ai_en ? AI : X;
        else       state <= nextstate;

    // error checking logic
    always @(*)
        begin
            gameover_err = (win[1] | win[0]) & (xoro[1] | xoro[0]);
            parse_err = (row[1] & row[0]) | (col[1] & col[0]) | 
                                (xoro[1] & xoro[0]);
            turn_err = ((state == X) & xoro[1]) | ((state == O) & xoro[0]) | 
                                ((state == AI) & (xoro[1] | xoro[0]));
            // error goes high when any of these errors are present
            error = gameover_err | parse_err | turn_err | write_error;
        end

    // next state logic
    always @(*)
        case (state)
            X:          nextstate <= error ? state : O;
            O:          nextstate <= error ? state : ai_en ? AI : X;
            AI:         nextstate <= O;
            default:    nextstate <= X;
        endcase

endmodule

// The output controller contantly cycles through the cells and sends them to
// the output pins
module outputController (
    input [1:0] clk,    // two-phase clock
    input reset,  
    input [17:0] registers,
    output [1:0] xoro, row, col
);
    
    wire xo, r, c;
    // typedef enum logic [3:0] {S0,S1,S2,S3,S4,S5,S6,S7,S8} statetype;
    // statetype [3:0] state, nextstate;
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
    wire [3:0] state, nextstate;

    // FSM to rotate through cells
    always @(posedge clk)
        if (reset) state <= S0;
        else        state <= nextstate;

    // next state logic
    always @(*)
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
    always @(*)
        case (state)
            S0: begin // row 0 col 0
                    r = 2'b00;
                    c = 2'b00;
                    xo = registers[1:0];
                end
            S1: begin // r 0 c 1
                    r = 2'b00;
                    c = 2'b01;
                    xo = registers[3:2];
                end
            S2: begin // r 0 c 2
                    r = 2'b00;
                    c = 2'b10;
                    xo = registers[5:4];
                end
            S3: begin // r 1 c 0
                    r = 2'b01;
                    c = 2'b00;
                    xo = registers[7:6];
                end
            S4: begin // r 1 c 1
                    r = 2'b01;
                    c = 2'b01;
                    xo = registers[9:8];
                end
            S5: begin // r 1 c 2
                    r = 2'b01;
                    c = 2'b10;
                    xo = registers[11:10];
                end
            S6: begin // r 2 c 0
                    r = 2'b10;
                    c = 2'b00;
                    xo = registers[13:12];
                end
            S7: begin // r 2 c 1
                    r = 2'b10;
                    c = 2'b01;
                    xo = registers[15:14];
                end
            S8: begin // r 2 c 2
                    r = 2'b10;
                    c = 2'b10;
                    xo = registers[17:16];
                end
            default: begin
                    r = 2'b00;
                    c = 2'b00;
                    xo = registers[1:0];
        endcase

    assign row = r;
    assign col = c;
    assign xoro = xo;
endmodule

// registers with set & error logic
module board (
    input [1:0] clk,
    input reset, error, 
    input [1:0] xoro, row, col, 
    output [17:0] registers, 
    output write_error
);

    wire [17:0] regset; 
    wire addr00, addr01, addr02, addr10, addr11, addr12, addr20, addr21, addr22;

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
    always @(posedge clk)
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