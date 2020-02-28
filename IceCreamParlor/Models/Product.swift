//
//  Product.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import Foundation
import UIKit

class Product: Decodable {
    enum CodingKeys: String, CodingKey {
        case name = "name1"
        case price
        case color = "bg_color"
        case type
    }
    
    let name: String
    let price: String
    let color: String
    let type: String
//
//    required init(from decoder: Decoder) throws {
//        do {
//            let container = try decoder.container(keyedBy: CodingKeys.self)
//
//            let name = try container.decode(String.self, forKey: .name)
//            let price = try container.decode(String.self, forKey: .price)
//            let color = try container.decode(String.self, forKey: .color)
//            let type = try container.decode(String.self, forKey: .type)
//
//            self.name = name
//            self.price = price
//            self.color = color
//            self.type = type
//        }
//    }
}
