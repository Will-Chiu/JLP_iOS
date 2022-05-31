

import Foundation

// MARK: - APIProdCustomProperties
struct APIProdCustomProperties: Codable {
    let warrantyCustomGeneric: String?
    let warrantyCustomTooltip: String?
    let warrantyCustomDescription: String?
    let warrantyCustomConfirm: String?

    enum CodingKeys: String, CodingKey {
        case warrantyCustomGeneric = "warrantyCustomGeneric"
        case warrantyCustomTooltip = "warrantyCustomTooltip"
        case warrantyCustomDescription = "warrantyCustomDescription"
        case warrantyCustomConfirm = "warrantyCustomConfirm"
    }
}
