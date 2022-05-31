

import Foundation

// MARK: - APIProdCrumb
struct APIProdCrumb: Codable {
    let displayName: String?
    let type: String?
    let item: String?
    let clickable: String?

    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case type = "type"
        case item = "item"
        case clickable = "clickable"
    }
}
