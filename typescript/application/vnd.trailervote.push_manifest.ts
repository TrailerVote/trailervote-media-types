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