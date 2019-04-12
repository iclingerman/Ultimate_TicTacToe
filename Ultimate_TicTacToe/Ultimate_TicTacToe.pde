BoardCell[][] board;
int player;

void setup() {
  strokeWeight(10);
  ellipseMode(CORNER);
 // fullScreen();
  size(700, 700);
  board = new BoardCell[3][3];
  player = 0;
  int boardSize = int(height*7/9);
  //int cellSize = int(boardSize/3);
  int x = width/9;
  int y = height/9;
  for (int i = 0; i < 3; i++) {
    int cx = 0;
    if (i == 0) cx = x;
    else if (i == 1) cx = x + int(boardSize/3);
    else if (i == 2) cx = x + int(2*boardSize/3);
    for (int j = 0; j < 3; j++) {
      int cy = 0;
      if (j == 0) cy = y;
      else if (j == 1) cy = y + int(boardSize/3);
      else if (j == 2) cy = y + int(2*boardSize/3);
      board[i][j] = new BoardCell(cx, cy, int(boardSize/3));
    }
  }
}

void draw() {
  clear();
  background(110, 158, 203);
  drawInfo();
  drawBoard();
}

void drawBoard() {
  for (int i = 0; i < 3; i++) {
    for (int j =0; j < 3; j++) {
      board[i][j].drawBoardCell();
    }
  }
}

void mousePressed() {

  ArrayList<Integer> returnArray = new ArrayList<Integer>(); //TODO make better variable name
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      returnArray = board[i][j].click(mouseX, mouseY, player);
      player = returnArray.get(0);
      //println("Current Player: " + player);
      //println("Size: "+returnArray.size());
      if (returnArray.size() > 1) {
        setActiveBoardCell(returnArray.get(1), returnArray.get(2));
      }
    }
  }
}

void setActiveBoardCell(int cellX, int cellY) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j].setActiveSubCells(false);
    }
  }
  board[cellX][cellY].setActiveSubCells(true);
}

void drawInfo() {
  pushMatrix();
  textAlign(LEFT);
  fill(255);
  textSize(12);
  text("x: " + mouseX + ", y: " + mouseY, 10, 20);
  text("FPS: " +(int)frameRate, 10, 40);
  text("FC: " +frameCount, 10, 60);
  popMatrix();
}
