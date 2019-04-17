BoardCell[][] board;
int player;
int victory; //0 = game in progess, 1 = red victory, 2 = blue victory, -1 = stalemate

void setup() {
  strokeWeight(10);
  fullScreen();
  //size(700, 700);
  board = new BoardCell[3][3];
  player = 0;
  int boardSize = int(height*7/9);
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
  background(255);
  drawInfo();
  drawUserInterface();
  drawBoard();
  isMouseOver(mouseX, mouseY);
  checkGame();
  if (victory > 0) {
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j].setActiveSubCells(false);
      }
    }
    //println("GAME OVER: "+ victory);
  }
}

void drawBoard() {
  for (int i = 0; i < 3; i++) {
    for (int j =0; j < 3; j++) {
      board[i][j].drawBoardCell();
    }
  }
}

void isMouseOver(int mx, int my) {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j].isMouseOver(mx, my);
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
        checkSubBoards();
        setActiveBoardCell(returnArray.get(1), returnArray.get(2));
      }
    }
  }
}

void setActiveBoardCell(int cellX, int cellY) {
  if (board[cellX][cellY].getState() == 0) {
    println("Setting whole board to false");
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j].setActiveSubCells(false);
      }
    }
    board[cellX][cellY].setActiveSubCells(true);
  } else {
    println("settings whole board to true");
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        board[i][j].setActiveSubCells(true);
      }
    }
    board[cellX][cellY].setActiveSubCells(false);
  }
}

void checkSubBoards() {
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j].checkSubCells();
    }
  }
}

void checkGame() {
  int j = 0; 
  for (int i = 0; i < 3; i++) {
    if (board[i][j].getState() == 1 && board[i][j+1].getState() == 1 && board[i][j+2].getState() == 1) { //Horizontal Red victory
      victory = 1;
    } else if (board[j][i].getState() == 1 && board[j+1][i].getState() == 1 && board[j+2][i].getState() == 1) { //Vertical Red victory
      victory = 1;
    } else if (board[i][j].getState() == 2 && board[i][j+1].getState() == 2 && board[i][j+2].getState() == 2) { //Horizontal Blue victory
      victory = 2;
    } else if (board[j][i].getState() == 2 && board[j+1][i].getState() == 2 && board[j+2][i].getState() == 2) { //Vertical Blue victory
      victory = 2;
    }
  }
  if (board[j][j].getState() == 1 && board[j+1][j+1].getState() == 1 && board[j+2][j+2].getState() == 1) {//diagonal Red victory
    victory = 1;
  } else if (board[j+2][j].getState() == 1 && board[j+1][j+1].getState() == 1 && board[j][j+2].getState() == 1) {//diagonal Red victory
    victory = 1;
  } else if (board[j][j].getState() == 2 && board[j+1][j+1].getState() == 2 && board[j+2][j+2].getState() == 2) {//diagonal Blue victory
    victory = 2;
  } else if (board[j+2][j].getState() == 2 && board[j+1][j+1].getState() == 2 && board[j][j+2].getState() == 2) {//diagonal Blue victory
    victory = 2;
  }
  if (victory == 0) {
    if (board[j][j].getState() != 0 && board[j][j+1].getState() != 0 && board[j][j+2].getState() != 0 
      && board[j+1][j].getState() != 0 && board[j+1][j+1].getState() != 0 && board[j+1][j+2].getState() != 0 
      && board[j+2][j].getState() != 0 && board[j+2][j+1].getState() != 0 && board[j+2][j+2].getState() != 0) {
      victory = -1;
    }
  }
}

void drawUserInterface() {
  pushMatrix();
  textSize(30);
  if (victory == 0) {
    String playerName;
    if (player == 0) {
      playerName = "Red";
      fill(255, 0, 0);
    } else if (player == 1) {
      playerName = "Blue";
      fill(0, 0, 255);
    } else {
      playerName = "error";
    }
    text(playerName + "'s Turn", width/9, height/10);
  } else {
    if (victory == 1) {
      text("Red Victory. Press Enter to restart", width/9, height/10);
    } else if (victory == 2) {
      text("Blue Victory. Press Enter to restart", width/9, height/10);
    } else if (victory == -1) {
      text("Stalemate. Press Enter to restart", width/9, height/10);
    }
    if (keyPressed && key == ENTER) {
      restartGame();
    }
  }
  popMatrix();
}

void restartGame() {
  victory = 0;
  for (int i = 0; i < 3; i++) {
    for (int j = 0; j < 3; j++) {
      board[i][j].clear();
    }
  }
}
void drawInfo() {
  pushMatrix();
  textAlign(LEFT);
  fill(0);
  textSize(12);
  text("x: " + mouseX + ", y: " + mouseY, 10, 20);
  text("FPS: " +(int)frameRate, 10, 40);
  text("FC: " +frameCount, 10, 60);
  popMatrix();
}