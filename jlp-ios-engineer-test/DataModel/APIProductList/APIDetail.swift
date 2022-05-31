

import Foundation

// MARK: - APIDetail
struct APIDetail: Codable {
    let facetId: String
    let label: String
    let qty: String
    let color: String
    let colorSwatchUrl: String
    let isSelected: String

    enum CodingKeys: String, CodingKey {
        case facetId = "facetId"
        case label = "label"
        case qty = "qty"
        case color = "color"
        case colorSwatchUrl = "colorSwatchUrl"
        case isSelected = "isSelected"
    }
}
