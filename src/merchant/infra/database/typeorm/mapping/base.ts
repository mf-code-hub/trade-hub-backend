import {
  CreateDateColumn,
  DeleteDateColumn,
  PrimaryColumn,
  UpdateDateColumn
} from 'typeorm'

export class BaseMapping {
  @PrimaryColumn({ name: 'id', type: 'uuid', primary: true })
  id: string

  @CreateDateColumn({ name: 'created_date', type: 'timestamp with time zone' })
  createdAt: Date

  @UpdateDateColumn({ name: 'updated_date', type: 'timestamp with time zone' })
  updatedAt: Date

  @DeleteDateColumn({ name: 'deleted_date', type: 'timestamp with time zone', nullable: true })
  deletedAt?: Date
}
