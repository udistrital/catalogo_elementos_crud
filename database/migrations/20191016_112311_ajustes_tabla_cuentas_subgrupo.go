package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AjustesTablaCuentasSubgrupo_20191016_112311 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AjustesTablaCuentasSubgrupo_20191016_112311{}
	m.Created = "20191016_112311"

	migration.Register("AjustesTablaCuentasSubgrupo_20191016_112311", m)
}

// Run the migrations
func (m *AjustesTablaCuentasSubgrupo_20191016_112311) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	m.SQL("ALTER TABLE catalogo.cuentas_grupo RENAME TO cuentas_subgrupo;")
}

// Reverse the migrations
func (m *AjustesTablaCuentasSubgrupo_20191016_112311) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	m.SQL("ALTER TABLE catalogo.cuentas_subgrupo RENAME TO cuentas_grupo;")
}
