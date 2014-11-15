class Intersection
{
  int xLocation, yLocation;
  
  Intersection(Point point)
  {
    xLocation = (int)point.getX();
    yLocation = (int)point.getY();
  }
  
  float getX()
  {
    return xLocation;
  }
  
  float getY()
  {
    return yLocation;
  }
}

