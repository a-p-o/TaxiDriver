// is it still blank ? it shouldnt be.
int CITY_SIZE = 8;
City city;
ArrayList<Vertex> path;

void setup()
{
  // Window and frame
  size(800, 500);
  background(255);
  
  // Create Vertices
  ArrayList<ArrayList<Vertex>> vertices = new ArrayList<ArrayList<Vertex>>();
  ArrayList<Vertex> cityRow;
  
  for(int i = 0; i < CITY_SIZE; i++)
  {
    cityRow = new ArrayList<Vertex>();
    for(int j = 0; j < CITY_SIZE; j++)
    {
      Vertex k = new Vertex(i + "" + j + "th Street");
      
      cityRow.add(k);
    }
    vertices.add(cityRow);
  }
  
  // Associate the Vertices with Edges with weights
  for(int row = 0; row < vertices.size(); row++)
  {
    for(int col = 0; col < vertices.get(row).size(); col++)
    {
      ArrayList<Edge> edges = new ArrayList<Edge>();
      
      // Check top and bottom of Vertex
      for(int i = -1; i <= 1; i += 2)
      {
        try
        {
          // Check top Vertex, then bottom Vertex
          if(vertices.get(row + i).get(col) == null)
          {
            println("A vertex does not exist top/bottom");
          }
          else
          {
            // Vertex top/bottom exists
            edges.add(new Edge(vertices.get(row + i).get(col), (int) random(1, 20)));
          }
        }
        catch(ArrayIndexOutOfBoundsException e)
        {
//          println(e);
        }
        catch(IndexOutOfBoundsException e)
        {
//          println(e);
        }
      }
      
      // Check left and right of Vertex
      for(int i = -1; i <= 1; i +=2)
      {
        try
        {
          // Check left Vertex, then right Vertex
          if(vertices.get(row).get(col + i) == null)
          {
            println("A vertex does not exist left/right");
          }
          else
          {
            // Vertex left/right exists
            edges.add(new Edge(vertices.get(row).get(col + i), (int) random(1, 20)));
          }
        }
        catch(ArrayIndexOutOfBoundsException e)
        {
//          println(e);
        }
        catch(IndexOutOfBoundsException e)
        {
//          println(e);
        }
      }
      
      vertices.get(row).get(col).adjacencies = edges;
    }
  }
  
  Dijkstra dij = new Dijkstra();
  dij.computePaths(vertices.get((int) random(0, 2)).get((int) random(0, 2))); // run Dijkstra
  path = dij.getShortestPathTo(vertices.get((int) random(5, CITY_SIZE)).get((int) random(5, CITY_SIZE)));
  System.out.println("Path: " + path);
  
  city = new City(CITY_SIZE, vertices);
  city.display();
}

void draw()
{
  ArrayList<ArrayList<Vertex>> newVertices = city.getVertices();
  
  for(int row = 0; row < newVertices.size(); row++)
  {
    for(int col = 0; col < newVertices.get(row).size(); col++)
    {
      for(int pathIndex = 0; pathIndex < path.size(); pathIndex++)
      {
        if(path.get(pathIndex).getName() == newVertices.get(row).get(col).getName())
        {
          newVertices.get(row).get(col).fillVertex();
        }
      }
    }
  }
}

