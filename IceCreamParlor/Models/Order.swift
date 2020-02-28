//
//  Order.swift
//  IceCreamParlor
//
//  Created by Santiago Pelaez Rua on 27/02/20.
//  Copyright © 2020 Santiago Pelaez Rua. All rights reserved.
//

import Foundation

typealias OrderDetail = (product: Product, quantity: Int)

class Order {
    var details: [OrderDetail]
    var total: Double {
        var price = 0.0
        
        for (product, quantity) in details {
            price += product.priceNumber * Double(quantity)
        }
        
        return price
    }
    
    init(details: [OrderDetail]) {
        self.details = details
    }
    
    func add(product: Product) {
        if let index = details.firstIndex(where: { detail in
            return detail.product.name == product.name
        }) {
            if details[index].quantity == 2 {
                details.remove(at: index)
            } else {
                details[index].quantity += 1
            }
        } else {
            details.append((product, 1))
        }
    }
}
