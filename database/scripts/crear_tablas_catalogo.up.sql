-- object: catalogo | type: SCHEMA --
-- DROP SCHEMA IF EXISTS catalogo CASCADE;
CREATE SCHEMA catalogo;
-- ddl-end --

SET search_path TO pg_catalog,public,catalogo;
-- ddl-end --

-- object: catalogo.subgrupo_catalogo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.subgrupo_catalogo CASCADE;
CREATE TABLE catalogo.subgrupo_catalogo (
	id serial NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	activo boolean NOT NULL,
	catalogo_id integer NOT NULL,
	subgrupo_id integer NOT NULL,
	CONSTRAINT pk_subgrupo_catalogo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.subgrupo_catalogo IS 'Tabla que almacena los subgrupos de catálogos disponibles en ARKA II en caso de existir más de uno.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_catalogo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --

-- object: catalogo.catalogo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.catalogo CASCADE;
CREATE TABLE catalogo.catalogo (
	id serial NOT NULL,
	nombre varchar(300) NOT NULL,
	descripcion varchar(300) NOT NULL,
	fecha_inicio timestamp NOT NULL,
	fecha_fin timestamp,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	activo boolean NOT NULL,
	CONSTRAINT pk_catalogo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.catalogo IS 'Tabla que almacena los catálogos disponibles en ARKA II';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.nombre IS 'Nombre del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.descripcion IS 'Campo que almacena la información extra del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_inicio IS 'Campo que almacena cuando inicia el funcionamiento del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_fin IS 'Campo que almacena cuando deja de funcionar el catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.catalogo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --

-- object: catalogo.subgrupo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.subgrupo CASCADE;
CREATE TABLE catalogo.subgrupo (
	id serial NOT NULL,
	nombre varchar(300) NOT NULL,
	descripcion varchar(300) NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	activo boolean NOT NULL,
	CONSTRAINT pk_subgrupo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.subgrupo IS 'Tabla que almacena los subgrupos disponibles en ARKA II';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.nombre IS 'nombre del subgrupo del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --

-- object: fk_subgrupo_catalogo_subgrupo | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo_catalogo DROP CONSTRAINT IF EXISTS fk_subgrupo_catalogo_subgrupo CASCADE;
ALTER TABLE catalogo.subgrupo_catalogo ADD CONSTRAINT fk_subgrupo_catalogo_subgrupo FOREIGN KEY (subgrupo_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: catalogo.subgrupo_subgrupo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.subgrupo_subgrupo CASCADE;
CREATE TABLE catalogo.subgrupo_subgrupo (
	id serial NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	activo boolean NOT NULL,
	subgrupo_padre_id integer NOT NULL,
	subgrupo_hijo_id integer NOT NULL,
	CONSTRAINT pk_subgrupo_subgrupo PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.subgrupo_subgrupo IS 'Tabla que almacena los subgrupos de los subgrupos disponibles en ARKA II en caso de que se pueda desagregar más un subgrupo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.subgrupo_subgrupo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --

-- object: fk_subgrupo_subgrupo_subgrupo_padre | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo_subgrupo DROP CONSTRAINT IF EXISTS fk_subgrupo_subgrupo_subgrupo_padre CASCADE;
ALTER TABLE catalogo.subgrupo_subgrupo ADD CONSTRAINT fk_subgrupo_subgrupo_subgrupo_padre FOREIGN KEY (subgrupo_padre_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_subgrupo_subgrupo_subgrupo_hijo | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo_subgrupo DROP CONSTRAINT IF EXISTS fk_subgrupo_subgrupo_subgrupo_hijo CASCADE;
ALTER TABLE catalogo.subgrupo_subgrupo ADD CONSTRAINT fk_subgrupo_subgrupo_subgrupo_hijo FOREIGN KEY (subgrupo_hijo_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: catalogo.cuentas_grupo | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.cuentas_grupo CASCADE;
CREATE TABLE catalogo.cuentas_grupo (
	id serial NOT NULL,
	cuenta_credito_id double precision NOT NULL,
	cuenta_debito_id double precision NOT NULL,
	subtipo_movimiento_id integer NOT NULL,
	fecha_creacion date NOT NULL,
	fecha_modificacion date NOT NULL,
	activo boolean NOT NULL,
	subgrupo_id integer NOT NULL,
	CONSTRAINT pk_movimiento_cuenta PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.cuentas_grupo IS 'Tabla de rompimiento para asociar múltiples cuentas a un subgrupo de un catálogo dependiento el tipo de movimiento. Por ejemplo, donación pertenece a un tipo de movimiento entrada, pero no tiene las mismas cuentas que el tipo de movimiento.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_grupo.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_grupo.cuenta_credito_id IS 'Campo para almacenar el número de la cuenta de crédito asociada a un movimiento. Proviene de KRONOS.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_grupo.cuenta_debito_id IS 'Campo para almacenar el número de la cuenta de débito asociada a un movimiento. Proviene de KRONOS.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_grupo.subtipo_movimiento_id IS 'Campo que guarda la foranea del movimiento, para asociar una cuenta a un tipo de movimiento específico.  Proviene de KRONOS.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_grupo.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_grupo.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.cuentas_grupo.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --

-- object: fk_cuentas_grupo_subgrupo | type: CONSTRAINT --
-- ALTER TABLE catalogo.cuentas_grupo DROP CONSTRAINT IF EXISTS fk_cuentas_grupo_subgrupo CASCADE;
ALTER TABLE catalogo.cuentas_grupo ADD CONSTRAINT fk_cuentas_grupo_subgrupo FOREIGN KEY (subgrupo_id)
REFERENCES catalogo.subgrupo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_subgrupo_catalogo_catalogo | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo_catalogo DROP CONSTRAINT IF EXISTS fk_subgrupo_catalogo_catalogo CASCADE;
ALTER TABLE catalogo.subgrupo_catalogo ADD CONSTRAINT fk_subgrupo_catalogo_catalogo FOREIGN KEY (catalogo_id)
REFERENCES catalogo.catalogo (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: uq_subgrupo_subgrupo | type: CONSTRAINT --
-- ALTER TABLE catalogo.subgrupo_subgrupo DROP CONSTRAINT IF EXISTS uq_subgrupo_subgrupo CASCADE;
ALTER TABLE catalogo.subgrupo_subgrupo ADD CONSTRAINT uq_subgrupo_subgrupo UNIQUE (subgrupo_padre_id,subgrupo_hijo_id);
-- ddl-end --

-- object: catalogo.tipo_bien | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.tipo_bien CASCADE;
CREATE TABLE catalogo.tipo_bien (
	id serial NOT NULL,
	nombre varchar(20) NOT NULL,
	descripcion varchar(300),
	codigo_abreviacion varchar(20),
	orden numeric(5,2),
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	activo boolean NOT NULL,
	CONSTRAINT pk_tipo_bien PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.tipo_bien IS 'Tabla que guarda los tipos de bienes (consumo controlado, devolutivo)';
-- ddl-end --

-- object: catalogo.elemento | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.elemento CASCADE;
CREATE TABLE catalogo.elemento (
	id serial NOT NULL,
	nombre varchar(300) NOT NULL,
	descripcion varchar(300) NOT NULL,
	fecha_inicio timestamp NOT NULL,
	fecha_fin timestamp,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	activo boolean NOT NULL,
	tipo_bien_id integer,
	subgrupo_catalogo_id integer,
	CONSTRAINT pk_elemento PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE catalogo.elemento IS 'Tabla que almacena los catálogos disponibles en ARKA II';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.id IS 'Identificador único';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.nombre IS 'Nombre del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.descripcion IS 'Campo que almacena la información extra del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.fecha_inicio IS 'Campo que almacena cuando inicia el funcionamiento del catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.fecha_fin IS 'Campo que almacena cuando deja de funcionar el catálogo.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.fecha_creacion IS 'Campo para almacenar la fecha de cración del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.fecha_modificacion IS 'Campo para almacenar la fecha de modificación del registro. Se usa para trazabilidad.';
-- ddl-end --
COMMENT ON COLUMN catalogo.elemento.activo IS 'Campo para validar si se encuentra activo o no el registro. Se usa para trazabilidad.';
-- ddl-end --

-- object: fk_elemento_tipo_bien | type: CONSTRAINT --
-- ALTER TABLE catalogo.elemento DROP CONSTRAINT IF EXISTS fk_elemento_tipo_bien CASCADE;
ALTER TABLE catalogo.elemento ADD CONSTRAINT fk_elemento_tipo_bien FOREIGN KEY (tipo_bien_id)
REFERENCES catalogo.tipo_bien (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_elemento_subgrupo_catalogo | type: CONSTRAINT --
-- ALTER TABLE catalogo.elemento DROP CONSTRAINT IF EXISTS fk_elemento_subgrupo_catalogo CASCADE;
ALTER TABLE catalogo.elemento ADD CONSTRAINT fk_elemento_subgrupo_catalogo FOREIGN KEY (subgrupo_catalogo_id)
REFERENCES catalogo.subgrupo_catalogo (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- Permisos de usuario
GRANT USAGE ON SCHEMA catalogo TO desarrollooas;
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA catalogo TO desarrollooas;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA catalogo TO desarrollooas;