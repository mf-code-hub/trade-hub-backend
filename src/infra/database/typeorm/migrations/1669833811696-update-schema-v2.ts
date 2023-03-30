import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers'
import {
  RUN_UPDATE_SCHEMA_V2,
  REVERT_UPDATE_SCHEMA_V2
} from '~/shared/infra/database/typeorm/migrations/constants'

export class updateSchemaV21669833811696 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(RUN_UPDATE_SCHEMA_V2)
    await queryRunner.query(sql)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(REVERT_UPDATE_SCHEMA_V2)
    await queryRunner.query(sql)
  }
}
