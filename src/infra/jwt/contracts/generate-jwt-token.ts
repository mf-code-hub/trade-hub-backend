export interface GenerateJwtToken {
  execute: (input: GenerateJwtToken.InputDTO) => Promise<GenerateJwtToken.OutputDTO>
}

export namespace GenerateJwtToken {
  export type InputDTO = object

  export type OutputDTO = {
    token: string
  }
}
