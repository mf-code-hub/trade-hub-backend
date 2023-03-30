import { Column, Entity, OneToMany } from 'typeorm'

import {
  BaseMapping,
  WalletMapping
} from '~/shared/infra/database/typeorm/mapping'

@Entity('networks', { schema: 'public' })
export class NetworkMapping extends BaseMapping {
  @Column('character varying', {
    name: 'name',

    length: 50
  })
  name: string

  @Column('character varying', {
    name: 'rpc_url',

    length: 400
  })
  rpcUrl: string

  @Column('character varying', {
    name: 'blockchain_id',

    length: 100
  })
  blockchainId: string

  @Column('character varying', {
    name: 'token_symbol',

    length: 10
  })
  tokenSymbol: string

  @Column('boolean', {
    name: 'is_active'
     })
  isActive: boolean

  @Column('boolean', {
    name: 'is_default'
     })
  isDefault: boolean

  @OneToMany(() => WalletMapping, wallets => wallets.user)
  wallets: WalletMapping[]
}
