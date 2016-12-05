package ar.edu.farmacosNeo4j.repo

import ar.edu.farmacosNeo4j.domain.Farmaco
import ar.edu.farmacosNeo4j.domain.Proveedor
import java.util.ArrayList
import java.util.Iterator
import java.util.List
import org.neo4j.graphdb.Label
import org.neo4j.graphdb.Node
import org.neo4j.graphdb.Result

import static extension ar.edu.farmacosNeo4j.repo.LaboratorioToNodeConverter.*

class RepoFarmacos extends AbstractRepoNeo4J {

	private static RepoLaboratorios instance
	
	def static RepoLaboratorios getInstance() {
		if (instance == null) {
			instance = new RepoLaboratorios
		}
		instance
	}

	def static void main(String[] args) {
		new RepoFarmacos => [
			getFarmacos("Fros")
		]
	}

	def List<Farmaco> getFarmacos(String valor) {
		val transaction = graphDb.beginTx
		try {
			getNodosFarmacos(valor).map [ Node node |
				convertToFarmaco(node, false)
			].toList
		} finally {
			cerrarTransaccion(transaction)
		}
	}

	def Farmaco getFarmaco(Long id) {
		val transaction = graphDb.beginTx
		try {
			convertToFarmaco(getNodoFarmaco(id), true)
		} finally {
			cerrarTransaccion(transaction)
		}
	}
	
	def convertToFarmaco(Node nodeFarmaco, boolean deep) {
		new Farmaco => [
			id = nodeFarmaco.id
			descripcion = nodeFarmaco.getProperty("descripcion") as String
			unidad = nodeFarmaco.getProperty("unidad") as String
			costo = (nodeFarmaco.getProperty("costo", 0L) as Long).longValue
			val released = nodeFarmaco.getProperty("prventa", null) as Long
			if (released != null) {
				prventa = released.longValue
			}
			if (deep) { 
				val rel_actuaron = nodeFarmaco.getRelationships(RelacionesFarmaco.ACTED_IN)
				proveedores = rel_actuaron.map [
					rel | new Proveedor => [
						id = rel.id
						val nombreProveedor = rel.getProperty("nombre", []) as String[]
						nombre = new ArrayList(nombreProveedor)
						val nodeLaboratorio = rel.startNode // hay que saber como navegar
						laboratorio = nodeLaboratorio.convertToLaboratorio
					]
				].toList
			}			
		]
	}

	def void eliminarFarmaco(Farmaco farmaco) {
		val transaction = graphDb.beginTx
		try {
			getNodoFarmaco(farmaco.id).delete
			transaction.success
		} finally {
			cerrarTransaccion(transaction)
		}
	}

	def void saveOrUpdateFarmaco(Farmaco farmaco) {
		farmaco.validar
		val transaction = graphDb.beginTx
		try {
			var Node nodoFarmaco = null
			if (farmaco.id == null) {
				nodoFarmaco = graphDb.createNode
				nodoFarmaco.addLabel(labelFarmaco)
			} else {
				nodoFarmaco = getNodoFarmaco(farmaco.id)
			}
			actualizarFarmaco(farmaco, nodoFarmaco)
			transaction.success
			farmaco.id = nodoFarmaco.id
		} finally {
			cerrarTransaccion(transaction)
		}
	}

	private def getNodosFarmacos(String valor) {
		basicSearch("farm.descripcion =~ '(?i).*" + valor + ".*'")
	}

	private def Node getNodoFarmaco(Long id) {
		basicSearch("ID(farm) = " + id).head
	}
	
	private def basicSearch(String where) {
		val Result result = graphDb.execute("match (farm:Farmaco) where " + where + " return farm")
		val Iterator<Node> farmaco_column = result.columnAs("farm")
		return farmaco_column
	}

	private def void actualizarFarmaco(Farmaco farmaco, Node nodeFarmaco) {
		nodeFarmaco => [
			setProperty("descripcion", farmaco.descripcion)
			setProperty("unidad", farmaco.unidad)
			setProperty("costo", new Long(farmaco.costo))
			setProperty("preventa", new Long(farmaco.prventa))
			// Borro las relaciones que tenga ese nodo
			relationships.forEach [it.delete ]
			// Creo relaciones nuevas
			farmaco.proveedores.forEach [ proveedor |
				val Node nodoLaboratorio = RepoLaboratorios.instance.getNodoLaboratorioById(proveedor.laboratorio.id)
				val relProveedor = nodoLaboratorio.createRelationshipTo(it, RelacionesFarmaco.ACTED_IN)
				
				// Manganeta para usar arrays porque el [] se confunde con el bloque
				val roles = proveedor.nombre		
				var String[] _nombres = #[]
				_nombres = roles.toArray(_nombres)
				relProveedor.setProperty("nombre", _nombres)	
			]
		]
	}

	private def Label labelFarmaco() {
		Label.label("Farmaco")
	}
}
