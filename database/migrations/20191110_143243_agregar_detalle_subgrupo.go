package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AgregarDetalleSubgrupo_20191110_143243 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AgregarDetalleSubgrupo_20191110_143243{}
	m.Created = "20191110_143243"

	migration.Register("AgregarDetalleSubgrupo_20191110_143243", m)
}

// Run the migrations
func (m *AgregarDetalleSubgrupo_20191110_143243) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	m.SQL("CREATE TABLE catalogo.tipo_bien (id serial NOT NULL,nombre varchar(20) NOT NULL,descripcion varchar(250),codigo_abreviacion varchar(20),orden numeric(5,2),activo boolean NOT NULL,fecha_creacion timestamp NOT NULL,fecha_modificacion timestamp NOT NULL,CONSTRAINT tipo_bien_pk PRIMARY KEY (id));")

	m.SQL("CREATE TABLE catalogo.detalle_subgrupo (id serial NOT NULL,depreciacion boolean NOT NULL,valorizacion boolean NOT NULL,deterioro boolean NOT NULL,activo boolean NOT NULL,fecha_creacion timestamp NOT NULL,fecha_modificacion timestamp NOT NULL,subgrupo_id integer,tipo_bien_id integer NOT NULL,CONSTRAINT detalle_subgrupo_pk PRIMARY KEY (id));")
	m.SQL("COMMENT ON COLUMN catalogo.detalle_subgrupo.depreciacion IS 'Campo que determina si un Grupo (subgrupo) se deprecia o no.';")
	m.SQL("COMMENT ON COLUMN catalogo.detalle_subgrupo.valorizacion IS 'Campo que determina si un Grupo (subgrupo) se valoriza o no.';")
	m.SQL("COMMENT ON COLUMN catalogo.detalle_subgrupo.deterioro IS 'Campo que determina si un Grupo (subgrupo) se deteriora o no.';")

	m.SQL("ALTER TABLE catalogo.detalle_subgrupo ADD CONSTRAINT fk_detalle_subgrupo_tipo_bien FOREIGN KEY (tipo_bien_id)REFERENCES catalogo.tipo_bien (id) MATCH FULL ON DELETE RESTRICT ON UPDATE CASCADE;")
	m.SQL("ALTER TABLE catalogo.detalle_subgrupo ADD CONSTRAINT fk_detalle_subgrupo_subgrupo FOREIGN KEY (subgrupo_id)REFERENCES catalogo.subgrupo (id) MATCH FULL ON DELETE SET NULL ON UPDATE CASCADE;")
}

// Reverse the migrations
func (m *AgregarDetalleSubgrupo_20191110_143243) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	m.SQL("ALTER TABLE catalogo.detalle_subgrupo DROP CONSTRAINT IF EXISTS fk_detalle_subgrupo_subgrupo CASCADE;")
	m.SQL("DROP TABLE IF EXISTS catalogo.detalle_subgrupo CASCADE;")
	m.SQL("DROP TABLE IF EXISTS catalogo.tipo_bien CASCADE;")
}
