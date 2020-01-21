import lord_of_galaxy.timing_utils.*;

Stopwatch s;//Declare

void setup(){
  size(640, 360);
  
  //Creating a stopwatch to keep time
  s = new Stopwatch(this);
  
  //Start the stopwatch
  s.start();
} 

void draw(){

  rect(0,0,50,50);

  if(s.second() % 2 == 0)
  {
    fill(255,0,0);
    rect(0,0,50,50);

    println(s.second());
  }
  else
  {
    fill(0,0,255);
    rect(0,0,50,50);
  }
  
}
