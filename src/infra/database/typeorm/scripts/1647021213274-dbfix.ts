import { MigrationInterface, QueryRunner } from 'typeorm'

export class DBFix1647021213274 implements MigrationInterface {
  public async up (queryRunner: QueryRunner): Promise<void> {
    const tables = await queryRunner.query(
      'SELECT * FROM "information_schema"."tables" WHERE "table_schema" = \'public\''
    )
    for (const table of tables) {
      table.table_name !== 'migrations_scripts' &&
        (await queryRunner.query(
          `DROP TABLE IF EXISTS ${table.table_name} CASCADE`
        ))
      console.log(`DROP TABLE IF EXISTS ${table.table_name}`)
    }
  }

  public async down (_queryRunner: QueryRunner): Promise<void> {}
}
