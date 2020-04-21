class Cell {

 int x, y, w, h, arrayPosition;
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
 Cell(int X, int Y, int W, int H, int arrayPosition){
  this.x = X;
  this.y = Y;
  this.w = W;
  this.h = H;

  this.state = resting;
  this.arrayPosition = arrayPosition;
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
 // public void calculateCharge() {
 //   int previousPosition = arrayPosition - 1;
 //   int posteriorPosition = arrayPosition + 1;
 //
 //   if (previousPosition < 0) {
 //     charge = 0.3 * tissue[posteriorPosition].Vm + 0.7 * tissue[arrayPosition].Vm;
 //     updateState();
 //   }
 //   else if (posteriorPosition >= tissue.length) {
 //     charge = 0.3 * tissue[previousPosition].Vm + 0.7 * tissue[arrayPosition].Vm;
 //     updateState();
 //   }
 //   else {
 //     charge = 0.25 * tissue[previousPosition].Vm + 0.5 * tissue[arrayPosition].Vm + 0.25 * tissue[posteriorPosition].Vm;
 //     updateState();
 //   }
 //   println(charge);
 // }

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
