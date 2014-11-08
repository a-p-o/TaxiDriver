class Vertex {
    String name;
    Edge[] adjacencies;
    double minDistance = Double.POSITIVE_INFINITY;
    Vertex previous;
    int xValue;
    int yValue;
    int widthValue;
    int heightValue;

    
    Vertex(String argName) { 
      name = argName; 
    }
    
    String toString() { 
      return name; 
    }
    
    int compareTo(Vertex other) {
        return Double.compare(minDistance, other.minDistance);
    }
    
    void drawVertex(int x, int y) {
      xValue = x;
      yValue = y;
      strokeWeight(2);
      ellipse(x, y, 20, 20);
   }
   
   void fillVertex()
   {
      fill(255, 0 ,0, 255);
      strokeWeight(2);
      ellipse(xValue, yValue, 20 ,20 );
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

