package ar.edu.farmacosNeo4j.repo;

/* @Accessors
 */public class GraphDatabaseProvider {
  private static /* String */Object PATH = "C:/Users/HP/Documents/Neo4j/default.graphdb";
  
  private static GraphDatabaseProvider instance;
  
  private /* GraphDatabaseService */Object graphDb;
  
  private GraphDatabaseProvider() {
    throw new Error("Unresolved compilation problems:"
      + "\nGraphDatabaseFactory cannot be resolved to a type."
      + "\nGraphDatabaseFactory cannot be resolved."
      + "\nFile cannot be resolved."
      + "\nThe field GraphDatabaseProvider.graphDb refers to the missing type GraphDatabaseService"
      + "\nThe field GraphDatabaseProvider.PATH refers to the missing type String"
      + "\nnewEmbeddedDatabase cannot be resolved"
      + "\n+ cannot be resolved");
  }
  
  public static GraphDatabaseProvider instance() {
    throw new Error("Unresolved compilation problems:"
      + "\n== cannot be resolved.");
  }
}
