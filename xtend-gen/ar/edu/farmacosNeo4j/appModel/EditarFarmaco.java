package ar.edu.farmacosNeo4j.appModel;

import ar.edu.farmacosNeo4j.domain.Farmaco;
import ar.edu.farmacosNeo4j.domain.Proveedor;
import ar.edu.farmacosNeo4j.repo.RepoFarmacos;

/* @Accessors
@Observable
 */public class EditarFarmaco {
  private Farmaco farmaco;
  
  private boolean modoAlta;
  
  private RepoFarmacos repoFarmacos;
  
  private Proveedor proveedorSeleccionado;
  
  public EditarFarmaco() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field ApplicationContext is undefined"
      + "\ninstance cannot be resolved"
      + "\ngetSingleton cannot be resolved");
  }
  
  public void aceptar() {
    this.repoFarmacos.saveOrUpdateFarmaco(this.farmaco);
  }
  
  public static EditarFarmaco modoAlta() {
    throw new Error("Unresolved compilation problems:"
      + "\n=> cannot be resolved."
      + "\nCannot make a static reference to the non-static field modoAlta from the type EditarFarmaco"
      + "\nCannot make a static reference to the non-static field farmaco from the type EditarFarmaco");
  }
  
  public static EditarFarmaco modoEdicion(final Farmaco _farmaco) {
    throw new Error("Unresolved compilation problems:"
      + "\n=> cannot be resolved."
      + "\nCannot make a static reference to the non-static field modoAlta from the type EditarFarmaco"
      + "\nCannot make a static reference to the non-static field farmaco from the type EditarFarmaco"
      + "\nCannot make a static reference to the non-static field repoFarmacos from the type EditarFarmaco"
      + "\nThe field id is not visible"
      + "\nThe method getFarmaco(Long) from the type RepoFarmacos refers to the missing type Long"
      + "\nThe field Farmaco.id refers to the missing type Long");
  }
  
  public void eliminarProveedor() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method eliminarProveedor(Proveedor) from the type Farmaco refers to the missing type Object");
  }
}
