import { InternalServerErrorException } from '@nestjs/common'

import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import { RUN_CREATE_SCHEMA, REVERT_CREATE_SCHEMA } from './constants'

export class CreateSchema1623892381203 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const createSchemaSql = FileHelper.read(RUN_CREATE_SCHEMA)
    await queryRunner.query(createSchemaSql)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    if (process.env.NODE_ENV === 'production') {
      throw new InternalServerErrorException(
        'Rollback available only in development.'
      )
    }
    const createSchemaSql = FileHelper.read(REVERT_CREATE_SCHEMA)
    await queryRunner.query(createSchemaSql)
  }
}
