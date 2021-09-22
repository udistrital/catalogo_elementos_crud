ALTER TABLE catalogo.detalle_subgrupo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

ALTER TABLE catalogo.tipo_bien
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

ALTER TABLE catalogo.catalogo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

ALTER TABLE catalogo.cuentas_subgrupo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

ALTER TABLE catalogo.subgrupo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

ALTER TABLE catalogo.subgrupo_catalogo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

ALTER TABLE catalogo.subgrupo_subgrupo
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

ALTER TABLE catalogo.elemento
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

ALTER TABLE catalogo.tipo_nivel
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

ALTER TABLE catalogo.relacion_nivel
    ALTER COLUMN fecha_creacion TYPE TIMESTAMP WITH TIME ZONE,
    ALTER COLUMN fecha_modificacion TYPE TIMESTAMP WITH TIME ZONE;

-- Se declaran funciones para fechas automaticas

CREATE OR REPLACE FUNCTION trigger_set_fecha_modificacion()
RETURNS TRIGGER AS $$
BEGIN
  NEW.fecha_creacion = OLD.fecha_creacion;
  NEW.fecha_modificacion = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION trigger_set_fecha_creacion()
RETURNS TRIGGER AS $$
BEGIN
  NEW.fecha_creacion = NOW();
  NEW.fecha_modificacion = NOW();
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Se asocia update e insert de cada tabla con un trigger a la funcion de las fechas

CREATE TRIGGER set_fecha_modificacion_detalle_subgrupo
BEFORE UPDATE ON catalogo.detalle_subgrupo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_detalle_subgrupo
BEFORE INSERT ON catalogo.detalle_subgrupo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();


CREATE TRIGGER set_fecha_modificacion_subgrupo
BEFORE UPDATE ON catalogo.subgrupo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_subgrupo
BEFORE INSERT ON catalogo.subgrupo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();

CREATE TRIGGER set_fecha_modificacion_catalogo
BEFORE UPDATE ON catalogo.catalogo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_catalogo
BEFORE INSERT ON catalogo.catalogo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();

CREATE TRIGGER set_fecha_modificacion_cuentas_subgrupo
BEFORE UPDATE ON catalogo.cuentas_subgrupo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_cuentas_subgrupo
BEFORE INSERT ON catalogo.cuentas_subgrupo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();

CREATE TRIGGER set_fecha_modificacion_elemento
BEFORE UPDATE ON catalogo.elemento
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_elemento
BEFORE INSERT ON catalogo.elemento
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();

CREATE TRIGGER set_fecha_modificacion_relacion_nivel
BEFORE UPDATE ON catalogo.relacion_nivel
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_relacion_nivel
BEFORE INSERT ON catalogo.relacion_nivel
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();

CREATE TRIGGER set_fecha_modificacion_subgrupo_catalogo
BEFORE UPDATE ON catalogo.subgrupo_catalogo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_subgrupo_catalogo
BEFORE INSERT ON catalogo.subgrupo_catalogo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();

CREATE TRIGGER set_fecha_modificacion_subgrupo_subgrupo
BEFORE UPDATE ON catalogo.subgrupo_subgrupo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_subgrupo_subgrupo
BEFORE INSERT ON catalogo.subgrupo_subgrupo
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();

CREATE TRIGGER set_fecha_modificacion_tipo_bien
BEFORE UPDATE ON catalogo.tipo_bien
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_tipo_bien
BEFORE INSERT ON catalogo.tipo_bien
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();

CREATE TRIGGER set_fecha_modificacion_tipo_nivel
BEFORE UPDATE ON catalogo.tipo_nivel
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_modificacion();

CREATE TRIGGER set_fecha_creacion_tipo_nivel
BEFORE INSERT ON catalogo.tipo_nivel
FOR EACH ROW
EXECUTE PROCEDURE trigger_set_fecha_creacion();
