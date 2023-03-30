import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers'
import {
  RUN_ADD_CAMPAIGN_BANNER_UPLOADED_DATE,
  REVERT_ADD_CAMPAIGN_BANNER_UPLOADED_DATE
} from '~/shared/infra/database/typeorm/migrations/constants'

export class addCampaignBannerUploadedDate1670970918727
  implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(RUN_ADD_CAMPAIGN_BANNER_UPLOADED_DATE)
    await queryRunner.query(sql)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(REVERT_ADD_CAMPAIGN_BANNER_UPLOADED_DATE)
    await queryRunner.query(sql)
  }
}
