import {
  InvalidPasswordException,
  PasswordMatchException
} from '~/core/domain/exceptions'

export class Password {
  value: string

  constructor(value: string) {
    if (!this.isValid(value)) {
      throw new InvalidPasswordException()
    }

    this.value = value
  }

  isEqual(otherPassword: string) {
    if (this.value !== otherPassword) throw new PasswordMatchException()
  }

  private isValid(password: string) {
    const capitals = /[A-Z]/
    const lowercase = /[a-z]/
    const numeric = /[0-9]/
    const specialCharacter = /\W/
    const space = /\s/

    return (
      capitals.test(password) &&
      lowercase.test(password) &&
      numeric.test(password) &&
      specialCharacter.test(password) &&
      !space.test(password) &&
      password.length >= 8 &&
      password.length <= 20
    )
  }
}
