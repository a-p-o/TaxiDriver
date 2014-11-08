class City
{
  int citySize;
  int distanceHorizontal;
  int distanceVertical;
  int intersectionGridSize;
  Intersection[] intersectionGrid;
  ArrayList<Vertex> path;
  ArrayList<Vertex> vertices;
  Point intersects;

  City(int size, ArrayList<Vertex> vertices, ArrayList<Vertex> path)
  {
    citySize = size;
    println("in constructor's path: " + path);
    println("in constructor's vertices: " + vertices);
    this.vertices = vertices;
    this.path = path;
  }

  Intersection[] getIntersections()
  {
    return intersectionGrid;
  }

  void display()
  {
    intersectionGridSize = citySize * citySize;
    intersectionGrid = new Intersection[intersectionGridSize];
    distanceHorizontal = (int) height/(citySize + 1);
    distanceVertical = (int) width/(citySize + 1);
   
    //Draw city grid
    for(int i = 0; i <= citySize; i++)
    {
      line(0, i*distanceHorizontal, width, i*distanceHorizontal);
      line(i*distanceVertical, 0, i*distanceVertical, height);
    }
    
    //Draw intersections
    int count = 0;
    for(int i = 1; i <= citySize; i++)
    {      
      for(int j = 1; j <= citySize; j++)
      {
        Point p1 = new Point(i * distanceVertical, 0);
        Point p2 = new Point(i * distanceVertical, height);
        Point p3 = new Point(0, j * distanceHorizontal);
        Point p4 = new Point(width, j * distanceHorizontal);
        intersects = findIntersection(p1, p2, p3, p4);
        Intersection intersection = new Intersection(intersects);
        //intersectionGrid[count] = intersection;
        
        intersection.displayVertex(vertices.get(j-1));
        println( "count: " + count);
                
        vertices.get(count).setXValue((int)intersects.getX());
        vertices.get(count).setYValue((int)intersects.getY());
        println("X: " + vertices.get(count).getXValue());
        println("Y: " + vertices.get(count).getYValue());
        count++;
      }
    }
  }
  
  Point findIntersection(Point p1, Point p2, Point p3, Point p4) {  
  float xDistance1, yDistance1, xDistance2, yDistance2, xDistance3, yDistance3;  
  float ua, div;  
  
  xDistance1 = p2.xValue - p1.xValue;  
  xDistance2 = p4.xValue - p3.xValue;  
  yDistance1 = p2.yValue - p1.yValue;  
  yDistance2 = p4.yValue - p3.yValue;  
  xDistance3 = p1.xValue - p3.xValue;  
  yDistance3 = p1.yValue - p3.yValue;    
  
  Point point = new Point(0,0);  
  div = yDistance2 * xDistance1 - xDistance2 * yDistance1;  
  ua = (xDistance2 * yDistance3 - yDistance2 * xDistance3) / div; 
  point.xValue = p1.xValue + ua * xDistance1;  
  point.yValue = p1.yValue + ua * yDistance1;  

  return point;  
  }

  int getSize() {
    return citySize;
  }
  
  ArrayList<Vertex> getVertices()
  {
     for(int i = 0; i < vertices.size(); i++)
     {
       println(i);
       println("x value: " + vertices.get(i).getXValue() + " y value: " + vertices.get(i).getYValue());
     }
    return this.vertices; 
  }
}

