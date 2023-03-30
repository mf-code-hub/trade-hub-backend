ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS is_organization_admin CASCADE;
-- ddl-end --
ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approval_request_email CASCADE;
-- ddl-end --
ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approval_request_email_sent_date CASCADE;
-- ddl-end --
ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approval_request_token CASCADE;
-- ddl-end --
ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS is_approved CASCADE;
-- ddl-end --
ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS response_date CASCADE;
-- ddl-end --

-- ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approval_email_sent_date CASCADE;
ALTER TABLE public.season_organization_admins ADD COLUMN approval_email_sent_date timestamp with time zone;
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.approval_email_sent_date IS E'The date the approval e-mail was sent.';
-- ddl-end --

-- ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approved_date CASCADE;
ALTER TABLE public.season_organization_admins ADD COLUMN approved_date timestamp with time zone;
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.approved_date IS E'The date the admin approved the';
-- ddl-end --
