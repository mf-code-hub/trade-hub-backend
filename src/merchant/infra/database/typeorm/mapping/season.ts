import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm'

import { BaseMapping, CampaignMapping, NFTMapping, SeasonStatusesMapping, SeasonOrganizationAdminMapping } from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'seasons', schema: 'public' })
export class SeasonMapping extends BaseMapping {
  @Column({ name: 'campaign_id', type: 'uuid' })
  campaignId: string

  @Column({ name: 'season_status_id', type: 'uuid' })
  seasonStatusId: string

  @Column({ name: 'contributor_share_percentage', type: 'numeric', scale: 2 })
  contibutorSharePercentage: string

  @Column({ name: 'token_qty', type: 'smallint' })
  tokenAmount: number

  @Column({ name: 'mandate_ordering', type: 'smallint' })
  mandateOrdering: number

  @Column({ name: 'mandate_year', type: 'smallint' })
  mandateYear: number

  @Column({ name: 'reserved_price', type: 'numeric' })
  reservedPrice: number

  @Column({ name: 'logo_uploaded_date', type: 'timestamp with time zone' })
  logoImageUploadedDate: Date

  @JoinColumn([{ name: 'campaign_id', referencedColumnName: 'id' }])
  @ManyToOne(() => CampaignMapping, campaign => campaign.seasons, { cascade: ['insert', 'update'] })
  campaign: CampaignMapping

  @JoinColumn([{ name: 'season_status_id', referencedColumnName: 'id' }])
  @ManyToOne(() => SeasonStatusesMapping, seasonStatus => seasonStatus.seasons, { cascade: ['insert', 'update'] })
  status: SeasonStatusesMapping

  @OneToMany(() => NFTMapping, nfts => nfts.season, { cascade: ['insert', 'update'] })
  nfts: NFTMapping[]

  @OneToMany(() => SeasonOrganizationAdminMapping, seasonOrganizationAdmins => seasonOrganizationAdmins.season, { cascade: ['insert', 'update'] })
  seasonOrganizationAdmins: SeasonOrganizationAdminMapping[]
}
