ALTER TABLE public.seasons DROP COLUMN IF EXISTS property_id CASCADE;

ALTER TABLE public.seasons DROP COLUMN IF EXISTS mandate CASCADE;

ALTER TABLE public.organizations DROP COLUMN IF EXISTS github_id CASCADE;

ALTER TABLE public.campaigns ADD COLUMN repository_name varchar(250) NOT NULL;

COMMENT ON COLUMN public.campaigns.repository_name IS E'The repository name.';

ALTER TABLE public.campaigns ADD COLUMN git_repository_id varchar(100) NOT NULL;

COMMENT ON COLUMN public.campaigns.git_repository_id IS E'The git repository identification.';

ALTER TABLE public.seasons ADD COLUMN reserved_price numeric(22,18) NOT NULL;

COMMENT ON COLUMN public.seasons.reserved_price IS E'The season reserved price.';

ALTER TABLE public.seasons ADD COLUMN contributor_share_percentage numeric(3,0) NOT NULL;

COMMENT ON COLUMN public.seasons.contributor_share_percentage IS E'The season contributor share in percentage.';

ALTER TABLE public.seasons ADD COLUMN mandate_ordering smallint NOT NULL;

COMMENT ON COLUMN public.seasons.mandate_ordering IS E'The season madate ordering. It is a sequential numer for each campaign.';

ALTER TABLE public.seasons ADD COLUMN logo_uploaded_date timestamp with time zone;

COMMENT ON COLUMN public.seasons.logo_uploaded_date IS E'The season logo uploaded date.';

ALTER TABLE public.peridiocities ADD COLUMN name varchar(50) NOT NULL;

COMMENT ON COLUMN public.peridiocities.name IS E'The periodicity name. Possible values are Monthly, Quarterly, Biannual and Yearly.';

ALTER TABLE public.organizations ADD COLUMN git_organization_id varchar(100) NOT NULL;

COMMENT ON COLUMN public.organizations.git_organization_id IS E'The organization git identification.';

CREATE TABLE public.campaign_statuses (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(50) NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__campaign_statuses PRIMARY KEY (id)
);

COMMENT ON COLUMN public.campaign_statuses.id IS E'The unique identifier for the object.';

COMMENT ON COLUMN public.campaign_statuses.alternative_id IS E'The auto generated sequential identifier.';

COMMENT ON COLUMN public.campaign_statuses.name IS E'The campaign status name. Possible values are Pre-draft, In draft, Waiting admins approval, Denied by admins, Approved by admins, Published, In auction, Auctioned.';

COMMENT ON COLUMN public.campaign_statuses.created_date IS E'The date of create.';

COMMENT ON COLUMN public.campaign_statuses.updated_date IS E'The date of last update.';

COMMENT ON COLUMN public.campaign_statuses.deleted_date IS E'The date of delete. Used by the soft delete.';

ALTER TABLE public.campaign_statuses OWNER TO admin_reopen;

ALTER TABLE public.seasons ADD COLUMN campaign_id uuid;

ALTER TABLE public.campaigns ADD COLUMN campaign_status_id uuid NOT NULL;

ALTER TABLE public.campaigns ADD COLUMN periodicity_id uuid NOT NULL;

ALTER TABLE public.organizations ADD COLUMN git_provider_id uuid NOT NULL;

ALTER TABLE public.campaigns ADD COLUMN git_provider_id uuid NOT NULL;

ALTER TABLE public.campaigns ALTER COLUMN name TYPE varchar(250);

COMMENT ON COLUMN public.campaigns.name IS E'The campaign name. Automatically generated with the repository name with other info.';

ALTER TABLE public.campaigns ALTER COLUMN description TYPE varchar;

COMMENT ON COLUMN public.campaigns.description IS E'The description. First filled with the repository short description.';

ALTER TABLE public.seasons ALTER COLUMN token_qty TYPE integer;

ALTER TABLE public.seasons ALTER COLUMN token_qty SET NOT NULL;

COMMENT ON COLUMN public.seasons.token_qty IS E'The season token quantity';

ALTER TABLE public.seasons ALTER COLUMN mandate_year SET NOT NULL;

COMMENT ON COLUMN public.seasons.mandate_year IS E'The season madate year.';

COMMENT ON COLUMN public.season_statuses.name IS E'The season status name. Possible values are Pre-draft, In draft, Waiting admins approval, Denied by admins, Approved by admins, Published, In auction, Auctioned.';

CREATE UNIQUE INDEX idx__uq__campaign_statuses ON public.campaign_statuses
	USING btree
	(
	  name,
	  deleted_date ASC NULLS FIRST
	);

CREATE UNIQUE INDEX idx__part__uq__campaign_statuses ON public.campaign_statuses
	USING btree
	(
	  name
	)
	WHERE (deleted_date is null);

CREATE INDEX idx__campaigns__campaign_status_id ON public.campaigns
	USING btree
	(
	  campaign_status_id,
	  deleted_date ASC NULLS FIRST
	);

CREATE UNIQUE INDEX idx__uq__seasons ON public.seasons
	USING btree
	(
	  campaign_id,
	  mandate_ordering,
	  deleted_date ASC NULLS FIRST
	);

CREATE UNIQUE INDEX idx__part__uq__seasons ON public.seasons
	USING btree
	(
	  campaign_id,
	  mandate_ordering
	)
	WHERE (deleted_date is null);

CREATE INDEX idx__seasons__season_status_id ON public.seasons
	USING btree
	(
	  season_status_id,
	  deleted_date ASC NULLS FIRST
	);

CREATE UNIQUE INDEX idx__uq__peridiocities ON public.peridiocities
	USING btree
	(
	  name,
	  deleted_date ASC NULLS FIRST
	);

CREATE UNIQUE INDEX idx__part__uq__peridiocities ON public.peridiocities
	USING btree
	(
	  name
	)
	WHERE (deleted_date is null);

CREATE INDEX idx__campaigns__git_provider_id ON public.campaigns
	USING btree
	(
	  git_provider_id,
	  deleted_date ASC NULLS FIRST
	);

ALTER TABLE public.campaigns ADD CONSTRAINT fk__campaign_statuses__campaigns FOREIGN KEY (campaign_status_id)
REFERENCES public.campaign_statuses (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE public.campaigns ADD CONSTRAINT fk__peridiocities__campaigns FOREIGN KEY (periodicity_id)
REFERENCES public.peridiocities (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE public.organizations ADD CONSTRAINT fk__git_providers__organizations FOREIGN KEY (git_provider_id)
REFERENCES public.git_providers (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;

ALTER TABLE public.campaigns ADD CONSTRAINT fk__git_providers__campaigns FOREIGN KEY (git_provider_id)
REFERENCES public.git_providers (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
