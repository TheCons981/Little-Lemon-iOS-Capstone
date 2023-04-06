//
//  MenuItem.swift
//  Little Lemon iOS Capstone
//
//  Created by Andrea Consorti on 05/04/23.
//

import Foundation

struct MenuItem: Codable, Hashable, Identifiable {
    var id = UUID()
    let title: String
    let price: String
    let description: String
    let image: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case description = "description"
        case image = "image"
        case category = "category"
    }
    
    
}
