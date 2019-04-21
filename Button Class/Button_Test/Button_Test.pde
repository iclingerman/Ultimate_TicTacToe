Button button; 

void setup(){
  size(600, 600); 
  background(255);
  button = new Button(100, 100, 50);
  rectMode(CENTER);
}

void draw(){
  background(255);
  fill(0);
  text("x: " + mouseX + ", y: " + mouseY, 10, 10);
  rect(100, 100, 50, 50);

}

void mousePressed() {
  button.update();
  if(button.getPressed()){
    println("pressed");
  }
}