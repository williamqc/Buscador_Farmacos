package ar.edu.farmacosNeo4j.domain

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable



@Accessors
@Observable
class Proveedor {
	Long id
	List<String> nombre
	Laboratorio laboratorio = new Laboratorio
	
	def getLaboratoriosMostrables() {
		if (nombre.isEmpty) {
			return ""
		}
		val nombreAsString = nombre.toString
		nombreAsString.substring(1, nombreAsString.length - 1)	
	}
	
	override toString() {
		laboratoriosMostrables + " por " + laboratorio.toString
	}
	
	def void validar() {
		if (this.nombre.isEmpty) {
			throw new UserException("Debe ingresar al menos un nombre para el Proveedor")
		}
		if (this.laboratorio == null) {
			throw new UserException("Debe ingresar qué laboratorio cumple ese Proveedor")
		}
	}
}
