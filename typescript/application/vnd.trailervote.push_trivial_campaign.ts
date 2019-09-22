import { VoteValue } from './types/vote_value'

export interface PushTrivialCampaignCreateV2 {
  push_campaign_trivial: {
    url: string
    schedule_at: string
    translations: {
      [k:string]: string
    }
    links: {
      product_asset: {
        href: string
      }
    }
  }
}

export interface PushTrivialCampaignBaseV2 {
  message: string
  schedule_at: string
  filter: {
    platform: string | null,
    region: string | null,
    language: string | null,
    timezone: string | null,
    vote_source: string | null,
    purchased: boolean | null,
    vote_value: VoteValue | null,
    vote_from: string | null,
    vote_until: string | null
  }
  _links: {
    action: { href: string }
    self: { href: string }
  }
}

export interface PushTrivialCampaignV2 {
  push_campaign_trivial: PushTrivialCampaignBaseV2
}

export interface PushTrivialCampaignV1 {
  push_campaign_trivial: PushTrivialCampaignBaseV1
}

export interface PushTrivialCampaignBaseV1 {
  message: string
  schedule_at: string
  _links: {
    action: { href: string }
  }
}