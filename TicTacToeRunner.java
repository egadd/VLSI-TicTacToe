import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.IOException;

public class TicTacToeRunner {
    public static void main(String[] args) throws IOException {
        TicTacToeBoard theBoard = new TicTacToeBoard();

        BufferedReader br = 
            new BufferedReader(new InputStreamReader(System.in));

        int xTurn = 0;

        while (true) {
            char[] playerIn = br.readLine().toCharArray();
            char[] rowIn = br.readLine().toCharArray();
            char[] colIn = br.readLine().toCharArray();

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
        System.out.println(in);
        assert((in[0] != '1') || (in[1] != '1'));
        
        if (in[0] == '1') {
            return 1;
        } else if (in[1] == '1') {
            return 2;
        } else {
            return 0;
        }
    }

}