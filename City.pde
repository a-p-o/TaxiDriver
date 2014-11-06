class City {

  int citySize;
  int distanceHorizontal;
  int distanceVertical;
  boolean hasVertex;
  Intersection[] intersections;

  City(int size) {
    citySize = size;
  }

  Intersection[] getIntersections() {
    return intersections;
  }

  void display() {
   distanceHorizontal = (int) height/(citySize + 1);
   distanceVertical = (int) width/(citySize + 1);
   for(int i = 0; i <= citySize; i++) {
      hasVertex = (0.5 < random(0, 1)) ? true : false;
      line(0, i*distanceHorizontal, width, i*distanceHorizontal);
      line(i*distanceVertical, 0, i*distanceVertical, height);
      strokeWeight(10);
      if(hasVertex) {
         Vertex vertice = new Vertex("T");
         //vertice.drawVertex(); 
      }
   }
  }

  int getSize() {
    return citySize;
  }
}


