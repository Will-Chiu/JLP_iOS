

import Foundation

// MARK: - APIProduct
struct APIProduct: Codable {
    let productId: String
    let type: String
    let title: String
    let code: String
    let averageRating: Double
    let reviews: Int
    let image: String
    let alternativeImageUrls: [String]
    let displaySpecialOffer: String
    let nonPromoMessage: String
    let defaultSkuId: String
    let defaultVariantId: String
    let colorSwatches: [APIColorSwatch]
    let outOfStock: Bool
    let isAvailableToOrder: Bool
    let emailMeWhenAvailable: Bool
    let compare: Bool
    let fabric: String
    let swatchAvailable: Bool
    let brand: String
    let ageRestriction: Int
    let isInStoreOnly: Bool
    let isMadeToMeasure: Bool
    let isBundle: Bool
    let isProductSet: Bool
    let dynamicAttributes: [String: String]
    let futureRelease: Bool
    let multiSku: Bool
    let fabricByLength: Bool
    let messaging: [APIMessaging]
    let variantPriceRange: APIVariantPriceRange
    let services: [APIService]
    let attributes: [APIAttribute]
    let hiddenAttributes: [APIAttribute]
    let permanentOos: Bool
    let defaultParentCategory: APIDefaultParentCategory

    enum CodingKeys: String, CodingKey {
        case productId = "productId"
        case type = "type"
        case title = "title"
        case code = "code"
        case averageRating = "averageRating"
        case reviews = "reviews"
        case image = "image"
        case alternativeImageUrls = "alternativeImageUrls"
        case displaySpecialOffer = "displaySpecialOffer"
        case nonPromoMessage = "nonPromoMessage"
        case defaultSkuId = "defaultSkuId"
        case defaultVariantId = "defaultVariantId"
        case colorSwatches = "colorSwatches"
        case outOfStock = "outOfStock"
        case isAvailableToOrder = "isAvailableToOrder"
        case emailMeWhenAvailable = "emailMeWhenAvailable"
        case compare = "compare"
        case fabric = "fabric"
        case swatchAvailable = "swatchAvailable"
        case brand = "brand"
        case ageRestriction = "ageRestriction"
        case isInStoreOnly = "isInStoreOnly"
        case isMadeToMeasure = "isMadeToMeasure"
        case isBundle = "isBundle"
        case isProductSet = "isProductSet"
        case dynamicAttributes = "dynamicAttributes"
        case futureRelease = "futureRelease"
        case multiSku = "multiSku"
        case fabricByLength = "fabricByLength"
        case messaging = "messaging"
        case variantPriceRange = "variantPriceRange"
        case services = "services"
        case attributes = "attributes"
        case hiddenAttributes = "hiddenAttributes"
        case permanentOos = "permanentOos"
        case defaultParentCategory = "defaultParentCategory"
    }
}
