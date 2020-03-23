/**
 * @title Membrane potential simulator
 * @dev see https://github.com/scammi/membrane-potential-sim
 */
 
Cell[] tissue;

// cell state
final String resting = "resting";
final String open = "open";
final String inactive = "inactive";

int numberOfCells = 100;
int time = 0;

public void setup() {
  size(1000, 400);
  background(150);
  
  //Position where cells start being draw
  int xPosition = 0;
  int yPosition = height/2;
  
  tissue = new Cell[numberOfCells];
  
  for(int i = 0; i < tissue.length; i++){
    if (i == 10)
      tissue[i] = new AutoCell(xPosition + 10, yPosition, 10, 10, i);
    else
      tissue[i] = new Cell(xPosition + 10, yPosition, 10, 10, i);
    
    xPosition = xPosition + 10;
  }
  

  thread("updateCells");
}

public void draw() {
 for(int i = 0; i < tissue.length; i++){
   tissue[i].display();
 }
}
public void updateCells(){
  while(true) {
    for (Cell cell: tissue) {
      cell.calculateAlpha();
    }
    for (Cell cell: tissue) {
      cell.calculateMembranePotential();
    }
    for (Cell cell: tissue) {
      cell.propagateLoads();
    }
    for (Cell cell: tissue) {
      cell.updateState();
    }
    delay(100);
  }
}


 
