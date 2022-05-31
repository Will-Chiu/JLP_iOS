

import Foundation

// MARK: - APIBanners
struct APIBanners: Codable {
    let topBannerId: String
    let blockBannerId: String
    let seoBannerId: String

    enum CodingKeys: String, CodingKey {
        case topBannerId = "topBannerId"
        case blockBannerId = "blockBannerId"
        case seoBannerId = "seoBannerId"
    }
}
