

import Foundation

// MARK: - APIProdDelivery
struct APIProdDelivery: Codable {
    let options: [APIProdOption]?
    let deliveryType: String?

    enum CodingKeys: String, CodingKey {
        case options = "options"
        case deliveryType = "deliveryType"
    }
}
