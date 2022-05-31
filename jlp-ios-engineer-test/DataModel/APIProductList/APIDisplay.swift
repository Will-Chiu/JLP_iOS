

import Foundation

// MARK: - APIDisplay
struct APIDisplay: Codable {
    let max: String
    let min: String

    enum CodingKeys: String, CodingKey {
        case max = "max"
        case min = "min"
    }
}
