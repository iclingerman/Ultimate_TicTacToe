class GameBoard {
  int x, y, size, state;
  boolean isActive;
  GameBoard(int x, int y, int size) {
    this.x = x;
    this.y = y;
    this.size = size;
    this.state = 0; 
    this.isActive = true;
  }
  void setIsActive(boolean isActive) {
    this.isActive = isActive;
  }
  int getState() {
    return this.state;
  }  
  void setState(int state) {
    this.state = state;
  }   
  void clear() {
    this.state = 0;
  }
  String toString() {
    return "Cell[x: " + this.x + ", y: " + this.y + ", Size: " + this.size + ", State: " + this.state + ", isActive: " + this.isActive + "]";
  }
  void drawBoard(){
    pushMatrix();
    rect(this.x, this.y, this.size, this.size);
    if(this.state == 1){
      ellipseMode(CORNER);
      ellipse(this.x, this.y, this.size, this.size);
    }else if(this.state == 2){
      line(this.x, this.y, this.x+this.size, this.y+this.size);
      line(this.x+this.size, this.y, this.x, this.y+this.size);
    }
    popMatrix();
  }
}