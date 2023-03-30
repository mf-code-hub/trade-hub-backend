-- [ Dropped objects ] --
ALTER TABLE public.users DROP COLUMN IF EXISTS security_stamp CASCADE;

-- ALTER TABLE public.users DROP COLUMN IF EXISTS security_token CASCADE;
ALTER TABLE public.users ADD COLUMN security_token varchar;
-- ddl-end --

COMMENT ON COLUMN public.users.security_token IS E'The security token of the user. It is used for a JWT to recover the user password.';
-- ddl-end --
