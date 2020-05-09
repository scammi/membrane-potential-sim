public class NullCell extends Cell{

 NullCell(int tempX, int tempY, int tempW, int tempH, int tempColPosition, int tempRowPosition){
   super(tempX, tempY, tempW, tempH, tempColPosition, tempRowPosition);
 }

 public void calculateAlpha() {
   alpha = 0;
 }

  public void display(){
   rect(x, y, w, h);

   if (state == resting) {
     fill(0,0,0); //red
   }
   else if (state == open) {
     fill(0,255,0); //green
   }
   else if (state == inactive) {
     fill(0,0,255); //blue
   }

 }
}
