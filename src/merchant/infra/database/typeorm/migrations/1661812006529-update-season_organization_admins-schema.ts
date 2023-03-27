import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import {
  RUN_UPDATE_SEASON_ORGANIZATION_ADMINS,
  REVERT_UPDATE_SEASON_ORGANIZATION_ADMINS
} from './constants'
export class updateSeasonOrganizationAdminsSchema1661812006529
  implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(RUN_UPDATE_SEASON_ORGANIZATION_ADMINS)
    await queryRunner.query(sql)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(REVERT_UPDATE_SEASON_ORGANIZATION_ADMINS)
    await queryRunner.query(sql)
  }
}
