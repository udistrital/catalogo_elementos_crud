package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AjusteModelo_20191008_142317 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AjusteModelo_20191008_142317{}
	m.Created = "20191008_142317"

	migration.Register("AjusteModelo_20191008_142317", m)
}

// Run the migrations
func (m *AjusteModelo_20191008_142317) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	m.SQL("ALTER TABLE catalogo.subgrupo ADD codigo integer NOT NULL;")
}

// Reverse the migrations
func (m *AjusteModelo_20191008_142317) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	m.SQL("ALTER TABLE catalogo.subgrupo DROP COLUMN codigo;")
}
