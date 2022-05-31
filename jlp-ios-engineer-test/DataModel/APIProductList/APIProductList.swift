

import Foundation

// MARK: - APIProductList
struct APIProductList: Codable {
    let showInStockOnly: Bool
    let isPersonalised: Bool
    let products: [APIProduct]
    let facets: [APIFacet]
    let results: Int
    let pagesAvailable: Int
    let crumbs: [APICrumb]
    let dynamicBannerId: String
    let banners: APIBanners
    let seoBannerId: String
    let pageInformation: APIPageInformation
    let triggeredRules: APITriggeredRules
    let endecaCanonical: String
    let baseFacetId: String
    let redirectType: String
    let nextBestActions: [APINextBestAction]

    enum CodingKeys: String, CodingKey {
        case showInStockOnly = "showInStockOnly"
        case isPersonalised = "isPersonalised"
        case products = "products"
        case facets = "facets"
        case results = "results"
        case pagesAvailable = "pagesAvailable"
        case crumbs = "crumbs"
        case dynamicBannerId = "dynamicBannerId"
        case banners = "banners"
        case seoBannerId = "seoBannerId"
        case pageInformation = "pageInformation"
        case triggeredRules = "triggeredRules"
        case endecaCanonical = "endecaCanonical"
        case baseFacetId = "baseFacetId"
        case redirectType = "redirectType"
        case nextBestActions = "nextBestActions"
    }
}
