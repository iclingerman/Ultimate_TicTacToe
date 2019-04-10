class Cell {
  int x;
  int y;
  int size;
  int state; //0 = empty, 1 = O, 2 = X
  boolean isActive;
  
  Cell(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
    this.state = 0; 
    this.isActive = true;
  }
  void setIsActive(boolean isActive){
    this.isActive = isActive;
  }
  int getState(){
    return this.state;
  }  
  void setState(int state){
    this.state = state; 
  }   
  void clear(){
    this.state = 0;
  }
  String toString(){
    return "Cell[x: " + this.x + ", y: " + this.y + ", Size: " + this.size + ", State: " + this.state + ", isActive: " + this.isActive + "]";
  }
  void drawCell(){
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
  int click(int mx, int my, int player){
    if(mx >= this.x && mx < this.x+this.size && my > this.y && my < this.y+this.size){
      if(player == 0 && this.state == 0 && isActive){
        this.state = 1;
        this.isActive = false;
        return 1;
      }else if(player == 1 && this.state == 0 && isActive){
        this.state = 2;
        this.isActive = false;
        return 0;
      }
    }
    return player;
  }
}
