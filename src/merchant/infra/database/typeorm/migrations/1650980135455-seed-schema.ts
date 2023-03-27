import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import { SEED_SCHEMA } from './constants'

export class seedSchema1650980135455 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const createSchemaSeedSampleSql = FileHelper.read(SEED_SCHEMA)
    await queryRunner.query(createSchemaSeedSampleSql)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query('')
  }
}
