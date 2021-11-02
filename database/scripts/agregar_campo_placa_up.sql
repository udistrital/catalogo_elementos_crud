ALTER TABLE catalogo.tipo_bien
    ADD COLUMN IF NOT EXISTS necesita_placa boolean;
UPDATE catalogo.tipo_bien
    SET necesita_placa = COALESCE(necesita_placa,false);
ALTER TABLE catalogo.tipo_bien
    ALTER COLUMN necesita_placa SET NOT NULL;