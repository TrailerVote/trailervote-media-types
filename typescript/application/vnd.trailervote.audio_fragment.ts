export interface AudioFragmentBaseV1 {
  content_addressable: string
  expires_at: string | null

  _links: {
    self: { href: string }
    product: { href: string }
    feedback: { href: string }
    advert: { href: string }
    direct?: { href: string }
  }
}

export interface AudioFragmentV1 {
  audio_fragment: AudioFragmentBaseV1
}

export interface AudioFragmentIndexV1 {
  audio_fragments: {
    _index?: Array<{ href: string }>
  }
}

export interface AudioFragmentCollectionV1 {
  audio_fragments: {
    _embedded?: AudioFragmentBaseV1[]
  }
}
