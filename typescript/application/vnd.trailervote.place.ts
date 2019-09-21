export interface PlaceBaseV3 {
  name: string
  parent_place: string | null
  expires_at: string | null
  updated_at: string

  _links: {
    self: { href: string }
    products_archive: { href: string }
    parent: { href: string | null }
    children: { href: string }
  }
}

export interface PlaceV3 {
  place: PlaceBaseV3
}

export type PlaceCreateV3 = PlaceCreateV2

export interface PlaceCollectionV3 {
  places: {
    _embedded: PlaceBaseV3[]
  }
}

export type PlaceIndexV3 = PlaceIndexV2

export interface PlaceBaseV2 {
  name: string
  parent_place: string | null
  expires_at: string | null
  updated_at: string

  _links: {
    self: { href: string }
    products_archive: { href: string }
    parent: { href: string | null }
  }
}

export interface PlaceV2 {
  place: PlaceBaseV2
}

export interface PlaceCreateV2 {
  place: {
    name: string
    parent_place: string
    expires_at: string | null
  }
}

export interface PlaceCollectionV2 {
  places: {
    _embedded: PlaceBaseV2[]
  }
}

export type PlaceIndexV2 = PlaceIndexV1

export interface PlaceBaseV1 {
  name: string
  parent_place: string | null
  expires_at: string | null
  updated_at: string

  _links: {
    self: { href: string }
    products: { href: string }
    parent: { href: string | null }
  }
}

export interface PlaceV1 {
  place: PlaceBaseV1
}

export interface PlaceCollectionV1 {
  places: {
    _embedded: PlaceBaseV1[]
  }
}

export interface PlaceIndexV1 {
  places: {
    _index: Array<{ href: string }>
  }
}
