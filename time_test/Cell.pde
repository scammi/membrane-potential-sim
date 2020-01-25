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


 public float potencialMembrana(){
     Vm = (61.5 * log10((Ko + (alfa * No)) / (Ki + (alfa * Ni))) );
     
     return Vm;
 }
 
 public void despolarizacion(int counter){
   
   if (alfa < 0.9 && counter % 5 == 0){
     
    for (float x = 0.01; x < 4; x = x+0.001){
      alfa = 1 / (1 + exp(-x));
      
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
