class AutoCell extends Cell {
  
 AutoCell(int tempX, int tempY, int tempW, int tempH){
   super(tempX, tempY, tempW, tempH, 0, 5);
 }
  
 /**
 *@dev Automatic depolarization, every 5 seconds the cell is polarized and depolarized
 *this is acomplish changing the alfa variable thus, the permeabilitis of Na and K
 *@param counter > timer used to trigger auto depolarization
 */
  public void despolarizacion(int counter)
  {
   if (counter % 5 == 0)
   {     
    // increases alfa in a sigmoid fashion 
    for (float x = 0.01; x < 4; x = x+0.001)
    {
      alfa = 1 / (1 + exp(-x));     
    }
    
    fill(255,0,0);
    rect(x, y, w, h);    
    //Triggers depolarization of the first cell in the array
    conducir();
    
    }
    else 
    {
     //Polarized cell white
     alfa = 0.05;
      
     fill(255);
     rect(x, y, w, h);
    }
  }
 
  public void conducir(){
   if (tissue[arrayPosition].Vm < -30 && arrayPosition+1 < arraySize)
   {
     tissue[arrayPosition].despolarizacion();
   }
  }
}
