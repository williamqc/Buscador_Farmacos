#  Proyecto Xtend contra una base Neo4J
 la documentacion y los Scrips estan en  al carpeta documentos detro de un comprimido
## Objetivo
Mostrar la integración entre una app hecha en JDK y Neo4J.



* generar una farmaco nuevo
* buscar farmacos existentes y editarlas

## Cómo ejecutar el ejemplo

* Instalar la última versión de Neo4j en https://neo4j.com/download/
* Ir a la carpeta bin del directorio de instalación de Neo4J. Levantar el server: 

```
$ ./neo4j start
```

* Abrir un Navegador e ingresar como URL: http://localhost:7474

*creamos la clave primaria para nuestras tablas
  $CREATE CONSTRAINT ON (p:Farmaco) ASSERT p.userId IS UNIQUE;

* Ejecutar el script que  carga los registros del archivo.csv

  $ LOAD CSV FROM "file:///farmacos.csv" AS row CREATE (:Farmaco  {descripcion:row[0] , unidad:row[1], costo:toInt(row[2]), prventa:toInt(row[3])});

* Bajar el servicio neo4j. Desde la carpeta bin hacer

```
$ ./neo4j stop
```

* En el Eclipse, ingresar al archivo GraphDatabaseProvider y verificar que el PATH esté apuntando al directorio correcto

``` Xtend
static String PATH = "C:\Users\HP\Documents\Neo4j\default.graphdb"
```

* Botón derecho sobre el archivo Farmacos Neo4J.launch" y Run, si respetaste el nombre del proyecto: wneo4j



Las modificaciones que hagas impactarán en el grafo de farmacos(puedes hacer consultas luego).




## Troubleshooting

* Si al arrancar la aplicación ves un mensaje de error como éste

```
Caused by: org.neo4j.kernel.StoreLockException: Store and its lock file has been locked by another process: /home/fernando/apps/neo4j-community-3.0.4/data/databases/graph.db/store_lock. Please ensure no other process is using this database, and that the directory is writable (required even for read-only access)
	at org.neo4j.kernel.internal.StoreLocker.storeLockException(StoreLocker.java:90)
	at org.neo4j.kernel.internal.StoreLocker.checkLock(StoreLocker.java:76)
```

Es que tenés que detener el servicio Neo4J, que en su versión Community no permite acceso por más de una aplicación a la vez.

