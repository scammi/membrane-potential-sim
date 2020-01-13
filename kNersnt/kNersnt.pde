import grafica.*;

GPlot plot1;

float kIn = 100;
float kOut = 10; 
float nersntEq = 0;
float time = 0;

public void setup() {
  size(900, 700);
  background(150);
  
  plot1 = new GPlot(this);
  plot1.setPos(10, 10);
  plot1.setDim(750, 550);
  plot1.getTitle().setText("K Nernst");
  plot1.getXAxis().getAxisLabel().setText("T(ms)");
  plot1.getYAxis().getAxisLabel().setText("mV");
}
public void draw() {   
  
  time = millis();
  nersntEq = 61 * log10(kIn / kOut);
  
  plot1.addPoint(time, nersntEq);
  plot1.defaultDraw();
  
 }
void keyPressed() {
  //Key w increase kout
  if (key ==  119) {
    kOut = kOut + 0.01; 
  } 
  //Key s decrease kout
  if (key == 115) {
    kOut = kOut - 0.01; 
  }
}
 
float log10 (float x) {
  return(log(x)/log(10));
}
