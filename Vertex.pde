class Vertex
{
    String name;
    Edge[] adjacencies;
    double minDistance = Double.POSITIVE_INFINITY;
    Vertex previous;
    
    Vertex(String argName) { 
      name = argName; 
    }
    
    String toString() { 
      return name; 
    }
    
    int compareTo(Vertex other)
    {
        return Double.compare(minDistance, other.minDistance);
    }
}

