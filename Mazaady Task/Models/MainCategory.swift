//
//  AllCategoryModel.swift
//  Mazaady Task
//
//  Created by Mustafa on 12/01/2024.
//

import Foundation

// MARK: - AllCategory
struct MainCategory: Codable {
    let code: Int
    let msg: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let categories: [Category]
    let statistics: Statistics
    let adsBanners: [AdsBanner]
    let iosVersion, iosLatestVersion, googleVersion, huaweiVersion: String

    enum CodingKeys: String, CodingKey {
        case categories, statistics
        case adsBanners = "ads_banners"
        case iosVersion = "ios_version"
        case iosLatestVersion = "ios_latest_version"
        case googleVersion = "google_version"
        case huaweiVersion = "huawei_version"
    }
}

// MARK: - AdsBanner
struct AdsBanner: Codable {
    let img: String
    let mediaType: String
    let duration: Int

    enum CodingKeys: String, CodingKey {
        case img
        case mediaType = "media_type"
        case duration
    }
}

// MARK: - Category
struct Category: Codable {
    let id: Int
    let name: String
    let description: JSONNull?
    let image: String
    let slug: String
    let children: [Category]?
    let circleIcon: String
    let disableShipping: Int

    enum CodingKeys: String, CodingKey {
        case id, name, description, image, slug, children
        case circleIcon = "circle_icon"
        case disableShipping = "disable_shipping"
    }
}

// MARK: - Statistics
struct Statistics: Codable {
    let auctions, users, products: Int
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }
    func hash(into hasher: inout Hasher) {
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
