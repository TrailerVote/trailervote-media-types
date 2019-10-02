export interface PushManifestV2 {
  push_manifest: PushManifestBaseV2
}

export interface PushManifestBaseV2 {
  campaigns: CampaignV2[]
}

export interface CampaignV2 {
  _links: {
    audio_fragment?: { href: string }
    product?: { href: string }
    campaign: { href: string }
  }
}

export interface PushManifestV1 {
  push_manifest: PushManifestBaseV1
}

export interface PushManifestBaseV1 {
  campaigns: CampaignV1[]
}

export interface CampaignV1 {
  _links: {
    audio_fragment: { href: string }
    campaign: { href: string }
  }
}
