

import Foundation

// MARK: - APIProdSkusDynamicAttributes
struct APIProdSkusDynamicAttributes: Codable {
    let range: String?
    let manufacturerpartnumbermpn: String?
    let dimensions: String?
    let modelnamenumber: String?

    enum CodingKeys: String, CodingKey {
        case range = "range"
        case manufacturerpartnumbermpn = "manufacturerpartnumbermpn"
        case dimensions = "dimensions"
        case modelnamenumber = "modelnamenumber"
    }
}
