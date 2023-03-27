import { FastifyRequest } from 'fastify'

export const createLog = (
  req: FastifyRequest,
  statusCode: number,
  responseTime: number
) => ({
  time: new Date().toISOString(),
  ip: req.headers['x-forwarded-for'],
  agent: req.headers['user-agent'],
  method: req.method,
  url: req.url,
  responseStatus: statusCode,
  responseTime
})
