import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

import java.util.Arrays;

public class TicTacToeRunner {
    public static void main(String[] args) throws IOException {
        TicTacToeBoard theBoard = new TicTacToeBoard();

        BufferedReader br = 
            new BufferedReader(new InputStreamReader(System.in));
        char[] input;
        int xTurn = 1;

        while ((input = br.readLine().toCharArray()) != null) {
            assert(input.length == 8);
            char reset = input[0];
            char[] playerIn = Arrays.copyOfRange(input, 1, 3);
            char[] rowIn = Arrays.copyOfRange(input, 3, 5);
            char[] colIn = Arrays.copyOfRange(input, 5, 7);
            char ai = input[7];

            int player = parseAsInt(playerIn);
            int row = parseAsInt(rowIn);
            int col = parseAsInt(colIn);

            if (player == 1) { // O's turn
                assert(theBoard.makeOMove(row, col));
            } else if (player == 2) { // X's turn
                assert(theBoard.makeXMove(row, col));
            }

            System.out.println("Move at (" + row + ", " + col + ").");

            xTurn = (xTurn + 1) % 2;
        }
    }

    private static int parseAsInt(char[] in) {
        assert(in.length == 2);
        assert((in[0] != '1') || (in[1] != '1')); // 11
        
        if (in[0] == '1') { // 10
            return 2;
        } else if (in[1] == '1') { // 01
            return 1;
        } else { // 00
            return 0;
        }
    }

}