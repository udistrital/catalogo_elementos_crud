package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AjustesTablaSubgrupo_20191016_121218 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AjustesTablaSubgrupo_20191016_121218{}
	m.Created = "20191016_121218"

	migration.Register("AjustesTablaSubgrupo_20191016_121218", m)
}

// Run the migrations
func (m *AjustesTablaSubgrupo_20191016_121218) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	m.SQL("ALTER TABLE catalogo.subgrupo ADD COLUMN tipo_bien_id integer NOT NULL;")

	m.SQL("ALTER TABLE catalogo.subgrupo ADD CONSTRAINT fk_subgrupo_tipo_bien FOREIGN KEY (tipo_bien_id)REFERENCES catalogo.tipo_bien (id) MATCH FULLON DELETE RESTRICT ON UPDATE CASCADE;")
}

// Reverse the migrations
func (m *AjustesTablaSubgrupo_20191016_121218) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	m.SQL("ALTER TABLE catalogo.subgrupo DROP COLUMN tipo_bien_id;")
	m.SQL("ALTER TABLE catalogo.subgrupo DROP CONSTRAINT IF EXISTS fk_subgrupo_tipo_bien CASCADE;")
}
