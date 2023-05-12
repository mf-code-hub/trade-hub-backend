// import * as mongoose from 'mongoose';
// import { ClientSession, Document, Model } from 'mongoose';
// // import {
// //   MongooseQueryEntity,
// //   PaginatedObj,
// // } from 'src/helper/mongoosequery.entity';
// // // import MongooseHelper from '../helper/mongoose.helper';
// // // import { DaoCreateUpdateError } from './createUpdateError.exception';

// export class BaseDao<T extends Document, K extends { _id?: string }> {
//   protected model: Model<T>;

//   protected constructor(model: Model<T>) {
//     this.model = model;
//   }

//   async findDirectMongo(
//     paramQuery: any,
//     paramProjection?: any | null,
//     paramOptions?: mongoose.QueryOptions | null,
//   ): Promise<T[]> {
//     return this.model.find(paramQuery, paramProjection, paramOptions);
//   }
// }
