import { Column, Entity, JoinColumn, ManyToOne, OneToMany } from 'typeorm'
import { BaseMapping, CampaignMapping, NetworkMapping, UserMapping } from '~/shared/infra/database/typeorm/mapping'

@Entity({ name: 'wallets', schema: 'public' })
export class WalletMapping extends BaseMapping {
  @Column({ name: 'network_id', type: 'uuid' })
  networkId: string

  @Column({ name: 'user_id', type: 'uuid' })
  userId: string

  @Column({ name: 'blockchain_address', type: 'character varying' })
  address: string

  @JoinColumn([{ name: 'user_id', referencedColumnName: 'id' }])
  @ManyToOne(() => UserMapping, users => users.wallets, { cascade: ['insert', 'update'] })
  user: UserMapping

  @JoinColumn([{ name: 'network_id', referencedColumnName: 'id' }])
  @ManyToOne(() => NetworkMapping, networks => networks.wallets, { cascade: ['insert', 'update'] })
  network: NetworkMapping

  @OneToMany(() => CampaignMapping, campaigns => campaigns.wallet)
  campaigns: CampaignMapping[]
}
