package ar.edu.farmacosNeo4j.ui

import ar.edu.farmacosNeo4j.appModel.AgregarProveedor
import ar.edu.farmacosNeo4j.appModel.EditarFarmaco
import ar.edu.farmacosNeo4j.domain.Farmaco
import ar.edu.farmacosNeo4j.domain.Proveedor
import ar.edu.farmacosNeo4j.repo.RepoFarmacos
import org.uqbar.arena.bindings.NotNullObservable
import org.uqbar.arena.layout.ColumnLayout
import org.uqbar.arena.layout.HorizontalLayout
import org.uqbar.arena.widgets.Button
import org.uqbar.arena.widgets.Label
import org.uqbar.arena.widgets.NumericField
import org.uqbar.arena.widgets.Panel
import org.uqbar.arena.widgets.TextBox
import org.uqbar.arena.widgets.tables.Table
import org.uqbar.arena.windows.Dialog
import org.uqbar.arena.windows.WindowOwner
import org.uqbar.commons.utils.ApplicationContext

import static extension org.uqbar.arena.xtend.ArenaXtendExtensions.*

class EditarFarmacoWindow extends Dialog<EditarFarmaco> {

	new(WindowOwner owner, EditarFarmaco editarFarmaco) {
		super(owner, editarFarmaco)
		if (editarFarmaco.modoAlta) {
			title = "Nueva farmaco"
		} else {
			title = "Editar datos de la farmaco"
		}
	}

	override createMainTemplate(Panel mainPanel) {
		val panelIzquierdo = new Panel(mainPanel)
		super.createMainTemplate(panelIzquierdo)
		this.createResultsGrid(mainPanel)
	}

	override protected createFormPanel(Panel panelIzquierdo) {
		val form = new Panel(panelIzquierdo)
		form.layout = new ColumnLayout(2)
		new Label(form).text = "descripcion"
		new TextBox(form) => [
			value <=> "farmaco.descripcion"
			width = 250
		]
		
		new Label(form).text = "unidad"
		new TextBox(form) => [
			value <=> "farmaco.unidad"
			width = 250
		]

		new Label(form).text = "costo"
		new NumericField(form) => [
			value <=> "farmaco.costo"
			width = 90
		]
		new Label(form).text = "PrVenta"
		new NumericField(form) => [
			value <=> "farmaco.prventa"
			width = 90
		]
	}

	override protected addActions(Panel actionsPanel) {
		val botonera = new Panel(actionsPanel)
		botonera.layout = new HorizontalLayout
		actionsPanel.width = 250
		new Button(botonera) => [
			caption = "Aceptar"
			onClick [|
				modelObject.aceptar
				this.accept
			]
			setAsDefault
//			disableOnError
		]

		new Button(botonera) => [
			caption = "Agregar proveedor"
			onClick [|
				this.agregarProveedor
			]
		]

		new Button(botonera) => [
			caption = "Cancelar"
			onClick [|
				this.cancel
			]
		]

	}

	def protected createResultsGrid(Panel mainPanel) {
		val panelDerecho = new Panel(mainPanel)

		// Llevar a otra pantalla los personajes
		val table = new Table<Proveedor>(panelDerecho, typeof(Proveedor)) => [
			numberVisibleRows = 5
			width = 650
			items <=> "farmaco.proveedores"
			value <=> "proveedorSeleccionado"
		]
		TableColumnBuilder.buildColumn(table, "Laboratorio", 250, "laboratoriosMostrables")
		TableColumnBuilder.buildColumn(table, "Farmaco", 250, "laboratorio.nombreCompleto")

		this.createGridActions(panelDerecho)
	}

	def getRepoFarmacos() {
		ApplicationContext.instance.getSingleton(typeof(Farmaco)) as RepoFarmacos
	}

	def void createGridActions(Panel mainPanel) {
		val actionsPanel = new Panel(mainPanel)
		actionsPanel.setLayout(new HorizontalLayout)
		val elementSelected = new NotNullObservable("proveedorSeleccionado")

		new Button(actionsPanel) => [
			caption = "Eliminar proveedor"
			onClick [|modelObject.eliminarProveedor]
			bindEnabled(elementSelected)
		]
	}

	def void agregarProveedor() {
		this.openDialog(new AgregarProveedorDialog(this, new AgregarProveedor(modelObject.farmaco)))
	}

	def openDialog(Dialog<?> dialog) {
		dialog.open
	}

}
