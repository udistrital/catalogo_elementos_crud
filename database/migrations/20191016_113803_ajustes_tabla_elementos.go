package main

import (
	"github.com/astaxie/beego/migration"
)

// DO NOT MODIFY
type AjustesTablaElementos_20191016_113803 struct {
	migration.Migration
}

// DO NOT MODIFY
func init() {
	m := &AjustesTablaElementos_20191016_113803{}
	m.Created = "20191016_113803"

	migration.Register("AjustesTablaElementos_20191016_113803", m)
}

// Run the migrations
func (m *AjustesTablaElementos_20191016_113803) Up() {
	// use m.SQL("CREATE TABLE ...") to make schema update
	m.SQL("DROP TABLE IF EXISTS catalogo.elemento CASCADE;")
}

// Reverse the migrations
func (m *AjustesTablaElementos_20191016_113803) Down() {
	// use m.SQL("DROP TABLE ...") to reverse schema update
	m.SQL("CREATE TABLE catalogo.elemento (id serial NOT NULL,nombre varchar(300) NOT NULL,descripcion varchar(300) NOT NULL,fecha_inicio timestamp NOT NULL,fecha_fin timestamp,fecha_creacion timestamp NOT NULL,fecha_modificacion timestamp NOT NULL,activo boolean NOT NULL,tipo_bien_id integer,subgrupo_catalogo_id integer,CONSTRAINT pk_elemento PRIMARY KEY (id));")
	m.SQL("COMMENT ON TABLE catalogo.elemento IS 'Tabla que almacena los catálogos disponibles en ARKA II';")
	m.SQL("COMMENT ON COLUMN catalogo.elemento.id IS 'Identificador único';")
	m.SQL("COMMENT ON COLUMN catalogo.elemento.nombre IS 'Nombre del catálogo.';")
	m.SQL("COMMENT ON COLUMN catalogo.elemento.descripcion IS 'Campo que almacena la información extra del catálogo.';")
	m.SQL("COMMENT ON COLUMN catalogo.elemento.fecha_inicio IS 'Campo que almacena cuando inicia el funcionamiento del catálogo.';")
	m.SQL("COMMENT ON COLUMN catalogo.elemento.fecha_fin IS 'Campo que almacena cuando deja de funcionar el catálogo.';")
	m.SQL("COMMENT ON COLUMN catalogo.elemento.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';")
	m.SQL("COMMENT ON COLUMN catalogo.elemento.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';")
	m.SQL("COMMENT ON COLUMN catalogo.elemento.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';")

	m.SQL("ALTER TABLE catalogo.elemento ADD CONSTRAINT fk_elemento_tipo_bien FOREIGN KEY (tipo_bien_id)REFERENCES catalogo.tipo_bien (id) MATCH FULL ON DELETE SET NULL ON UPDATE CASCADE;")

	m.SQL("ALTER TABLE catalogo.elemento ADD CONSTRAINT fk_elemento_subgrupo_catalogo FOREIGN KEY (subgrupo_catalogo_id)REFERENCES catalogo.subgrupo_catalogo (id) MATCH FULL ON DELETE SET NULL ON UPDATE CASCADE;")
}
