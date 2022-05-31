

import Foundation

// MARK: - APIProdOption
struct APIProdOption: Codable {
    let standardDescription: String?
    let shortDescription: String?
    let price: String?
    let newPriority: Int?
    let newShortDescription: String?
    let isApprovedSupplier: Bool?
    let id: String?
    let newStandardDescription: String?

    enum CodingKeys: String, CodingKey {
        case standardDescription = "standardDescription"
        case shortDescription = "shortDescription"
        case price = "price"
        case newPriority = "newPriority"
        case newShortDescription = "newShortDescription"
        case isApprovedSupplier = "isApprovedSupplier"
        case id = "id"
        case newStandardDescription = "newStandardDescription"
    }
}
