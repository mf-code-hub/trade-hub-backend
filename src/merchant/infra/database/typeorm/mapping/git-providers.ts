import { Column, Entity, OneToMany } from 'typeorm'

import {
  BaseMapping,
  CampaignMapping,
  OrgMapping
} from '~/shared/infra/database/typeorm/mapping'

@Entity('git_providers', { schema: 'public' })
export class GitProviderMapping extends BaseMapping {
  @Column({ name: 'name', type: 'character varying', length: 100 })
  name: string

  @Column({ name: 'is_active', type: 'boolean' })
  isActive: boolean

  @OneToMany(() => CampaignMapping, campaigns => campaigns.gitProvider)
  campaigns: CampaignMapping[]

  @OneToMany(() => OrgMapping, orgs => orgs.gitProvider)
  organizations: OrgMapping[]
}
