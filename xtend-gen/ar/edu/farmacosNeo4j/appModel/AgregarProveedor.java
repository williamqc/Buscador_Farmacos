package ar.edu.farmacosNeo4j.appModel;

import ar.edu.farmacosNeo4j.domain.Farmaco;
import ar.edu.farmacosNeo4j.domain.Laboratorio;
import ar.edu.farmacosNeo4j.repo.RepoLaboratorios;

/* @Observable
@Accessors
 */public class AgregarProveedor {
  private RepoLaboratorios repoLaboratorios;
  
  private /* String */Object name;
  
  private Farmaco farmaco;
  
  private Laboratorio laboratorioSeleccionado;
  
  private /* List<Laboratorio> */Object laboratorios;
  
  private /* String */Object farmacoBusqueda;
  
  public AgregarProveedor(final Farmaco _farmaco) {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method or field ApplicationContext is undefined"
      + "\ninstance cannot be resolved"
      + "\ngetSingleton cannot be resolved");
  }
  
  public void aceptar() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe method agregarProveedor(String, Laboratorio) from the type Farmaco refers to the missing type Object"
      + "\nThe field AgregarProveedor.name refers to the missing type String");
  }
  
  public void buscarFarmaco() {
    throw new Error("Unresolved compilation problems:"
      + "\nThe field AgregarProveedor.laboratorios refers to the missing type List"
      + "\nThe method getLaboratorios(String) from the type RepoLaboratorios refers to the missing type List"
      + "\nThe field AgregarProveedor.farmacoBusqueda refers to the missing type String");
  }
}
