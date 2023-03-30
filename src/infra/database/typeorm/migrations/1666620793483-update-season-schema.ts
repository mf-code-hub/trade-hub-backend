import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers'
import {
  REVERT_UPDATE_SEASON_SCHEMA,
  RUN_UPDATE_SEASON_SCHEMA
} from '~/shared/infra/database/typeorm/migrations/constants'

export class updateSeasonSchema1666620793483 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(RUN_UPDATE_SEASON_SCHEMA)
    await queryRunner.query(sql)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(REVERT_UPDATE_SEASON_SCHEMA)
    await queryRunner.query(sql)
  }
}
