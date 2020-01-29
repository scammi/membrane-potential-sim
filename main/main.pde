/**
 * @title Membrane potential simulator
 * @dev see https://github.com/scammi/membrane-potential-sim
 */
 
//Declaration of AutoCell
AutoCell automaticCell;
//Declaration of array of cell's 
Cell[] tissue;

int numberOfCells = 100;
int time = 0;

public void setup() {
  size(1000, 400);
  background(150);
  
  //Position where cells start being draw
  int xPosition = 0;
  int yPosition = height/2;
  
  //Instantiation of Cells
  tissue = new Cell[numberOfCells];
  
  //Initialization of automatic cell
  automaticCell = new AutoCell(xPosition, yPosition, 10, 10);
  automaticCell.display();
  
  //Initialization and display of every cell in array
  for(int i = 0; i < tissue.length; i++){
    tissue[i] = new Cell(xPosition + 10, yPosition, 10, 10, i, numberOfCells);
    tissue[i].display();
    //Sets position of next cell to be display
    xPosition = xPosition + 10;
  }
    
}

public void draw() {
 //Start timer
 time = second();
 automaticCell.despolarizacion(time);
 
 //Every frame the Vm of every cell is calculated
 for(int i = 0; i < tissue.length; i++)
 {
   tissue[i].potencialMembrana();
   println(tissue[i].Vm);
 }
  
}
 
