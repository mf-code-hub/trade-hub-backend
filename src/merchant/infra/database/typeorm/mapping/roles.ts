import { Column, Entity, ManyToMany } from 'typeorm'

import { BaseMapping, UserMapping } from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'roles', schema: 'public' })
export class RoleMapping extends BaseMapping {
  @Column({ name: 'name', type: 'character varying', length: 150 })
  name: string

  @ManyToMany(() => UserMapping, user => user.roles)
  users: UserMapping[]
}
