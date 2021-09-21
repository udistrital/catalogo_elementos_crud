-- Se revierte ajuste al modelo de datos

ALTER TABLE catalogo.detalle_subgrupo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE catalogo.tipo_bien
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE catalogo.catalogo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE catalogo.cuentas_subgrupo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE catalogo.subgrupo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE catalogo.subgrupo_catalogo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE catalogo.subgrupo_subgrupo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE catalogo.elemento
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE catalogo.tipo_nivel
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

ALTER TABLE catalogo.relacion_nivel
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITHOUT TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITHOUT TIME ZONE;

-- Se revierte la función de las fechas automaticas

DROP FUNCTION trigger_set_fecha_modificacion() cascade;
DROP FUNCTION trigger_set_fecha_creacion() cascade;
