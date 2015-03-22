public class TicTacToeCell {

    private boolean x;
    private boolean o;
    
    public TicTacToeCell() {
        x = false;
        o = false;
    }

    public boolean isEmpty() {
        return !(x || o);
    }

    public void setEmpty() {
        x = false;
        o = false;
    }

    public void setO() {
        assert(x = false);
        assert(o = false);
        o = true;
    }

    public void setX() {
        assert(x = false);
        assert(o = false);
        x = true;
    }

    public boolean isX() {
        return x;
    }

    public boolean isO() {
        return o;
    }
}