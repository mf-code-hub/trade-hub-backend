import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import { SEED_CAMPAIGN } from './constants'

export class seedCampaign1659733565742 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(SEED_CAMPAIGN)
    await queryRunner.query(sql)
  }

  public async down (_queryRunner: QueryRunner): Promise<void> {}
}
