ALTER TABLE catalogo.tipo_bien
    ADD COLUMN IF NOT EXISTS reglas JSONB;
ALTER TABLE catalogo.tipo_bien
    ADD COLUMN IF NOT EXISTS tipo_bien_padre INTEGER;

ALTER TABLE catalogo.tipo_bien  ADD CONSTRAINT fk_tipo_bien_tipo_bien_padre FOREIGN KEY (tipo_bien_padre)
REFERENCES catalogo.tipo_bien (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;