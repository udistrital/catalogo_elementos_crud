ALTER TABLE catalogo.cuentas_subgrupo
    ADD COLUMN IF NOT EXISTS tipo_movimiento_id INTEGER NOT NULL,
    ADD CONSTRAINT ck_movimiento_id CHECK(subtipo_movimiento_id > 0 OR tipo_movimiento_id > 0);

ALTER TABLE catalogo.catalogo
    DROP COLUMN IF EXISTS fecha_inicio,
    DROP COLUMN IF EXISTS fecha_fin;
