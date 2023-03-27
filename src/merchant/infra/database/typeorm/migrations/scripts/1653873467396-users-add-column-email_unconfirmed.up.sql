-- ALTER TABLE public.users DROP COLUMN IF EXISTS email_unconfirmed CASCADE;
ALTER TABLE public.users ADD COLUMN email_unconfirmed varchar(300);
-- ddl-end --
COMMENT ON COLUMN public.users.email_unconfirmed IS E'The user unconfirmed email. It is filled while the email was not confirmed by the user.';
-- ddl-end --

COMMENT ON COLUMN public.users.email IS E'The user email. It is filled when the user confirmed the email.';
-- ddl-end --
