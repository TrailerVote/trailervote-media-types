import { ElementType, literals } from '../utils/literals'

export const ProductImageTypesV1 = literals('backdrop', 'poster')
export type ProductImageTypeV1 = ElementType<typeof ProductImageTypesV1>

export const ProductImageTypesV0 = literals('backdrop', 'poster', 'Post', 'HeroMobileDynamic', 'PosterDynamic', 'HeroDesktopDynamic')
export type ProductImageTypeV0 = ElementType<typeof ProductImageTypesV0>

