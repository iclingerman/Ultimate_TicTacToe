class Boards {
  int x; 
  int y;
  int boardSize;
  Cell[][] cells;

  Boards(int x, int y, int boardSize) {
    this.x = x;
    this.y = y;
    this.boardSize = int(boardSize);
    this.cells = new Cell[3][3];
    int cx;
    int cy;
    for (int i = 0; i < 3; i++) {
      if (i == 0) cy = int(BOARD_SIZE*2/10);
      else if (i == 1) cy = int(BOARD_SIZE*4.9/10);
      else cy = int(BOARD_SIZE*7.8/10);
      for (int j = 0; j < 3; j++) {
        if (j == 0) cx = int(BOARD_SIZE*1/10);
        else if (j == 1) cx = int(BOARD_SIZE*3.9/10);
        else cx = int(BOARD_SIZE*6.8/10);      
        main[i][j] = new Cell(cx, cy, int(BOARD_SIZE/3.5));
      }
    }
  }

  void display() {
    pushMatrix();
    translate(this.x-this.boardSize*.0292, this.y-this.boardSize*.129);
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        this.cells[i][j].drawCell();
      }
    }
    popMatrix();
  }
}