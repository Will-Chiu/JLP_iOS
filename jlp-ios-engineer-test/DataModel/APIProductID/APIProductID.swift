
import Foundation

// MARK: - APIProductID
struct APIProductID: Codable {
    let emailMeWhenAvailable: Bool?
    let displaySpecialOffer: String?
    let releaseDateTimestamp: Int?
    let media: APIProdMedia?
    let code: String?
    let averageRating: Double?
    let promotionalFeatures: [JSONAny]?
    let skus: [APIProdSkus]?
    let specialOfferBundles: [JSONAny]?
    let crumbs: [APIProdCrumb]?
    let isAsafShape: Bool?
    let nonPromoMessage: String?
    let templateType: String?
    let lifeCycleState: String?
    let isFBL: Bool?
    let details: APIProdDetails?
    let legs: [JSONAny]?
    let parentCategories: [JSONAny]?
    let brand: APIProdBrand?
    let price: APIProdPrice?
    let priceBands: [JSONAny]?
    let defaultCategory: APIProdDefaultCategory?
    let productId: String?
    let deliveries: [APIProdDelivery]?
    let dynamicAttributes: APIProductIDDynamicAttributes?
    let storeOnly: Bool?
    let numberOfReviews: Int?
    let seoURL: String?
    let type: String?
    let defaultSku: String?
    let specialOffers: APIProdSpecialOffers?
    let title: String?
    let bundleProducts: [JSONAny]?
    let additionalServices: APIProdAdditionalServices?
    let ageRestriction: Int?

    enum CodingKeys: String, CodingKey {
        case emailMeWhenAvailable = "emailMeWhenAvailable"
        case displaySpecialOffer = "displaySpecialOffer"
        case releaseDateTimestamp = "releaseDateTimestamp"
        case media = "media"
        case code = "code"
        case averageRating = "averageRating"
        case promotionalFeatures = "promotionalFeatures"
        case skus = "skus"
        case specialOfferBundles = "specialOfferBundles"
        case crumbs = "crumbs"
        case isAsafShape = "isAsafShape"
        case nonPromoMessage = "nonPromoMessage"
        case templateType = "templateType"
        case lifeCycleState = "lifeCycleState"
        case isFBL = "isFBL"
        case details = "details"
        case legs = "legs"
        case parentCategories = "parentCategories"
        case brand = "brand"
        case price = "price"
        case priceBands = "priceBands"
        case defaultCategory = "defaultCategory"
        case productId = "productId"
        case deliveries = "deliveries"
        case dynamicAttributes = "dynamicAttributes"
        case storeOnly = "storeOnly"
        case numberOfReviews = "numberOfReviews"
        case seoURL = "seoURL"
        case type = "type"
        case defaultSku = "defaultSku"
        case specialOffers = "specialOffers"
        case title = "title"
        case bundleProducts = "bundleProducts"
        case additionalServices = "additionalServices"
        case ageRestriction = "ageRestriction"
    }
}
