

import Foundation

// MARK: - APIReductionHistory
struct APIReductionHistory: Codable {
    let chronology: Int
    let display: APIDisplay

    enum CodingKeys: String, CodingKey {
        case chronology = "chronology"
        case display = "display"
    }
}
