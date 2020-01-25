class AutoCell extends Cell {
  
   AutoCell(int tempX, int tempY, int tempW, int tempH){
     
     super(tempX, tempY, tempW, tempH);
   
 }

  public void despolarizacion(int counter){
   
   if (alfa < 0.9 && counter % 5 == 0){     
    for (float x = 0.01; x < 4; x = x+0.001){
      alfa = 1 / (1 + exp(-x));     
    };
     fill(255,0,0);
     rect(x, y, w, h);            
  }
   else {
    alfa = 0.05;
    
    fill(255);
    rect(x, y, w, h);

  }
 
 }
}
