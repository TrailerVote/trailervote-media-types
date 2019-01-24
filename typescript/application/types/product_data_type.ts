import { ElementType, literals } from '../utils/literals'

export const ProductDataTypesV1 = literals('movie', 'book')
export type ProductDataTypeV1 = ElementType<typeof ProductDataTypesV1>
