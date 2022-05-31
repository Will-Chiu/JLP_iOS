

import Foundation

// MARK: - APINextBestAction
struct APINextBestAction: Codable {
    let facetId: String
    let display: String
    let facetGroupName: String
    let facetName: String

    enum CodingKeys: String, CodingKey {
        case facetId = "facetId"
        case display = "display"
        case facetGroupName = "facetGroupName"
        case facetName = "facetName"
    }
}
