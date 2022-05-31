

import Foundation

// MARK: - APIProdSpecialOffers
struct APIProdSpecialOffers: Codable {
    let priceMatched: String?
    let customSpecialOffer: APIProdVideos?
    let bundleHeadline: String?
    let customPromotionalMessage: String?
    let offer: String?

    enum CodingKeys: String, CodingKey {
        case priceMatched = "priceMatched"
        case customSpecialOffer = "customSpecialOffer"
        case bundleHeadline = "bundleHeadline"
        case customPromotionalMessage = "customPromotionalMessage"
        case offer = "offer"
    }
}
