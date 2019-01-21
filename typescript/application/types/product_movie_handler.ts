import { ElementType, literals } from '../utils/literals'

export const ProductMovieHandlersV1 = literals('youtube', 'vimeo', 'url')
export type ProductMovieHandlerV1 = ElementType<typeof ProductMovieHandlersV1>
