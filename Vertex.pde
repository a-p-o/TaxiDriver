class Vertex implements Comparable
{
  String name;
  ArrayList<Edge> adjacencies;
  double minDistance = Double.POSITIVE_INFINITY;
  Vertex previous;
  int xValue;
  int yValue;

  Vertex(String argName)
  { 
    name = argName;
  }
  
  int compareTo(Object other)
  {
    // BEWARE: A Vertex is messily being cast from and Object, just so we can "implement" Comparable.
    // If Comparable is not implemented, then the Dijkstra algorithm breaks, because PriorityQueue needs Vertex to be comparable.
    // DO NOT REUSE THIS CODE
    return Double.compare(minDistance, ((Vertex) other).minDistance);
  }
  
  void drawVertex(int i, int j)
  {
    strokeWeight(2);
    fill(255);
    ellipseMode(CENTER);
    ellipse(xValue, yValue, 20, 20);
    PFont f;
    f = createFont("Times New Roman Bold", 16, true);
    textFont(f, 11);
    fill(0);
    text(i + "" + j, xValue - 6, yValue + 4);
  }
  
  void fillVertex()
  {
    fill(255, 0, 0);
    strokeWeight(2);
    ellipse(xValue, yValue, 20, 20);
  }
  
  void fillShortestPathVertex()
  {
    fill(0, 0, 255);
    strokeWeight(2);
    ellipse(xValue, yValue, 20, 20);
  }
  
  void drawStartImage()
  {
     PImage taxi = loadImage("taxi.png");
     image(taxi, xValue-30, yValue-15);
  }
  
  void drawEndImage()
  {
     PImage house = loadImage("house.png");
     image(house, xValue-30, yValue-15);
  }
 
  int getXValue()
  {
    return xValue; 
  }
  
  int getYValue()
  {
    return yValue; 
  }
 
  String getName()
  {
    return name; 
  }
 
  void setXValue(int x)
  {
    xValue = x;
  }
 
  void setYValue(int y)
  {
    yValue = y;
  }
}

