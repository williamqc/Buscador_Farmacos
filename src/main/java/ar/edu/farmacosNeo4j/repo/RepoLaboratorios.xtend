package ar.edu.farmacosNeo4j.repo

import ar.edu.farmacosNeo4j.domain.Laboratorio
import java.util.Iterator
import java.util.List
import org.neo4j.graphdb.Node
import org.neo4j.graphdb.Result

import static extension ar.edu.farmacosNeo4j.repo.LaboratorioToNodeConverter.*

class RepoLaboratorios extends AbstractRepoNeo4J {

	private static RepoLaboratorios instance
	
	def static RepoLaboratorios getInstance() {
		if (instance == null) {
			instance = new RepoLaboratorios
		}
		instance
	}

	def List<Laboratorio> getLaboratorios(String valor) {
		val transaction = graphDb.beginTx
		try {
			getNodosLaboratorios(valor).map [ Node node |
				node.convertToLaboratorio
			].toList
		} finally {
			cerrarTransaccion(transaction)
		}
	}
	
	private def getNodosLaboratorios(String valor) {
		basicSearch("laboratorio.name =~ '(?i).*" + valor + ".*'")
	}

	def getNodoLaboratorioById(Long id) {
		basicSearch("ID(laboratorio) = " + id).head
	}

	private def basicSearch(String where) {
		val Result result = graphDb.execute("match (laboratorio:Laboratorio) where " + where + " return laboratorio")
		val Iterator<Node> farmaco_column = result.columnAs("laboratorio")
		return farmaco_column
	}
	
}

