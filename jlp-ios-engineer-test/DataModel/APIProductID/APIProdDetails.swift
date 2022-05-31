

import Foundation

// MARK: - APIProdDetails
struct APIProdDetails: Codable {
    let featuredArticles: [APIProdBuyingGuide]?
    let editorsNotes: String?
    let features: [APIProdFeature]?
    let buyingGuides: [APIProdBuyingGuide]?
    let productInformation: String?
    let returns: String?

    enum CodingKeys: String, CodingKey {
        case featuredArticles = "featuredArticles"
        case editorsNotes = "editorsNotes"
        case features = "features"
        case buyingGuides = "buyingGuides"
        case productInformation = "productInformation"
        case returns = "returns"
    }
}
