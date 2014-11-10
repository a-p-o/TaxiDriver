class Vertex implements Comparable
{
  String name;
  ArrayList<Edge> adjacencies;
  double minDistance = Double.POSITIVE_INFINITY;
  Vertex previous;
  int xValue;
  int yValue;
  int widthValue;
  int heightValue;

  Vertex(String argName)
  { 
    name = argName;
  }
  
  String toString()
  { 
    return name;
  }
  
  int compareTo(Object other)
  {
    // BEWARE: A Vertex is messily being cast from and Object, just so we can "implement" Comparable.
    // If Comparable is not implemented, then the Dijkstra algorithm breaks, because PriorityQueue needs Vertex to be comparable.
    // DO NOT REUSE THIS CODE
    return Double.compare(minDistance, ((Vertex) other).minDistance);
  }
  
  void drawVertex()
  {
    strokeWeight(2);
    ellipse(xValue, yValue, 20, 20);
  }
 
  void fillVertex()
  {
    fill(255, 0, 0, 255);
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

