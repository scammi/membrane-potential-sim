class Cell {

 int x, y, w, h, arrayPosition;
 float Vm;
 String state;
 float loads;

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
 *@param arraySize > lenght of the array
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
  
 public void calculateMembranePotential() {
   Vm = membranePotential();
 }
  
 public void propagateLoads() {
   int previousPos = arrayPosition - 1;
   int posteriorPos = arrayPosition + 1;
   
   if (previousPos < 1) {
     loads = 0.7 * tissue[posteriorPos].Vm + 0.3 * tissue[arrayPosition].Vm;
   } 
   else if (posteriorPos >= tissue.length) {
     loads = 0.7 * tissue[previousPos].Vm + 0.3 * tissue[arrayPosition].Vm;
   }
   else {
     loads = 0.25 * tissue[previousPos].Vm + 0.5 * tissue[arrayPosition].Vm + 0.25 * tissue[posteriorPos].Vm;
   }
 }
  
 public void updateState() {
  if (arrayPosition == 0) {
    println("Cell:" + arrayPosition + " Vm;" + Vm + " loads;" + loads);
  }
  
  if (state == resting && loads > -50) {
    println("opening channel"); //<>//
    state = open;
  }
  else if (state == open && loads > 10) {
    println("inactiving channel");
    state = inactive;
  } 
  else if (state == inactive && loads < -55) {
    state = resting;  
  }
 }
 
 private float log10 (float x) {
   return(log(x)/log(10));
 }
  
 
}
