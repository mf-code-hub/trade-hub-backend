import {
  Column,
  Entity,
  JoinColumn,
  ManyToMany,
  ManyToOne,
  OneToMany
} from 'typeorm'

import {
  BaseMapping,
  WalletMapping,
  TimeZoneMapping,
  GitUserMapping,
  RoleMapping
} from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'users', schema: 'public' })
export class UserMapping extends BaseMapping {
  @Column({ name: 'time_zone_id', type: 'uuid' })
  timeZoneId: string

  @Column({ name: 'username', type: 'character varying', nullable: true, length: 32 })
  username: string | null

  @Column({ name: 'bio', type: 'character varying', nullable: true, length: 1500 })
  bio: string | null

  @Column({ name: 'email', type: 'character varying', nullable: true, length: 300 })
  email: string | null

  @Column({ name: 'email_unconfirmed', type: 'character varying', nullable: true, length: 300 })
  emailUnconfirmed: string | null

  @Column({ name: 'email_confirmed_date', type: 'timestamp with time zone', nullable: true })
  emailConfirmedAt: Date | null

  @Column({ name: 'security_token', type: 'character varying', nullable: true })
  securityStamp: string | null

  @Column({ name: 'admin_blocked_date', type: 'timestamp with time zone', nullable: true })
  adminBlockedDate: Date | null

  @Column({ name: 'avatar_image_uploaded_date', type: 'timestamp with time zone', nullable: true })
  avatarImageUploadedAt: Date | null

  @Column({ name: 'banner_image_uploaded_date', type: 'timestamp with time zone', nullable: true })
  bannerImageUploadedAt: Date | null

  @Column({ name: 'twitter_username', type: 'character varying', nullable: true, length: 15 })
  twitterUsername: string | null

  @Column({ name: 'instagram_username', type: 'character varying', nullable: true, length: 30 })
  instagramUsername: string | null

  @Column({ name: 'linkedin_username', type: 'character varying', nullable: true, length: 12 })
  linkedinUsername: string | null

  @Column({ name: 'website_url', type: 'character varying', nullable: true, length: 400 })
  websiteUrl: string | null

  @ManyToMany(() => RoleMapping, role => role.users, { cascade: ['insert', 'update'] })
  roles: RoleMapping[]

  @JoinColumn([{ name: 'time_zone_id', referencedColumnName: 'id' }])
  @ManyToOne(() => TimeZoneMapping, timeZones => timeZones.users)
  timeZone: TimeZoneMapping

  @OneToMany(() => WalletMapping, wallets => wallets.user, { cascade: ['insert', 'update'] })
  wallets: WalletMapping[]

  @OneToMany(() => GitUserMapping, gitUsers => gitUsers.user, { cascade: ['insert', 'update'] })
  gitUsers: GitUserMapping[]
}
