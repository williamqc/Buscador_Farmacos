package ar.edu.farmacosNeo4j.domain

import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.utils.Observable

@Accessors
@Observable
class Laboratorio {
	Long id
	String labdescripcion
	int telefono
	String direccion
	
	override toString() {
		labdescripcion
	}
	
}
