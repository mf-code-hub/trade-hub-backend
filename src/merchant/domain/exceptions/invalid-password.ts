import { AppException } from '~/shared/domain/exceptions/base'

export class InvalidPasswordException extends AppException {
  constructor() {
    super('Invalid password.', 409, 'InvalidPasswordException')
  }
}
