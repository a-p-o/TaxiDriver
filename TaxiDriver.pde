import javax.swing.JOptionPane;
int CITY_SIZE = 10;
int startX;
int startY;
int destX;
int destY;
City city;
ArrayList<Vertex> path;
ArrayList<ArrayList<Vertex>> newVertices;
ArrayList<Vertex> userSelectedPath;

void setup()
{
  // Window and frame
  size(800, 500);
  background(0, 125, 0);
  
  // Create Vertices
  ArrayList<ArrayList<Vertex>> vertices = new ArrayList<ArrayList<Vertex>>();
  ArrayList<Vertex> cityRow;
  userSelectedPath = new ArrayList<Vertex>();

  for (int i = 0; i < CITY_SIZE; i++)
  {
    // Create a row of vertices
    cityRow = new ArrayList<Vertex>();
    for (int j = 0; j < CITY_SIZE; j++)
    {
      // Create each vertice in this row
      Vertex k = new Vertex(i + "" + j + "th Street");
      cityRow.add(k);
    }
    
    // Add the row to the city 
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
          edges.add(new Edge(vertices.get(row + i).get(col), (int) random(1, 20)));
        }
        catch(ArrayIndexOutOfBoundsException e)
        {
          // A thrown error is expected here. We deal with it.
        }
        catch(IndexOutOfBoundsException e)
        {
          // A thrown error is expected here. We deal with it.
        }
      }

      // Check left and right of Vertex
      for (int i = -1; i <= 1; i +=2)
      {
        try
        {
          edges.add(new Edge(vertices.get(row).get(col + i), (int) random(1, 20)));
        }
        catch(ArrayIndexOutOfBoundsException e)
        {
          // A thrown error is expected here. We deal with it.
        }
        catch(IndexOutOfBoundsException e)
        {
          // A thrown error is expected here. We deal with it.
        }
      }
      
      vertices.get(row).get(col).adjacencies = edges;
    }
  }

  Dijkstra dij = new Dijkstra();
  startX = (int)random(0, 2);
  startY = (int)random(0, 2);
  
  // Execute Dijkstra's algorithm
  dij.computePaths(vertices.get(startX).get(startY));

  destX = (int)random(5, CITY_SIZE);
  destY = (int)random(5, CITY_SIZE);
  
  // Computer shortest path to destination
  path = dij.getShortestPathTo(vertices.get(destX).get(destY));
  
  // Create graphical city
  city = new City(CITY_SIZE, vertices);
  city.display();
  
  newVertices = city.getVertices();
  userSelectedPath.add(newVertices.get(startX).get(startY));
  newVertices.get(startX).get(startY).drawStartImage();
  newVertices.get(destX).get(destY).drawEndImage();
}

//88888888ba  88888888888 88        88   ,ad8888ba,   88          88888888ba,    
//88      "8b 88          88        88  d8"'    `"8b  88          88      `"8b   
//88      ,8P 88          88        88 d8'        `8b 88          88        `8b  
//88aaaaaa8P' 88aaaaa     88aaaaaaaa88 88          88 88          88         88  
//88""""""8b, 88"""""     88""""""""88 88          88 88          88         88  
//88      `8b 88          88        88 Y8,        ,8P 88          88         8P  
//88      a8P 88          88        88  Y8a.    .a8P  88          88      .a8P   
//88888888P"  88888888888 88        88   `"Y8888Y"'   88888888888 88888888Y"'    
//
//
//888888888888 88        88 88888888888     ad88888ba  88b           d88        db        88          88          88888888888 ad88888ba 888888888888  
//     88      88        88 88             d8"     "8b 888b         d888       d88b       88          88          88         d8"     "8b     88       
//     88      88        88 88             Y8,         88`8b       d8'88      d8'`8b      88          88          88         Y8,             88       
//     88      88aaaaaaaa88 88aaaaa        `Y8aaaaa,   88 `8b     d8' 88     d8'  `8b     88          88          88aaaaa    `Y8aaaaa,       88       
//     88      88""""""""88 88"""""          `"""""8b, 88  `8b   d8'  88    d8YaaaaY8b    88          88          88"""""      `"""""8b,     88       
//     88      88        88 88                     `8b 88   `8b d8'   88   d8""""""""8b   88          88          88                 `8b     88       
//     88      88        88 88             Y8a     a8P 88    `888'    88  d8'        `8b  88          88          88         Y8a     a8P     88       
//     88      88        88 88888888888     "Y88888P"  88     `8'     88 d8'          `8b 88888888888 88888888888 88888888888 "Y88888P"      88       
//                                                                                                                                                    
//                                                                                                                                                                                                                                                                                                     
//88b           d88        db        88 888b      88    8b        d8 ,ad8888ba,   88        88    I8,        8        ,8I 88 88          88           
//888b         d888       d88b       88 8888b     88     Y8,    ,8P d8"'    `"8b  88        88    `8b       d8b       d8' 88 88          88           
//88`8b       d8'88      d8'`8b      88 88 `8b    88      Y8,  ,8P d8'        `8b 88        88     "8,     ,8"8,     ,8"  88 88          88           
//88 `8b     d8' 88     d8'  `8b     88 88  `8b   88       "8aa8"  88          88 88        88      Y8     8P Y8     8P   88 88          88           
//88  `8b   d8'  88    d8YaaaaY8b    88 88   `8b  88        `88'   88          88 88        88      `8b   d8' `8b   d8'   88 88          88           
//88   `8b d8'   88   d8""""""""8b   88 88    `8b 88         88    Y8,        ,8P 88        88       `8a a8'   `8a a8'    88 88          88           
//88    `888'    88  d8'        `8b  88 88     `8888         88     Y8a.    .a8P  Y8a.    .a8P        `8a8'     `8a8'     88 88          88           
//88     `8'     88 d8'          `8b 88 88      `888         88      `"Y8888Y"'    `"Y8888Y"'          `8'       `8'      88 88888888888 88888888888  
//                                                                                                                                                    
//                                                                                                                                                                                                                                        
//88888888888 8b           d8 88888888888 88888888ba      ad88888ba  88888888888 88888888888  
//88          `8b         d8' 88          88      "8b    d8"     "8b 88          88           
//88           `8b       d8'  88          88      ,8P    Y8,         88          88           
//88aaaaa       `8b     d8'   88aaaaa     88aaaaaa8P'    `Y8aaaaa,   88aaaaa     88aaaaa      
//88"""""        `8b   d8'    88"""""     88""""88'        `"""""8b, 88"""""     88"""""      
//88              `8b d8'     88          88    `8b              `8b 88          88           
//88               `888'      88          88     `8b     Y8a     a8P 88          88           
//88888888888       `8'       88888888888 88      `8b     "Y88888P"  88888888888 88888888888  
void draw()
{
  for (int i = 0; i < userSelectedPath.size(); i++) userSelectedPath.get(i).fillVertex();
}

