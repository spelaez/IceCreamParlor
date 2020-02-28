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
    
    var priceNumber: Double {
        var priceToConvert = price
        priceToConvert.remove(at: priceToConvert.startIndex)
        
        return Double(priceToConvert) ?? 0.0
    }
}
