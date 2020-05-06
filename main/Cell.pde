class Cell {

 int x, y, w, h, colPosition, rowPosition;
 float Vm;
 String state;
 float charge;

 //variables to calculate membrane potential
 float alpha = .05;
 int Ko = 4;
 int Ki = 120;
 int No = 145;
 int Ni = 15;

 /**
 *@dev constructor set position of cell in canvas and in the array
 *@param x > position x in canvas
 *@param y > position y in canvas
 *@param w > width of cell
 *@param h > height of cell
 *@param arrayPosition > index of cell in the array
 */
 Cell(int X, int Y, int W, int H, int tempColPosition, int tempRowPosition){
  this.x = X;
  this.y = Y;
  this.w = W;
  this.h = H;

  this.colPosition = tempColPosition;
  this.rowPosition = tempRowPosition;

  this.state = resting;
  this.Vm = membranePotential();
 }

 public void display(){
   rect(x, y, w, h);

   if (state == resting) {
     fill(255,0,0); //red
   }
   else if (state == open) {
     fill(0,255,0); //green
   }
   else if (state == inactive) {
     fill(0,0,255); //blue
   }

 }

 public float membranePotential(){
   return (61.5 * log10((Ko + (alpha * No)) / (Ki + (alpha * Ni))) );
 }

 public void calculateMembranePotential() {
   Vm = membranePotential();
 }

 public void calculateAlpha() {
   if (state == resting) {
     alpha = alpha + (0.05 - alpha) / 10;
   }
   else if (state == open) {
     alpha = alpha + (5 - alpha) / 50;
   }
   else if (state == inactive) {
     alpha = alpha + (0.05 - alpha) / 50;
   }
 }


 // Calculates cell charge influenced by the surrounding cells
  public void calculateCharge(){

    if (x < 1 || x >= cols || y < 1 || y >= rows) 
        return; 

    int preCol = colPosition - 1;
    int posCol = colPosition + 1;
    int preRow = rowPosition - 1;
    int posRow = rowPosition + 1;
   
    charge =
     //centro
     (0.2 * tissue[colPosition][rowPosition].Vm) +
     //arriba
     (0.2 * tissue[colPosition][preCol].Vm) +
     //abajo
     (0.2 * tissue[colPosition][posRow].Vm) +
     //derecha
     (0.2 * tissue[rowPosition][posCol].Vm) +
     //izquierda
     (0.2 * tissue[rowPosition][preCol].Vm);

     updateState();

  }

 public void updateState() {
  if (state == resting && charge > -50) {
    state = open;
  }
  else if (state == open && charge > 10) {
    state = inactive;
  }
  else if (state == inactive && charge < -55) {
    state = resting;
  }
 }

 private float log10 (float x) {
   return(log(x)/log(10));
 }


}
