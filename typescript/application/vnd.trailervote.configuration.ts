export interface ConfigurationV2 {
  configuration: {
    _links: {
      self: { href: string }
      place: { href: string }
      products: { href: string }
      product_lookup: { href: string }
      persona: { href: string, templated: true }
      analytics: { href: string }
      telemetrics: { href: string }
      issues: { href: string }
    }
  }
}

export interface ConfigurationV1 {
  configuration: {
    _links: {
      place: { href: string }
      products: { href: string }
      feedback: { href: string, templated: true }
      persona: { href: string, templated: true }
      analytics: { href: string }
    }
  }
}
