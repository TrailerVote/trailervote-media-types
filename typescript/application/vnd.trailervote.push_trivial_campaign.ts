import {VoteValue} from './types/vote_value'

export interface PushTrivialCampaignV5 {
  push_campaign_trivial: PushTrivialCampaignBaseV5
}

export interface PushTrivialCampaignBaseV5 {
  message: string
  schedule_at: string
  published_at: string | null
  archived_at: string | null
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
    rich_media?: { href: string }
  }
}

export interface PushTrivialCampaignCreateV5 {
  push_campaign_trivial: {
    schedule_at: string
    published_at: string | null
    archived_at: string | null
    translations: {
      [k: string]: {
        message: string
      }
    }
    _links: {
      product_asset?: {
        href: string
      },
      product?: {
        href: string
      },
      action: {
        href: string
      },
      rich_media?: {
        href: string
      }
    },
    filter: {
      platform?: string | null,
      region?: string | null,
      language?: string | null,
      timezone?: string | null,
      vote_source?: string | null,
      purchased?: boolean | null,
      vote_value?: VoteValue | null,
      vote_from?: string | null,
      vote_until?: string | null
    }
  }
}

export interface PushTrivialCampaignRawV5 {
  push_campaign_trivial: {
    translations: {
      [k: string]: {
        message: string
      }
    }
    schedule_at: string
    published_at: string | null
    archived_at: string | null
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
      rich_media?: { href: string }
      product_asset?: { href: string },
      product?: { href: string },
    }
  }
}

export interface PushTrivialCampaignV4 {
  push_campaign_trivial: PushTrivialCampaignBaseV4
}

export interface PushTrivialCampaignBaseV4 {
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
    rich_media?: { href: string }
  }
}

export interface PushTrivialCampaignCreateV4 {
  push_campaign_trivial: {
    schedule_at: string
    translations: {
      [k: string]: {
        message: string
      }
    }
    _links: {
      product_asset?: {
        href: string
      },
      product?: {
        href: string
      },
      action: {
        href: string
      },
      rich_media?: {
        href: string
      }
    },
    filter: {
      platform?: string | null,
      region?: string | null,
      language?: string | null,
      timezone?: string | null,
      vote_source?: string | null,
      purchased?: boolean | null,
      vote_value?: VoteValue | null,
      vote_from?: string | null,
      vote_until?: string | null
    }
  }
}

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

export interface PushTrivialCampaignCreateV2 {
  push_campaign_trivial: {
    schedule_at: string
    translations: {
      [k: string]: {
        message: string
      }
    }
    _links: {
      product_asset: {
        href: string
      },
      action: {
        href: string
      }
    },
    filter: {
      platform?: string | null,
      region?: string | null,
      language?: string | null,
      timezone?: string | null,
      vote_source?: string | null,
      purchased?: boolean | null,
      vote_value?: VoteValue | null,
      vote_from?: string | null,
      vote_until?: string | null
    }
  }
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

export interface PushTrivialCampaignCreateV1 {
  push_campaign_trivial: {
    schedule_at: string
    translations: {
      [k: string]: {
        message: string
      }
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
