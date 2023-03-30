import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers'
import {
  RUN_UPDATE_NFT_SCHEMA,
  REVERT_UPDATE_NFT_SCHEMA
} from '~/shared/infra/database/typeorm/migrations/constants'

export class updateNftSchema1667530152139 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(RUN_UPDATE_NFT_SCHEMA)
    await queryRunner.query(sql)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(REVERT_UPDATE_NFT_SCHEMA)
    await queryRunner.query(sql)
  }
}
