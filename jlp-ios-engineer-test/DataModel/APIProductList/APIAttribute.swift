

import Foundation

// MARK: - APIAttribute
struct APIAttribute: Codable {
    let key: String
    let values: [String]
    let displayName: String

    enum CodingKeys: String, CodingKey {
        case key = "key"
        case values = "values"
        case displayName = "displayName"
    }
}
