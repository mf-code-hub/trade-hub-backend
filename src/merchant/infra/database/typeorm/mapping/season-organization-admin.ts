import { Column, Entity, JoinColumn, ManyToOne } from 'typeorm'
import { BaseMapping, GitUserMapping, OrgMapping, SeasonMapping } from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'season_organization_admins', schema: 'public' })
export class SeasonOrganizationAdminMapping extends BaseMapping {
  @Column({ name: 'season_id', type: 'uuid' })
  seasonId: string

  @Column({ name: 'organization_id', type: 'uuid' })
  orgId: string

  @Column({ name: 'is_organization_admin', type: 'bool' })
  isOrgAdmin: boolean

  @Column({ name: 'approval_request_email', type: 'character varying', nullable: true })
  requestEmail: string | null

  @Column({ name: 'approval_request_email_sent_date', type: 'timestamp with time zone', nullable: true })
  requestEmailSentAt: Date | null

  @Column({ name: 'approval_request_token', type: 'character varying', nullable: true })
  requestToken: string | null

  @Column({ name: 'is_approved', type: 'bool', nullable: true })
  isApproved: boolean | null

  @Column({ name: 'response_date', type: 'timestamp with time zone', nullable: true })
  responseAt: Date | null

  @Column('uuid', { name: 'git_user_id' })
  gitUserId: string

  @JoinColumn([{ name: 'season_id', referencedColumnName: 'id' }])
  @ManyToOne(() => SeasonMapping, season => season.seasonOrganizationAdmins, { cascade: ['insert', 'update'] })
  season: SeasonMapping

  @JoinColumn([{ name: 'organization_id', referencedColumnName: 'id' }])
  @ManyToOne(() => OrgMapping, org => org.seasonOrgAdmins, { cascade: ['insert', 'update'] })
  org: OrgMapping

  @JoinColumn([{ name: 'git_user_id', referencedColumnName: 'id' }])
  @ManyToOne(() => GitUserMapping, gitUser => gitUser.seasonOrganizationAdmins, { cascade: ['insert', 'update'] })
  gitUser: GitUserMapping
}
