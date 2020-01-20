Cell myCell;

Cell[] tissue;

float time = 0;

public void setup() {
  size(600, 400);
  background(150);
  
  tissue = new Cell[5];
  
  int xPosition = width/2;
  
  for(int i = 0; i < 5; i++){
    tissue[i] = new Cell(xPosition, height/2, 20, 20);
    xPosition = xPosition + 20;
  }
  
  //myCell = new Cell(width/2, height/2, 5, 5);
  
}

public void draw() {
  
  
}
 
void mouseClicked(){
  tissue[0].despolarizacion();
  
  
}
