

import Foundation

// MARK: - APIProdBuyingGuide
struct APIProdBuyingGuide: Codable {
    let linkUrl: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case linkUrl = "linkUrl"
        case title = "title"
    }
}
