import { MigrationInterface, QueryRunner } from 'typeorm'

import { FileHelper } from '~/shared/helpers/handle-file.helper'

import { SEED_GIT_PROVIDERS } from './constants'

export class seedGitProviders1654690018473 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const createSchemaSeedGitProviders = FileHelper.read(SEED_GIT_PROVIDERS)
    await queryRunner.query(createSchemaSeedGitProviders)
  }

  public async down (queryRunner: QueryRunner): Promise<void> {
    await queryRunner.query('')
  }
}
