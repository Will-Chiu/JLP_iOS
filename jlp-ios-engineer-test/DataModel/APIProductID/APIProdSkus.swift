

import Foundation

// MARK: - APIProdSkus
struct APIProdSkus: Codable {
    let swatchUrl: String?
    let brandName: String?
    let code: String?
    let size: String?
    let dynamicAttributes: APIProdSkusDynamicAttributes?
    let color: String?
    let skuTitle: String?
    let unitPriceInfo: APIProdVideos?
    let id: String?
    let availability: APIProdAvailability?
    let sizeHeadline: String?
    let ticketType: String?
    let media: APIProdMedia?
    let priceBand: String?
    let price: APIProdPrice?

    enum CodingKeys: String, CodingKey {
        case swatchUrl = "swatchUrl"
        case brandName = "brandName"
        case code = "code"
        case size = "size"
        case dynamicAttributes = "dynamicAttributes"
        case color = "color"
        case skuTitle = "skuTitle"
        case unitPriceInfo = "unitPriceInfo"
        case id = "id"
        case availability = "availability"
        case sizeHeadline = "sizeHeadline"
        case ticketType = "ticketType"
        case media = "media"
        case priceBand = "priceBand"
        case price = "price"
    }
}
