DROP INDEX IF EXISTS public.idx__part__uq__git_users__username CASCADE;
-- ddl-end --
DROP INDEX IF EXISTS public.idx__uq__git_users__username CASCADE;
-- ddl-end --

ALTER TABLE public.git_users DROP COLUMN IF EXISTS username CASCADE;
-- ddl-end --

ALTER TABLE public.campaigns ALTER COLUMN description DROP NOT NULL;
-- ddl-end --

-- ALTER TABLE public.git_users DROP COLUMN IF EXISTS git_id CASCADE;
ALTER TABLE public.git_users ADD COLUMN git_id varchar(30) NOT NULL;
-- ddl-end --
COMMENT ON COLUMN public.git_users.git_id IS E'The git user id.';
-- ddl-end --

-- ALTER TABLE public.git_users DROP COLUMN IF EXISTS git_login CASCADE;
ALTER TABLE public.git_users ADD COLUMN git_login varchar(50) NOT NULL;
-- ddl-end --
COMMENT ON COLUMN public.git_users.git_login IS E'The git user login.';
-- ddl-end --

-- ALTER TABLE public.git_users DROP COLUMN IF EXISTS git_fullname CASCADE;
ALTER TABLE public.git_users ADD COLUMN git_fullname varchar(300);
-- ddl-end --
COMMENT ON COLUMN public.git_users.git_fullname IS E'The git full name.';
-- ddl-end --

-- DROP INDEX IF EXISTS public.idx__uq__git_users__git_id CASCADE;
CREATE UNIQUE INDEX idx__uq__git_users__git_id ON public.git_users
	USING btree
	(
	  git_provider_id,
	  git_id,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- DROP INDEX IF EXISTS public.idx__part__uq__git_users__git_id CASCADE;
CREATE UNIQUE INDEX idx__part__uq__git_users__git_id ON public.git_users
	USING btree
	(
	  git_provider_id,
	  git_id
	)
	WHERE (deleted_date is null);
-- ddl-end --
