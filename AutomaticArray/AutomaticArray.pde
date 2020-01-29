AutoCell automaticCell;

Cell[] tissue;
int arraySize = 100;
int time = 0;

public void setup() {
  size(1000, 400);
  background(150);
  
  int xPosition = 0;

  tissue = new Cell[arraySize];
  automaticCell = new AutoCell(xPosition, height/2, 10, 10);

  automaticCell.display();
   
  for(int i = 0; i < tissue.length; i++){
    tissue[i] = new Cell(xPosition + 10, height/2, 10, 10, i, arraySize);
    tissue[i].display();
    xPosition = xPosition + 10;
  }
    
}

public void draw() {
 time = second();
 automaticCell.despolarizacion(time);
 
 for(int i = 0; i < tissue.length; i++){
   
   tissue[i].potencialMembrana();
 }
  
}
 
