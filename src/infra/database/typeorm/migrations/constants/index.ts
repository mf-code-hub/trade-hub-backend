const SCRIPTS_FOLDER = `${__dirname}/../scripts`

// STRUCTURE
export const RUN_CREATE_SCHEMA = `${SCRIPTS_FOLDER}/1623892381203-create-schema.up.sql`
export const REVERT_CREATE_SCHEMA = `${SCRIPTS_FOLDER}/1623892381203-create-schema.down.sql`

// SEED_DATA
export const SEED_SCHEMA = `${SCRIPTS_FOLDER}/1650980135455-seed-schema.sql`

// ADD SECURITY_TOKEN COLUMN IN USER TABLE
export const RUN_ADD_SECURITY_TOKEN_COLUMN = `${SCRIPTS_FOLDER}/1653274281011-users-add-column-security_token.up.sql`
export const REVERT_ADD_SECURITY_TOKEN_COLUMN = `${SCRIPTS_FOLDER}/1653274281011-users-add-column-security_token.down.sql`

// ADD EMAIL_UNCONFIRMED COLUMN IN USER TABLE
export const RUN_ADD_EMAIL_UNCONFIRMED_COLUMN = `${SCRIPTS_FOLDER}/1653873467396-users-add-column-email_unconfirmed.up.sql`
export const REVERT_ADD_EMAIL_UNCONFIRMED_COLUMN = `${SCRIPTS_FOLDER}/1653873467396-users-add-column-email_unconfirmed.down.sql`

// SEED_GIT_PROVIDERS
export const SEED_GIT_PROVIDERS = `${SCRIPTS_FOLDER}/1654690018473-seed-git-providers.sql`

export const RUN_UPDATE_CAMPAIGN_FLOW = `${SCRIPTS_FOLDER}/1659555365988-update-campaign-flow.up.sql`
export const REVERT_UPDATE_CAMPAIGN_FLOW = `${SCRIPTS_FOLDER}/1659555365988-update-campaign-flow.down.sql`

export const SEED_CAMPAIGN = `${SCRIPTS_FOLDER}/1659733565742-seed-campaign.sql`

export const RUN_UPDATE_SCHEMA = `${SCRIPTS_FOLDER}/1661264531519-update-schema.up.sql`
export const REVERT_UPDATE_SCHEMA = `${SCRIPTS_FOLDER}/1661264531519-update-schema.down.sql`

export const RUN_UPDATE_SEASON_ORGANIZATION_ADMINS = `${SCRIPTS_FOLDER}/1661812006529-update-season_organization_admins-schema.up.sql`
export const REVERT_UPDATE_SEASON_ORGANIZATION_ADMINS = `${SCRIPTS_FOLDER}/1661812006529-update-season_organization_admins-schema.down.sql`

export const RUN_UPDATE_SEASON_AND_CAMPAIGN_STATUSES = `${SCRIPTS_FOLDER}/1664030106195-update-campaign-and-season-statuses.up.sql`

export const RUN_UPDATE_SEASON_SCHEMA = `${SCRIPTS_FOLDER}/1666620793483-update-season-schema.up.sql`
export const REVERT_UPDATE_SEASON_SCHEMA = `${SCRIPTS_FOLDER}/1666620793483-update-season-schema.down.sql`

export const RUN_UPDATE_NFT_SCHEMA = `${SCRIPTS_FOLDER}/1667530152139-update-nft-schema.up.sql`
export const REVERT_UPDATE_NFT_SCHEMA = `${SCRIPTS_FOLDER}/1667530152139-update-nft-schema.down.sql`

export const RUN_UPDATE_SCHEMA_V2 = `${SCRIPTS_FOLDER}/1669833811696-update-schema-v2.up.sql`
export const REVERT_UPDATE_SCHEMA_V2 = `${SCRIPTS_FOLDER}/1669833811696-update-schema-v2.down.sql`

export const RUN_ADD_CAMPAIGN_BANNER_UPLOADED_DATE = `${SCRIPTS_FOLDER}/1670970918727-add-campaign-banner-uploaded-date.up.sql`
export const REVERT_ADD_CAMPAIGN_BANNER_UPLOADED_DATE = `${SCRIPTS_FOLDER}/1670970918727-add-campaign-banner-uploaded-date.down.sql`
