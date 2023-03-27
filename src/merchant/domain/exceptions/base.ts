export abstract class AppException extends Error {
  constructor (
    readonly customMessage: string | string[],
    readonly status: number = 500,
    readonly statusCode: string = 'InternalServerErrorException',
    readonly details?: string | string[]
  ) {
    super()
  }
}
