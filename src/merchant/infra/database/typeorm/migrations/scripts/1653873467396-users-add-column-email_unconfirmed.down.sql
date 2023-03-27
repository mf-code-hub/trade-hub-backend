ALTER TABLE public.users DROP COLUMN IF EXISTS email_unconfirmed CASCADE;
-- ddl-end --

COMMENT ON COLUMN public.users.email IS E'The unique email of the user.';
-- ddl-end --
