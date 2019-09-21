import { VoteValue } from './types/vote_value'

export interface PushTrivialCampaignBaseV2 {
  message: string
  schedule_at: string
  filter: {
    platform?: string,
    region?: string,
    language?: string,
    timezone?: string,
    vote_source?: string,
    purchased?: boolean,
    vote_value?: VoteValue,
    vote_from?: string,
    vote_until?: string
  }
  _links: {
    action: { href: string }
  }
}

export interface PushTrivialCampaignV2 {
  push_campaign_trivial: PushTrivialCampaignBaseV2
}

export interface PushTrivialCampaignCreateV2 {
  push_campaign_trivial: {
    url: string
    schedule_at: string
    translations: {
      [k:string]: string
    }
  }
}