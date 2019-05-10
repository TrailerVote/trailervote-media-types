import { ImageLinks } from './partials/image_links'
import { ProductImageTypeV1 } from './types/product_image_type'

export interface SentimentFeedbackV2 {
  sentiment_feedback: {
    title: string
    description: string | null
    image?: null | {} | {
      _embedded?: null | {} | (ImageLinks & {
        identifier: string
        updated_at: string
        type: ProductImageTypeV1
      })
    }

    _links: {
      self: { href: string }
      feedback: { href: string }
    }
  }
}

export interface SentimentFeedbackV1 {
  sentiment_feedback: {
    title: string
    description: string | null
    images?: null | {} | {
      _embedded?: null | Array<ImageLinks & {
        identifier: string
        updated_at: string
        type: ProductImageTypeV1
      }>
    }

    _links: {
      self: { href: string }
      feedback: { href: string }
    }
  }
}
