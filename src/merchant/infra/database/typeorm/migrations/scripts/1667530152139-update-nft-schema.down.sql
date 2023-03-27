ALTER TABLE public.nfts DROP COLUMN IF EXISTS image_uploaded_date CASCADE;
DELETE FROM PUBLIC.season_statuses WHERE id = '19bde97e-8919-4e07-8fed-c491c5487e26';
