export interface IssueBaseV1 {
  error_name: string
  error_message: string
  rescue_context: {
    caller: string
    args: {} | {
      [P: string]: any
    }
  }
}

export interface IssueV1 {
  issue: IssueBaseV1 & {
    updated_at: string,
    _links: {
      self: { href: string }
    }
  }
}

export interface IssueCreateV1 {
  issue: IssueBaseV1
}

export interface IssueIndexV1 {
  issues: {
    _index: [] | Array<{ href: string }>
  }
}
