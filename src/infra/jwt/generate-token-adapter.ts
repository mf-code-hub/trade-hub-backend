// import jwt from 'jsonwebtoken'
// import { UserEmailTokenInvalidException } from '~/core/domain/exceptions'

// import { GenerateJwtToken } from '~/shared/infra/jwt/contracts'

// export class GenerateJwtTokenAdapter implements GenerateJwtToken {
//   private readonly SECRET_KEY: string
//   private readonly expiresIn?: string

//   constructor (expiresIn?: string) {
//     this.SECRET_KEY = process.env.JWT_SECRET!
//     this.expiresIn = expiresIn
//   }

//   async execute (
//     input: GenerateJwtToken.InputDTO
//   ): Promise<GenerateJwtToken.OutputDTO> {
//     try {
//       let token: string
//       if (this?.expiresIn) {
//         token = jwt.sign(input, this.SECRET_KEY, { expiresIn: this.expiresIn })
//       } else {
//         token = jwt.sign(input, this.SECRET_KEY)
//       }
//       return { token }
//     } catch (error) {
//       throw new UserEmailTokenInvalidException(error.message)
//     }
//   }
// }
