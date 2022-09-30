ALTER TABLE catalogo.cuentas_subgrupo
    DROP COLUMN IF EXISTS tipo_bien_id;

ALTER TABLE catalogo.cuentas_subgrupo
    DROP CONSTRAINT IF EXISTS ec_subgrupo_tipo_bien_subtipo_movimiento;

ALTER TABLE catalogo.detalle_subgrupo
    ADD COLUMN IF NOT EXISTS tipo_bien_id INTEGER NOT NULL DEFAULT 1;

ALTER TABLE catalogo.tipo_bien
    ADD COLUMN IF NOT EXISTS tipo_bien_padre_id INTEGER,
    ADD COLUMN IF NOT EXISTS orden INTEGER;

ALTER TABLE catalogo.tipo_bien
    ADD CONSTRAINT fk_tipo_bien_tipo_bien FOREIGN KEY (tipo_bien_padre_id)
    REFERENCES catalogo.tipo_bien (id) MATCH FULL
    ON DELETE RESTRICT ON UPDATE CASCADE;

ALTER TABLE catalogo.tipo_bien
    DROP COLUMN IF EXISTS limite_inferior,
    DROP COLUMN IF EXISTS limite_superior,
    DROP CONSTRAINT IF EXISTS check_rango,
    DROP COLUMN IF EXISTS requiere_rango BOOLEAN NOT NULL DEFAULT FALSE;
