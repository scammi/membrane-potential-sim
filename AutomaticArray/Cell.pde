class Cell {

 int x, y, w, h, arrayPosition, arraySize;
 float Vm = 0;


 /**
 *@dev constructor set position of cell in canvas and in the array
 *@param x > position x in canvas
 *@param y > position y in canvas
 *@param w > width of cell
 *@param h > height of cell
 *@param arrayPosition > index of cell in the array
 *@param arraySize > lenght of the array
 */
 Cell(int X, int Y, int W, int H, int arrayPosition, int arraySize){
  this.x = X;
  this.y = Y;
  this.w = W;
  this.h = H;
  
  this.arrayPosition = arrayPosition;
  this.arraySize = arraySize;
 }
 
 /**
 *@dev Displays the rect cell on the canvas
 */
 public void display(){
    rect(x, y, w, h); 
 }
 
 /**
 *@dev Goldman-Hodgkin-Katz simplified equation, it returns Vm of a cell.
 *@variable alfa = permeabilidadSodio(Na)/permeabilidadPotasio(K)
 */
 float alfa = .05;
 public float potencialMembrana(){
    int Ko = 4;
    int Ki = 120; 
    int No = 145;
    int Ni = 15;
    
    Vm = (61.5 * log10((Ko + (alfa * No)) / (Ki + (alfa * Ni))) );
    return Vm;

 }
 
 /**
 *@dev Depolarizes the cell, setting alfa = 1, meaning the permeability of Na greater than that of K 
 *it then re-draws the rectangle as red
 *finnaly it triggers the function conducir
 */
 public void despolarizacion(){
   if (alfa < 0.9)
   {
     alfa = 1;
      
     fill(255,0,0);
     rect(this.x,this.y,this.w,this.h); 
      
     conducir();
 
   }
   else
   {
     // alfa = 0.05;
    
     // fill(255);
     // rect(this.x,this.y,this.w,this.h);
    }
 }
 
 /**
 *@dev if the cell index + 1 exceeds the array.lenght it stops, prevents calling undefined object
 * if next cell is polarized then it is trigger to depolireze.
 */
 public void conducir(){
   if (arrayPosition+1 < arraySize)
   {  
     if(tissue[arrayPosition+1].Vm < -30)
     {
       tissue[arrayPosition+1].despolarizacion();
     }
     
   };
 }
 
  float log10 (float x) {
   return(log(x)/log(10));
  }

}
