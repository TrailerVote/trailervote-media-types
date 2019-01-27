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
