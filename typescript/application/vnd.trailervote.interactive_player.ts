export interface InteractivePlayerV1 {
  interactive_player: {
    title: null | string

    _links: {
      self: { href: string }
      advert: { href: string }
      direct: { href: string }
      product: { href: string }
    }
  }
}
