export interface ProductPlaceLinkV1 {
  product_place_link: {
    _links: {
      place: { href: string }
      product: { href: string }
    }
  }
}

export interface ProductPlaceLinkCreateV1 {
  place: string
}
