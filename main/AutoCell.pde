class AutoCell extends Cell {

 AutoCell(int tempX, int tempY, int tempW, int tempH, int tempColPosition, int tempRowPosition){
   super(tempX, tempY, tempW, tempH, tempColPosition, tempRowPosition);
 }

 public void calculateAlpha() {
    if (state == resting) {
      alpha = alpha + 0.05;
    }
    else if (state == open) {
      alpha = alpha + (5 - alpha) / 50;
    }
    else if (state == inactive) {
      alpha = alpha + (0.05 - alpha) / 50;
    }
  println(this.state, this.Vm, this.alpha);
 }

 //Calculates cell charge influenced by the surrounding cells
 public void calculateCharge(){
   this.charge = (tissue[colPosition][rowPosition].Vm);
    
    updateState();

 }

 
 public void updateState() {
  if (state == resting && charge > -40) {
    state = open;
  }
  else if (state == open && charge > 35) {
    state = inactive;
  }
  else if ((state == inactive) && charge < -55) {
    state = resting;
  }
 }
}
