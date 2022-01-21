ALTER TABLE catalogo.tipo_bien
    ADD COLUMN IF NOT EXISTS necesita_poliza boolean;
UPDATE catalogo.tipo_bien
    SET necesita_poliza = COALESCE(necesita_poliza,false);
ALTER TABLE catalogo.tipo_bien
    ALTER COLUMN necesita_poliza SET NOT NULL;
