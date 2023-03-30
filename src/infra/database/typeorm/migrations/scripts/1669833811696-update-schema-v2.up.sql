ALTER TABLE public.nfts DROP COLUMN IF EXISTS image_uploaded_date CASCADE;
-- ddl-end --
ALTER TABLE public.nfts ADD COLUMN processed_date timestamp with time zone;
-- ddl-end --
COMMENT ON COLUMN public.nfts.processed_date IS E'The NFT procesed date. The NFT image was created and uploaded to NFT storage.';
-- ddl-end --
ALTER TABLE public.campaigns ADD COLUMN logo_uploaded_date timestamp with time zone;
-- ddl-end --
COMMENT ON COLUMN public.campaigns.logo_uploaded_date IS E'The campaign logo uploaded date.';
-- ddl-end --
COMMENT ON COLUMN public.seasons.logo_uploaded_date IS E'The season logo uploaded date. The system will copy the current campaign logo to the season when it changes to "in publishing".';
-- ddl-end --
ALTER TABLE public.nfts ADD COLUMN reward_weight smallint;
UPDATE public.nfts SET reward_weight = 1 WHERE reward_weight IS NULL;
ALTER TABLE public.nfts ALTER COLUMN reward_weight SET NOT NULL;

-- ddl-end --
COMMENT ON COLUMN public.nfts.reward_weight IS E'The NFT reward_weight. It''s calculated from the quantity of tokens generated on a season.';
-- ddl-end --
ALTER TABLE public.nfts ADD COLUMN ipfs_image_hash varchar;
-- ddl-end --
COMMENT ON COLUMN public.nfts.ipfs_image_hash IS E'The IPFS image hash. It is generated after the upload of the image to the IPFS.';
-- ddl-end --
ALTER TABLE public.nfts ADD COLUMN ipfs_metadata_hash varchar;
-- ddl-end --
COMMENT ON COLUMN public.nfts.ipfs_metadata_hash IS E'The IPFS metadata hash. It is generated after the upload of the json data to the IPFS.';
-- ddl-end --
ALTER TABLE public.nfts ADD COLUMN metadata jsonb;
-- ddl-end --
COMMENT ON COLUMN public.nfts.metadata IS E'The NFT metadata.';
-- ddl-end --
UPDATE public.season_statuses SET name = 'Draft' WHERE id = '59bcfb98-f3f0-4c93-8fa5-caf39a554451';
UPDATE public.season_statuses SET name = 'Waiting admins approval' WHERE id = '62f34f5f-99c1-49b8-b1ea-6a17049f43cf';
UPDATE public.season_statuses SET name = 'Denied by admins' WHERE id = '23761aa0-0b5f-42a4-a29d-8981747d63cd';
UPDATE public.season_statuses SET name = 'Approved by admins' WHERE id = '530ae30c-bcc7-4076-a3fd-e6858af33fd2';
UPDATE public.season_statuses SET name = 'Published' WHERE id = '74058bc5-2c07-4a14-aba9-b64e33253e18';
UPDATE public.season_statuses SET name = 'In auction' WHERE id = 'df0161a1-7312-48d1-931c-47b762d3e359';
UPDATE public.season_statuses SET name = 'Auctioned' WHERE id = '42901df9-3ed7-475d-ba8b-1cc2f6b01344';
UPDATE public.season_statuses SET name = 'In Publishing' WHERE id = '19bde97e-8919-4e07-8fed-c491c5487e26';
UPDATE public.campaign_statuses SET name = 'Draft' WHERE id = 'f8dcbcdd-8ab9-4eeb-8f4c-81c23778f8a8';
UPDATE public.campaign_statuses SET name = 'Waiting admins approval' WHERE id = 'e912dd11-7a87-46a4-a039-550c9bf68c8a';
UPDATE public.campaign_statuses SET name = 'Denied by admins' WHERE id = '42beec31-d0bc-4812-b564-ef6dbbbf81c9';
UPDATE public.campaign_statuses SET name = 'Active' WHERE id = 'ba29a7c8-9cdb-48b6-8cc0-ae1b9e25f0f7';

