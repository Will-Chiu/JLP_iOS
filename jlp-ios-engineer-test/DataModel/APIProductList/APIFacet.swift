

import Foundation

// MARK: - APIFacet
struct APIFacet: Codable {
    let dimensionName: String
    let name: String
    let type: String
    let tooltip: String
    let filterTypes: [String]
    let details: [APIDetail]

    enum CodingKeys: String, CodingKey {
        case dimensionName = "dimensionName"
        case name = "name"
        case type = "type"
        case tooltip = "tooltip"
        case filterTypes = "filterTypes"
        case details = "details"
    }
}
