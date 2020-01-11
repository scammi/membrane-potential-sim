float kIn = 100;
float kOut = 10; 

float nersntEq = -15 * log(kIn/kOut);

void setup() {
  size(600,600);
  boackground(255);
}

void draw() {
 line(0, nersntEq , width/2, nersntEq );
       
}
    
