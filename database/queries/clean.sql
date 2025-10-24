ALTER TABLE IF EXISTS source_item DROP CONSTRAINT IF EXISTS source_item_source_id_fkey;
ALTER TABLE IF EXISTS tastes DROP CONSTRAINT IF EXISTS tastes_source_id_fkey;

ALTER TABLE source DROP CONSTRAINT IF EXISTS idx_source_name;
ALTER TABLE source_item DROP CONSTRAINT IF EXISTS idx_source_item_name;
ALTER TABLE tastes DROP CONSTRAINT IF EXISTS idx_tastes_name;

DROP TABLE IF EXISTS source_item;
DROP TABLE IF EXISTS tastes;
DROP TABLE IF EXISTS source;
