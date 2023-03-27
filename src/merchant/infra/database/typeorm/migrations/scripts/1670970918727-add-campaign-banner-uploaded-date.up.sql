ALTER TABLE public.campaigns ADD COLUMN banner_uploaded_date timestamp with time zone;
-- ddl-end --
COMMENT ON COLUMN public.campaigns.banner_uploaded_date IS E'The banner image uploaded date.';
-- ddl-end --
