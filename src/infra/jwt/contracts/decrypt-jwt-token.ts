export interface DecryptJwtToken {
  execute: (input: DecryptJwtToken.InputDTO) => Promise<DecryptJwtToken.OutputDTO>
}

export namespace DecryptJwtToken {
  export type InputDTO = {
    token: string
  }

  export type OutputDTO = {
    payload: {
      sub: string
    }
  }
}
