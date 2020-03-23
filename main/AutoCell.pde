class AutoCell extends Cell {
  
 AutoCell(int tempX, int tempY, int tempW, int tempH, int arrayPos){
   super(tempX, tempY, tempW, tempH, arrayPos);
 }
 public void calculateAlpha() {
    if (state == resting) {
      alpha = alpha + 0.05;
    } else if (state == open) {
        alpha = alpha + (5 - alpha) / 50;
    } else if (state == inactive) {
        alpha = alpha + (0.05 - alpha) / 50;
    }
 }
}
