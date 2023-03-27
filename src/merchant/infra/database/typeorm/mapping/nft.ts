import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm'

import {
  BaseMapping,
  CampaignMapping,
  SeasonMapping
} from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'nfts', schema: 'public' })
export class NFTMapping extends BaseMapping {
  @Column({ name: 'token_id', type: 'smallint' })
  currentToken: number

  @Column({ name: 'processed_date', type: 'timestamp with time zone', nullable: true })
  processedAt: Date | null

  @Column({ name: 'reward_weight', type: 'smallint' })
  weight: number

  @Column({ name: 'campaign_id', type: 'uuid' })
  campaignId: string

  @Column({ name: 'season_id', type: 'uuid' })
  seasonId: string

  @Column({ name: 'bid_id', type: 'uuid', nullable: true })
  bidId: string | null

  @Column({ name: 'metadata', type: 'jsonb', nullable: true })
  metadata: string | null

  @Column({ name: 'ipfs_metadata_hash', type: 'varchar', nullable: true })
  ipfsMetadataHash: string | null

  @Column({ name: 'ipfs_image_hash', type: 'varchar', nullable: true })
  ipfsImageHash: string | null

  @JoinColumn([{ name: 'season_id', referencedColumnName: 'id' }])
  @ManyToOne(() => SeasonMapping, season => season.nfts, { cascade: ['insert', 'update'] })
  season: SeasonMapping

  @JoinColumn([{ name: 'campaign_id', referencedColumnName: 'id' }])
  @ManyToOne(() => CampaignMapping, campaign => campaign.nfts, { cascade: ['insert', 'update'] })
  campaign: CampaignMapping
}
