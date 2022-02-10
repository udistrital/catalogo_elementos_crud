ALTER TABLE catalogo.tipo_bien
    DROP COLUMN IF EXISTS reglas;
ALTER TABLE catalogo.tipo_bien
    DROP COLUMN IF EXISTS tipo_bien_padre;