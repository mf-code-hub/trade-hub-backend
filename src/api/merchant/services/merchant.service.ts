import { Injectable } from '@nestjs/common';
import { InjectModel } from '@nestjs/mongoose';
import { Model } from 'mongoose';
import { Merchant } from '../model/merchant.model';
import { MerchantDTO } from '../dtos/merchant.dto';

@Injectable()
export class MerchantService {
  constructor(
    @InjectModel('Merchant') private readonly merchantModel: Model<Merchant>,
  ) {}

  async getAll() {
    return await this.merchantModel.find().exec();
  }

  async createMerchant(merchant: MerchantDTO): Promise<Merchant> {
    console.log(merchant);
    const result = await new this.merchantModel(merchant).save();
    return result;
  }
}

//   async getById() {
//     return await this.merchantModel.find({ cardId: { $exists: true } }).exec();
//   }

//   async getByCategory() {
//     return await this.merchantModel.find({ category: 'SUV' }).exec();
//   }

//   async getByCategorySUV() {
//     return await this.merchantModel.find({ category: 'SUV' }).exec();
//   }

//   async registerCar(car: Car) {
//     const result = await new this.merchantModel(car).save();
//     return result;
//   }
// }
