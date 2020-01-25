import grafica.*;

GPlot plot1;
AutoCell myCell;

int time = 0;
int xChart = 0;

public void setup() {
  size(900, 700);
  background(150);
  
  myCell = new AutoCell();
  
  plot1 = new GPlot(this);
  plot1.setPos(10, 10);
  plot1.setDim(750, 550);
  plot1.getTitle().setText("Vm");
  plot1.getXAxis().getAxisLabel().setText("T(ms)");
  plot1.getYAxis().getAxisLabel().setText("mV");
}

public void draw() {
  
  time = second();
  xChart = millis();
    
  plot1.addPoint(xChart, myCell.potencialMembrana());
  plot1.defaultDraw();
  println(time);
  
  myCell.despolarizacion(time);

  
 }
