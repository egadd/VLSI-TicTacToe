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
            //new BufferedReader(new InputStreamReader(System.in));
            new BufferedReader(new FileReader("inputVecs.txt"));
        BufferedReader outReader =
            new BufferedReader(new FileReader("outputVecs.txt"));
        PrintWriter writer = new PrintWriter("javaOutputVecs.txt", "UTF-8");
        String inputString;
        String expectedOutput;
        int xTurn = 1;
        int outputIteration = 0;
        char error = '0';

        while ((inputString = br.readLine()) != null) {
            expectedOutput = outReader.readLine();

            System.out.print(inputString + " - ");

            char[] input = inputString.toCharArray();
            assert(input.length == 8);
            char reset = input[0];
            int player = parseAsInt(Arrays.copyOfRange(input, 1, 3));
            int row = parseAsInt(Arrays.copyOfRange(input, 3, 5));
            int col = parseAsInt(Arrays.copyOfRange(input, 5, 7));
            char ai = input[7];

            // Compute win before putting the move through (1 cycle delay)
            String win = "00";
            if (myBoard.isXWin()) {
                win = "10";
            } else if (myBoard.isOWin()) {
                win = "01";
            }

            // ERROR if invalid input
            if (player == -1 || row == -1 || col == -1) {
                error = '1';
            } else {
                // RESET
                if (reset == '1') {
                    myBoard = new TicTacToeBoard();
                    xTurn = 1;
                    outputIteration = 0;
                    win = "00";
                } else {
                    if (player == 0) {
                        // make no move
                    } else if (win != "00") {
                        // game won, no moves allowed
                        error = '1';
                    } else if (player == 1 && xTurn == 0) { // O's turn
                        if (!myBoard.makeOMove(row, col)) {
                            // move fails
                            error = '1';
                        } else {
                            // move succeeds, pass off turn
                            xTurn = 1;
                        }
                    } else if (player == 2 && xTurn == 1) { // X's turn
                        if (!myBoard.makeXMove(row, col)) {
                            // move fails
                            error = '1';
                        } else {
                            // move succeeds, pass off turn
                            xTurn = 0;
                        }
                    } else {
                        // Move out of turn
                        error = '1';
                    }
                }
            }

            //myBoard.prettyPrint();

            String outputVector = error + myBoard.getOutputVector(outputIteration) + win;

            System.out.println(outputVector + " - " + expectedOutput);
            writer.println(outputVector);

            if (!expectedOutput.equals(outputVector)) {
                System.out.println("FAIL");
                myBoard.prettyPrint();
            }

            outputIteration = (outputIteration + 1) % 9;
            error = '0';
        }

        writer.close();
    }

    private static int parseAsInt(char[] in) {
        assert(in.length == 2);
        
        if (in[0] == '1' && in[1] == '1') { // 11
            return -1;
        } else if (in[0] == '1') { // 10
            return 2;
        } else if (in[1] == '1') { // 01
            return 1;
        } else { // 00
            return 0;
        }
    }

}