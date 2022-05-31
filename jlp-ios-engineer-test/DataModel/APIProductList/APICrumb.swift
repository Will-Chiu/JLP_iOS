

import Foundation

// MARK: - APICrumb
struct APICrumb: Codable {
    let displayName: String
    let type: String
    let clickable: String
    let url: String
    let item: String

    enum CodingKeys: String, CodingKey {
        case displayName = "displayName"
        case type = "type"
        case clickable = "clickable"
        case url = "url"
        case item = "item"
    }
}
