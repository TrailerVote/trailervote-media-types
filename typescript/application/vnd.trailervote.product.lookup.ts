type SingleLookup = {
  authority: string
  identifier: string
}

export interface ProductLookupV1 {
  product_identifiers: SingleLookup | [SingleLookup, ...SingleLookup[]]
}
