package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AjustesTipoBien_20191025_153006 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AjustesTipoBien_20191025_153006{}
	m.Created = "20191025_153006"

	migration.Register("AjustesTipoBien_20191025_153006", m)
}

// Run the migrations
func (m *AjustesTipoBien_20191025_153006) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	m.SQL("ALTER TABLE catalogo.subgrupo DROP CONSTRAINT IF EXISTS fk_subgrupo_tipo_bien CASCADE;")
	m.SQL("ALTER TABLE catalogo.subgrupo DROP COLUMN tipo_bien_id;")
	m.SQL("DROP TABLE IF EXISTS catalogo.tipo_bien CASCADE;")
}

// Reverse the migrations
func (m *AjustesTipoBien_20191025_153006) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	m.SQL("CREATE TABLE catalogo.tipo_bien (id serial NOT NULL,nombre varchar(20) NOT NULL,descripcion varchar(300),codigo_abreviacion varchar(20),orden numeric(5,2),fecha_creacion timestamp NOT NULL,fecha_modificacion timestamp NOT NULL,activo boolean NOT NULL,CONSTRAINT pk_tipo_bien PRIMARY KEY (id));")
	m.SQL("COMMENT ON TABLE catalogo.tipo_bien IS 'Tabla que guarda los tipos de bienes (consumo controlado, devolutivo)';")
	m.SQL("ALTER TABLE catalogo.subgrupo ADD COLUMN tipo_bien_id integer NOT NULL;")
	m.SQL("ALTER TABLE catalogo.subgrupo ADD CONSTRAINT fk_subgrupo_tipo_bien FOREIGN KEY (tipo_bien_id)REFERENCES catalogo.tipo_bien (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE;")
}
