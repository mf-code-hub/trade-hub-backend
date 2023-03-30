import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import { RUN_UPDATE_SEASON_AND_CAMPAIGN_STATUSES } from './constants'

export class updateCampaignAndSeasonStatuses1664030106195
  implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(RUN_UPDATE_SEASON_AND_CAMPAIGN_STATUSES)
    await queryRunner.query(sql)
  }

  public async down (_queryRunner: QueryRunner): Promise<void> {}
}
