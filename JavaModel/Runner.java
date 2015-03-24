import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.FileReader;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Arrays;

public class Runner {
    public static void main(String[] args) throws IOException, InterruptedException {
        TicTacToeBoard myBoard = new TicTacToeBoard();

        BufferedReader br = 
            // Read from input
            // new BufferedReader(new InputStreamReader(System.in));
            // Read from inputVecs.txt
            new BufferedReader(new FileReader("../Verilog/tictactoe.tv"));
        PrintWriter writer = new PrintWriter("javaOutputVecs.out", "UTF-8");

        String vector;
        boolean xTurn = true;
        int outputIteration = 0;
        int error = 0;

        while ((vector = br.readLine()) != null) {
            char[] input = Arrays.copyOfRange(vector.toCharArray(), 0, 8);
            char[] expectedOutput = Arrays.copyOfRange(vector.toCharArray(), 9, 18);
            assert(input.length == 8) : Arrays.toString(input);
            assert(expectedOutput.length == 9) : Arrays.toString(expectedOutput);

            // Parse input signals from vector
            boolean reset = (input[0] != '0');
            int player = parseAsInt(Arrays.copyOfRange(input, 1, 3));
            int row = parseAsInt(Arrays.copyOfRange(input, 3, 5));
            int col = parseAsInt(Arrays.copyOfRange(input, 5, 7));
            boolean ai_en = (input[7] != '0');

            // Compute win before putting the move through (1 cycle delay)
            String win = "00";
            if (myBoard.isXWin()) {
                win = "10";
            } else if (myBoard.isOWin()) {
                win = "01";
            } else if (myBoard.isDraw()) {
                win = "11";
            }

            // ERROR if invalid input
            if (player == -1 || row == -1 || col == -1) {
                error = 1;
            } else {
                // RESET
                if (reset) {
                    myBoard = new TicTacToeBoard();
                    xTurn = true;
                    outputIteration = 0;
                    win = "00";
                } else {
                    if (ai_en && xTurn) {
                        // AI makes a move
                        myBoard.makeAIMove();
                        xTurn = false;
                    } else if (ai_en && !xTurn) {
                        // AI cannot go out of turn
                        error = 1;
                    } else if (player == 0) {
                        // make no move
                    } else if (win != "00") {
                        // game won, no moves allowed
                        error = 1;
                    } else if (player == 1 && !xTurn) { // O's turn
                        if (!myBoard.makeOMove(row, col)) {
                            // move fails
                            error = 1;
                        } else {
                            // move succeeds, pass off turn
                            xTurn = true;
                        }
                    } else if (player == 2 && xTurn) { // X's turn
                        if (!myBoard.makeXMove(row, col)) {
                            // move fails
                            error = 1;
                        } else {
                            // move succeeds, pass off turn
                            xTurn = false;
                        }
                    } else {
                        // Move out of turn
                        error = 1;
                    }
                }
            }

            // myBoard.prettyPrint();

            String outputVector = error + myBoard.getOutputVector(outputIteration) + win;
            System.out.println(new String(input) + " - " +
                               outputVector + " - " +
                               new String(expectedOutput));
            writer.println(outputVector);

            // Did we match the prediction?
            if (!new String(expectedOutput).equals(outputVector)) {
                System.out.println("FAIL");
                myBoard.prettyPrint();
            }

            outputIteration = (outputIteration + 1) % 9;
            error = 0;
        }

        writer.close();
    }

    private static int parseAsInt(char[] in) {
        assert(in.length == 2);
        
        if (in[0] == '0' && in[1] == '0') { // 00
            return 0;
        } else if (in[0] == '1') { // 10
            return 2;
        } else if (in[1] == '1') { // 01
            return 1;
        } else { // XX
            return -1;
        }
    }
}