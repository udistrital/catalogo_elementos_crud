ALTER TABLE catalogo.cuentas_subgrupo ALTER COLUMN cuenta_credito_id SET DATA TYPE varchar(20);
ALTER TABLE catalogo.cuentas_subgrupo ALTER COLUMN cuenta_debito_id SET DATA TYPE varchar(20);
ALTER TABLE catalogo.cuentas_subgrupo ALTER COLUMN fecha_creacion SET DATA TYPE timestamp;
ALTER TABLE catalogo.cuentas_subgrupo ALTER COLUMN fecha_modificacion SET DATA TYPE timestamp;