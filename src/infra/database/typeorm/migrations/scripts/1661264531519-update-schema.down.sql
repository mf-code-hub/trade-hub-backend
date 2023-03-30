DROP INDEX IF EXISTS public.idx__part__uq__git_users__git_id CASCADE;
-- ddl-end --
DROP INDEX IF EXISTS public.idx__uq__git_users__git_id CASCADE;
-- ddl-end --

ALTER TABLE public.git_users DROP COLUMN IF EXISTS git_id CASCADE;
-- ddl-end --

ALTER TABLE public.git_users DROP COLUMN IF EXISTS git_login CASCADE;
-- ddl-end --

ALTER TABLE public.git_users DROP COLUMN IF EXISTS git_fullname CASCADE;
-- ddl-end --

ALTER TABLE public.campaigns ALTER COLUMN description SET NOT NULL;
-- ddl-end --

-- object: username | type: COLUMN --
-- ALTER TABLE public.git_users DROP COLUMN IF EXISTS username CASCADE;
ALTER TABLE public.git_users ADD COLUMN username varchar(50) NOT NULL;
-- ddl-end --
COMMENT ON COLUMN public.git_users.username IS E'The git username.';
-- ddl-end --

-- DROP INDEX IF EXISTS public.idx__uq__git_users__username CASCADE;
CREATE UNIQUE INDEX idx__uq__git_users__username ON public.git_users
	USING btree
	(
	  git_provider_id,
	  username,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- DROP INDEX IF EXISTS public.idx__part__uq__git_users__username CASCADE;
CREATE UNIQUE INDEX idx__part__uq__git_users__username ON public.git_users
	USING btree
	(
	  git_provider_id,
	  username
	)
	WHERE (deleted_date is null);
-- ddl-end --
