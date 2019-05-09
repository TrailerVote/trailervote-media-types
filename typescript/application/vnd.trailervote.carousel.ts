import { ImageLinks } from './partials/image_links'

export interface CarouselV1 {
  carousel: {
    items: CarouselItemV1[]

    _links: {
      self: { href: string }
    }
  }
}

export interface CarouselItemV1 {
  title: null | string
  image?: null | {} | {
    _embedded?: null | {} | ImageLinks
  }

  _links: {
    product: { href: string }
    video: { href: string }
    direct: { href: string }
    interactive_player: { href: string }
  }
}
