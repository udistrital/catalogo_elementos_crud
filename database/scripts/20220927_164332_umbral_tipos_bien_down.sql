ALTER TABLE catalogo.cuentas_subgrupo
    DROP COLUMN IF EXISTS tipo_bien_id;

ALTER TABLE catalogo.cuentas_subgrupo
    DROP CONSTRAINT IF EXISTS ec_subgrupo_tipo_bien_subtipo_movimiento;

ALTER TABLE catalogo.tipo_bien
    RENAME tipo_bien_padre_id TO tipo_bien_padre;

ALTER TABLE catalogo.tipo_bien
    ALTER COLUMN nombre TYPE VARCHAR(20),
	ADD COLUMN IF NOT EXISTS codigo_abreviacion VARCHAR(20),
    ADD COLUMN IF NOT EXISTS orden INTEGER,
    DROP COLUMN IF EXISTS bodega_consumo,
    DROP COLUMN IF EXISTS limite_inferior,
    DROP COLUMN IF EXISTS limite_superior,
    DROP CONSTRAINT IF EXISTS ck_tipo_bien_padre_id_tipo_bien,
    DROP CONSTRAINT IF EXISTS ck_limite_superior_tipo_bien,
    DROP CONSTRAINT IF EXISTS ck_limite_inferior_tipo_bien;
