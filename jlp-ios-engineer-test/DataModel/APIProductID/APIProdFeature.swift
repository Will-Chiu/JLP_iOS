

import Foundation

// MARK: - APIProdFeature
struct APIProdFeature: Codable {
    let groupName: String?
    let attributes: [APIProdAttribute]?

    enum CodingKeys: String, CodingKey {
        case groupName = "groupName"
        case attributes = "attributes"
    }
}
