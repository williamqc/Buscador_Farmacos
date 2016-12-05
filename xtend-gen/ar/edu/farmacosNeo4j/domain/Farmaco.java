package ar.edu.farmacosNeo4j.domain;

import ar.edu.farmacosNeo4j.domain.Laboratorio;
import ar.edu.farmacosNeo4j.domain.Proveedor;

/* @Observable
@Accessors
 */public class Farmaco {
  private /* Long */Object id;
  
  private /* String */Object descripcion;
  
  private /* String */Object unidad;
  
  private long costo;
  
  private long prventa;
  
  private /* List<Proveedor> */Object proveedores /* Skipped initializer because of errors */;
  
  public Object toString() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field Farmaco.descripcion refers to the missing type String"
      + "\n+ cannot be resolved"
      + "\n+ cannot be resolved"
      + "\n+ cannot be resolved");
  }
  
  public Object agregarProveedor(final /* String */Object _nombre, final Laboratorio _laboratorio) {
    throw new Error("Unresolved compilation problems:"
      + "\n=> cannot be resolved."
      + "\nThe method nombre(java.util.List) is undefined"
      + "\nThe method laboratorio(Laboratorio) is undefined"
      + "\nThe method firePropertyChanged(Farmaco, java.lang.String) is undefined"
      + "\nThe field Farmaco.proveedores refers to the missing type List"
      + "\nvalidar cannot be resolved"
      + "\nadd cannot be resolved");
  }
  
  public Object eliminarProveedor(final Proveedor proveedor) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method firePropertyChanged(Farmaco, java.lang.String) is undefined"
      + "\nThe field Farmaco.proveedores refers to the missing type List"
      + "\nremove cannot be resolved");
  }
  
  public void validar() {
    throw new Error("Unresolved compilation problems:"
      + "\nUserException cannot be resolved."
      + "\n== cannot be resolved."
      + "\nUserException cannot be resolved."
      + "\nThe field Farmaco.descripcion refers to the missing type String"
      + "\nThe field Farmaco.descripcion refers to the missing type String"
      + "\nThe field Farmaco.proveedores refers to the missing type List"
      + "\n== cannot be resolved"
      + "\n|| cannot be resolved"
      + "\ntrim cannot be resolved"
      + "\nequals cannot be resolved"
      + "\nforEach cannot be resolved"
      + "\nvalidar cannot be resolved");
  }
}
