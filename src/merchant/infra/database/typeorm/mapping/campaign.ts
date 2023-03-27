import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm'
import {
  BaseMapping,
  CampaignStatusesMapping,
  GitProviderMapping,
  NFTMapping,
  SeasonMapping,
  WalletMapping,
  OrgMapping
} from '~/shared/infra/database/typeorm/mapping'

@Entity('campaigns', { schema: 'public' })
export class CampaignMapping extends BaseMapping {
  @Column({ name: 'creator_wallet_id', type: 'uuid' })
  creatorWalletId: string

  @Column({ name: 'organization_id', type: 'uuid', nullable: true })
  organizationId: string | null

  @Column({ name: 'git_provider_id', type: 'uuid' })
  gitProviderId: string

  @Column({ name: 'campaign_status_id', type: 'uuid' })
  campaignStatusId: string

  @Column({ name: 'name', type: 'character varying' })
  name: string

  @Column({ name: 'description', type: 'character varying', nullable: true })
  description: string | null

  @Column({ name: 'logo_uploaded_date', type: 'timestamp with time zone' })
  logoUploadedAt: Date

  @Column({ name: 'banner_uploaded_date', type: 'timestamp with time zone', nullable: true })
  bannerUploadedAt: Date | null

  @Column({ name: 'repository_url', type: 'character varying' })
  repositoryUrl: string

  @Column({ name: 'repository_name', type: 'character varying' })
  repositoryName: string

  @Column({ name: 'repository_stars', type: 'integer' })
  repositoryStars: number

  @Column({ name: 'repository_contributors_qty', type: 'integer' })
  repositoryContributorsQty: number

  @Column({ name: 'repository_forks_qty', type: 'integer' })
  repositoryForksQty: number

  @Column({ name: 'git_repository_id', type: 'character varying' })
  gitRepositoryId: string

  @Column({ name: 'is_organization_owner', type: 'boolean' })
  isOrgAdmin: boolean

  @Column({ name: 'periodicity_id', type: 'uuid' })
  periodicityId: string

  @JoinColumn([{ name: 'creator_wallet_id', referencedColumnName: 'id' }])
  @ManyToOne(() => WalletMapping, wallet => wallet.campaigns, { cascade: ['insert', 'update'] })
  wallet: WalletMapping

  @ManyToOne(() => GitProviderMapping, gitProvider => gitProvider.campaigns, { cascade: ['insert', 'update'] })
  @JoinColumn([{ name: 'git_provider_id', referencedColumnName: 'id' }])
  gitProvider: GitProviderMapping

  @JoinColumn([{ name: 'organization_id', referencedColumnName: 'id' }])
  @ManyToOne(() => OrgMapping, org => org.campaigns, { cascade: ['insert', 'update'] })
  org: OrgMapping

  @OneToMany(() => SeasonMapping, seasons => seasons.campaign, { cascade: ['insert', 'update'] })
  seasons: SeasonMapping[]

  @OneToMany(() => NFTMapping, nfts => nfts.campaign, { cascade: true })
  nfts: NFTMapping[]

  @JoinColumn([{ name: 'campaign_status_id', referencedColumnName: 'id' }])
  @ManyToOne(() => CampaignStatusesMapping, campaignStatus => campaignStatus.campaigns, { cascade: true })
  status: CampaignStatusesMapping
}
