
import Foundation

// MARK: - APIDefaultParentCategory
struct APIDefaultParentCategory: Codable {
    let id: String
    let name: String

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
    }
}
