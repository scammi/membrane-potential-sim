/*
Cell class
Methods:
  vm
  deploraize
*/

class Cell {

  float alfa = .05;
  float Vm = 0;
  //position
  int x;
  int y;
  int w;
  int h;

 Cell(int tempX, int tempY, int tempW, int tempH){
   x = tempX;
   y = tempY;
   w = tempW;
   h = tempH;
 }
 
 public void display(){
    rect(x, y, w, h); 

 }
 
 public float potencialMembrana(){
       
    int Ko = 4;
    int Ki = 120; 
    int No = 145;
    int Ni = 15;
    
    Vm = (61.5 * log10((Ko + (alfa * No)) / (Ki + (alfa * Ni))) );
    println(Vm);
    return Vm;

 }
 
 public void despolarizacion(){
   
   if (alfa < 0.9){
     
    for (float x = 0.01; x < 4; x = x+0.001){
      alfa = 1 / (1 + exp(-x));
      
      fill(255,0,0);
      rect(x, y, w, h);
    };
  }
   else {
    alfa = 0.05;
    
      fill(255);
      rect(x, y, w, h);
  }
 
 }
 
  float log10 (float x) {
   return(log(x)/log(10));
  }

}
