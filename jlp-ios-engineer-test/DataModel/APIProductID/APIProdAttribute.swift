

import Foundation

// MARK: - APIProdAttribute
struct APIProdAttribute: Codable {
    let multivalued: Bool?
    let name: String?
    let value: String?
    let values: [String]?

    enum CodingKeys: String, CodingKey {
        case multivalued = "multivalued"
        case name = "name"
        case value = "value"
        case values = "values"
    }
}
