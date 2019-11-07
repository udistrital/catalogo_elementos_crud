package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AjustesTablaTipoBien_20191016_115027 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AjustesTablaTipoBien_20191016_115027{}
	m.Created = "20191016_115027"

	migration.Register("AjustesTablaTipoBien_20191016_115027", m)
}

// Run the migrations
func (m *AjustesTablaTipoBien_20191016_115027) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	m.SQL("DROP TABLE IF EXISTS catalogo.tipo_bien CASCADE;")
}

// Reverse the migrations
func (m *AjustesTablaTipoBien_20191016_115027) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	m.SQL("CREATE TABLE catalogo.tipo_bien (id serial NOT NULL,nombre varchar(20) NOT NULL,descripcion varchar(300),codigo_abreviacion varchar(20),orden numeric(5,2),fecha_creacion timestamp NOT NULL,fecha_modificacion timestamp NOT NULL,activo boolean NOT NULL,CONSTRAINT pk_tipo_bien PRIMARY KEY (id));")
	m.SQL("COMMENT ON TABLE catalogo.tipo_bien IS 'Tabla que guarda los tipos de bienes (consumo controlado, devolutivo)';")
}
