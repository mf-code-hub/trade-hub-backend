import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import {
  RUN_UPDATE_CAMPAIGN_FLOW,
  REVERT_UPDATE_CAMPAIGN_FLOW
} from './constants'

export class updateCampaignFlow1659555365988 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(RUN_UPDATE_CAMPAIGN_FLOW)
    await queryRunner.query(sql)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    const sql = FileHelper.read(REVERT_UPDATE_CAMPAIGN_FLOW)
    await queryRunner.query(sql)
  }
}
