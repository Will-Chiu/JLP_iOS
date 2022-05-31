

import Foundation

// MARK: - APIProdImages
struct APIProdImages: Codable {
    let urls: [String]?

    enum CodingKeys: String, CodingKey {
        case urls = "urls"
    }
}
