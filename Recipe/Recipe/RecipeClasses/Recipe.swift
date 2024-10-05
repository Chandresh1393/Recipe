//
//  Recipe.swift
//  Recipe
//
//  Created by chandresh patel on 05/10/24.
//

import Foundation

struct Recipe: Identifiable, Codable {
    let id: String // UUID should be a String, not a UUID type to match the JSON
    let name: String
    let cuisine: String?
    let photoURLSmall: String?

    enum CodingKeys: String, CodingKey {
        case id = "uuid"
        case name
        case cuisine
        case photoURLSmall = "photo_url_small"
    }
}
