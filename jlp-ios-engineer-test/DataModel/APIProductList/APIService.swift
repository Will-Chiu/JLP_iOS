

import Foundation

// MARK: - APIService
struct APIService: Codable {
    let typename: String
    let title: String
    let automaticallyIncluded: Bool

    enum CodingKeys: String, CodingKey {
        case typename = "__typename"
        case title = "title"
        case automaticallyIncluded = "automaticallyIncluded"
    }
}
