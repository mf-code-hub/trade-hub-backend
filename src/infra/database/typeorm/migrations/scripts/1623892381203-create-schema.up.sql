-- Database generated with pgModeler (PostgreSQL Database Modeler).
-- pgModeler  version: 0.9.3-beta1
-- PostgreSQL version: 13.0
-- Project Site: pgmodeler.io
-- Model Author: ---
-- object: admin_reopen | type: ROLE --
DROP ROLE IF EXISTS admin_reopen;
CREATE ROLE admin_reopen WITH ;
-- ddl-end --


-- Database creation must be performed outside a multi lined SQL file.
-- These commands were put in this file only as a convenience.
--
-- object: "Reopen" | type: DATABASE --
-- DROP DATABASE IF EXISTS "Reopen";
-- CREATE DATABASE "Reopen";
-- ddl-end --


-- object: public.users | type: TABLE --
-- DROP TABLE IF EXISTS public.users CASCADE;
CREATE TABLE public.users (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	time_zone_id uuid NOT NULL,
	username varchar(32),
	bio varchar(1500),
	email varchar(300),
	email_confirmed_date timestamp with time zone,
	security_stamp uuid NOT NULL,
	admin_blocked_date timestamp with time zone,
	avatar_image_uploaded_date timestamp with time zone,
	banner_image_uploaded_date timestamp with time zone,
	twitter_username varchar(15),
	instagram_username varchar(30),
	linkedin_username varchar(128),
	website_url varchar(400),
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__users PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.users.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.users.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.users.username IS E'The username.';
-- ddl-end --
COMMENT ON COLUMN public.users.bio IS E'The bio of the user.';
-- ddl-end --
COMMENT ON COLUMN public.users.email IS E'The unique email of the user.';
-- ddl-end --
COMMENT ON COLUMN public.users.email_confirmed_date IS E'The email confirmation date. It is set by the confirmation link sent by email.';
-- ddl-end --
COMMENT ON COLUMN public.users.security_stamp IS E'The security stamp of the user. It is used to recover password.';
-- ddl-end --
COMMENT ON COLUMN public.users.admin_blocked_date IS E'The date the admin blocked the user access.';
-- ddl-end --
COMMENT ON COLUMN public.users.avatar_image_uploaded_date IS E'The date the user uploaded the avatar. It is used to show the avatar or a default image. This date is used to version the image and avoid the cache of the browser when the image is changed.';
-- ddl-end --
COMMENT ON COLUMN public.users.banner_image_uploaded_date IS E'The date the user uploaded the banner. It is used to show the banner or a default image. This date is used to version the image and avoid the cache of the browser when the image is changed.';
-- ddl-end --
COMMENT ON COLUMN public.users.twitter_username IS E'The twitter username.';
-- ddl-end --
COMMENT ON COLUMN public.users.instagram_username IS E'The instagram username.';
-- ddl-end --
COMMENT ON COLUMN public.users.linkedin_username IS E'The linkedin username.';
-- ddl-end --
COMMENT ON COLUMN public.users.website_url IS E'The user website url.';
-- ddl-end --
COMMENT ON COLUMN public.users.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.users.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.users.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.users OWNER TO admin_reopen;
-- ddl-end --

-- object: public.roles | type: TABLE --
-- DROP TABLE IF EXISTS public.roles CASCADE;
CREATE TABLE public.roles (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(150) NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__roles PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.roles.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.roles.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.roles.name IS E'The name of the role. It is created by the user to group functionalities.';
-- ddl-end --
COMMENT ON COLUMN public.roles.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.roles.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.roles.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.roles OWNER TO admin_reopen;
-- ddl-end --

-- object: public.user_roles | type: TABLE --
-- DROP TABLE IF EXISTS public.user_roles CASCADE;
CREATE TABLE public.user_roles (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	user_id uuid NOT NULL,
	role_id uuid NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__user_roles PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON TABLE public.user_roles IS E'admin\noperador de CRM';
-- ddl-end --
COMMENT ON COLUMN public.user_roles.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.user_roles.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.user_roles.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.user_roles.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.user_roles.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.user_roles OWNER TO admin_reopen;
-- ddl-end --

-- object: public.templates | type: TABLE --
-- DROP TABLE IF EXISTS public.templates CASCADE;
CREATE TABLE public.templates (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__templates PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.templates.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.templates.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.templates.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.templates.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.templates.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.templates OWNER TO admin_reopen;
-- ddl-end --

-- object: public.time_zones | type: TABLE --
-- DROP TABLE IF EXISTS public.time_zones CASCADE;
CREATE TABLE public.time_zones (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(100) NOT NULL,
	abbreviation varchar(20) NOT NULL,
	country_iso_code varchar(6) NOT NULL,
	utc_offset interval NOT NULL,
	utc_dst_offset interval NOT NULL,
	is_default bool NOT NULL,
	is_active bool NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__time_zones PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.time_zones.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.name IS E'The name of the time zone.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.abbreviation IS E'The unique time zone abbreviation.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.country_iso_code IS E'The country ISO 3166-1 code of the time zone.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.utc_offset IS E'The utc offset of the time zone. Examples are -03:00, +00:00, +03:00.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.utc_dst_offset IS E'The day light utc offset of the time zone. Examples are -03:00, +00:00, +03:00.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.is_default IS E'Whatever is the default time zone. True if it is the default.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.is_active IS E'Whatever the time zone is active. True if it is active.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.time_zones.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.time_zones OWNER TO admin_reopen;
-- ddl-end --

-- object: fk__time_zones__users | type: CONSTRAINT --
-- ALTER TABLE public.users DROP CONSTRAINT IF EXISTS fk__time_zones__users CASCADE;
ALTER TABLE public.users ADD CONSTRAINT fk__time_zones__users FOREIGN KEY (time_zone_id)
REFERENCES public.time_zones (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: fk__users__user_roles | type: CONSTRAINT --
-- ALTER TABLE public.user_roles DROP CONSTRAINT IF EXISTS fk__users__user_roles CASCADE;
ALTER TABLE public.user_roles ADD CONSTRAINT fk__users__user_roles FOREIGN KEY (user_id)
REFERENCES public.users (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT;
-- ddl-end --

-- object: public.system_configurations | type: TABLE --
-- DROP TABLE IF EXISTS public.system_configurations CASCADE;
CREATE TABLE public.system_configurations (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(100) NOT NULL,
	general_data_type_id uuid NOT NULL,
	description varchar(1000),
	slug varchar(20) NOT NULL,
	is_global bool NOT NULL,
	is_hidden bool NOT NULL,
	int_value integer,
	bool_value bool,
	string_value varchar,
	uuid_value uuid,
	timestamp_value timestamp with time zone,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__system_configurations PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.name IS E'The name of the system configuration.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.description IS E'The description of the system configuration.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.slug IS E'The unique slug of the system configuration.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.is_global IS E'Whatever the system configuration is global. True if it is global for all tenants.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.is_hidden IS E'Whatever the system configuration is hidden. True if it is hidden and not visible to the client.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.int_value IS E'The int value of the system configuration.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.bool_value IS E'The bool value of the system configuration.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.string_value IS E'The string value of the system configuration.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.uuid_value IS E'The uuid value of the system configuration.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.timestamp_value IS E'The timestamp value of the system configuration.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.system_configurations.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.system_configurations OWNER TO admin_reopen;
-- ddl-end --

-- object: public.general_data_types | type: TABLE --
-- DROP TABLE IF EXISTS public.general_data_types CASCADE;
CREATE TABLE public.general_data_types (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(40) NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__general_data_types PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.general_data_types.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.general_data_types.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.general_data_types.name IS E'The unique name of the data type.';
-- ddl-end --
COMMENT ON COLUMN public.general_data_types.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.general_data_types.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.general_data_types.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.general_data_types OWNER TO admin_reopen;
-- ddl-end --

-- object: fk__general_data_types__system_configurations | type: CONSTRAINT --
-- ALTER TABLE public.system_configurations DROP CONSTRAINT IF EXISTS fk__general_data_types__system_configurations CASCADE;
ALTER TABLE public.system_configurations ADD CONSTRAINT fk__general_data_types__system_configurations FOREIGN KEY (general_data_type_id)
REFERENCES public.general_data_types (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: idx__uq__system_configurations | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__system_configurations CASCADE;
CREATE UNIQUE INDEX idx__uq__system_configurations ON public.system_configurations
	USING btree
	(
	  slug,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: fk__roles__user_roles | type: CONSTRAINT --
-- ALTER TABLE public.user_roles DROP CONSTRAINT IF EXISTS fk__roles__user_roles CASCADE;
ALTER TABLE public.user_roles ADD CONSTRAINT fk__roles__user_roles FOREIGN KEY (role_id)
REFERENCES public.roles (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: idx__uq__roles | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__roles CASCADE;
CREATE UNIQUE INDEX idx__uq__roles ON public.roles
	USING btree
	(
	  name,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__uq__user_roles | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__user_roles CASCADE;
CREATE UNIQUE INDEX idx__uq__user_roles ON public.user_roles
	USING btree
	(
	  user_id,
	  role_id,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__uq__time_zones | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__time_zones CASCADE;
CREATE UNIQUE INDEX idx__uq__time_zones ON public.time_zones
	USING btree
	(
	  abbreviation,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__time_zones | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__time_zones CASCADE;
CREATE UNIQUE INDEX idx__part__uq__time_zones ON public.time_zones
	USING btree
	(
	  abbreviation
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: idx__part__uq__roles | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__roles CASCADE;
CREATE UNIQUE INDEX idx__part__uq__roles ON public.roles
	USING btree
	(
	  name
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: idx__part__uq__user_roles | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__user_roles CASCADE;
CREATE UNIQUE INDEX idx__part__uq__user_roles ON public.user_roles
	USING btree
	(
	  user_id,
	  role_id
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: idx__user_roles__role_id | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__user_roles__role_id CASCADE;
CREATE INDEX idx__user_roles__role_id ON public.user_roles
	USING btree
	(
	  role_id,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__system_configurations | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__system_configurations CASCADE;
CREATE UNIQUE INDEX idx__part__uq__system_configurations ON public.system_configurations
	USING btree
	(
	  slug
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: idx__uq__general_data_types | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__general_data_types CASCADE;
CREATE UNIQUE INDEX idx__uq__general_data_types ON public.general_data_types
	USING btree
	(
	  name,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__general_data_types | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__general_data_types CASCADE;
CREATE UNIQUE INDEX idx__part__uq__general_data_types ON public.general_data_types
	USING btree
	(
	  name
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: public.campaigns | type: TABLE --
-- DROP TABLE IF EXISTS public.campaigns CASCADE;
CREATE TABLE public.campaigns (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	creator_wallet_id uuid NOT NULL,
	name varchar(64) NOT NULL,
	description varchar(500) NOT NULL,
	repository_url varchar(400) NOT NULL,
	repository_stars integer NOT NULL,
	repository_forks_qty integer NOT NULL,
	repository_contributors_qty integer NOT NULL,
	is_organization_owner bool NOT NULL,
	organization_id uuid,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__campaigns PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.campaigns.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.name IS E'The property name.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.description IS E'The property description.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.repository_url IS E'The property repository url.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.repository_stars IS E'The property repository stars.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.repository_forks_qty IS E'The property repository forks quantity.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.repository_contributors_qty IS E'The property repository contributors quantity.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.is_organization_owner IS E'Whatever the property is owned by an organization or individual. True if is owned by an organization.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.campaigns.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.campaigns OWNER TO admin_reopen;
-- ddl-end --

-- object: public.nfts | type: TABLE --
-- DROP TABLE IF EXISTS public.nfts CASCADE;
CREATE TABLE public.nfts (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	token_id smallint NOT NULL,
	season_id uuid NOT NULL,
	bid_id uuid,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	campaign_id uuid NOT NULL,
	CONSTRAINT pk__nfts PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.nfts.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.nfts.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.nfts.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.nfts.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.nfts.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.nfts OWNER TO admin_reopen;
-- ddl-end --

-- object: fk__campaigns__nfts | type: CONSTRAINT --
-- ALTER TABLE public.nfts DROP CONSTRAINT IF EXISTS fk__campaigns__nfts CASCADE;
ALTER TABLE public.nfts ADD CONSTRAINT fk__campaigns__nfts FOREIGN KEY (campaign_id)
REFERENCES public.campaigns (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.seasons | type: TABLE --
-- DROP TABLE IF EXISTS public.seasons CASCADE;
CREATE TABLE public.seasons (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	property_id uuid,
	season_status_id uuid NOT NULL,
	token_qty smallint,
	mandate smallint,
	mandate_year smallint,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__seasons PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.seasons.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.seasons.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.seasons.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.seasons.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.seasons.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.seasons OWNER TO admin_reopen;
-- ddl-end --

-- object: fk__campaigns__seasons | type: CONSTRAINT --
-- ALTER TABLE public.seasons DROP CONSTRAINT IF EXISTS fk__campaigns__seasons CASCADE;
ALTER TABLE public.seasons ADD CONSTRAINT fk__campaigns__seasons FOREIGN KEY (property_id)
REFERENCES public.campaigns (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: fk__seasons__nfts | type: CONSTRAINT --
-- ALTER TABLE public.nfts DROP CONSTRAINT IF EXISTS fk__seasons__nfts CASCADE;
ALTER TABLE public.nfts ADD CONSTRAINT fk__seasons__nfts FOREIGN KEY (season_id)
REFERENCES public.seasons (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: public.peridiocities | type: TABLE --
-- DROP TABLE IF EXISTS public.peridiocities CASCADE;
CREATE TABLE public.peridiocities (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__peridiocities PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.peridiocities.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.peridiocities.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.peridiocities.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.peridiocities.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.peridiocities.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.peridiocities OWNER TO admin_reopen;
-- ddl-end --

-- object: public.auctions | type: TABLE --
-- DROP TABLE IF EXISTS public.auctions CASCADE;
CREATE TABLE public.auctions (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	season_id uuid NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__auctions PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.auctions.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.auctions.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.auctions.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.auctions.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.auctions.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.auctions OWNER TO admin_reopen;
-- ddl-end --

-- object: public.bids | type: TABLE --
-- DROP TABLE IF EXISTS public.bids CASCADE;
CREATE TABLE public.bids (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	auction_id uuid NOT NULL,
	user_id uuid NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__bids PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.bids.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.bids.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.bids.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.bids.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.bids.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.bids OWNER TO admin_reopen;
-- ddl-end --

-- object: fk__seasons__auctions | type: CONSTRAINT --
-- ALTER TABLE public.auctions DROP CONSTRAINT IF EXISTS fk__seasons__auctions CASCADE;
ALTER TABLE public.auctions ADD CONSTRAINT fk__seasons__auctions FOREIGN KEY (season_id)
REFERENCES public.seasons (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk__auctions__bids | type: CONSTRAINT --
-- ALTER TABLE public.bids DROP CONSTRAINT IF EXISTS fk__auctions__bids CASCADE;
ALTER TABLE public.bids ADD CONSTRAINT fk__auctions__bids FOREIGN KEY (auction_id)
REFERENCES public.auctions (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk__users__bids | type: CONSTRAINT --
-- ALTER TABLE public.bids DROP CONSTRAINT IF EXISTS fk__users__bids CASCADE;
ALTER TABLE public.bids ADD CONSTRAINT fk__users__bids FOREIGN KEY (user_id)
REFERENCES public.users (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk__bids__nfts | type: CONSTRAINT --
-- ALTER TABLE public.nfts DROP CONSTRAINT IF EXISTS fk__bids__nfts CASCADE;
ALTER TABLE public.nfts ADD CONSTRAINT fk__bids__nfts FOREIGN KEY (bid_id)
REFERENCES public.bids (id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: idx_uq_nfts | type: CONSTRAINT --
-- ALTER TABLE public.nfts DROP CONSTRAINT IF EXISTS idx_uq_nfts CASCADE;
ALTER TABLE public.nfts ADD CONSTRAINT idx_uq_nfts UNIQUE (bid_id);
-- ddl-end --

-- object: public.networks | type: TABLE --
-- DROP TABLE IF EXISTS public.networks CASCADE;
CREATE TABLE public.networks (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(50) NOT NULL,
	rpc_url varchar(400) NOT NULL,
	blockchain_id varchar(100) NOT NULL,
	token_symbol varchar(10) NOT NULL,
	is_active bool NOT NULL,
	is_default bool NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__networks PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.networks.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.networks.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.networks.name IS E'The name of the network. Possible value is Ethereum.';
-- ddl-end --
COMMENT ON COLUMN public.networks.rpc_url IS E'The RPC url of the network.';
-- ddl-end --
COMMENT ON COLUMN public.networks.blockchain_id IS E'The blockchain_id of the network.';
-- ddl-end --
COMMENT ON COLUMN public.networks.token_symbol IS E'The symbol of the network. Possible values are Ethereum = WETH and Ethereum = ETH.';
-- ddl-end --
COMMENT ON COLUMN public.networks.is_active IS E'Whatever the network is active. True if it is active.';
-- ddl-end --
COMMENT ON COLUMN public.networks.is_default IS E'Whatever the network is the default. True if it is default.';
-- ddl-end --
COMMENT ON COLUMN public.networks.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.networks.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.networks.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.networks OWNER TO admin_reopen;
-- ddl-end --

-- object: public.blockchain_transactions | type: TABLE --
-- DROP TABLE IF EXISTS public.blockchain_transactions CASCADE;
CREATE TABLE public.blockchain_transactions (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	network_id uuid NOT NULL,
	nft_id uuid NOT NULL,
	hash_id smallint,
	price smallint,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__blockchain_transactions PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.blockchain_transactions.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.blockchain_transactions.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.blockchain_transactions.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.blockchain_transactions.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.blockchain_transactions.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.blockchain_transactions OWNER TO admin_reopen;
-- ddl-end --

-- object: fk__networks__blockchain_transactions | type: CONSTRAINT --
-- ALTER TABLE public.blockchain_transactions DROP CONSTRAINT IF EXISTS fk__networks__blockchain_transactions CASCADE;
ALTER TABLE public.blockchain_transactions ADD CONSTRAINT fk__networks__blockchain_transactions FOREIGN KEY (network_id)
REFERENCES public.networks (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: fk__nfts__blockchain_transactions | type: CONSTRAINT --
-- ALTER TABLE public.blockchain_transactions DROP CONSTRAINT IF EXISTS fk__nfts__blockchain_transactions CASCADE;
ALTER TABLE public.blockchain_transactions ADD CONSTRAINT fk__nfts__blockchain_transactions FOREIGN KEY (nft_id)
REFERENCES public.nfts (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: idx__uq__networks | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__networks CASCADE;
CREATE UNIQUE INDEX idx__uq__networks ON public.networks
	USING btree
	(
	  name,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__networks | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__networks CASCADE;
CREATE UNIQUE INDEX idx__part__uq__networks ON public.networks
	USING btree
	(
	  name
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: idx__uq__campaigns | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__campaigns CASCADE;
CREATE UNIQUE INDEX idx__uq__campaigns ON public.campaigns
	USING btree
	(
	  name,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__campaigns | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__campaigns CASCADE;
CREATE UNIQUE INDEX idx__part__uq__campaigns ON public.campaigns
	USING btree
	(
	  name
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: public.organizations | type: TABLE --
-- DROP TABLE IF EXISTS public.organizations CASCADE;
CREATE TABLE public.organizations (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(100) NOT NULL,
	github_id bigint NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__organizations PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.organizations.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.organizations.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.organizations.name IS E'The organization name.';
-- ddl-end --
COMMENT ON COLUMN public.organizations.github_id IS E'The organization github_id.';
-- ddl-end --
COMMENT ON COLUMN public.organizations.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.organizations.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.organizations.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.organizations OWNER TO admin_reopen;
-- ddl-end --

-- object: idx__uq__organizations__name | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__organizations__name CASCADE;
CREATE UNIQUE INDEX idx__uq__organizations__name ON public.organizations
	USING btree
	(
	  name,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__organizations__name | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__organizations__name CASCADE;
CREATE UNIQUE INDEX idx__part__uq__organizations__name ON public.organizations
	USING btree
	(
	  name
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: idx__uq__organizations__github_id | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__organizations__github_id CASCADE;
CREATE UNIQUE INDEX idx__uq__organizations__github_id ON public.organizations
	USING btree
	(
	  github_id,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__organizations__github_id | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__organizations__github_id CASCADE;
CREATE UNIQUE INDEX idx__part__uq__organizations__github_id ON public.organizations
	USING btree
	(
	  github_id
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: fk__organizations__campaigns | type: CONSTRAINT --
-- ALTER TABLE public.campaigns DROP CONSTRAINT IF EXISTS fk__organizations__campaigns CASCADE;
ALTER TABLE public.campaigns ADD CONSTRAINT fk__organizations__campaigns FOREIGN KEY (organization_id)
REFERENCES public.organizations (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: public.season_organization_admins | type: TABLE --
-- DROP TABLE IF EXISTS public.season_organization_admins CASCADE;
CREATE TABLE public.season_organization_admins (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	season_id uuid NOT NULL,
	organization_id uuid NOT NULL,
	git_user_id uuid NOT NULL,
	approval_email_sent_date timestamp with time zone,
	approved_date timestamp with time zone,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__sason_organization_admins PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.approval_email_sent_date IS E'The date the approval e-mail was sent.';
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.approved_date IS E'The date the admin approved the';
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.season_organization_admins.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.season_organization_admins OWNER TO admin_reopen;
-- ddl-end --

-- object: fk__organizations__season_organization_admins | type: CONSTRAINT --
-- ALTER TABLE public.season_organization_admins DROP CONSTRAINT IF EXISTS fk__organizations__season_organization_admins CASCADE;
ALTER TABLE public.season_organization_admins ADD CONSTRAINT fk__organizations__season_organization_admins FOREIGN KEY (organization_id)
REFERENCES public.organizations (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: idx__uq__users__username | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__users__username CASCADE;
CREATE UNIQUE INDEX idx__uq__users__username ON public.users
	USING btree
	(
	  username,
	  deleted_date ASC NULLS FIRST
	)
	WHERE (username is not null);
-- ddl-end --

-- object: idx__part__uq__users__username | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__users__username CASCADE;
CREATE UNIQUE INDEX idx__part__uq__users__username ON public.users
	USING btree
	(
	  username
	)
	WHERE (username is not null and deleted_date is null);
-- ddl-end --

-- object: fk__seasons__season_organization_admins | type: CONSTRAINT --
-- ALTER TABLE public.season_organization_admins DROP CONSTRAINT IF EXISTS fk__seasons__season_organization_admins CASCADE;
ALTER TABLE public.season_organization_admins ADD CONSTRAINT fk__seasons__season_organization_admins FOREIGN KEY (season_id)
REFERENCES public.seasons (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: public.git_users | type: TABLE --
-- DROP TABLE IF EXISTS public.git_users CASCADE;
CREATE TABLE public.git_users (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	git_provider_id uuid NOT NULL,
	user_id uuid,
	username varchar(50) NOT NULL,
	token varchar(100),
	email varchar(300),
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__git_users PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.git_users.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.git_users.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.git_users.username IS E'The git username.';
-- ddl-end --
COMMENT ON COLUMN public.git_users.token IS E'The git token.';
-- ddl-end --
COMMENT ON COLUMN public.git_users.email IS E'The git provider email.';
-- ddl-end --
COMMENT ON COLUMN public.git_users.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.git_users.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.git_users.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.git_users OWNER TO admin_reopen;
-- ddl-end --

-- object: public.git_providers | type: TABLE --
-- DROP TABLE IF EXISTS public.git_providers CASCADE;
CREATE TABLE public.git_providers (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(100) NOT NULL,
	is_active bool NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__git_providers PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.git_providers.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.git_providers.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.git_providers.name IS E'The git provider name.';
-- ddl-end --
COMMENT ON COLUMN public.git_providers.is_active IS E'Whatever the git provider is active. True if it is active.';
-- ddl-end --
COMMENT ON COLUMN public.git_providers.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.git_providers.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.git_providers.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.git_providers OWNER TO admin_reopen;
-- ddl-end --

-- object: fk__git_providers__git_users | type: CONSTRAINT --
-- ALTER TABLE public.git_users DROP CONSTRAINT IF EXISTS fk__git_providers__git_users CASCADE;
ALTER TABLE public.git_users ADD CONSTRAINT fk__git_providers__git_users FOREIGN KEY (git_provider_id)
REFERENCES public.git_providers (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: public.wallets | type: TABLE --
-- DROP TABLE IF EXISTS public.wallets CASCADE;
CREATE TABLE public.wallets (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	network_id uuid NOT NULL,
	user_id uuid NOT NULL,
	blockchain_address varchar NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__wallets PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.wallets.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.wallets.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.wallets.blockchain_address IS E'The network blockchain address.';
-- ddl-end --
COMMENT ON COLUMN public.wallets.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.wallets.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.wallets.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.wallets OWNER TO admin_reopen;
-- ddl-end --

-- object: fk__users__wallets | type: CONSTRAINT --
-- ALTER TABLE public.wallets DROP CONSTRAINT IF EXISTS fk__users__wallets CASCADE;
ALTER TABLE public.wallets ADD CONSTRAINT fk__users__wallets FOREIGN KEY (user_id)
REFERENCES public.users (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: fk__networks__wallets | type: CONSTRAINT --
-- ALTER TABLE public.wallets DROP CONSTRAINT IF EXISTS fk__networks__wallets CASCADE;
ALTER TABLE public.wallets ADD CONSTRAINT fk__networks__wallets FOREIGN KEY (network_id)
REFERENCES public.networks (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: fk__users__git_users | type: CONSTRAINT --
-- ALTER TABLE public.git_users DROP CONSTRAINT IF EXISTS fk__users__git_users CASCADE;
ALTER TABLE public.git_users ADD CONSTRAINT fk__users__git_users FOREIGN KEY (user_id)
REFERENCES public.users (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: fk__git_users__season_organization_admins | type: CONSTRAINT --
-- ALTER TABLE public.season_organization_admins DROP CONSTRAINT IF EXISTS fk__git_users__season_organization_admins CASCADE;
ALTER TABLE public.season_organization_admins ADD CONSTRAINT fk__git_users__season_organization_admins FOREIGN KEY (git_user_id)
REFERENCES public.git_users (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: idx__uq__season_organization_admins | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__season_organization_admins CASCADE;
CREATE UNIQUE INDEX idx__uq__season_organization_admins ON public.season_organization_admins
	USING btree
	(
	  season_id,
	  organization_id,
	  git_user_id,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__season_organization_admins | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__season_organization_admins CASCADE;
CREATE UNIQUE INDEX idx__part__uq__season_organization_admins ON public.season_organization_admins
	USING btree
	(
	  season_id,
	  organization_id,
	  git_user_id
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: idx__season_organization_admins__organization_id | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__season_organization_admins__organization_id CASCADE;
CREATE INDEX idx__season_organization_admins__organization_id ON public.season_organization_admins
	USING btree
	(
	  organization_id,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__season_organization_admins__git_user_id | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__season_organization_admins__git_user_id CASCADE;
CREATE INDEX idx__season_organization_admins__git_user_id ON public.season_organization_admins
	USING btree
	(
	  git_user_id,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__uq__git_users__user_id | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__git_users__user_id CASCADE;
CREATE UNIQUE INDEX idx__uq__git_users__user_id ON public.git_users
	USING btree
	(
	  git_provider_id,
	  user_id,
	  deleted_date ASC NULLS FIRST
	)
	WHERE (user_id is not null);
-- ddl-end --

-- object: idx__part__uq__git_users__user_id | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__git_users__user_id CASCADE;
CREATE UNIQUE INDEX idx__part__uq__git_users__user_id ON public.git_users
	USING btree
	(
	  git_provider_id,
	  user_id,
	  deleted_date ASC NULLS FIRST
	)
	WHERE (user_id is not null and deleted_date is null);
-- ddl-end --

-- object: idx__uq__git_users__username | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__git_users__username CASCADE;
CREATE UNIQUE INDEX idx__uq__git_users__username ON public.git_users
	USING btree
	(
	  git_provider_id,
	  username,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__git_users__username | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__git_users__username CASCADE;
CREATE UNIQUE INDEX idx__part__uq__git_users__username ON public.git_users
	USING btree
	(
	  git_provider_id,
	  username
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: idx__uq__wallets | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__wallets CASCADE;
CREATE UNIQUE INDEX idx__uq__wallets ON public.wallets
	USING btree
	(
	  network_id,
	  blockchain_address,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__wallets | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__wallets CASCADE;
CREATE UNIQUE INDEX idx__part__uq__wallets ON public.wallets
	USING btree
	(
	  network_id,
	  blockchain_address
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: fk__wallets__campaigns | type: CONSTRAINT --
-- ALTER TABLE public.campaigns DROP CONSTRAINT IF EXISTS fk__wallets__campaigns CASCADE;
ALTER TABLE public.campaigns ADD CONSTRAINT fk__wallets__campaigns FOREIGN KEY (creator_wallet_id)
REFERENCES public.wallets (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --

-- object: idx__campaigns__creator_wallet_id | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__campaigns__creator_wallet_id CASCADE;
CREATE INDEX idx__campaigns__creator_wallet_id ON public.campaigns
	USING btree
	(
	  creator_wallet_id,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__campaigns__organization_id | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__campaigns__organization_id CASCADE;
CREATE INDEX idx__campaigns__organization_id ON public.campaigns
	USING btree
	(
	  organization_id,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__uq__git_providers | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__git_providers CASCADE;
CREATE UNIQUE INDEX idx__uq__git_providers ON public.git_providers
	USING btree
	(
	  name,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__git_providers | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__git_providers CASCADE;
CREATE UNIQUE INDEX idx__part__uq__git_providers ON public.git_providers
	USING btree
	(
	  name
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: public.season_statuses | type: TABLE --
-- DROP TABLE IF EXISTS public.season_statuses CASCADE;
CREATE TABLE public.season_statuses (
	id uuid NOT NULL,
	alternative_id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ,
	name varchar(50) NOT NULL,
	created_date timestamp with time zone NOT NULL,
	updated_date timestamp with time zone,
	deleted_date timestamp with time zone,
	CONSTRAINT pk__season_statuses PRIMARY KEY (id)

);
-- ddl-end --
COMMENT ON COLUMN public.season_statuses.id IS E'The unique identifier for the object.';
-- ddl-end --
COMMENT ON COLUMN public.season_statuses.alternative_id IS E'The auto generated sequential identifier.';
-- ddl-end --
COMMENT ON COLUMN public.season_statuses.created_date IS E'The date of create.';
-- ddl-end --
COMMENT ON COLUMN public.season_statuses.updated_date IS E'The date of last update.';
-- ddl-end --
COMMENT ON COLUMN public.season_statuses.deleted_date IS E'The date of delete. Used by the soft delete.';
-- ddl-end --
ALTER TABLE public.season_statuses OWNER TO admin_reopen;
-- ddl-end --

-- object: idx__uq__season_statuses | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__uq__season_statuses CASCADE;
CREATE UNIQUE INDEX idx__uq__season_statuses ON public.season_statuses
	USING btree
	(
	  name,
	  deleted_date ASC NULLS FIRST
	);
-- ddl-end --

-- object: idx__part__uq__season_statuses | type: INDEX --
-- DROP INDEX IF EXISTS public.idx__part__uq__season_statuses CASCADE;
CREATE UNIQUE INDEX idx__part__uq__season_statuses ON public.season_statuses
	USING btree
	(
	  name
	)
	WHERE (deleted_date is null);
-- ddl-end --

-- object: fk__season_statuses__seasons | type: CONSTRAINT --
-- ALTER TABLE public.seasons DROP CONSTRAINT IF EXISTS fk__season_statuses__seasons CASCADE;
ALTER TABLE public.seasons ADD CONSTRAINT fk__season_statuses__seasons FOREIGN KEY (season_status_id)
REFERENCES public.season_statuses (id) MATCH FULL
ON DELETE RESTRICT ON UPDATE RESTRICT DEFERRABLE INITIALLY IMMEDIATE;
-- ddl-end --


