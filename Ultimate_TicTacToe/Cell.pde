class Cell {
  int x;
  int y;
  int size;
  int state; //0 = empty, 1 = red, 2 = blue
  boolean isActive;

  Cell(int x, int y, int size) {
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


  void setIsActive(boolean isActive) {
    this.isActive = isActive;
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
  void drawCell() {
    pushMatrix();
    if (this.isActive) {
      fill(211);
    }else{
      fill(255);
    }
    
    if (this.state == 1) {
      //ellipseMode(CORNER);
      //ellipse(this.x, this.y, this.size, this.size);'
      fill(255, 0, 0);
    } else if (this.state == 2) {
      //line(this.x, this.y, this.x+this.size, this.y+this.size);
      //line(this.x+this.size, this.y, this.x, this.y+this.size);
      fill(0, 0, 255);
    }
    rect(this.x, this.y, this.size, this.size);
    popMatrix();
    fill(255);
  }
  int click(int mx, int my, int player) {
    if (this.isActive) {
      if (mx >= this.x && mx < this.x+this.size && my > this.y && my < this.y+this.size) {
        if (player == 0 && this.state == 0) {
          this.state = 1;
          this.isActive = false;
          return 1;
        } else if (player == 1 && this.state == 0) {
          this.state = 2;
          this.isActive = false;
          return 0;
        }
      }
    }
    return player;
  }
}