

import Foundation

// MARK: - APIProdPrice
struct APIProdPrice: Codable {
    let then2: String?
    let now: String?
    let was: String?
    let uom: String?
    let currency: String?
    let then1: String?

    enum CodingKeys: String, CodingKey {
        case then2 = "then2"
        case now = "now"
        case was = "was"
        case uom = "uom"
        case currency = "currency"
        case then1 = "then1"
    }
}
