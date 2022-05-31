

import Foundation

// MARK: - APIProdAdditionalServices
struct APIProdAdditionalServices: Codable {
    let optionalServices: [APIProdOptionalService]?
    let includedServices: [String]?

    enum CodingKeys: String, CodingKey {
        case optionalServices = "optionalServices"
        case includedServices = "includedServices"
    }
}
