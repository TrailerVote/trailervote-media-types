import { VoteValue } from './types/vote_value'

export interface PushTrivialCampaignV3 {
  push_campaign_trivial: PushTrivialCampaignBaseV3
}

export interface PushTrivialCampaignBaseV3 {
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

export type PushTrivialCampaignCreateV3 = PushTrivialCampaignCreateV2

export interface PushTrivialCampaignV2 {
  push_campaign_trivial: PushTrivialCampaignBaseV2
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
  }
}

export type PushTrivialCampaignCreateV2 = PushTrivialCampaignCreateV1

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

export interface PushTrivialCampaignCreateV1 {
  push_campaign_trivial: {
    schedule_at: string
    translations: {
      [k:string]: string
    }
    _links: {
      product_asset: {
        href: string
      },
      action: {
        href: string
      }
    }
  }
}
