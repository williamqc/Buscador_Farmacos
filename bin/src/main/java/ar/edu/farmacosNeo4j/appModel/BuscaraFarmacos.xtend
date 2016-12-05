package ar.edu.farmacosNeo4j.appModel

import ar.edu.farmacosNeo4j.domain.Farmaco
import ar.edu.farmacosNeo4j.repo.RepoFarmacos
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class BuscaraFarmacos {
	
	List<Farmaco> farmaco
	String valorABuscar
	RepoFarmacos repoFarmacos
	Farmaco farmacoSeleccionada
	
	new() {
		init()
		repoFarmacos = ApplicationContext.instance.getSingleton(typeof(RepoFarmacos))
	}
	
	def init() {
		farmaco = new ArrayList<Farmaco>
		valorABuscar = ""
	}
	
	def void buscar() {
		farmaco = repoFarmacos.getFarmacos(valorABuscar)
	}
	
	def void limpiar() {
		init()
	}
	
	def void eliminarFarmacoSeleccionada() {
		repoFarmacos.eliminarFarmaco(farmacoSeleccionada)
		buscar	
	}

}
