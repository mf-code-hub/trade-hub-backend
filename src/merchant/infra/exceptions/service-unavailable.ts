import { AppException } from '~/shared/domain/exceptions/base'

export class ServiceUnavailableException extends AppException {
  constructor(params: AppException.InputDTO) {
    super(params.customMessage, params.statusCode, params.statusText)
  }
}
