/*
Cell class
Methods:
  vm
  deploraize
*/

class Cell {
  
  int Ko = 4;
  int Ki = 120; 
  int No = 145;
  int Ni = 15;
  float alfa = .05;
  float Vm = 0;

 Cell(int x, int y, int wdth, int hght){
   rect(x, y, wdth, hght);
 }
 
 public float potencialMembrana(){
     Vm = (61.5 * log10((Ko + (alfa * No)) / (Ki + (alfa * Ni))) );
     println(Vm);
     return Vm;

 }
 
 public void despolarizacion(){
   
   if (alfa < 0.9){
     
    for (float x = 0.01; x < 4; x = x+0.001){
      alfa = 1 / (1 + exp(-x));
      println(alfa);
      
    };
  }
   else {
    alfa = 0.05;
  }
 
 }
 
  float log10 (float x) {
   return(log(x)/log(10));
  }

}
