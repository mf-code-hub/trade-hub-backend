ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approval_email_sent_date CASCADE;
-- ddl-end --
ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approved_date CASCADE;
-- ddl-end --

-- ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS is_organization_admin CASCADE;
ALTER TABLE public.season_organization_admins ADD COLUMN is_organization_admin bool NOT NULL;
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.is_organization_admin IS E'Whatever the user is admin of the organization. True if it is an organization admin, false if it is an admin of the repository.';
-- ddl-end --

-- ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approval_request_email CASCADE;
ALTER TABLE public.season_organization_admins ADD COLUMN approval_request_email varchar(300);
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.approval_request_email IS E'The approval request email.';
-- ddl-end --

-- ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approval_request_email_sent_date CASCADE;
ALTER TABLE public.season_organization_admins ADD COLUMN approval_request_email_sent_date timestamp with time zone;
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.approval_request_email_sent_date IS E'The date the approval request e-mail was sent.';
-- ddl-end --

-- ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS approval_request_token CASCADE;
ALTER TABLE public.season_organization_admins ADD COLUMN approval_request_token varchar;
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.approval_request_token IS E'The admin approval request token. It is used to approve the campaign season and stores a JWT.';
-- ddl-end --

-- ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS is_approved CASCADE;
ALTER TABLE public.season_organization_admins ADD COLUMN is_approved bool;
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.is_approved IS E'Whatever the campaign season was approved by the admin. True if is approved.';
-- ddl-end --

-- ALTER TABLE public.season_organization_admins DROP COLUMN IF EXISTS response_date CASCADE;
ALTER TABLE public.season_organization_admins ADD COLUMN response_date timestamp with time zone;
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.response_date IS E'The date the admin responded the season approval.';
-- ddl-end --
