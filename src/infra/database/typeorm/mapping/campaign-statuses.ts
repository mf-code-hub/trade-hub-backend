import { Column, Entity, OneToMany } from 'typeorm'
import { BaseMapping, CampaignMapping } from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'campaign_statuses', schema: 'public' })
export class CampaignStatusesMapping extends BaseMapping {
  @Column({ name: 'name', type: 'character varying' })
  name: string

  @OneToMany(() => CampaignMapping, campaigns => campaigns.status)
  campaigns: CampaignMapping[]
}
