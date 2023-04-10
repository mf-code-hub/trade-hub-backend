// import { ApiHideProperty } from '@nestjs/swagger'

// import {
//   ClassConstructor,
//   classToClass,
//   ClassTransformOptions,
//   Exclude,
//   plainToClass
// } from 'class-transformer'

// interface Options extends ClassTransformOptions {
//   locale: string
// }

// export class BaseDto {
//   static locale: string

//   id: string

//   @ApiHideProperty()
//   @Exclude()
//   alternativeid: number

//   createddate: Date

//   @ApiHideProperty()
//   @Exclude()
//   updateddate: Date

//   @ApiHideProperty()
//   @Exclude()
//   deleteddate: Date

//   public static factory<T, R>(
//     ResponseDto: ClassConstructor<T>,
//     plainResponseData: R,
//     options?: Options
//   ): T {
//     BaseDto.locale = options?.locale

//     const updatedResponseData = plainToClass<T, R>(
//       ResponseDto,
//       plainResponseData,
//       {
//         ignoreDecorators: true
//       }
//     )

//     return classToClass(updatedResponseData, {
//       ...options,
//       excludeExtraneousValues: true
//     })
//   }
// }
