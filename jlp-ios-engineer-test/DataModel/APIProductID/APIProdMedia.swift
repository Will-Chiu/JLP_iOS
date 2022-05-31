

import Foundation

// MARK: - APIProdMedia
struct APIProdMedia: Codable {
    let videos: APIProdVideos?
    let images: APIProdImages?

    enum CodingKeys: String, CodingKey {
        case videos = "videos"
        case images = "images"
    }
}
