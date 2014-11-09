// is it still blank ? it shouldnt be.
int CITY_SIZE = 5;
City city;
ArrayList<Vertex> path;

void setup()
{
  size(800, 500);
  background(255);
   
  // Name all vertices 
  Vertex A = new Vertex("1st Street");
  Vertex B = new Vertex("2nd Street");
  Vertex C = new Vertex("3rd Street");
  Vertex D = new Vertex("4th Street");
  Vertex E = new Vertex("5th Street");
  Vertex F = new Vertex("6th Street");
  Vertex G = new Vertex("7th Street");
  Vertex H = new Vertex("8th Street");
  Vertex I = new Vertex("9th Street");
  Vertex J = new Vertex("Park Street");
  Vertex K = new Vertex("Pine Street");
  Vertex L = new Vertex("10th Street");
  Vertex M = new Vertex("Oak Street");
  Vertex N = new Vertex("11th Street");
  Vertex O = new Vertex("Elm Street");
  Vertex P = new Vertex("Washington Street");
  Vertex Q = new Vertex("12th Street");
  Vertex R = new Vertex("Cedar Street");
  Vertex S = new Vertex("13th Street");
  Vertex T = new Vertex("14th Street");
  Vertex U = new Vertex("15th Street");
  Vertex V = new Vertex("16th Street");
  Vertex W = new Vertex("17th Street");
  Vertex X = new Vertex("18th Street");
  Vertex Z = new Vertex("Lake Street");
  
  ArrayList vertices = new ArrayList();
  vertices.add(A);
  vertices.add(B);
  vertices.add(C);
  vertices.add(D);
  vertices.add(E);
  vertices.add(F);
  vertices.add(G);
  vertices.add(H);
  vertices.add(I);
  vertices.add(J);
  vertices.add(K);
  vertices.add(L);
  vertices.add(M);
  vertices.add(N);
  vertices.add(O);
  vertices.add(P);
  vertices.add(Q);
  vertices.add(R);
  vertices.add(S);
  vertices.add(T);
  vertices.add(U);
  vertices.add(V);
  vertices.add(W);
  vertices.add(X);
  vertices.add(Z);
  
  // set the edges and weight
  A.adjacencies = new Edge[]{ new Edge(M, 8) };
  B.adjacencies = new Edge[]{ new Edge(D, 11) };
  D.adjacencies = new Edge[]{ new Edge(B, 11) };
  F.adjacencies = new Edge[]{ new Edge(K, 23) };
  K.adjacencies = new Edge[]{ new Edge(O, 40) };
  J.adjacencies = new Edge[]{ new Edge(K, 25) };
  M.adjacencies = new Edge[]{ new Edge(R, 8) };
  O.adjacencies = new Edge[]{ new Edge(K, 40) };
  P.adjacencies = new Edge[]{ new Edge(Z, 18) };
  R.adjacencies = new Edge[]{ new Edge(P, 15) };
  Z.adjacencies = new Edge[]{ new Edge(P, 18) };
  
  Dijkstra dij = new Dijkstra();
  dij.computePaths(A); // run Dijkstra
  System.out.println("Distance to " + Z + ": " + Z.minDistance);
  path = dij.getShortestPathTo(Z);
  System.out.println("Path: " + path);
  
  city = new City(CITY_SIZE, vertices, path);
  city.display();
}


void draw()
{
  ArrayList<Vertex> newVertices = city.getVertices();
  
  for(int i = 0; i < newVertices.size(); i++)
  {
    for(int j = 0; j < path.size(); j++)
    {
      if(path.get(j).getName() == newVertices.get(i).getName())
      {
        newVertices.get(i).fillVertex(); 
      }
    } 
  }
}
