

import Foundation

// MARK: - APIMessaging
struct APIMessaging: Codable {
    let title: String
    let type: String

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case type = "type"
    }
}
