export interface PersonaV2 {
  persona: {
    id: string
    _links: {
      self: { href: string }
      feedback: { href: string }
      push_consent: { href: string }
    }
  }
}

export type PersonaCreateV2 = { }

export interface PersonaV1 {
  persona: {
    id: string
    _links: {
      self: { href: string }
      feedback: { href: string }
    }
  }
}

export type PersonaCreateV1 = { }
