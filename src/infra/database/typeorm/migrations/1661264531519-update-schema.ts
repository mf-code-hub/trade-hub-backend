import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import { RUN_UPDATE_SCHEMA, REVERT_UPDATE_SCHEMA } from './constants'

export class updateSchema1661264531519 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(RUN_UPDATE_SCHEMA)
    await queryRunner.query(sql)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(REVERT_UPDATE_SCHEMA)
    await queryRunner.query(sql)
  }
}
