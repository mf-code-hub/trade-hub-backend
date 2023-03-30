ALTER TABLE public.nfts ADD COLUMN image_uploaded_date timestamp with time zone;
COMMENT ON COLUMN public.nfts.image_uploaded_date IS E'The NFT image uploaded date.';

INSERT INTO PUBLIC.season_statuses (id, NAME, created_date, updated_date, deleted_date)
VALUES ('19bde97e-8919-4e07-8fed-c491c5487e26', 'In publishing', Now(), NULL, NULL)
