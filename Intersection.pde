class Intersection {
  
  int xLocation;
  int yLocation;
  int time;
  boolean hasCrash;
  
  Intersection(Point point) {
    xLocation = (int)point.getX();
    yLocation = (int)point.getY();
    
    hasCrash = (0.5 < random(0, 1)) ? true : false;
    
    //System.out.println("Has crash: " + hasCrash);
  }
  
  void displayVertex(Vertex vertex) {
    //drawing vertex
     vertex.drawVertex((int)xLocation, (int)yLocation);
  }
  
  int getTime() {
    //returning time
    return time;
  }
  
  float getX() {
    return xLocation;
  }
  
  float getY() {
    return yLocation;
  }
}

