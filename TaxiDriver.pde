// is it still blank ? it shouldnt be.
int horizontalLines = 7;
int verticalLines = 7;
int CITY_SIZE = 3;
City city;

void setup()
{
   size(800, 500);
   background(255);
   city = new City(CITY_SIZE);
   //Intersection[] intersections = city.getIntersections();
   
    // mark all the vertices 
        Vertex A = new Vertex("A");
        Vertex B = new Vertex("B");
        Vertex D = new Vertex("D");
        Vertex F = new Vertex("F");
        Vertex K = new Vertex("K");
        Vertex J = new Vertex("J");
        Vertex M = new Vertex("M");
        Vertex O = new Vertex("O");
        Vertex P = new Vertex("P");
        Vertex R = new Vertex("R");
        Vertex Z = new Vertex("Z");

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
        ArrayList<Vertex> path = dij.getShortestPathTo(Z);
        System.out.println("Path: " + path);

}

void draw()
{
   frame.setLocation(width/3,height/3);   
   //city.drawCity();
   //drawIntersections();
   drawGrid();
   noLoop();
}

/*
void drawIntersections() {
   int rand = (int)random(10,20);
   for(int i = 0; i < rand; i++) {
      Vertex vertice = new Vertex(); 
      vertice.drawVertex();
   }
}
*/

void drawGrid() {
   int distanceHorizontal = (int) height/horizontalLines;
   int distanceVertical = (int) width/verticalLines;
   for(int i = 0; i < horizontalLines; i++) {
      line(0, i*distanceHorizontal, width, i*distanceHorizontal);
   }   
   for(int i = 0; i < verticalLines; i++) {
      line(i*distanceVertical, 0, i*distanceVertical, height); 
   }
}
