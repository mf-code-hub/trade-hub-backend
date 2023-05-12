import {
  Body,
  Controller,
  Get,
  HttpCode,
  HttpStatus,
  Post,
  Res,
  UploadedFile,
  UseInterceptors,
} from '@nestjs/common';
import { FileInterceptor, MulterModule } from '@nestjs/platform-express';
import e from 'express';
// import * as path from 'path';
import path from 'path';
import { MerchantService } from '../services/merchant.service';
import { Merchant } from '../model/merchant.model';
import { MerchantDTO } from '../dtos/merchant.dto';

@Controller('merchant')
export class MerchantController {
  constructor(private readonly merchantService: MerchantService) {}

  @Get('list')
  findAll() {
    return this.merchantService.getAll();
  }

  @Post('create')
  async create(@Body() merchant: MerchantDTO) {
    return await this.merchantService.createMerchant(merchant);
  }

  // @Get('list-by-id')
  // findById() {
  //   return this.merchantService.getById();
  // }

  // @Get('list-by-category')
  // findByCategory() {
  //   return this.merchantService.getByCategory();
  // }

  // @Get('list-suvs')
  // findByCategorySUV() {
  //   return this.merchantService.getByCategorySUV();
  // }

  //   @Post('car-register')
  //   @UseInterceptors(FileInterceptor('file'))
  //   @UseInterceptors(
  //     FileInterceptor('carImage', {
  //       storage: diskStorage({
  //         destination: './src/api/car-imgs',
  //         filename: (req, file, callBack) => {
  //           const fileName =
  //             path.parse(file.originalname).name.replace(/\s/g, '') + Date.now();
  //           const extension = path.parse(file.originalname).ext;
  //           callBack(null, `${fileName}${extension}`);
  //         },
  //       }),
  //     }),
  //   )
  //   @HttpCode(HttpStatus.CREATED)
  //   register(
  //     @Body() car: Car,
  //     @Res() res,
  //     @UploadedFile() carImg: Express.Multer.File,
  //   ) {
  //     const fileUploadSuccess = res.status(HttpStatus.OK).json({
  //       success: true,
  //       data: carImg.path,
  //     });
  //     const carRegistrationSuccess = this.carRegistrationService.registerCar(car);
  //     return { fileUploadSuccess, carRegistrationSuccess };
  //   }
  // }

  // @Post('upload-img')
  // @UseInterceptors(
  //   FileInterceptor('image', {
  //     storage: diskStorage({
  //       destination: './src/api/carImgs',
  //       filename: (req, file, callBack) => {
  //         const fileName =
  //           path.parse(file.originalname).name.replace(/\s/g, '') + Date.now();
  //         const extension = path.parse(file.originalname).ext;
  //         callBack(null, `${fileName}${extension}`);
  //       },
  //     }),
  //   }),
  // )
  // uploadImg(@Res() res, @UploadedFile() file) {
  //   return res.status(HttpStatus.OK).json({
  //     success: true,
  //     data: file.path,
  //   });
  // }

  // @Post('car-register')
  // @UseInterceptors(
  //   FileInterceptor('file', {
  //     storage: diskStorage({
  //       destination: './src/api/carImgs',
  //       filename(
  //         req: e.Request,
  //         file: Express.Multer.File,
  //         callBack: (error: Error | null, filename: string) => void,
  //       ) {
  //         const name = file.originalname.split('.')[0];
  //         const fileExtension = file.originalname.split('.')[1];
  //         const newFileName =
  //           name.split('.').join('_') + '_' + Date.now() + '_' + fileExtension;

  //         callBack(null, newFileName);
  //       },
  //     }),
  //   }),
  // )
  // async register(@Body() car: Car, @UploadedFile() file: Express.Multer.File) {
  //   console.log(file);
  //   return await this.carRegistrationService.registerCar(car);
  // }
}
