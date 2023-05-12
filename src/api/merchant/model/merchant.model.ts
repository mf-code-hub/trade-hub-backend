import * as mongoose from 'mongoose';

export const MerchantSchema = new mongoose.Schema({
  name: { type: String, required: true },
  // category: { type: String, required: true },
  // subcategory: { type: String, required: true },
  // description: { type: String, required: true },
  // inAvailable: { type: Boolean, required: true },
  // availabilityPeriod: { type: String, required: true },
});

export interface Merchant {
  name: string;
  // logo: string;
  // category: string;
  // subcategory: string;
  // description: string;
  // isAvailable: boolean;
  // availabilityPeriod: string[];
}
