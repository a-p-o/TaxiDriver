int xValue;
int yValue;
int widthValue;
int heightValue;

class Vertex {
   Vertex() {
     //xValue = x;
     //yValue = y;
     //widthValue;
     //heightValue = h;
   }
    
   void drawVertex() {
     int randX = (int)random(100,700);
     int randY = (int)random(50,500);
     ellipse(randX, randY, 20, 20);   
   }
}

