//8/3
class Button {
  int x;
  int y;
  int size;
  boolean overButton;
  boolean pressed;
  boolean isActive;

  Button(){
    x = 0;
    y = 0;
    size = 0;
    overButton = false; //variable overButton still exists for potential future use
    pressed = false;
    isActive = false;
  }
  Button(int x, int y, int size){
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
      if(mouseX >= x -(size/2)&& mouseX <= x+ (size/2) && mouseY >= y -(size/2) && mouseY <= y+ (size/2)){
        this.pressed = true;
      }else{
        this.pressed = false;
      }  
    }
  }
  
}