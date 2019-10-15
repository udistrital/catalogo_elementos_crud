package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AjustesCuentaid_20191015_084818 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AjustesCuentaid_20191015_084818{}
	m.Created = "20191015_084818"

	migration.Register("AjustesCuentaid_20191015_084818", m)
}

// Run the migrations
func (m *AjustesCuentaid_20191015_084818) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	m.SQL("ALTER TABLE catalogo.cuentas_grupo ALTER COLUMN cuenta_credito_id TYPE INTEGER;")
	m.SQL("ALTER TABLE catalogo.cuentas_grupo ALTER COLUMN cuenta_debito_id TYPE INTEGER;")
}

// Reverse the migrations
func (m *AjustesCuentaid_20191015_084818) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	m.SQL("ALTER TABLE catalogo.cuentas_grupo ALTER COLUMN cuenta_credito_id TYPE DOUBLE PRECISION;")
	m.SQL("ALTER TABLE catalogo.cuentas_grupo ALTER COLUMN cuenta_debito_id TYPE DOUBLE PRECISION;")
}
