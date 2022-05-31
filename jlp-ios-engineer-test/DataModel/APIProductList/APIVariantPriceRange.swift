

import Foundation

// MARK: - APIVariantPriceRange
struct APIVariantPriceRange: Codable {
    let display: APIDisplay
    let variantPriceRangeFor: String
    let reductionHistory: [APIReductionHistory]
    let value: APIDisplay

    enum CodingKeys: String, CodingKey {
        case display = "display"
        case variantPriceRangeFor = "for"
        case reductionHistory = "reductionHistory"
        case value = "value"
    }
}
