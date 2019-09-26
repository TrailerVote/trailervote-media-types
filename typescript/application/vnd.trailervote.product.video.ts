import { ProductMovieHandlerV1 } from './types/product_movie_handler'
import { ProductMovieTypeV1 } from './types/product_movie_type'

interface ProductVideoBaseCreationV1 {
  identifier: string
  source_url: string
  expires_at?: null | string
  content_language?: null | string
  content_region?: null | string
}

export interface ProductVideoBaseV1 extends ProductVideoBaseCreationV1 {
  updated_at: string
  data: {
    processed: boolean
    transcoded: boolean
    type: ProductMovieTypeV1
    as: ProductMovieHandlerV1
  }

  _links: {
    self: {
      href: string
      type: ProductMovieTypeV1
    }

    audio_fragment: {
      href: string
      content_digest: string
    }

    direct?: { href: string | null }
  }
}

export interface ProductVideoV1 {
  product_video: ProductVideoBaseV1
}

export interface ProductVideoCreateV1 {
  product_video: ProductVideoBaseCreationV1
}

export interface ProductVideoCollectionV1 {
  product_videos: {
    _embedded: [] | [ProductVideoBaseV1, ...ProductVideoBaseV1[]]
  }
}

export interface ProductVideoIndexV1 {
  product_videos: {
    _index: Array<{ href: string, type: ProductMovieTypeV1 }>
  }
}
