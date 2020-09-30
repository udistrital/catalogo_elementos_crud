package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type InsertsParametricas_20191016_142518 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &InsertsParametricas_20191016_142518{}
	m.Created = "20191016_142518"

	migration.Register("InsertsParametricas_20191016_142518", m)
}

// Run the migrations
func (m *InsertsParametricas_20191016_142518) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	m.SQL("INSERT INTO catalogo.tipo_bien (nombre, descripcion, codigo_abreviacion, orden, fecha_creacion, fecha_modificacion, activo)VALUES ('Consumo', 'Elemento designado como bien de consumo', 'Consumo', 1, now(), now(), true);")
	m.SQL("INSERT INTO catalogo.tipo_bien (nombre, descripcion, codigo_abreviacion, orden, fecha_creacion, fecha_modificacion, activo)VALUES ('Consumo Controlado', 'Elemento designado como bien de consumo controlado', 'ConsCon', 2, now(), now(), true);")
	m.SQL("INSERT INTO catalogo.tipo_bien (nombre, descripcion, codigo_abreviacion, orden, fecha_creacion, fecha_modificacion, activo)VALUES ('Devolutivo', 'Elemento designado como bien devolutivo', 'Devolutivo', 3, now(), now(), true); ")
}

// Reverse the migrations
func (m *InsertsParametricas_20191016_142518) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	m.SQL("DELETE FROM catalogo.tipo_bien;")
}
