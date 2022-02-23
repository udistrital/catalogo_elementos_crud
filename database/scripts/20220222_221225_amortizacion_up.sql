ALTER TABLE catalogo.detalle_subgrupo
    RENAME COLUMN deterioro TO amortizacion;

COMMENT ON COLUMN catalogo.detalle_subgrupo.amortizacion
    IS 'Indica si al subgrupo le aplica amortización';
