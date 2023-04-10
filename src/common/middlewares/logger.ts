// import { Logger } from '@nestjs/common'

// import { FastifyRequest } from 'fastify'
// import { ServerResponse } from 'http'
// import { performance } from 'perf_hooks'

// import { createLog } from '../utils'

// export const logger = (
//   req: FastifyRequest,
//   res: ServerResponse,
//   next: () => void
// ) => {
//   const start = performance.now()
//   res.on('close', () => {
//     const { statusCode } = res
//     if (statusCode !== 500) {
//       Logger.log(
//         JSON.stringify(createLog(req, statusCode, performance.now() - start))
//       )
//     }
//   })
//   next()
// }
