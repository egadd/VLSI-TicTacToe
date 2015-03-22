public class TicTacToeBoard {

    private TicTacToeCell[][] myBoard;
    
    public TicTacToeBoard() {
        myBoard = new TicTacToeCell[3][3];
    }

    public boolean makeXMove(int row, int col) {
        // if row or col is invalid, ERROR
        if (row < 0 || row > 2 || col < 0 || col > 2) {
            return false;
        }

        // if the cell is not empty, ERROR
        if (!myBoard[row][col].isEmpty()) {
            return false;
        }

        // update cell
        myBoard[row][col].setX();

        // return success
        return true;
    }

    public boolean makeOMove(int row, int col) {
        // if row or col is invalid, ERROR
        if (row < 0 || row > 2 || col < 0 || col > 2) {
            return false;
        }

        // if the cell is not empty, ERROR
        if (!myBoard[row][col].isEmpty()) {
            return false;
        }

        // update cell
        myBoard[row][col].setO();

        // return success
        return true;
    }

    public boolean isXWin() {
        return winChecker('X');
    }

    public boolean isOWin() {
        return winChecker('O');
    }

    private boolean winChecker(char xo) {
        // check horizontal wins
        for (int row = 0; row < 3; row++) {
            boolean allXorO = true;
            for (int col = 0; col < 3; col++) {
                if (!(xo == 'X' ? myBoard[row][col].isX() : myBoard[row][col].isO())) {
                    allXorO = false;
                }
            }
            if (allXorO) {
                return true;
            }
        }

        // check vertical wins
        for (int row = 0; row < 3; row++) {
            boolean allXorO = true;
            for (int col = 0; col < 3; col++) {
                if (!(xo == 'X' ? myBoard[row][col].isX() : myBoard[row][col].isO())) {
                    allXorO = false;
                }
            }
            if (allXorO) {
                return true;
            }
        }

        // check diagonal wins
        boolean allXorO1 = true;
        boolean allXorO2 = true;
        for (int i = 0; i < 3; i++) {
            if (!(xo == 'X' ? myBoard[i][i].isX() : myBoard[i][i].isO())) {
                    allXorO1 = false;
                }
            if (!(xo == 'X' ? myBoard[i][2-i].isX() : myBoard[i][2-i].isO())) {
                    allXorO2 = false;
                }
        }
        if (allXorO1 || allXorO2) {
            return true;
        }

        // no win conditions
        return false;
    }

    public String toString() {
        String out = "";
        for (int row = 0; row < 3; row++) {
            for (int col = 0; col < 3; col++) {
                out += "0"; // error bit - assume we never give it a bad input
                if (myBoard[row][col].isEmpty()) {
                    out += "00";
                } else if (myBoard[row][col].isX()) {
                    out += "10";
                } else {
                    out += "01";
                }
                out += intToBinaryString(row) + intToBinaryString(col);
                if (isXWin()) {
                    out += "10";
                } else if (isOWin()) {
                    out += "01";
                } else {
                    out += "00";
                }
            }
        }
        return out;
    }

    private String intToBinaryString(int x) {
        assert (0 <= x && x < 3);
        if (x == 0) {
            return "00";
        } else if (x == 1) {
            return "01";
        } else {
            return "10";
        }
    }

}