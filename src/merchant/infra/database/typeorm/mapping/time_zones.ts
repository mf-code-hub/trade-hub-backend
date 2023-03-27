import { Column, Entity, OneToMany } from 'typeorm'

import { BaseMapping, UserMapping } from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'time_zones', schema: 'public' })
export class TimeZoneMapping extends BaseMapping {
  @Column({ name: 'name', type: 'character varying', length: 100 })
  name: string

  @Column({ name: 'abbreviation', type: 'character varying', length: 20 })
  abbreviation: string

  @Column({ name: 'country_iso_code', length: 6, type: 'character varying' })
  countryISOCode: string

  @Column({ name: 'utc_offset', type: 'interval' })
  utcOffset: any

  @Column({ name: 'utc_dst_offset', type: 'interval' })
  utcDstOffset: any

  @Column({ name: 'is_default', type: 'boolean' })
  isDefault: boolean

  @Column({ name: 'is_active', type: 'boolean' })
  isActive: boolean

  @OneToMany(() => UserMapping, users => users.timeZone)
  users: UserMapping[]
}
