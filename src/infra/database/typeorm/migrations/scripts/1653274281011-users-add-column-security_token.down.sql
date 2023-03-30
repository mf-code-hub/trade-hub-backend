-- [ Dropped objects ] --
ALTER TABLE public.users DROP COLUMN IF EXISTS security_token CASCADE;

-- ALTER TABLE public.users DROP COLUMN IF EXISTS security_stamp CASCADE;
ALTER TABLE public.users ADD COLUMN security_stamp uuid NOT NULL;
-- ddl-end --

COMMENT ON COLUMN public.users.security_stamp IS E'The security stamp of the user. It is used to recover password.';
-- ddl-end --
