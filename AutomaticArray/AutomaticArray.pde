Cell myCell;
AutoCell automaticCell;

Cell[] tissue;

int time = 0;

public void setup() {
  size(600, 400);
  background(150);
  time = second();
  
  int xPosition = width/2;

  tissue = new Cell[5];
  automaticCell = new AutoCell(xPosition, height/2, 20, 20);
  automaticCell.despolarizacion(time);

   
  for(int i = 0; i < 5; i++){
    tissue[i] = new Cell(xPosition + 20, height/2, 20, 20);
    xPosition = xPosition + 20;
  }
  
  //myCell = new Cell(width/2, height/2, 5, 5);
  
}

public void draw() {
  
 automaticCell.display();
  
 for(int i = 0; i < tissue.length; i++ )
  {   
    tissue[i].display();
  }
  
  
}
 
void mouseClicked(){
  for(int i = 0; i < tissue.length; i++ )
  {   
      tissue[i].despolarizacion();

  }
    
}
