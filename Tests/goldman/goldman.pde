import grafica.*;

GPlot plot1;

int Ko = 4;
int Ki = 120; 
int No = 145;
int Ni = 15;
float alfa = .05;
float Vm = 0;
float time = 0;

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
 
 float log10 (float x) {
  return(log(x)/log(10));
}

void mouseClicked() {

  if (alfa < 0.9){
     
    for (float x = 0.01; x < 4; x = x+0.001){
      alfa = 1 / (1 + exp(-x));
      println(alfa);
      
    };
  }
   else {
    alfa = 0.05;
  }
}

void keyPressed() {
  if (key == UP) {
  }
  Ko = Ko + 1;
}
