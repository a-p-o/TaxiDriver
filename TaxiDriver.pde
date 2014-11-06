// is it still blank ? it shouldnt be.
int horizontalLines = 7;
int verticalLines = 7;
int CITY_SIZE = 3;

void setup()
{
   size(800, 500);
   background(255);
   //City city = new City(CITY_SIZE);
   //  Intersection[] intersections city.getIntersections();
}

void draw()
{
   frame.setLocation(width/3,height/3);   
   //city.drawCity();
   drawIntersections();
   drawGrid();
   noLoop();
}

void drawIntersections() {
   int rand = (int)random(10,20);
   for(int i = 0; i < rand; i++) {
      Vertex vertice = new Vertex(); 
      vertice.drawVertex();
   }
}

void drawGrid() {
   int distanceHorizontal = (int) height/horizontalLines;
   int distanceVertical = (int) width/verticalLines;
   for(int i = 0; i < horizontalLines; i++) {
      line(0, i*distanceHorizontal, width, i*distanceHorizontal);
   }   
   for(int i = 0; i < verticalLines; i++) {
      line(i*distanceVertical, 0, i*distanceVertical, height); 
   }
