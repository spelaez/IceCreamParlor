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
    let name: String
    let price: Double
    let color: UIColor
    let type: String
    
    init(name: String, price: Double, color: UIColor, type: String) {
        self.name = name
        self.price = price
        self.color = color
        self.type = type
    }
}
