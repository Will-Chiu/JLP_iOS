

import Foundation

// MARK: - APIProdAvailability
struct APIProdAvailability: Codable {
    let stockLevel: Int?
    let message: String?
    let availabilityStatus: String?
    let isPreorder: Bool?

    enum CodingKeys: String, CodingKey {
        case stockLevel = "stockLevel"
        case message = "message"
        case availabilityStatus = "availabilityStatus"
        case isPreorder = "isPreorder"
    }
}
