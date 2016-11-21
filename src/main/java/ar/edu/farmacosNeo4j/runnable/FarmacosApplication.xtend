package ar.edu.farmacosNeo4j.runnable

import ar.edu.farmacosNeo4j.appModel.BuscaraFarmacos
import ar.edu.farmacosNeo4j.repo.RepoLaboratorios
import ar.edu.farmacosNeo4j.repo.RepoFarmacos
import ar.edu.farmacosNeo4j.ui.BuscarFarmacosWindow
import org.uqbar.arena.Application
import org.uqbar.commons.utils.ApplicationContext

class FarmacosApplication extends Application {
	
	static def void main(String[] args) {
		ApplicationContext.instance.configureSingleton(typeof(RepoFarmacos), new RepoFarmacos)
		ApplicationContext.instance.configureSingleton(typeof(RepoLaboratorios), RepoLaboratorios.instance) 
		new FarmacosApplication().start()
	}

	override createMainWindow() {
		new BuscarFarmacosWindow(this, new BuscaraFarmacos())
	}
	
}