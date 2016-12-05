package ar.edu.farmacosNeo4j.domain

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.commons.model.UserException
import org.uqbar.commons.utils.Observable

import static org.uqbar.commons.model.ObservableUtils.*

@Observable
@Accessors
class Farmaco {
	Long id
	String descripcion	
	String unidad
	long costo
	long prventa
	List<Proveedor> proveedores = new ArrayList<Proveedor>
	
	override toString() {
		descripcion + " (" + prventa + ")" 
	}
	
	def agregarProveedor(String _nombre, Laboratorio _laboratorio) {
		val proveedor = new Proveedor => [
					nombre = #[_nombre]
					laboratorio = _laboratorio
				] 
		proveedor.validar
		proveedores.add(proveedor)
		firePropertyChanged(this, "proveedores")
	}
	
	def eliminarProveedor(Proveedor proveedor) {
		proveedores.remove(proveedor)
		firePropertyChanged(this, "proveedores")
	}
	
	def void validar() {
		if (this.descripcion == null || this.descripcion.trim.equals("")) {
			throw new UserException("Debe ingresar la descripcion")
		}
		
		if (this.prventa == 0) {
			throw new UserException("el precio venta" )
		}
		proveedores.forEach [ proveedor | proveedor.validar ]
	}
	
}
