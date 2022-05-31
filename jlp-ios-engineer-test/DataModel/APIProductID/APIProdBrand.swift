

import Foundation

// MARK: - APIProdBrand
struct APIProdBrand: Codable {
    let logo: String?
    let name: String?

    enum CodingKeys: String, CodingKey {
        case logo = "logo"
        case name = "name"
    }
}
