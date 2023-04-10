export default class Merchant {
  readonly name: string;
  readonly logo: any; 
  readonly category: string;
  readonly subcategory: string;
  readonly description: string;
  readonly isAvailable: boolean;
  readonly availabilityPeriod: string[];
  
    constructor(
    name: string,
    logo: string,
    category: string,
    subcategory: string,
    description: string,
    isAvailable: boolean,
    availabilityPeriod: string[]
    
    ){
    this.name = name;
    this.logo = logo;
    this.category = category;
    this.subcategory = subcategory;
    this.description = description;
    this.isAvailable = isAvailable;
    this.availabilityPeriod = availabilityPeriod;

  }
}