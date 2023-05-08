const config = {
  staging: {
    MONGO_HOST: '10.101.32.219',
    MONGO_HOST1: '10.101.32.220',
    MONGO_HOST2: '10.101.32.221',
    MONGO_PORT: 27020,
    MONGO_PORT1: 27020,
    MONGO_PORT2: 27020,
    MONGO_REPLICA_NAME: 'penghx04_rs0',
    MONGO_DB_NAME: 'penghml',
    MONGO_USER_NAME: 'portengusr',
    MONGO_PASSWORD: 't3mpor4ri4%4019',
  },
  production: {
    MONGO_HOST: '10.101.0.230',
    MONGO_HOST1: '10.101.0.231',
    MONGO_HOST2: '10.101.0.232',
    MONGO_PORT: 27020,
    MONGO_PORT1: 27020,
    MONGO_PORT2: 27020,
    MONGO_REPLICA_NAME: 'pengpx04_rs0',
    MONGO_DB_NAME: 'pengprd',
    MONGO_USER_NAME: 'portenguswr',
    MONGO_PASSWORD: 't3mpor4ri4%4019',
  },
};

export default config[process.env.NODE_ENV] ?? {};
