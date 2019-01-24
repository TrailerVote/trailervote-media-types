export interface PersonaV1 {
  id: string
  _links: {
    self: { href: string }
    feedback: { href: string }
  }
}

export type PersonaCreateV1 = { }
