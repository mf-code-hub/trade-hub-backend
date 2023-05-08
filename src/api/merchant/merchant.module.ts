import { MongooseModule } from '@nestjs/mongoose';
import { Module } from '@nestjs/common';
import { MerchantController } from './controllers/merchant.controller';
import { MerchantService } from './services/merchant.service';
import { MerchantSchema } from './model/merchant.model';

@Module({
  imports: [
    MongooseModule.forFeature([
        { name: 'Merchant', schema: MerchantSchema }
    ]),
  ],
  controllers: [MerchantController],
  providers:[MerchantService],
})
export class MerchantModule {}
