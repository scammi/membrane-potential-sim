class AutoCell extends Cell {

  public void despolarizacion(int counter){
     if (counter % 5 == 0){
       
      for (float x = 0.01; x < 4; x = x+0.001){
        alfa = 1 / (1 + exp(-x));
        
      };
    }
     else {
      alfa = 0.05;
    }
  
      println(alfa);
 }
}
