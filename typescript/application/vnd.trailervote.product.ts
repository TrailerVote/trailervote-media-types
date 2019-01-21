import { ProductDataTypeV1 } from './types/product_data_type'

interface ProductIndexBase {
  products: {
    _index: [] | Array<{ href: string }>
  }
}

interface GenericDataV2 {
  type_version: number

  translations: {
    [P: string]: {
      name?: string | null
      description?: string | null
    }
  }
}

interface MovieDataV2 extends GenericDataV2 {
  type: 'movie'
  mpaa_rating?: null | 'G' | 'PG' | 'PG-13' | 'R' | 'NC-17' | 'NR'
  run_time?: null | number
  release_date?: null | string
  default_image_url?: null | string
}

interface BookDataV2 extends GenericDataV2 {
  type: 'book'
}

interface ProductBaseCreationV2 {
  name: string
  description: string | null
  product_identifiers: Array<{ authority: string, identifier: string }>
  data: {
    [P: string]: { type: ProductDataTypeV1 } & (MovieDataV2 | BookDataV2)
  }
  raw_data?: {
    [P: string]: any
  }
}

export interface ProductBaseV2 extends ProductBaseCreationV2 {
  updated_at: string
  lock_version: number

  _links: {
    self: { href: string }
    images: { href: string }
    videos: { href: string }
    places: { href: string }
    audio_fragments: { href: string }
  }
}

export interface ProductV2 {
  product: ProductBaseV2
}

export interface ProductCreateV2 {
  product: ProductBaseCreationV2
}

export interface ProductCollectionV2 {
  products: {
    _embedded: [] | ProductBaseV2[]
  }
}

export type ProductIndexV2 = ProductIndexBase

interface GenericDataV1 {
  type_version: number

  name?: string | null
  description?: string | null
}

interface MovieDataV1 extends GenericDataV1 {
  type: 'movie'
  mpaa_rating?: null | 'G' | 'PG' | 'PG-13' | 'R' | 'NC-17' | 'NR'
  run_time?: null | number
  release_date?: null | string
  default_image_url?: null | string
}

interface BookDataV1 extends GenericDataV1 {
  type: 'book'
}

interface ProductBaseCreationV1 extends Pick<ProductBaseCreationV2, Exclude<keyof ProductBaseCreationV2, 'data'>> {
  data: {
    [P: string]: { type: ProductDataTypeV1 } & (MovieDataV1 | BookDataV1)
  }
}

export interface ProductBaseV1 extends ProductBaseCreationV1 {
  updated_at: string
  lock_version: number

  _links: {
    self: { href: string }
    images: { href: string }
    videos: { href: string }
    places: { href: string }
    audio_fragments: { href: string }
  }
}

export interface ProductV1 {
  product: ProductBaseV1
}

export interface ProductCreateV1 {
  product: ProductBaseCreationV1
}

export interface ProductCollectionV1 {
  products: {
    _embedded: [] | [ProductBaseV1, ...ProductBaseV1[]]
  }
}

export type ProductIndexV1 = ProductIndexBase
