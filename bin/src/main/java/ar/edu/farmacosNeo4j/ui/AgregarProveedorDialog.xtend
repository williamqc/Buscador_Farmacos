package ar.edu.farmacosNeo4j.ui

import ar.edu.farmacosNeo4j.appModel.AgregarProveedor
import ar.edu.farmacosNeo4j.domain.Farmaco
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.GroupPanel
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class AgregarProveedorDialog extends Dialog<AgregarProveedor> {

	new(WindowOwner owner, AgregarProveedor model) {
		super(owner, model)
		title = "Agregar un proveedor del farmaco " + model.farmaco
	}

	override protected createFormPanel(Panel mainPanel) {
		val panelRoles = new Panel(mainPanel) => [
			layout = new ColumnLayout(1)
		]
		new Label(panelRoles) => [
			text = "nombre del laboratorio del farmaco"
		]
		new TextBox(panelRoles) => [
			width = 300
			value <=> "name"
		]
		
		val panelActor = new GroupPanel(mainPanel, this.modelObject) => [
			title = "Farmaco"
		] 
		val panelValoresBusqueda = new Panel(panelActor)
		panelValoresBusqueda.layout = new HorizontalLayout
		new TextBox(panelValoresBusqueda) => [
			value <=> "farmacoBusqueda"
			width = 300
		]
		new Button(panelValoresBusqueda) => [
			caption = "Buscar"
			onClick [ | modelObject.buscarFarmaco ]
		]
		
		val table = new Table<Farmaco>(panelActor, typeof(Farmaco)) => [
			numberVisibleRows = 10
			width = 650
			items <=> "laboratorios"
			value <=> "laboratorioSeleccionado"
		]
		TableColumnBuilder.buildColumn(table, "labdescripcion", 550, "descripcionCompleta")
		TableColumnBuilder.buildColumn(table, "telefono", 100, "Telefono")
		
		val filaAgregar = new Panel(mainPanel)
		new Button(filaAgregar) => [
			caption = "Agregar proveedor"
			onClick [|
				modelObject.aceptar
				// TODO: Validar
				this.close
			]
		]
	}

}
