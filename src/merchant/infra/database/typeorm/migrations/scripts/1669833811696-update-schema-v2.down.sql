ALTER TABLE public.nfts DROP COLUMN IF EXISTS reward_weight CASCADE;
-- ddl-end --
ALTER TABLE public.nfts DROP COLUMN IF EXISTS ipfs_image_hash CASCADE;
-- ddl-end --
ALTER TABLE public.nfts DROP COLUMN IF EXISTS ipfs_metadata_hash CASCADE;
-- ddl-end --
ALTER TABLE public.nfts DROP COLUMN IF EXISTS metadata CASCADE;
-- ddl-end --
ALTER TABLE public.campaigns DROP COLUMN IF EXISTS logo_uploaded_date CASCADE;
-- ddl-end --
ALTER TABLE public.nfts DROP COLUMN IF EXISTS processed_date CASCADE;
-- ddl-end --
ALTER TABLE public.nfts ADD COLUMN image_uploaded_date timestamp with time zone;
-- ddl-end --
COMMENT ON COLUMN public.nfts.image_uploaded_date IS E'The NFT image uploaded date.';
-- ddl-end --
COMMENT ON COLUMN public.seasons.logo_uploaded_date IS E'The season logo uploaded date.';
-- ddl-end --
