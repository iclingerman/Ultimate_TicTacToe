int BOARD_SIZE;
int player;
int victory;
Cell[][] main;

void setup() {
  size(700, 700);
  background(110, 158, 203);
  BOARD_SIZE = int(height*7/9);
  player = 0;
  victory = 0;
  main = new Cell[3][3];
  int cx, cy;
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
void draw(){
  clear();
  background(110, 158, 203);
  drawInfo();
  drawBoard(); 
  //checkGame();
  if(victory > 0){
    for(int i = 0; i < 3; i++){
      for(int j = 0; j < 3; j++){
        main[i][j].setIsActive(false);
      }
    }
    pushMatrix();
    textSize(20);
    text("Game Over \nPress Enter to Restart", displayWidth*2/3, displayHeight/2); 
    popMatrix();
  }
}

void drawBoard(){
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      main[i][j].drawCell();
    }
  } 
}

void drawInfo() {
  textAlign(LEFT);
  fill(255);
  textSize(12);
  text("x: " + mouseX + ", y: " + mouseY, 10, 20);
  text("FPS: " +(int)frameRate, 10, 40);
  text("FC: " +frameCount, 10, 60);
  textAlign(CENTER, CENTER);
}