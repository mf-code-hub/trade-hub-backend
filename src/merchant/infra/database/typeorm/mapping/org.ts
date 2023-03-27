import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm'

import {
  BaseMapping,
  CampaignMapping,
  GitProviderMapping,
  SeasonOrganizationAdminMapping
} from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'organizations', schema: 'public' })
export class OrgMapping extends BaseMapping {
  @Column({ name: 'name', type: 'character varying' })
  name: string

  @Column({ name: 'git_organization_id', type: 'character varying' })
  gitOrganizationId: string

  @Column({ name: 'git_provider_id', type: 'uuid' })
  gitProviderId: string

  @OneToMany(() => CampaignMapping, campaigns => campaigns.org)
  campaigns: CampaignMapping[]

  @OneToMany(() => SeasonOrganizationAdminMapping, seasonOrgAdmins => seasonOrgAdmins.org)
  seasonOrgAdmins: SeasonOrganizationAdminMapping[]

  @JoinColumn([{ name: 'git_provider_id', referencedColumnName: 'id' }])
  @ManyToOne(() => GitProviderMapping, gitProvider => gitProvider.organizations, { cascade: ['insert', 'update'] })
  gitProvider: GitProviderMapping
}
