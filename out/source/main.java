import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class main extends PApplet {

/**
 * @title Membrane potential simulator
 * @dev see https://github.com/scammi/membrane-potential-sim
 */

Cell[][] tissue;

// cell state
final String resting = "resting";
final String open = "open";
final String inactive = "inactive";

int cols = 100;
int rows = 100;
int ch = 10; //cell_height
int cw = 10; //cell_width
int time = 0;

public void setup() {
  
  background(150);

  tissue = new Cell[cols][rows];

  //TODO: ADD AUTOCELL
  for (int i = 0; i < cols; i++) {

      for (int j = 0; j < rows; j++) {

        if((i == 25 && j == 25) || (i == 75 && j == 75)){
           tissue[i][j] = new AutoCell(i*cw, j*ch, cw, ch, i, j);

        } else if ((i > 30 && i< 35) && (j>30 && j< 35)){
           tissue[i][j] = new NullCell(i*cw, j*ch, cw, ch, i, j);

        }
        else{
          tissue[i][j] = new Cell(i*cw, j*ch, cw, ch, i, j);

        }
    }
  }

}

public void draw() {

 for (int w = 2; w < (cols-2); w++) {
   for (int p = 2; p < (rows-2); p++) {
     tissue[w][p].display();
     tissue[w][p].calculateMembranePotential();
     tissue[w][p].calculateCharge();
     tissue[w][p].calculateAlpha();


   }
   // tissue[i].calculateCharge();
   // tissue[i].calculateAlpha();

 }
}
class AutoCell extends Cell {

 AutoCell(int tempX, int tempY, int tempW, int tempH, int tempColPosition, int tempRowPosition){
   super(tempX, tempY, tempW, tempH, tempColPosition, tempRowPosition);
 }

 public void calculateAlpha() {
    if (state == resting) {
      alpha = alpha + 0.05f;
    }
    else if (state == open) {
      alpha = alpha + (5 - alpha) / 50;
    }
    else if (state == inactive) {
      alpha = alpha + (0.05f - alpha) / 50;
    }
 }


}
class Cell {

 int x, y, w, h, colPosition, rowPosition;
 float Vm;
 String state;
 float charge;

 //variables to calculate membrane potential
 float alpha = .05f;
 int Ko = 4;
 int Ki = 120;
 int No = 145;
 int Ni = 15;

 /**
 *@dev constructor set position of cell in canvas and in the array
 *@param x > position x in canvas
 *@param y > position y in canvas
 *@param w > width of cell
 *@param h > height of cell
 *@param arrayPosition > index of cell in the array
 */
 Cell(int X, int Y, int W, int H, int tempColPosition, int tempRowPosition){
  this.x = X;
  this.y = Y;
  this.w = W;
  this.h = H;

  this.colPosition = tempColPosition;
  this.rowPosition = tempRowPosition;

  this.state = resting;
  calculateMembranePotential();
 }

 public void display(){
   rect(x, y, w, h);

   if (state == resting) {
     fill(255,0,0); //red
   }
   else if (state == open) {
     fill(0,255,0); //green
   }
   else if (state == inactive) {
     fill(0,0,255); //blue
   }

 }

 public void calculateMembranePotential() {
   this.Vm =  (61.5f * log10((Ko + (alpha * No)) / (Ki + (alpha * Ni))) );
 }

 public void calculateAlpha() {
   if (state == resting) {
     alpha = alpha + (0.05f - alpha) / 10;
   }
   else if (state == open) {
     alpha = alpha + (50 - alpha) / 50;
   }
   else if (state == inactive) {
     alpha = alpha + (0.05f - alpha) / 50;
   }
 }


 // Calculates cell charge influenced by the surrounding cells
  public void calculateCharge(){

    if (colPosition < 1 || colPosition >= (cols-1) || rowPosition < 1 || rowPosition >= (rows-1)) 
        return; 

    int preCol = colPosition - 1;
    int postCol = colPosition + 1;
    int preRow = rowPosition - 1;
    int postRow = rowPosition + 1;

    this.charge =
     //centro
     (0.4f * tissue[colPosition][rowPosition].Vm) +
     //arriba
     (0.15f * tissue[colPosition][preRow].Vm) +
     //abajo
     (0.15f * tissue[colPosition][postRow].Vm) +
     //derecha
     (0.15f * tissue[preCol][rowPosition].Vm) +
     //izquierda
     (0.15f * tissue[postCol][rowPosition].Vm);

     updateState();

  }

 public void updateState() {
  if (state == resting && charge > -50) {
    state = open;
  }
  else if (state == open && charge > 10) {
    state = inactive;
  }
  else if (state == inactive && charge < -55) {
    state = resting;
  }
 }

 private float log10 (float x) {
   return(log(x)/log(10));
 }


}
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
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "main" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
