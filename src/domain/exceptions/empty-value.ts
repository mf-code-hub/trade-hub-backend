import { AppException } from '~/shared/domain/exceptions/base'

export class EmptyValueException extends AppException {
  constructor(field: string) {
    super(`The ${field} must not be empty`, 409, 'EmptyValueException')
  }
}
