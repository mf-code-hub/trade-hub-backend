import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm'
import { BaseMapping, UserMapping, SeasonOrganizationAdminMapping } from '~/shared/infra/database/typeorm/mapping'

@Entity('git_users', { schema: 'public' })
export class GitUserMapping extends BaseMapping {
  @Column({ name: 'git_id', type: 'character varying' })
  gitId: string

  @Column({ name: 'git_fullname', type: 'character varying', length: 300, nullable: true })
  name: string | null

  @Column({ name: 'user_id', type: 'uuid', nullable: true })
  userId: string | null

  @Column({ name: 'git_provider_id', type: 'uuid' })
  gitProviderId: string

  @Column({ name: 'git_login', type: 'character varying', length: 50 })
  username: string

  @Column({ name: 'token', nullable: true, type: 'character varying', length: 100 })
  token: string | null

  @Column({ name: 'email', type: 'character varying', nullable: true, length: 300 })
  email: string | null

  @JoinColumn([{ name: 'user_id', referencedColumnName: 'id' }])
  @ManyToOne(() => UserMapping, users => users.gitUsers, { cascade: ['insert', 'update'] })
  user: UserMapping

  @OneToMany(() => SeasonOrganizationAdminMapping, seasonOrganizationAdmins => seasonOrganizationAdmins.gitUser)
  seasonOrganizationAdmins: SeasonOrganizationAdminMapping[]
}
