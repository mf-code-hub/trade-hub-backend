export default class Product {
    readonly productName: string;
    readonly productCategory: string;
    readonly productSubcategory: string;
    readonly productImageUrl: string [];
    readonly productDescription: string;
    readonly productPrice: number;

    constructor(
        productName: string,
        productCategory: string,
        productSubcategory: string,
        productImageUrl: string[],
        productDescription: string,
        productPrice: number){
            this.productName = productName;
            this.productCategory = productCategory;
            this.productSubcategory = productSubcategory;
            this.productImageUrl = productImageUrl;
            this.productDescription = productDescription;
            this.productPrice = productPrice;
        }
}