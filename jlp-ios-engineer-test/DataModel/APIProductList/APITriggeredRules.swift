

import Foundation

// MARK: - APITriggeredRules
struct APITriggeredRules: Codable {
    let triggeredRulesDynamic: String
    let seo: String

    enum CodingKeys: String, CodingKey {
        case triggeredRulesDynamic = "dynamic"
        case seo = "seo"
    }
}
