//8/3
class CircularButton {
  int x;
  int y;
  int size;
  boolean overButton;
  boolean pressed;
  boolean isActive;

  CircularButton(){
    x = 0;
    y = 0;
    size = 0;
    overButton = false; //variable overButton still exists for potential future use
    pressed = false;
    isActive = false;
  }
  CircularButton(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
    overButton = false;
    pressed = false;
    isActive = false;
  }
  int getX(){
    return this.x;
  }
  int getY(){
    return this.y;
  }
  int getSize(){
    return size;
  }
  boolean getOverButton(){
    return this.overButton;
  }
  boolean getPressed(){
    return this.pressed;
  }
  boolean getIsActive(){
    return this.isActive;
  }
  void setX(int x){
    this.x = x;
  }
  void setY(int y){
    this.y = y;
  }
  void setSize(int size){
    this.size = size;
  }
  void setOverButton(boolean overButton){
    this.overButton = overButton;
  }
  void setPressed(boolean pressed){
    this.pressed = pressed;
  }
  void setIsActive(boolean isActive){
    this.isActive = isActive;
  }
  String toString(){
    return ("Button[X: " + x + ", Y: " + y + ", overButton: " + overButton + ", pressed: " + pressed + ", isActive: "+ isActive+ "]");
  }
  void update(){
    this.pressed = false;
    if(this.isActive){
      float distanceX = x - mouseX;
      float distanceY = y - mouseY;
      if(sqrt(sq(distanceX) + sq(distanceY)) < size/2 ){
        this.pressed = true;
        this.isActive = false;
      }else this.pressed = false; 
    }
  }
  
}