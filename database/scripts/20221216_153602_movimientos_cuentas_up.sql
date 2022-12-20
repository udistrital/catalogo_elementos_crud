ALTER TABLE catalogo.cuentas_subgrupo
    DROP CONSTRAINT IF EXISTS ec_subgrupo_tipo_bien_subtipo_movimiento;

ALTER TABLE catalogo.cuentas_subgrupo
    ADD CONSTRAINT ec_subgrupo_tipo_bien_movimiento
    EXCLUDE (subgrupo_id WITH =, tipo_bien_id WITH =, subtipo_movimiento_id WITH =, tipo_movimiento_id WITH =) WHERE (activo);
