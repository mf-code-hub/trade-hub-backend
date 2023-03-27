ALTER TABLE public.campaigns DROP CONSTRAINT IF EXISTS fk__git_providers__campaigns CASCADE;

ALTER TABLE public.organizations DROP CONSTRAINT IF EXISTS fk__git_providers__organizations CASCADE;

ALTER TABLE public.campaigns DROP CONSTRAINT IF EXISTS fk__peridiocities__campaigns CASCADE;

ALTER TABLE public.campaigns DROP CONSTRAINT IF EXISTS fk__campaign_statuses__campaigns CASCADE;

DROP INDEX IF EXISTS public.idx__campaigns__git_provider_id CASCADE;

DROP INDEX IF EXISTS public.idx__part__uq__peridiocities CASCADE;

DROP INDEX IF EXISTS public.idx__uq__peridiocities CASCADE;

DROP INDEX IF EXISTS public.idx__seasons__season_status_id CASCADE;

DROP INDEX IF EXISTS public.idx__part__uq__seasons CASCADE;

DROP INDEX IF EXISTS public.idx__uq__seasons CASCADE;

DROP INDEX IF EXISTS public.idx__campaigns__campaign_status_id CASCADE;

DROP INDEX IF EXISTS public.idx__part__uq__campaign_statuses CASCADE;

DROP INDEX IF EXISTS public.idx__uq__campaign_statuses CASCADE;

DROP TABLE IF EXISTS public.campaign_statuses CASCADE;

ALTER TABLE public.campaigns DROP COLUMN IF EXISTS repository_name CASCADE;

ALTER TABLE public.campaigns DROP COLUMN IF EXISTS git_repository_id CASCADE;

ALTER TABLE public.campaigns DROP COLUMN IF EXISTS campaign_status_id CASCADE;

ALTER TABLE public.campaigns DROP COLUMN IF EXISTS periodicity_id CASCADE;

ALTER TABLE public.campaigns DROP COLUMN IF EXISTS git_provider_id CASCADE;

ALTER TABLE public.seasons DROP COLUMN IF EXISTS reserved_price CASCADE;

ALTER TABLE public.seasons DROP COLUMN IF EXISTS contributor_share_percentage CASCADE;

ALTER TABLE public.seasons DROP COLUMN IF EXISTS mandate_ordering CASCADE;

ALTER TABLE public.seasons DROP COLUMN IF EXISTS logo_uploaded_date CASCADE;

ALTER TABLE public.seasons DROP COLUMN IF EXISTS campaign_id CASCADE;

ALTER TABLE public.peridiocities DROP COLUMN IF EXISTS name CASCADE;

ALTER TABLE public.organizations DROP COLUMN IF EXISTS git_organization_id CASCADE;

ALTER TABLE public.organizations DROP COLUMN IF EXISTS git_provider_id CASCADE;

ALTER TABLE public.seasons ADD COLUMN mandate smallint;

ALTER TABLE public.organizations ADD COLUMN github_id bigint NOT NULL;

COMMENT ON COLUMN public.organizations.github_id IS E'The organization github_id.';

CREATE UNIQUE INDEX idx__uq__organizations__github_id ON public.organizations
	USING btree
	(
	  github_id,
	  deleted_date ASC NULLS FIRST
	);

CREATE UNIQUE INDEX idx__part__uq__organizations__github_id ON public.organizations
	USING btree
	(
	  github_id
	)
	WHERE (deleted_date is null);

ALTER TABLE public.seasons ADD COLUMN property_id uuid;

ALTER TABLE public.campaigns ALTER COLUMN name TYPE varchar(64);

COMMENT ON COLUMN public.campaigns.name IS E'The property name.';

ALTER TABLE public.campaigns ALTER COLUMN description TYPE varchar(500);

COMMENT ON COLUMN public.campaigns.description IS E'The property description.';

ALTER TABLE public.seasons ALTER COLUMN token_qty TYPE smallint;

ALTER TABLE public.seasons ALTER COLUMN token_qty DROP NOT NULL;

COMMENT ON COLUMN public.seasons.token_qty IS '';

ALTER TABLE public.seasons ALTER COLUMN mandate_year DROP NOT NULL;

COMMENT ON COLUMN public.seasons.mandate_year IS '';

COMMENT ON COLUMN public.season_statuses.name IS '';


ALTER TABLE public.seasons ADD CONSTRAINT fk__campaigns__seasons FOREIGN KEY (property_id)
REFERENCES public.campaigns (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;

