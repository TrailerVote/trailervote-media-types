import { ElementType, literals } from '../utils/literals'

export const ProductMovieTypesV1 = literals('Trailer', 'Teaser', 'Rewards', 'Advert')
export type ProductMovieTypeV1 = ElementType<typeof ProductMovieTypesV1>
