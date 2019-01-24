import { ElementType, literals } from '../utils/literals'

export const VoteValues = literals('positive', 'negative', 'neutral', 'skip')
export type VoteValue = ElementType<typeof VoteValues>
