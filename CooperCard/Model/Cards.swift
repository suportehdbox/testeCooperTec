//
//  Cards.swift
//  CooperCard
//
//  Created by Mac on 23/11/19.
//  Copyright © 2019 Mac. All rights reserved.
//


import Foundation

// MARK: - Cards
struct Cards: Codable {
    let cards: [Card]
}

// MARK: - Card
struct Card: Codable {
    let name, cardNumber: String
    let limit: Int
    let category: Category

    enum CodingKeys: String, CodingKey {
        case name
        case cardNumber = "card_number"
        case limit, category
    }
}

// MARK: - Category
struct Category: Codable {
    let type, backgroundColor: String
    let imagePath: String

    enum CodingKeys: String, CodingKey {
        case type
        case backgroundColor = "background_color"
        case imagePath = "image_path"
    }
}

struct DataSource {
    static var dataSourceCode = [[String]]()
}
