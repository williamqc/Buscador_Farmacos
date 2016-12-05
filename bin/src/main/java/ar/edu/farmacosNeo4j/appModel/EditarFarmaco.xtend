package ar.edu.farmacosNeo4j.appModel

import ar.edu.farmacosNeo4j.domain.Farmaco
import ar.edu.farmacosNeo4j.domain.Proveedor
import ar.edu.farmacosNeo4j.repo.RepoFarmacos
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class EditarFarmaco {
	Farmaco farmaco
	boolean modoAlta
	RepoFarmacos repoFarmacos
	Proveedor proveedorSeleccionado
	
	
	new() {
		repoFarmacos = ApplicationContext.instance.getSingleton(typeof(RepoFarmacos))
	}
	
	def void aceptar() {
		repoFarmacos.saveOrUpdateFarmaco(farmaco)
	}
	
	def static EditarFarmaco modoAlta() {
		new EditarFarmaco => [
			modoAlta = true
			farmaco = new Farmaco
		]
	}
	
	def static EditarFarmaco modoEdicion(Farmaco _farmaco) {
		new EditarFarmaco => [
			modoAlta = false
			farmaco = repoFarmacos.getFarmaco(_farmaco.id)
		]
	}

	def void eliminarProveedor() {
		farmaco.eliminarProveedor(proveedorSeleccionado)
	}
	
}
