import { VoteValue } from './types/vote_value'

export interface FeedbackBaseV1 {
  value: VoteValue
  updated_at: string

  _links: {
    audio_fragment: { href: string }
    product: { href: string }
    persona: { href: string }
  }
}

export interface FeedbackV1 {
  feedback: FeedbackBaseV1
}

export interface FeedbackCollectionV1 {
  feedback: {
    _embedded: FeedbackBaseV1[]
  }
}

export interface FeedbackCreateV1 {
  feedback: {
    persona: string
    value: VoteValue
  }
}
