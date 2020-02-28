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
    let color: String
    let type: String
}
