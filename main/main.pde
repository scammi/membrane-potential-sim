import grafica.*;

float kIn = 100;
float kOut = 10; 

void setup() {
  size(500, 350);
  background(150);
  
  float nersntEq = 61 * log10(kIn / kOut);

  // Prepare the points for the plot
  int nPoints = 100;
  GPointsArray points = new GPointsArray(nPoints);

  for (int i = 0; i < nPoints; i++) {
    points.add(i, nersntEq);
  }

  // Create a new plot and set its position on the screen
  GPlot plot = new GPlot(this);
  plot.setPos(25, 25);
  // or all in one go
  // GPlot plot = new GPlot(this, 25, 25);

  // Set the plot title and the axis labels
  plot.setTitleText("K nerst ");
  plot.getXAxis().setAxisLabelText("x axis");
  plot.getYAxis().setAxisLabelText("mV");

  // Add the points
  plot.setPoints(points);

  // Draw it!
  plot.defaultDraw();
}

float log10 (float x) {
  return(log(x)/log(10));
}
