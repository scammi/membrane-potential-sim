import grafica.*;

GPlot plot1;

public void setup() {
  size(900, 700);
  background(150);
  
  plot1 = new GPlot(this);
  plot1.setPos(10, 10);
  plot1.setDim(750, 550);
  plot1.getTitle().setText("Vm");
  plot1.getXAxis().getAxisLabel().setText("T(ms)");
  plot1.getYAxis().getAxisLabel().setText("mV");
}

public void draw() {   
  
  time = millis();
  Vm = (61.5 * log10((Ko + (alfa * No)) / (Ki + (alfa * Ni))) );
  
  plot1.addPoint(time, Vm);
  plot1.defaultDraw();
  
 }
