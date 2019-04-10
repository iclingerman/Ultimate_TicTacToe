class BoardCell {
  Cell mainCell; 
  Cell[][] subCells;

  int x;
  int y; 
  int size;
  int state; // 0 = subBoard printed, 1 = O, 2 = X
  boolean isActive;

  BoardCell(int x, int y, int size) {
    mainCell = new Cell(x, y, size);
    subCells = new Cell[3][3];
    for (int i = 0; i < 3; i++) {
      int cx = 0;
      if (i == 0) cx = x;
      else if (i == 1) cx = x + int(size/3);
      else if (i == 2) cx = x + int(2*size/3);
      for (int j = 0; j < 3; j++) {
        int cy = 0;
        if (j == 0) cy = y;
        else if (j == 1) cy = y + int(size/3);
        else if (j == 2) cy = y + int(2*size/3);
        subCells[i][j] = new Cell(cx, cy, int(size/3));
      }
    }
    this.x = x;
    this.y = y;
    this.size = size;
    this.state = 0;
    this.isActive = true;
  }
  //Getters
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

  //Setters
  void setX(int x) {
    this.x = x;
  }
  void setY(int y) {
    this.y = y;
  }
  void setSize(int size) {
    this.size = size;
  }
  void setState(int state) {
    this.state = state;
  }
  void setIsActive(boolean isActive) {
    this.isActive = isActive;
  }

  //Member Functions
  void drawBoardCell() {
    this.mainCell.drawCell();
    if (this.state == 0) {
      for (int i = 0; i < 3; i++) {
        for (int j =0; j < 3; j++) {
          strokeWeight(3);
          subCells[i][j].drawCell();
          strokeWeight(10);
        }
      }
    } else if (this.state == 1) {
      ellipse(this.x, this.y, this.size, this.size);
    } else if (this.state == 2) {
      line(this.x, this.y, this.x+this.size, this.y+this.size);
      line(this.x+this.size, this.y, this.x, this.y+this.size);
    }
  }

  int[] click(int mx, int my, int player) {
    int[] returnArray = new int[3];
    returnArray[0] = player;
    if (mx >= this.x && mx < this.x+this.size && my > this.y && my < this.y+this.size) {
      if (player == 0 && this.state == 0 && isActive) {
        println(player);
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            this.subCells[i][j].click(mx, my, player);
            if (this.subCells[i][j].getState() != 0) {
              println("i: " + i + ", j: " + j);
              returnArray[1] = i;
              returnArray[2] = j;
            }
          }
        }
        returnArray[0] = 1;
        ;
      } else if (player == 1 && this.state == 0 && isActive) {
        println(player);
        for (int i = 0; i < 3; i++) {
          for (int j = 0; j < 3; j++) {
            this.subCells[i][j].click(mx, my, player);
            if (this.subCells[i][j].getState() != 0) {
              println("i: " + i + ", j: " + j);
              returnArray[1] = i;
              returnArray[2] = j;
            }
          }
        }
        returnArray[0] = 0;
      }
    }
    return returnArray;
  }

  void setActiveSubCells(boolean isActive) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        this.subCells[i][j].setIsActive(isActive);
      }
    }
  }
}