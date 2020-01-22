import lord_of_galaxy.timing_utils.*;

Stopwatch s;//Declare
int time;

void setup(){
  size(640, 360);
  
  //Creating a stopwatch to keep time
  s = new Stopwatch(this);
  
  //Start the stopwatch
  s.start();
} 

void draw(){
   time = millis();

  rect(0,0,50,50);

  if((time/2000) % 2 == 0)
  {
    fill(255,0,0);
    rect(0,0,50,50);

    println(time);
  }
  else
  {
    fill(0,0,255);
    rect(0,0,50,50);
  }
  
}
