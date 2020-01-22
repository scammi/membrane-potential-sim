import grafica.*;

GPlot plot1;
Cell myCell;

int time = 0;

public void setup() {
  size(900, 700);
  background(150);
  
  myCell = new Cell();
  
  plot1 = new GPlot(this);
  plot1.setPos(10, 10);
  plot1.setDim(750, 550);
  plot1.getTitle().setText("Vm");
  plot1.getXAxis().getAxisLabel().setText("T(ms)");
  plot1.getYAxis().getAxisLabel().setText("mV");
}

public void draw() {
  
  time = millis();
  
  plot1.addPoint(time, myCell.potencialMembrana());
  plot1.defaultDraw();
  println(time);
  if((time/2000000) % 2 == 0)
  {
      myCell.despolarizacion();

  }
 }
