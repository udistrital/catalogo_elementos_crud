ALTER SCHEMA catalogo OWNER TO desarrollooas;
ALTER TABLE catalogo.elemento
ADD COLUMN IF NOT EXISTS codigo TEXT NOT NULL DEFAULT '',
DROP COLUMN IF EXISTS fecha_inicio,
DROP COLUMN IF EXISTS fecha_fin;
