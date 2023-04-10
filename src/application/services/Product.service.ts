import ProductContract from './contracts/Product.contract';

export default class ProductService {
  constructor(readonly productContract: ProductContract) {}

  async getProducts(): Promise<{ productName: string }[]> {
    const products = await this.productContract.getAllProducts();
    return products.map((product) => ({ productName: product.productName }));
  }
}

//   async getBoard(idBoard: number): Promise<BoardOutput> {
//     const board = await this.boardRepository.get(idBoard);
//     const output: BoardOutput = {
//       name: board.name,
//       estimative: 0,
//       columns: [],
//     };
//   }
// };

// type ColumnOutput = {
//     name: string;
//     estimative: number;
//     hasEstimative: boolean;
//     cards: {
//       title: string;
//       estimative: number;
//     }[];
//   };

//   type BoardOutput = {
//     name: string;
//     estimative: number;
//     columns: ColumnOutput[];
//   };
