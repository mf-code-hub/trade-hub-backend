import { InternalServerErrorException } from '@nestjs/common'

import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import {
  RUN_ADD_EMAIL_UNCONFIRMED_COLUMN,
  REVERT_ADD_EMAIL_UNCONFIRMED_COLUMN
} from './constants'

export class usersAddColumnUnconfirmedEmail1653873467396
  implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const addUnconfirmedEmailColumn = FileHelper.read(
      RUN_ADD_EMAIL_UNCONFIRMED_COLUMN
    )
    await queryRunner.query(addUnconfirmedEmailColumn)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    if (process.env.NODE_ENV === 'production') {
      throw new InternalServerErrorException(
        'Rollback available only in development.'
      )
    }
    const revertUnconfirmedEmailColumn = FileHelper.read(
      REVERT_ADD_EMAIL_UNCONFIRMED_COLUMN
    )
    await queryRunner.query(revertUnconfirmedEmailColumn)
  }
}
