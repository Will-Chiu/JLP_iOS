

import Foundation

// MARK: - APIProdOptionalService
struct APIProdOptionalService: Codable {
    let type: String?
    let associatedProductId: String?
    let optionalServiceDescription: String?
    let orderOnSite: Int?
    let price: String?
    let title: String?
    let id: String?
    let customProperties: APIProdCustomProperties?

    enum CodingKeys: String, CodingKey {
        case type = "type"
        case associatedProductId = "associatedProductId"
        case optionalServiceDescription = "description"
        case orderOnSite = "orderOnSite"
        case price = "price"
        case title = "title"
        case id = "id"
        case customProperties = "customProperties"
    }
}
