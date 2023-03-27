import { createParamDecorator, ExecutionContext } from '@nestjs/common'

import { UnauthorizedException } from '~/shared/domain'

export const Cookies = createParamDecorator(
  (data: string, ctx: ExecutionContext) => {
    const request = ctx.switchToHttp().getRequest()
    if (!data || !request.cookies[data]) {
      throw new UnauthorizedException()
    }
    return request.unsignCookie(request.cookies[data]).value
  }
)
