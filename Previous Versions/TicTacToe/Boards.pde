class Boards{
  int x; 
  int y;
  int boardSize;
  Cell[][] board;
  
  Boards(int x, int y, int boardSize){
    this.x = x;
    this.y = y;
    this.boardSize = int(boardSize/3.5);
    this.board = new Cell[3][3];
    int cx;
    int cy;
    for(int i = 0; i < 3; i++){
      if(i == 0) cy = int(this.boardSize*2/10);
      else if(i == 1) cy = int(this.boardSize*4.9/10);
      else cy = int(this.boardSize*7.8/10);
      for(int j = 0; j < 3; j++){
        if(j == 0) cx = int(this.boardSize*1/10);
        else if(j == 1) cx = int(this.boardSize*3.9/10);
        else cx = int(this.boardSize*6.8/10);      
        board[i][j] = new Cell(cx, cy, int(this.boardSize/3.5));
      }
    }
  }
  
  void display(){
    pushMatrix();
    translate(this.x-this.boardSize*.0292, this.y-this.boardSize*.129);
    println(this.boardSize);
    for(int i = 0; i < 3; i++){
        for(int j =0; j < 3; j++){
          this.board[i][j].drawCell();
        }
    }
    popMatrix();
  }
}