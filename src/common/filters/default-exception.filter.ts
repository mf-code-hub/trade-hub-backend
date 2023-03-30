import {
  ArgumentsHost,
  BadRequestException,
  Catch,
  ExceptionFilter,
  Logger
} from '@nestjs/common'

import * as Sentry from '@sentry/node'
import { performance } from 'perf_hooks'
import { createLog } from '~/shared/common/utils'

import { AppException } from '~/shared/domain/exceptions/base'
import { InternalServerErrorException } from '~/shared/domain/exceptions/internal-server-error'
import { ValidationError } from '~/shared/domain/exceptions/validation-error'

@Catch()
export class DefaultExceptionsFilter implements ExceptionFilter {
  private loggerService: Logger

  constructor() {
    this.loggerService = new Logger()
  }

  catch(exception, host: ArgumentsHost) {
    const start = performance.now()
    const ctx = host.switchToHttp()
    const response = ctx.getResponse()
    const request = ctx.getRequest()

    this.loggerService.error(
      JSON.stringify(
        createLog(request, exception.status, performance.now() - start)
      )
    )

    if (exception instanceof BadRequestException) {
      const validationException = new ValidationError()

      const { statusCode, statusText } = validationException

      const errors = exception.getResponse() as { message: string }

      response.status(statusCode).send({
        statusText,
        errors: errors.message,
        details: []
      })

      return
    }

    if (exception instanceof AppException) {
      const { statusText, statusCode, customMessage, details } = exception
      response.status(statusCode).send({
        statusText,
        errors:
          typeof customMessage === 'string' ? [customMessage] : customMessage,
        details: typeof details === 'string' ? [details] : details
      })
    }

    const { statusCode, statusText, customMessage } =
      new InternalServerErrorException()

    if (process.env.NODE_ENV === 'production')
      Sentry.captureException(exception)

    const errors = [exception?.message || customMessage]
    response.status(exception?.status || statusCode).send({
      statusText: exception?.name || statusText,
      errors
    })
  }
}
