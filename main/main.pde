/**
 * @title Membrane potential simulator
 * @dev see https://github.com/scammi/membrane-potential-sim
 */

Cell[][] tissue;

// cell state
final String resting = "resting";
final String open = "open";
final String inactive = "inactive";

int cols = 200;
int rows = 200;
int time = 0;

public void setup() {
  size(1000, 1000);
  background(150);

  tissue = new Cell[cols][rows];

  //TODO: ADD AUTOCELL
  for (int i = 0; i < cols; i++) {
      for (int j = 0; j < rows; j++) {
        if((i == 25 && j == 25) || (i == 75 && j == 75)){
           tissue[i][j] = new AutoCell(i*2, j*2, 2, 2, i, j);
        } else if ((i > 30 && i< 35) && (j>30 && j< 35)){
           tissue[i][j] = new NullCell(i*2, j*2, 2, 2, i, j);
        }
        else{
          tissue[i][j] = new Cell(i*2, j*2, 2, 2, i, j);
        }
    }
  }

}

public void draw() {

 for (int w = 2; w < (cols-2); w++) {
   for (int p = 2; p < (rows-2); p++) {
     tissue[w][p].display();
     tissue[w][p].calculateMembranePotential();
     tissue[w][p].calculateCharge();
     tissue[w][p].calculateAlpha();


   }
   // tissue[i].calculateCharge();
   // tissue[i].calculateAlpha();

 }
}
