-- object: catalogo.relacion_nivel | type: TABLE --
-- DROP TABLE IF EXISTS catalogo.relacion_nivel CASCADE;
CREATE TABLE catalogo.relacion_nivel (
	id serial NOT NULL,
	fecha_creacion timestamp NOT NULL,
	fecha_modificacion timestamp NOT NULL,
	activo boolean NOT NULL,
	nivel_padre_id integer NOT NULL,
	nivel_hijo_id integer NOT NULL,
	CONSTRAINT pk_relacion_nivel PRIMARY KEY (id),
	CONSTRAINT uq_relacion_nivel UNIQUE (nivel_padre_id,nivel_hijo_id)

);
-- ddl-end --
-- ALTER TABLE catalogo.relacion_nivel OWNER TO postgres;
-- ddl-end --

-- object: fk_tipo_nivel_nivel_padre | type: CONSTRAINT --
-- ALTER TABLE catalogo.relacion_nivel DROP CONSTRAINT IF EXISTS fk_tipo_nivel_nivel_padre CASCADE;
ALTER TABLE catalogo.relacion_nivel ADD CONSTRAINT fk_tipo_nivel_nivel_padre FOREIGN KEY (nivel_padre_id)
REFERENCES catalogo.tipo_nivel (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk_tipo_nivel_nivel_hijo | type: CONSTRAINT --
-- ALTER TABLE catalogo.relacion_nivel DROP CONSTRAINT IF EXISTS fk_tipo_nivel_nivel_hijo CASCADE;
ALTER TABLE catalogo.relacion_nivel ADD CONSTRAINT fk_tipo_nivel_nivel_hijo FOREIGN KEY (nivel_hijo_id)
REFERENCES catalogo.tipo_nivel (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

