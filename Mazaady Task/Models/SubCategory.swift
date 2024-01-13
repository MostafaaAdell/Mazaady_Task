//
//  PropertiesModel.swift
//  Mazaady Task
//
//  Created by Mustafa on 12/01/2024.
//

import Foundation

// MARK: - Welcome
struct SubCategory: Codable {
    let code: Int
    let msg: String
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let name: String
    let description: JSONNull?
    let slug: String
    let parent: Int?
    let list: Bool
    let type: String?
    let value: String
    let otherValue: JSONNull?
    let options: [Option]

    enum CodingKeys: String, CodingKey {
        case id, name, description, slug, parent, list, type, value
        case otherValue = "other_value"
        case options
    }
}

// MARK: - Option
struct Option: Codable {
    let id: Int
    let name, slug: String
    let parent: Int
    let child: Bool
}

