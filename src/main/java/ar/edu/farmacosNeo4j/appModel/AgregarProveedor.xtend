package ar.edu.farmacosNeo4j.appModel

import ar.edu.farmacosNeo4j.domain.Laboratorio
import ar.edu.farmacosNeo4j.domain.Farmaco
import ar.edu.farmacosNeo4j.repo.RepoLaboratorios
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.ApplicationContext
import org.uqbar.commons.utils.Observable

@Observable
@Accessors
class AgregarProveedor {
	RepoLaboratorios repoLaboratorios
	String name
	Farmaco farmaco
	Laboratorio laboratorioSeleccionado
	List<Laboratorio> laboratorios
	String farmacoBusqueda

	new(Farmaco _farmaco) {
		farmaco = _farmaco
		repoLaboratorios = ApplicationContext.instance.getSingleton(typeof(RepoLaboratorios))
	}

	def void aceptar() {
		farmaco.agregarProveedor(name, laboratorioSeleccionado)
	}
	
	def void buscarLaboratorio() {
		laboratorios = repoLaboratorios.getLaboratorios(farmacoBusqueda)	
	}

}
