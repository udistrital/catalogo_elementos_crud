ALTER TABLE catalogo.detalle_subgrupo
    ADD COLUMN IF NOT EXISTS vida_util NUMERIC(10,5) DEFAULT 5,
    ADD COLUMN IF NOT EXISTS valor_residual NUMERIC(5,4) DEFAULT 0;


ALTER TABLE catalogo.detalle_subgrupo
    ALTER COLUMN vida_util DROP DEFAULT;

ALTER TABLE catalogo.detalle_subgrupo
    ALTER COLUMN valor_residual DROP DEFAULT;

COMMENT ON COLUMN catalogo.detalle_subgrupo.vida_util
    IS 'Valor de la vida útil sugerida para un tipo de bien en años';

COMMENT ON COLUMN catalogo.detalle_subgrupo.valor_residual
    IS 'Porcentaje del valor residual sugerido para un tipo de bien (0-1)';
