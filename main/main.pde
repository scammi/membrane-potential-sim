import grafica.*;

GPlot plot1;

float kIn = 100;
float kOut = 10; 
float nersntEq = 0;
float time = 0;

public void setup() {
  size(900, 700);
  background(150);
  
  nersntEq = 61 * log10(kIn / kOut);

  plot1 = new GPlot(this);
  plot1.setPos(10, 10);
  plot1.setDim(700, 500);
  plot1.getTitle().setText("Effet tactile");
  plot1.getXAxis().getAxisLabel().setText("Déplacement (mm)");
  plot1.getYAxis().getAxisLabel().setText("Force (N)");
}
public void draw() {   
  // Also possible
  time = time + 0.0001;

  plot1.addPoint(time, nersntEq);

  plot1.defaultDraw();
}

float log10 (float x) {
  return(log(x)/log(10));
}
