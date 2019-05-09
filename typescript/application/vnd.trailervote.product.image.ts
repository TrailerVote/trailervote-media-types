import { ImageLink } from './partials/image_links'
import { ProductImageTypeV1 } from './types/product_image_type'

interface ProductImageBaseCreationV1 {
  identifier: string
  source_url: string
  expires_at?: null | string
  content_language?: null | string
  content_region?: null | string
}

export interface ProductImageBaseV1 extends ProductImageBaseCreationV1 {
  updated_at: string
  data: {
    processed: boolean
    type: ProductImageTypeV1
  }

  _links: {
    self: {
      href: string,
      type: ProductImageTypeV1
    }

    original?: null | ImageLink
    thumbnail?: null | ImageLink
    xlarge?: null | ImageLink
    large?: null | ImageLink
    medium?: null | ImageLink
    small?: null | ImageLink
    xsmall?: null | ImageLink
  }
}

export interface ProductImageV1 {
  product_image: ProductImageBaseV1
}

export interface ProductImageCreateV1 {
  product_image: ProductImageBaseCreationV1
}

export interface ProductImageCollectionV1 {
  product_images: {
    _embedded: ProductImageBaseV1[]
  }
}

export interface ProductImageIndexV1 {
  product_images: {
    _index: Array<{ href: string, type: ProductImageTypeV1 }>
  }
}
