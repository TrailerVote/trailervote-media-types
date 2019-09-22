import { ImageLinks } from './partials/image_links'

export interface ProductListingV1 {
  products_listing: {
    items: ProductListingItemV1[],
    _links: {
      self: { href: string }
    }
  }
}

export interface ProductListingItemV1 {
  title: string | null
  publish_date: string | null
  image?: null | {} | {
    _embedded?: null | {} | ImageLinks
  }
  _links: {
    product: { href: string }
  }
}
