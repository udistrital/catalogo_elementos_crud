ALTER TABLE catalogo.elemento 
DROP COLUMN IF EXISTS codigo,
ADD COLUMN IF NOT EXISTS fecha_inicio timestamp NOT NULL,
ADD COLUMN IF NOT EXISTS fecha_fin timestamp NOT NULL;
