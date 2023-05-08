// import { MongooseModule } from '@nestjs/mongoose';
// import { isLocal } from '../environment/env.initialization';
// import mongoConfig from './mongo.config';
//
// export function initMongo() {
//   return MongooseModule.forRootAsync({
//     useFactory: async () => {
//       const uri = getMongoUri(mongoConfig);
//       return { uri, autoIndex: false };
//     },
//   });
// }
//
// export function getMongoUri(mongoConfig) {
//   const username = mongoConfig.MONGO_USER_NAME;
//   const password = mongoConfig.MONGO_PASSWORD;
//   const port = mongoConfig.MONGO_PORT || 27017;
//   const dbname = mongoConfig.MONGO_DB_NAME || 'portaleng';
//   const replicaSetName = mongoConfig.MONGO_REPLICA_NAME;
//
//   const hosts = [
//     {
//       host: mongoConfig.MONGO_HOST,
//       port: mongoConfig.MONGO_PORT,
//     },
//     {
//       host: mongoConfig.MONGO_HOST1,
//       port: mongoConfig.MONGO_PORT1,
//     },
//
//     {
//       host: mongoConfig.MONGO_HOST2,
//       port: mongoConfig.MONGO_PORT2,
//     },
//   ]
//     .filter(({ host, port }) => host && port)
//     .map(({ host, port }) => `${host}:${port}`)
//     .join(',');
//
//   const uri = isLocal()
//     ? getLocalUri({ dbname, port })
//     : getDefaultUri({ username, password, hosts, dbname, replicaSetName });
//
//   return uri;
// }
//
// function getLocalUri({ dbname, port }) {
//   return `mongodb://localhost:${port}/${dbname}`;
// }
//
// function getDefaultUri({ username, password, hosts, dbname, replicaSetName }) {
//   return `mongodb://${username}:${password}@${hosts}/${dbname}?authSource=admin${
//     replicaSetName ? `&replicaSet=${replicaSetName}` : ''
//   }`;
// }
