

import Foundation

// MARK: - APIPageInformation
struct APIPageInformation: Codable {
    let title: String
    let heading: String
    let pageInformationDescription: String
    let noIndex: Bool
    let noFollow: Bool

    enum CodingKeys: String, CodingKey {
        case title = "title"
        case heading = "heading"
        case pageInformationDescription = "description"
        case noIndex = "noIndex"
        case noFollow = "noFollow"
    }
}
