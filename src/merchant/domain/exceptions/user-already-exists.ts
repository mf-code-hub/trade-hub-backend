import { AppException } from '~/shared/domain/exceptions/base'

export class UserAlreadyExistsException extends AppException {
  constructor() {
    super('User already exists.', 409, 'UserException')
  }
}

export class UserNameAlreadyExistsException extends AppException {
  constructor() {
    super('User name already exists.', 409, 'UserException')
  }
}
