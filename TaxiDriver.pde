// is it still blank ? it shouldnt be.
int CITY_SIZE = 10;
int startX;
int startY;
int destX;
int destY;
City city;
ArrayList<Vertex> path;
ArrayList<ArrayList<Vertex>>newVertices;
ArrayList<Vertex> userSelectedPath;

void setup()
{
  // Window and frame
  size(800, 500);
  background(255);

  // Create Vertices
  ArrayList<ArrayList<Vertex>> vertices = new ArrayList<ArrayList<Vertex>>();
  ArrayList<Vertex> cityRow;
  userSelectedPath = new ArrayList<Vertex>();

  for (int i = 0; i < CITY_SIZE; i++)
  {
    cityRow = new ArrayList<Vertex>();
    for (int j = 0; j < CITY_SIZE; j++)
    {
      Vertex k = new Vertex(i + "" + j + "th Street");
      cityRow.add(k);
    }
    vertices.add(cityRow);
  }

  // Associate the Vertices with Edges with weights
  for (int row = 0; row < vertices.size (); row++)
  {
    for (int col = 0; col < vertices.get (row).size(); col++)
    {
      ArrayList<Edge> edges = new ArrayList<Edge>();

      // Check top and bottom of Vertex
      for (int i = -1; i <= 1; i += 2)
      {
        try
        {
          // Check top Vertex, then bottom Vertex
          if (vertices.get(row + i).get(col) == null)
          {
            println("A vertex does not exist top/bottom");
          } else
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
      for (int i = -1; i <= 1; i +=2)
      {
        try
        {
          // Check left Vertex, then right Vertex
          if (vertices.get(row).get(col + i) == null)
          {
            println("A vertex does not exist left/right");
          } else
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
  startX = (int)random(0, 2);
  startY = (int)random(0, 2);
  dij.computePaths(vertices.get(startX).get(startY)); // run Dijkstra

  destX = (int)random(5, CITY_SIZE);
  destY = (int)random(5, CITY_SIZE);
  path = dij.getShortestPathTo(vertices.get(destX).get(destY));
  System.out.println("Path: " + path);
  city = new City(CITY_SIZE, vertices);
  
}

void draw()
{ 
  background(255); 
  city.display();
  newVertices = city.getVertices();

  newVertices.get(startX).get(startY).drawStartImage();
  newVertices.get(destX).get(destY).drawEndImage();

  for (int i =0; i < userSelectedPath.size (); i++)
  {
    userSelectedPath.get(i).fillVertex();
  }
}

int sumPaths(ArrayList<Vertex> path)
{
  int sum=0;
  for (int i = 0; i < path.size ()-1; i++)
  { 
    for (int j = 0; j < path.get (i).adjacencies.size(); j++)
    { 
      if (path.get(i).adjacencies.get(j).getTarget() == path.get(i+1))
      {
        sum += path.get(i).adjacencies.get(j).getWeight();
      }
    }
  }

  return sum;
}

void isWinner()
{
  println("ending");
  int shortestPathWeight = sumPaths(path);
  int usersPathWeight = sumPaths(userSelectedPath);

  println("shortest weight->"+ shortestPathWeight);
  println("user weight->"+ usersPathWeight);

  if (usersPathWeight < shortestPathWeight)
  {
    println("win");
  } else
  {
    println("loser");
  }
}

void keyPressed()
{
  if (key == CODED)
  {
    if (keyCode == LEFT)
    {
      if (startX <= 0)
      {
        println("LEFT bounds");
      } else
      {
        startX--;
        userSelectedPath.add(newVertices.get(startX).get(startY));
      }
    } else if (keyCode == RIGHT)
    {
      if (startX >= CITY_SIZE-1)
      {
        println("RIGHT bounds");
      } else
      {
        startX++;
        userSelectedPath.add(newVertices.get(startX).get(startY));
      }
    } else if (keyCode == UP)
    {
      if (startY <= 0)
      {
        println("UP bounds");
      } else
      {
        startY--;
        userSelectedPath.add(newVertices.get(startX).get(startY));
      }
    } else if (keyCode == DOWN)
    {
      if (startY >= CITY_SIZE-1)
      {
        println("DOWN bounds");
      } else
      {
        startY++;
        userSelectedPath.add(newVertices.get(startX).get(startY));
      }
    }
  }
  
  if (startX == destX && startY == destY)
  {
    isWinner();
  }
}
