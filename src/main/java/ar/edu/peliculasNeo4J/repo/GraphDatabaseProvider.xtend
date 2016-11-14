package ar.edu.peliculasNeo4J.repo

import java.io.File
import org.eclipse.xtend.lib.annotations.Accessors
import org.neo4j.graphdb.GraphDatabaseService
import org.neo4j.graphdb.factory.GraphDatabaseFactory

@Accessors
class GraphDatabaseProvider {
	static String PATH = "C:/Users/HP/Documents/Neo4j/default.graphdb"
	static GraphDatabaseProvider instance
	
	GraphDatabaseService graphDb
	
	private new() {
		val GraphDatabaseFactory dbFactory = new GraphDatabaseFactory
		graphDb = dbFactory.newEmbeddedDatabase(new File(PATH ))
	}
	
	def static instance() {
		if (instance == null) {
			instance = new GraphDatabaseProvider		
		}
		instance
	}
	 	
}