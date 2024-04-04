//
//  MenuItem.swift
//  LittleLemonRestaurant
//
//  Created by Luismi on 3/25/24.
//

import Foundation
import CoreData

struct MenuItem: Decodable {
    var id = UUID()
    let title: String
    let price: String
    let image: String
    let descriptionDish: String
    let category: String
    
    enum CodingKeys: String, CodingKey {
        case title = "title"
        case price = "price"
        case image = "image"
        case descriptionDish = "description"
        case category = "category"
    }
}
