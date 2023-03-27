export class Email {
  constructor(readonly value: string) {
    if (!this.isValid(value)) {
      throw new Error('Invalid email')
    }

    this.value = value
  }

  private isValid(email: string) {
    const pattern = /^(\w+)@(\w+(\.\w{2,3})+)$/
    return pattern.test(email)
  }
}
