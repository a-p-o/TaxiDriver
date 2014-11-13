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
    fill(255);
    ellipseMode(CENTER);
    ellipse(xValue, yValue, 20, 20);
  }
  
  // BEWARE:
  // THIS CODE IS NOT FUNCTIONAL, WORK IN PROGRESS.
  void drawEdges()
  {
    int targetVertexX, targetVertexY;
    Edge targetEdge;
    Vertex targetVertex;
    
    for(int i = 0; i < adjacencies.size(); i++)
    {
      targetEdge = adjacencies.get(i);
      targetVertex = targetEdge.getTarget();
     
      
      if(this.getXValue() == targetVertex.getXValue())
      {
        if(this.getYValue() == targetVertex.getYValue())
        {
          println("this and Target are equal.");
          continue;
        }
      }
      
      targetVertexX = targetVertex.getXValue();
      targetVertexY = targetVertex.getYValue();
      
      if(targetVertexX < xValue)
      {
        int x, y;
        String message;
        
        message = "L " + targetEdge.getWeight();
        x = xValue - ((int) (xValue - targetVertexX) / 2);
        y = yValue;
        
        fill(0);
//        text(message, x, y);
      }
      else if(targetVertexX > xValue)
      {
        int x, y;
        String message;
        
        message = "R " + targetEdge.getWeight();
        x = xValue + (int)((targetVertexX - xValue) / 2) + 20;
        y = yValue;
        
        fill(0);
//        text(message, x, y);
      }
      
      if(targetVertexY < yValue)
      {
        int x, y;
        String message;
        
        message = "U " + targetEdge.getWeight();
        x = xValue;
        y = yValue -  ((int) (yValue - targetVertexY) / 2);
        
        fill(0);
        //text(message, x, y);
      }
      else
      {
        int x, y;
        String message;
        
        message = "D " + targetEdge.getWeight();
        x = xValue;
        y = yValue + ((int) (yValue - targetVertexY) / 2);
        
        fill(0);
        //text(message, x, y);
      }
    }
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

