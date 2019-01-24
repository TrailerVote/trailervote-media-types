import { ImageLinks } from './partials/image_links'
import { VoteValue } from './types/vote_value'

export interface FeedbackListingV1 {
  feedback_listing: {
    items: FeedbackListingItemV1[]

    _links: {
      self: { href: true }
    }
  }
}

export interface FeedbackListingItemV1 {
  title: string | null
  value: VoteValue
  updated_at: string
  image?: null | {} | {
    _embedded: null | {} | ImageLinks
  }

  _links: {
    audio_fragment: { href: string }
    product: { href: string }
    persona: { href: string }
    feedback: { href: string }
    interactive_player: { href: string }
  }
}
