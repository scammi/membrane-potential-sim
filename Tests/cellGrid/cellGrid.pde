// 2D Array of objects
Cell[][] grid;

// Number of columns and rows in the grid
int cols = 10;
int rows = 10;

void setup() {
  size(200,200);
  grid = new Cell[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j] = new Cell(i*20,j*20,20,20);
    }
  }
}

void draw() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Display each object
      grid[i][j].display();
    }
  }
}

void mouseClicked(){
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      // Initialize each object
      grid[i][j].despolarizacion();
    }
  }
  
  
}
