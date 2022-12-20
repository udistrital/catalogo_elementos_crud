ALTER TABLE catalogo.cuentas_subgrupo
    DROP COLUMN IF EXISTS tipo_movimiento_id;
    DROP CONSTRAINT IF EXISTS ck_movimiento_id;
