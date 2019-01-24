import { ProductImageTypeV1 } from '../types/product_image_type'

import { ElementType, literals } from '../utils/literals'

export const ImageSizes = literals(
  'thumbnail',
  'xlarge',
  'large',
  'medium',
  'small',
  'xsmall'
)

export type ImageSize = ElementType<typeof ImageSizes>

export type ImageLink = {
  href: string
  content_digest?: string
  width?: number
  height?: number
}

export type ImageLinks = {
  _links: {
    self: {
      href: string
      type?: ProductImageTypeV1
    }

    original?: ImageLink
    thumbnail?: ImageLink
    xlarge?: ImageLink
    large?: ImageLink
    medium?: ImageLink
    small?: ImageLink
    xsmall?: ImageLink

    /*
    [K in ImageSize]: {
      href: string
      content_digest?: string
      width?: number
      height?: number
    }
    */
  }
}
