package ar.edu.farmacosNeo4j.appModel;

import ar.edu.farmacosNeo4j.domain.Farmaco;
import ar.edu.farmacosNeo4j.repo.RepoFarmacos;

/* @Accessors
@Observable
 */public class BuscaraFarmacos {
  private /* List<Farmaco> */Object farmaco;
  
  private /* String */Object valorABuscar;
  
  private RepoFarmacos repoFarmacos;
  
  private Farmaco farmacoSeleccionada;
  
  public BuscaraFarmacos() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field ApplicationContext is undefined"
      + "\nThe method init() from the type BuscaraFarmacos refers to the missing type String"
      + "\ninstance cannot be resolved"
      + "\ngetSingleton cannot be resolved");
  }
  
  public String init() {
    throw new Error("Unresolved compilation problems:"
      + "\nArrayList cannot be resolved."
      + "\nThe field BuscaraFarmacos.farmaco refers to the missing type List"
      + "\nThe field BuscaraFarmacos.valorABuscar refers to the missing type String");
  }
  
  public void buscar() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field BuscaraFarmacos.farmaco refers to the missing type List"
      + "\nThe method getFarmacos(String) from the type RepoFarmacos refers to the missing type List"
      + "\nThe field BuscaraFarmacos.valorABuscar refers to the missing type String");
  }
  
  public void limpiar() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method init() from the type BuscaraFarmacos refers to the missing type String");
  }
  
  public void eliminarFarmacoSeleccionada() {
    this.repoFarmacos.eliminarFarmaco(this.farmacoSeleccionada);
    this.buscar();
  }
}
