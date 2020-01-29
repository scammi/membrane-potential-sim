class Cell {

  float alfa = .05;
  float Vm = 0;
  //position
  int x;
  int y;
  int w;
  int h;
  
  int arrayPosition;
  int arraySize;

 Cell(int tempX, int tempY, int tempW, int tempH, int tempArrayPosition, int tempAarraySize){
  this.x = tempX;
  this.y = tempY;
  this.w = tempW;
  this.h = tempH;
  
  this.arrayPosition = tempArrayPosition;
  this.arraySize = tempAarraySize;
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
    return Vm;

 }
 
 public void despolarizacion(){
   
   if (alfa < 0.9){
     
      alfa = 1;
      
      fill(255,0,0);
      rect(this.x,this.y,this.w,this.h); 
      
      conducir();
 
  }
   else {
     // alfa = 0.05;
    
     // fill(255);
     // rect(this.x,this.y,this.w,this.h);
  }
 
 }
 
 public void conducir(){
   if (tissue[arrayPosition].Vm < -30 && arrayPosition+1 < arraySize)
   {
     tissue[arrayPosition+1].despolarizacion();
   };
 }
 
  float log10 (float x) {
   return(log(x)/log(10));
  }

}
