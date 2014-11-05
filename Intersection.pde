class Intersection {
  
  int xLocation;
  int yLocation;
  int time;
  boolean hasCrash;
  
  Intersection(int x, int y) {
    xLocation = x;
    yLocation = y;
    
    hasCrash = (0.5 < random(0, 1)) ? true : false;
    
    println("Has crash: " + hasCrash);
  }
  
  int getTime() {
    return time;
  }
  
  int getX() {
    return xLocation;
  }
  
  int getY() {
    return yLocation;
  }
  
  void setup() {
    Intersection intersection = new Intersection(0, 0); 
  }
}

