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
  int xs;
  int ys;
  int rwdidth;
  int rheight;

 Cell(int x, int y, int wdth, int hght){
   xs = x;
   ys = y;
   rwdidth = wdth;
   rheight = hght;
   
   rect(x, y, wdth, hght);
   
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
      rect(xs, ys, rwdidth, rheight);

      println(alfa);
      
      
    };
  }
   else {
    alfa = 0.05;
    
      fill(255);
      rect(xs, ys, rwdidth, rheight);

  }
 
 }
 
  float log10 (float x) {
   return(log(x)/log(10));
  }

}
