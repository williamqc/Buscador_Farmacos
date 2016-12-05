package ar.edu.farmacosNeo4j.repo

import ar.edu.farmacosNeo4j.domain.Laboratorio
import org.neo4j.graphdb.Node

class LaboratorioToNodeConverter {

	def static Laboratorio convertToLaboratorio(Node nodeLaboratorio) {
		new Laboratorio => [
			id = nodeLaboratorio.id
			labdescripcion = nodeLaboratorio.getProperty("descripcion", "") as String
			telefono = (nodeLaboratorio.getProperty("telefono", 0L) as Long).intValue
			direccion = nodeLaboratorio.getProperty("direccion", "") as String
		]
	}
}
