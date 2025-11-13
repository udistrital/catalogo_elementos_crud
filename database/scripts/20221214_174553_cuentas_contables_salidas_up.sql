ALTER TABLE catalogo.cuentas_subgrupo
    ADD COLUMN IF NOT EXISTS tipo_movimiento_id INTEGER DEFAULT 0,
    ADD CONSTRAINT ck_movimiento_id CHECK(subtipo_movimiento_id > 0 OR tipo_movimiento_id > 0);

ALTER TABLE catalogo.cuentas_subgrupo
    ALTER COLUMN tipo_movimiento_id DROP DEFAULT;

ALTER TABLE catalogo.cuentas_subgrupo
    ALTER COLUMN tipo_movimiento_id SET NOT NULL;

ALTER TABLE catalogo.catalogo
    DROP COLUMN IF EXISTS fecha_inicio,
    DROP COLUMN IF EXISTS fecha_fin;

COMMENT ON COLUMN catalogo.cuentas_subgrupo.tipo_movimiento_id
    IS 'Tipo de entrada en la parametrización de las cuentas contables de las salidas.';
