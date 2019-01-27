export interface PersonaV1 {
  psersona: {
    id: string
    _links: {
      self: { href: string }
      feedback: { href: string }
    }
  }
}

export type PersonaCreateV1 = { }
