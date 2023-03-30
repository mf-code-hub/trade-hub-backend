import { InternalServerErrorException } from '@nestjs/common'

import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import {
  RUN_ADD_SECURITY_TOKEN_COLUMN,
  REVERT_ADD_SECURITY_TOKEN_COLUMN
} from './constants'

export class usersAddColumnSecurityToken1653274281011
  implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const addSecurityTokenColumn = FileHelper.read(
      RUN_ADD_SECURITY_TOKEN_COLUMN
    )
    await queryRunner.query(addSecurityTokenColumn)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    if (process.env.NODE_ENV === 'production') {
      throw new InternalServerErrorException(
        'Rollback available only in development.'
      )
    }
    const revertSecurityTokenColumn = FileHelper.read(
      REVERT_ADD_SECURITY_TOKEN_COLUMN
    )
    await queryRunner.query(revertSecurityTokenColumn)
  }
}
