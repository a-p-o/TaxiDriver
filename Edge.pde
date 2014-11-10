class Edge
{
  Vertex target;
  int weight;
  
  Edge(Vertex argTarget, int argWeight)
  {
   target = argTarget;
   weight = argWeight; 
  }
  
  Vertex getTarget()
  {
    return target;
  }
  
  int getWeight()
  {
    return weight;
  }
}
