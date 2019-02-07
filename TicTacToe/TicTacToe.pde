int BOARD_SIZE;
int player; //0 = O, 1 = X
int victory; //0 = in game, 1 = O Victory, 1 = X Victory 
Cell[][] main;
//Boards[][] subBoards;
Cell[][][][] subBoards;

void setup(){
 // fullScreen();
  size(750, 750);
  background(110, 158, 203);
  strokeWeight(5);
  BOARD_SIZE = int(height*7/9);
  player = 0;
  victory= 0; 
  main = new Cell[3][3];
 // subBoards = new Boards[3][3];
 subBoards = new Cell[3][3][3][3];
  int cx, cy;
  for(int i = 0; i < 3; i++){
    if(i == 0) cy = int(BOARD_SIZE*2/10);
    else if(i == 1) cy = int(BOARD_SIZE*4.9/10);
    else cy = int(BOARD_SIZE*7.8/10);
    for(int j = 0; j < 3; j++){
      if(j == 0) cx = int(BOARD_SIZE*1/10);
      else if(j == 1) cx = int(BOARD_SIZE*3.9/10);
      else cx = int(BOARD_SIZE*6.8/10);      
      main[i][j] = new Cell(cx, cy, int(BOARD_SIZE/3.5));
    }
  }
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      for(int k = 0; k < 3;  k++){
        if(k == 0) cy = int(BOARD_SIZE*2/10);
        else if(k == 1) cy = int(BOARD_SIZE*4.9/10);
        else cy = int(BOARD_SIZE*7.8/10);
        for(int l = 0; l < 3; l++){
          if(l == 0) cx = int(BOARD_SIZE*1/10);
          else if(l == 1) cx = int(BOARD_SIZE*3.9/10);
          else cx = int(BOARD_SIZE*6.8/10); 
          subBoards[i][j][k][l] = new Cell(cx, cy,int(BOARD_SIZE/10.5));
        }
      }
    }
  }
}
void draw(){
  clear();
  background(110, 158, 203);
  drawInfo();
  drawBoard(); 
  checkGame();
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
  pushMatrix();
  for(int i = 0; i < 3; i++){
    if(i == 0) translate(0, 0);
    else if(i == 1) translate(0, int((BOARD_SIZE)*.95/10));
    else translate(0, int((BOARD_SIZE*3.5/10)*2.7/10)); 
    for(int j = 0; j < 3; j++){
      translate(0,0);
      if(j == 0) translate(0, 0);
      else if(j == 1) translate(int(BOARD_SIZE*2/10), 0);
      else translate(int((BOARD_SIZE*3.5/10)*2.7/10), 0);      
      for(int k = 0; k < 3;  k++){
        for(int l = 0; l < 3; l++){
          subBoards[i][j][k][l].drawCell();
        }
      }
    }
  }
  popMatrix();
}
void mousePressed(){
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      player = main[i][j].click(mouseX, mouseY, player);
    }
  } 
}
void keyPressed(){
  if(key == ENTER){
    if(victory > 0){
      clearBoard();
      victory = 0;
    }
  }
}

void checkGame(){
  int j = 0; 
  for(int i = 0; i < 3; i++){
    if(main[i][j].getState() == 1 && main[i][j+1].getState() == 1 && main[i][j+2].getState() == 1){ //Horizontal O victory
      victory = 1; 
    }else if(main[j][i].getState() == 1 && main[j+1][i].getState() == 1 && main[j+2][i].getState() == 1){ //Vertical O victory
      victory = 1; 
    }else if(main[i][j].getState() == 2 && main[i][j+1].getState() == 2 && main[i][j+2].getState() == 2){ //Horizontal X victory
      victory = 2; 
    }else if(main[j][i].getState() == 2 && main[j+1][i].getState() == 2 && main[j+2][i].getState() == 2){ //Vertical X victory
      victory = 2; 
    }
  }
  if(main[j][j].getState() == 1 && main[j+1][j+1].getState() == 1 && main[j+2][j+2].getState() == 1){//diagonal O victory
    victory = 1;
  }else if(main[j+2][j].getState() == 1 && main[j+1][j+1].getState() == 1 && main[j][j+2].getState() == 1){//diagonal O victory
    victory = 1;
  }else if(main[j][j].getState() == 2 && main[j+1][j+1].getState() == 2 && main[j+2][j+2].getState() == 2){//diagonal X victory
      victory = 2; 
  }else if(main[j+2][j].getState() == 2 && main[j+1][j+1].getState() == 2 && main[j][j+2].getState() == 2){//diagonal X victory
    victory = 2; 
  }
}

void clearBoard(){
  for(int i = 0; i < 3; i++){
    for(int j = 0; j < 3; j++){
      main[i][j].clear();
      main[i][j].setIsActive(true);
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