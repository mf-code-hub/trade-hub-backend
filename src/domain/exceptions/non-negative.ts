import { AppException } from '~/shared/domain/exceptions/base'

export class NonNegativeNumberException extends AppException {
  constructor() {
    super(
      'The value inputted by the user cannot be negative.',
      409,
      'NonNegativeNumberException'
    )
  }
}
