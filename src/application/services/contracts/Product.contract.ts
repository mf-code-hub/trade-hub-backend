import Product from 'src/domain/entities/Product';

export default interface ProductContract {
  getAllProducts(): Promise<Product[]>;
  getProduct(idProduct): Promise<Product[]>;
}
