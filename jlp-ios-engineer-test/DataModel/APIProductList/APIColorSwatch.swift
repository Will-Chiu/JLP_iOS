

import Foundation

// MARK: - APIColorSwatch
struct APIColorSwatch: Codable {
    let color: String
    let basicColor: String
    let colorSwatchUrl: String
    let imageUrl: String
    let isAvailable: Bool
    let skuId: String
    let id: String
    let isColorOfDefaultVariant: Bool

    enum CodingKeys: String, CodingKey {
        case color = "color"
        case basicColor = "basicColor"
        case colorSwatchUrl = "colorSwatchUrl"
        case imageUrl = "imageUrl"
        case isAvailable = "isAvailable"
        case skuId = "skuId"
        case id = "id"
        case isColorOfDefaultVariant = "isColorOfDefaultVariant"
    }
}
