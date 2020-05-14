/**
 * @title Membrane potential simulator
 * @dev see https://github.com/scammi/membrane-potential-sim
 */

Cell[][] tissue;

// cell state
final String resting = "resting";
final String open = "open";
final String inactive = "inactive";

int cols = 100;
int rows = 100;
int ch = 10; //cell_height
int cw = 10; //cell_width
int time = 0;

public void setup() {
  size(1000, 1000);
  background(150);

  tissue = new Cell[cols][rows];

  //TODO: ADD AUTOCELL
  for (int i = 0; i < cols; i++) {

      for (int j = 0; j < rows; j++) {

        if((i == 25 && j == 25) || (i == 75 && j == 75)){
           tissue[i][j] = new AutoCell(i*cw, j*ch, cw, ch, i, j);

        } else if ((i > 30 && i< 35) && (j>30 && j< 35)){
           tissue[i][j] = new NullCell(i*cw, j*ch, cw, ch, i, j);

        }
        else{
          tissue[i][j] = new Cell(i*cw, j*ch, cw, ch, i, j);

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

 }
}
