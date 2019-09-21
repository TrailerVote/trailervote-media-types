export interface ErrorsV1 {
  errors: [SingleErrorV1, ...SingleErrorV1[]]
}

export interface SingleErrorV1 {
  message: string,
  code: string | null
}
