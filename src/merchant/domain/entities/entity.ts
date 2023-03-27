export class Entity<T> {
  constructor(data: T) {
    Object.values(data).forEach((value, _key) => {
      if (!value) throw new Error(`Invalid params. `)
    })
  }
}
