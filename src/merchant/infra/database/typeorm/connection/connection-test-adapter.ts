import { Connection, createConnection } from 'typeorm'

import { DatabaseConnection } from '~/shared/infra/database/contracts/database-connection'

export class DBTypeORMTestConnectionAdapter implements DatabaseConnection {
  private connection: Connection

  async connect (): Promise<void> {
    this.connection = await createConnection({
      type: 'postgres',
      host: process.env.DB_HOST_TEST,
      username: process.env.DB_USER_TEST,
      password: process.env.DB_PASS_TEST,
      database: process.env.DB_NAME_TEST,
      logging: false,
      migrationsRun: true,
      dropSchema: true,
      entities: [`${__dirname}/../mapping/*.{js,ts}`],
      migrations: [`${__dirname}/../migrations/*.ts`]
    })
  }

  async close (): Promise<void> {
    await this.connection.close()
  }
}
