ALTER TABLE catalogo.cuentas_subgrupo
    ADD COLUMN IF NOT EXISTS tipo_bien_id INTEGER NOT NULL;

ALTER TABLE catalogo.cuentas_subgrupo
    ADD CONSTRAINT fk_cuentas_subgrupo_tipo_bien FOREIGN KEY (tipo_bien_id)
    REFERENCES catalogo.tipo_bien (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE catalogo.cuentas_subgrupo
    ADD CONSTRAINT ec_subgrupo_tipo_bien_subtipo_movimiento
    EXCLUDE (subgrupo_id WITH =, tipo_bien_id WITH =, subtipo_movimiento_id WITH =) WHERE (activo);

ALTER TABLE catalogo.tipo_bien
    RENAME tipo_bien_padre TO tipo_bien_padre_id;

ALTER TABLE catalogo.tipo_bien
    DROP COLUMN IF EXISTS orden,
    DROP COLUMN IF EXISTS codigo_abreviacion,
    ADD COLUMN IF NOT EXISTS limite_inferior INTEGER,
    ADD COLUMN IF NOT EXISTS limite_superior INTEGER,
    ADD COLUMN IF NOT EXISTS bodega_consumo BOOLEAN,
    ADD CONSTRAINT ck_tipo_bien_padre_id_tipo_bien CHECK(id <> tipo_bien_padre_id),
    ADD CONSTRAINT ck_limite_superior_tipo_bien CHECK(limite_superior >= limite_inferior),
    ADD CONSTRAINT ck_limite_inferior_tipo_bien CHECK(limite_inferior >= 0);
