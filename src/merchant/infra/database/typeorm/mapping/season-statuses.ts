import { Column, Entity, OneToMany } from 'typeorm'
import { BaseMapping, SeasonMapping } from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'season_statuses', schema: 'public' })
export class SeasonStatusesMapping extends BaseMapping {
  @Column({ name: 'name', type: 'character varying' })
  name: string

  @OneToMany(() => SeasonMapping, seasons => seasons.status)
  seasons: SeasonMapping[]
}
