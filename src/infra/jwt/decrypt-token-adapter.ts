import jwt from 'jsonwebtoken'
import { UserEmailTokenInvalidException } from '~/core/domain/exceptions'

import { DecryptJwtToken } from '~/shared/infra/jwt/contracts'

export class DecryptJwtTokenAdapter implements DecryptJwtToken {
  private readonly SECRET_KEY: string

  constructor () {
    this.SECRET_KEY = process.env.JWT_SECRET!
  }

  async execute (
    input: DecryptJwtToken.InputDTO
  ): Promise<DecryptJwtToken.OutputDTO> {
    try {
      return jwt.verify(
        input.token,
        this.SECRET_KEY
      ) as DecryptJwtToken.OutputDTO
    } catch (error) {
      throw new UserEmailTokenInvalidException(error.message)
    }
  }
}
