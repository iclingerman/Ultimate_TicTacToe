class BoardCell {
  Cell mainCell; 
  Cell[][] subCells;

  int x;
  int y; 
  int size;
  int state; // 0 = subBoard printed, 1 = X, 2 = 0
  boolean isActive;

  BoardCell(int x, int y, int size) {
    mainCell = new Cell(x, y, size);
    subCells = new Cell[3][3];
    for (int i = 0; i < 3; i++) {
      int cx = 0;
      if(i == 0) cx = x;
      else if(i == 1) cx = x + int(size/3);
      else if(i == 2) cx = x + int(2*size/3);
      for (int j = 0; j < 3; j++) {
        int cy = 0;
        if(j == 0) cy = y;
        else if(j == 1) cy = y + int(size/3);
        else if(j == 2) cy = y + int(2*size/3);
        subCells[i][j] = new Cell(cx, cy, int(size/3));
      }
    }
    this.x = x;
    this.y = y;
    this.size = size;
    this.state = 0;
    this.isActive = false;
  }

  int getX() {
    return this.x;
  }
  int getY() {
    return this.y;
  }
  int getSize() {
    return this.size;
  }
  int getState() {
    return this.state;
  }
  boolean getIsActive() {
    return this.isActive;
  }
  
  void drawBoardCell(){
    this.mainCell.drawCell();
    for(int i = 0; i < 3; i++){
      for(int j =0; j < 3; j++){
        strokeWeight(3);
        subCells[i][j].drawCell();
        strokeWeight(10);
      }
    }
  }
}
