class City
{
  PImage roadSide;
  PImage roadStraight;
  int citySize;
  int distanceHorizontal;
  int distanceVertical;
  int intersectionGridSize;
  Intersection[] intersectionGrid;
  ArrayList<Vertex> path;
  ArrayList<ArrayList<Vertex>> vertices;
  Point intersects;

  City(int size, ArrayList<ArrayList<Vertex>> vertices)
  {
    citySize = size;
    this.vertices = vertices;
  }

  void display()
  {
    roadSide = loadImage("roadSide.png");
    roadStraight = loadImage("roadStraight.png");
    intersectionGridSize = citySize * citySize;
    intersectionGrid = new Intersection[intersectionGridSize];
    distanceHorizontal = (int) height/(citySize + 1);
    distanceVertical = (int) width/(citySize + 1);
    
    // Draw road
    int roadX = (int)(distanceHorizontal + 20);
    int roadY = (int)(distanceVertical / 2);
    int startRows = 0;
    int startCols;
    for(int rows = 0; rows < CITY_SIZE * 4; rows++)
    {
      for(int cols = 0; cols < CITY_SIZE; cols++)
      {
        startCols = 0;
         for(int i = 0; i < 70; i++)
         {
          image(roadStraight, roadX + (cols * distanceVertical), startRows, 18, 15);
          image(roadSide, startCols, roadY + (rows * distanceHorizontal), 15, 18); 
          startCols += 15;
         }
       }
      startRows += 15;
    }
    
    // Draw intersections
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
        
        vertices.get(i - 1).get(j - 1).setXValue((int) intersects.getX());
        vertices.get(i - 1).get(j - 1).setYValue((int) intersects.getY());
        vertices.get(i - 1).get(j - 1).drawVertex(i - 1, j - 1);
      }
    }
  }
  
  Point findIntersection(Point p1, Point p2, Point p3, Point p4)
  {  
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

  int getSize()
  {
    return citySize;
  }
  
  ArrayList<ArrayList<Vertex>> getVertices()
  {
    return this.vertices; 
  }
}