int sumPaths(ArrayList<Vertex> path)
{
  int sum = 0;
  
  for (int i = 0; i < path.size ()-1; i++)
  {
    for (int j = 0; j < path.get(i).adjacencies.size(); j++)
    { 
      if (path.get(i).adjacencies.get(j).getTarget() == path.get(i + 1))
      {
        sum += path.get(i).adjacencies.get(j).getWeight();
      }
    }
  }
  return sum;
}

void isWinner()
{
  int shortestPathWeight = sumPaths(path);
  int usersPathWeight = sumPaths(userSelectedPath);

  for (int i = 0; i < path.size(); i++)
  {
    path.get(i).fillShortestPathVertex();
  }
  
  if (usersPathWeight < shortestPathWeight)
  {
    PFont f;
    f = createFont("Times New Roman", 16, true);
    fill(255, 255, 255);
    rect(width - 330, 0, 330, 130);
    textFont(f, 24);
    fill(255, 0, 0);
    text("GAME OVER, You Win!", width - 300, 40);
    text("The shortest path score is " + shortestPathWeight + ",\n and your score is " + usersPathWeight + ".", width - 315, 80);
  } 
  else
  {
    PFont f;
    f = createFont("Times New Roman", 16, true);
    fill(255, 255, 255);
    rect(width - 330, 0, 330, 130);
    textFont(f, 24);
    fill(255, 0, 0);
    text("GAME OVER, You Lost!", width - 300, 40);
    text("The shortest path score is " + shortestPathWeight + ",\n and your score is " + usersPathWeight + ".", width - 315, 80);
  }
  noLoop();
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
      }
      else
      {
        startX--;
        userSelectedPath.add(newVertices.get(startX).get(startY));
      }
    }
    else if (keyCode == RIGHT)
    {
      if (startX >= CITY_SIZE-1)
      {
        println("RIGHT bounds");
      }
      else
      {
        startX++;
        userSelectedPath.add(newVertices.get(startX).get(startY));
      }
    }
    else if (keyCode == UP)
    {
      if (startY <= 0)
      {
        println("UP bounds");
      }
      else
      {
        startY--;
        userSelectedPath.add(newVertices.get(startX).get(startY));
      }
    }
    else if (keyCode == DOWN)
    {
      if (startY >= CITY_SIZE-1)
      {
        println("DOWN bounds");
      }
      else
      {
        startY++;
        userSelectedPath.add(newVertices.get(startX).get(startY));
      }
    }
  }
  
  if(keyPressed)
  {
    if (key == 'h' || key == 'H')
    {
      String hint = "Street name: Weight:\n";
      
      for(int i = 0; i < (path.size() - 1); i++)
      {
        for(int j = 0; j < path.get(i).adjacencies.size(); j++)
        {
          if (path.get(i).adjacencies.get(j).getTarget() == path.get(i + 1))
          {
            hint = hint + path.get(i).adjacencies.get(j).getTarget().getName() + "       " + path.get(i).adjacencies.get(j).getWeight() + "\n"; 
          }
        }  
      }
      JOptionPane.showMessageDialog(null, hint); 
    }
  }
  
  if (startX == destX && startY == destY)
  {
    isWinner();
  }
}
